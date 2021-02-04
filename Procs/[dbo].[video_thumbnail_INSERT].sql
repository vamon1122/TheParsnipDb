SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 02/01/2021
-- Description:	Inserts video thumbnail
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 02/01/2021 - Initial create
-- V1.1 - 04/02/2021 - Replace thumbnail if deleted
-- =============================================
CREATE PROCEDURE [dbo].[video_thumbnail_INSERT] 
	@media_id char(8),
	@created_by_user_id int = NULL,
	@datetime_deleted datetime = NULL,
	@datetime_created datetime,
	@x_scale smallint,
	@y_scale smallint,
	@placeholder_dir char(1000),
	@compressed_dir char(1000),
	@original_dir char(1000)
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @display_order smallint
	IF EXISTS(SELECT display_order FROM video_thumbnail WHERE media_id = @media_id) BEGIN
		SELECT @display_order = MAX(display_order) + 1 FROM video_thumbnail WHERE media_id = @media_id
	END ELSE BEGIN
		SET @display_order = 1
	END
	
	DECLARE @active int
	IF NOT EXISTS(SELECT active FROM video_thumbnail WHERE media_id = @media_id AND active = 1 AND datetime_deleted IS NULL) BEGIN
		SET @active = 1
	END ELSE IF @created_by_user_id IS NOT NULL BEGIN
		SET @active = 1
	END ELSE BEGIN
		SET @active = 0
	END

	IF @active = 1 BEGIN
		UPDATE 
			media 
		SET 
			x_scale = @x_scale,
			y_scale = @y_scale,
			placeholder_dir = @placeholder_dir,
			compressed_dir = @compressed_dir,
			original_dir = @original_dir
		WHERE
			id = @media_id

		UPDATE 
			video_thumbnail 
		SET 
			active = 0 
		WHERE 
			media_id = @media_id
	END

	INSERT INTO 
		video_thumbnail 
		(
			media_id,
			created_by_user_id,
			datetime_deleted,
			datetime_created,
			x_scale,
			y_scale,
			display_order,
			active,
			placeholder_dir,
			compressed_dir,
			original_dir
		) 
	VALUES
		(
			@media_id,
			@created_by_user_id,
			@datetime_deleted,
			@datetime_created,
			@x_scale,
			@y_scale,
			@display_order,
			@active,
			@placeholder_dir,
			@compressed_dir,
			@original_dir
		)
END
GO
