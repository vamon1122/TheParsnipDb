SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 18/04/2020
-- Description:	Insert a video into the database
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 10/04/2020 - Initial create
-- V1.1 - 30/04/2020 - Removed hard-coded directories
-- V1.2 - 30/04/2020 - Added videoOriginalDir parameter
-- V1.3 - 30/05/2020 - Changed defauly media tag from 4 (Amsterdam) to NULL
-- V1.4 - 30/08/2020 - Added defaults & reformatted
-- V1.5 - 31/08/2020 - Removed default vaule for @title
-- V1.6 - 31/08/2020 - Changed default value of @title to NULL
-- =============================================

CREATE PROCEDURE dbo.video_INSERT
	@title nchar(100) = NULL,
	@original_dir varchar(1000) = NULL,
	@thumbnail_original_dir varchar(1000),
	@thumbnail_compressed_dir varchar(1000),
	@thumbnail_placeholder_dir varchar(1000),
	@datetime_captured datetime = NULL,
	@thumbnail_x_scale smallint,
	@thumbnail_y_scale smallint,
	@media_tag_id int = NULL,
	@created_by_user_id int,
	@new_media_id char(8) = NULL,
	@now datetime = NULL
AS
BEGIN
	SET NOCOUNT ON
	
	IF @new_media_id IS NULL BEGIN
		SET @new_media_id = (SELECT LEFT(NEWID(), 8))
	END
	
	IF @now IS NULL BEGIN
		SET @now = GETDATE()
	END
	
	IF @datetime_captured IS NULL BEGIN
		SET @datetime_captured = @now
	END

	EXEC media_INSERT
		@id = @new_media_id, 
		@type = 'video',
		@datetime_captured = @datetime_captured,
		@datetime_created = @now,
		@x_scale = @thumbnail_x_scale,
		@y_scale = @thumbnail_y_scale,
		@original_dir = @thumbnail_original_dir,
		@compressed_dir = @thumbnail_compressed_dir,
		@placeholder_dir = @thumbnail_placeholder_dir,
		@created_by_user_id = @created_by_user_id,
		@media_tag_id = @media_tag_id,
		@title = @title,
		@description = NULL,
		@alt = NULL

	INSERT INTO dbo.video 
	(
		media_id,
		original_dir
	) 
	VALUES 
	(
		@new_media_id,
		@original_dir
	)
END
GO
