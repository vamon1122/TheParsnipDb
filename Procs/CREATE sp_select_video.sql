USE [ParsnipTestDb]
GO

/****** Object:  StoredProcedure [dbo].[sp_select_video]    Script Date: 01/12/2019 21:44:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 30/11/2019
-- Description:	SELECT video
-- =============================================
CREATE PROCEDURE [dbo].[sp_select_video] 
	@video_id uniqueidentifier = NULL,
	@media_tag_id uniqueidentifier = NULL, 
	@logged_in_user_id uniqueidentifier = NULL,
	@is_deleted bit = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		video.video_id, video.title, 
		video.description, video.alt, 
		video.datetime_captured,
		video.datetime_created,
		video.video_x_scale,
		video.video_y_scale,
		video.video_original_dir,
		video.video_compressed_dir,
		video.thumbnail_x_scale,
		video.thumbnail_y_scale,
		video.thumbnail_original_dir,
		video.thumbnail_compressed_dir,
		video.thumbnail_placeholder_dir,
		video.created_by_user_id,
		video.datetime_deleted,
		media_tag_pair.media_tag_id, 
		media_share.media_share_id,
		media_share.created_by_user_id,
		media_share.datetime_created,
		media_share.times_used,
		media_share.media_id
	FROM 
		video 
		INNER JOIN media_tag_pair ON video.video_id = media_tag_pair.media_id 
		INNER JOIN[user] ON[user].user_id = video.created_by_user_id 
		LEFT JOIN media_share ON media_share.created_by_user_id = @logged_in_user_id AND media_share.media_id = video.video_id 
	WHERE 
		[user].datetime_deleted IS NULL 

		AND (@video_id IS NULL 
		OR video_id = @video_id)

		AND (@media_tag_id IS NULL 
		OR media_tag_pair.media_tag_id = @media_tag_id)

		AND((@is_deleted = 1 AND video.datetime_deleted IS NOT NULL) 
		OR (@is_deleted = 0 AND video.datetime_deleted IS NULL)
		OR @is_deleted IS NULL)
END
GO


