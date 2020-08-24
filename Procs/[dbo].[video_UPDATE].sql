SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 30/08/2020
-- Description:	Updates a video's data
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 30/08/20 - Initial Create
-- =============================================

CREATE PROCEDURE dbo.video_UPDATE
	@media_id char(8),
	@title nchar(100) = NULL,
	@description nchar(1000) = NULL,
	@alt nchar(1024) = NULL,
	@datetime_captured datetime = NULL,
	@media_tag_id int = NULL,
	@media_tag_created_by_user_id int = NULL,
	@thumbnail_x_scale smallint = NULL,
	@thumbnail_y_scale smallint = NULL,
	@thumbnail_placeholder_dir char(1024) = NULL,
	@thumbnail_compressed_dir char(1024) = NULL,
	@thumbnail_original_dir char(1024) = NULL,
	@compressed_dir char(1024) = NULL,
	@original_dir char(1024) = NULL,
	@x_scale smallint = NULL,
	@y_scale smallint = NULL,
	@duration int = NULL
AS
BEGIN
	SET NOCOUNT ON
	
	IF @x_scale = 0 OR @y_scale = 0 BEGIN
		SET @x_scale = NULL
		SET @y_scale = NULL
	END
	
	IF @duration = 0 BEGIN
		SET @duration = NULL
	END
	
	UPDATE
		video
	SET
		compressed_dir = COALESCE(@compressed_dir, compressed_dir),
		original_dir = COALESCE(@original_dir, original_dir),
		x_scale = COALESCE(@x_scale, x_scale),
		y_scale = COALESCE(@y_scale, y_scale),
		duration = COALESCE(@duration, duration)
	WHERE 
		media_id = @media_id;
		
	EXEC dbo.media_update
		@id = @media_id,
		@title = @title,
		@description = @description,
		@alt = @alt,
		@datetime_captured = @datetime_captured,
		@media_tag_id = @media_tag_id,
		@media_tag_created_by_user_id = @media_tag_created_by_user_id,
		@x_scale = @thumbnail_x_scale,
		@y_scale = @thumbnail_y_scale,
		@placeholder_dir = @thumbnail_placeholder_dir,
		@compressed_dir = @thumbnail_compressed_dir,
		@original_dir = @thumbnail_original_dir
END
