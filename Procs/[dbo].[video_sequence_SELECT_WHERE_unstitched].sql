SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 23/08/2020
-- Description:	SELECT all unstitched video sequences
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 23/08/2020 - Initial create
-- V1.1 - 23/08/2020 - Return results for new parent media & stop filtering by media_id (not a parameter)
-- =============================================

CREATE PROCEDURE dbo.video_sequence_SELECT_WHERE_unstitched
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE @media_id char(8)
	DECLARE @title nchar(100)
	DECLARE @description nchar(1000)
	DECLARE @alt char(1024)
	DECLARE @datetime_captured datetime
	DECLARE @datetime_created datetime
	DECLARE @x_scale float
	DECLARE @y_scale float
	DECLARE @original_dir char(1024)
	DECLARE @compressed_dir char(1024)
	DECLARE @thumbnail_x_scale int
	DECLARE @thumbnail_y_scale int
	DECLARE @thumbnail_original_dir char(1024)
	DECLARE @thumbnail_compressed_dir char(1024)
	DECLARE @thumbnail_placeholder_dir char(1024)
	DECLARE @created_by_user_id int
	DECLARE @datetime_deleted datetime
	DECLARE @datetime_user_deleted datetime
	DECLARE @position int
	
	SELECT TOP 1
		@media_id = vw_video.media_id,
		@title = vw_video.title,
		@description = vw_video.description,
		@alt = vw_video.alt,
		@datetime_captured = vw_video.datetime_captured,
		@datetime_created = vw_video.datetime_created,
		@x_scale = vw_video.x_scale,
		@y_scale = vw_video.y_scale,
		@original_dir = vw_video.original_dir,
		@compressed_dir = vw_video.compressed_dir,
		@thumbnail_x_scale = vw_video.thumbnail_x_scale,
		@thumbnail_y_scale = vw_video.thumbnail_y_scale,
		@thumbnail_original_dir = vw_video.thumbnail_original_dir,
		@thumbnail_compressed_dir = vw_video.thumbnail_compressed_dir,
		@thumbnail_placeholder_dir = vw_video.thumbnail_placeholder_dir,
		@created_by_user_id = vw_video.created_by_user_id,
		@datetime_deleted = vw_video.datetime_deleted,
		@datetime_user_deleted = vw_video.datetime_user_deleted,
		@position = video_sequence.position
	FROM
		video_sequence
		INNER JOIN vw_video ON vw_video.media_id = video_sequence.media_id
	WHERE
		vw_video.compressed_dir IS NULL
	ORDER BY 
		vw_video.datetime_created ASC
	
	SELECT 
		@media_id,
		@title,
		@description,
		@alt,
		@datetime_captured,
		@datetime_created,
		@x_scale,
		@y_scale,
		@original_dir,
		@compressed_dir,
		@thumbnail_x_scale,
		@thumbnail_y_scale,
		@thumbnail_original_dir,
		@thumbnail_compressed_dir,
		@thumbnail_placeholder_dir,
		@created_by_user_id,
		@datetime_deleted,
		@datetime_user_deleted,
		@position
	
	EXEC dbo.video_sequence_original_media_SELECT_WHERE_media_id
		@media_id
END
