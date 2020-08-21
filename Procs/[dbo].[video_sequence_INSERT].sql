SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 23/08/2020
-- Description:	INSERT a video sequence & it's first video
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 23/08/2020 - Initial create
-- =============================================

CREATE TYPE UDT_sequenced_video AS TABLE
(
	original_media_id char(8) PRIMARY KEY,
	position int NOT NULL
)
GO

CREATE PROCEDURE dbo.video_sequence_INSERT
	@media_id char(8) = NULL,
	@title nchar(100) = NULL,
	@video_original_dir varchar(1000) = NULL,
	@video_compressed_dir varchar(1000) = NULL,
	@thumbnail_original_dir varchar(1000),
	@thumbnail_compressed_dir varchar(1000),
	@thumbnail_placeholder_dir varchar(1000),
	@datetime_captured datetime = NULL,
	@media_x_scale float,
	@media_y_scale float,
	@media_tag_id int = NULL,
	@created_by_user_id int = NULL,
	@datetime_now datetime = NULL,
	@sequenced_video AS dbo.UDT_sequenced_video READONLY
AS
BEGIN
	SET NOCOUNT ON
	
	IF @media_id IS NULL BEGIN
		SET @media_id = (SELECT LEFT(NEWID(), 8))
	END
	
	EXEC video_INSERT
		@videoTitle = @title,
		@videoOriginalDir = @video_original_dir,
		@videoCompressedDir = @video_compressed_dir,
		@thumbnailOriginalDir = @thumbnail_original_dir,
		@thumbnailCompressedDir = @thumbnail_compressed_dir,
		@thumbnailPlaceholderDir = @thumbnail_placeholder_dir,
		@dateTimeCaptured = @datetime_captured,
		@media_x_scale = @media_x_scale,
		@media_y_scale = @media_y_scale,
		@mediaTagId = @media_tag_id,
		@createdByUserId = @created_by_user_id,
		@newMediaId = @media_id,
		@now = @datetime_now
	
	INSERT INTO
		video_sequence
		(
			media_id,
			original_media_id,
			position
		)
	SELECT
		@media_id,
		original_media_id,
		position
	FROM
		@sequenced_video
END
