GO

/****** Object:  StoredProcedure [dbo].[sp_select_all_video_by_created_by_user_id]    Script Date: 05/12/2019 21:36:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ben Barton
-- Create date: 30/11/2019
-- Description:	SELECT video
-- =============================================
CREATE PROCEDURE [dbo].[sp_select_all_video_by_created_by_user_id] 
	@created_by_user_id uniqueidentifier = NULL, 
	@logged_in_user_id uniqueidentifier = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		video_id, 
		title, 
		vw_video.description, 
		alt, 
		datetime_captured,
		vw_video.datetime_created AS datetime_video_created,
		video_x_scale,
		video_y_scale,
		video_original_dir,
		video_compressed_dir,
		thumbnail_x_scale,
		thumbnail_y_scale,
		thumbnail_original_dir,
		thumbnail_compressed_dir,
		thumbnail_placeholder_dir,
		vw_video.created_by_user_id,
		datetime_video_deleted,
		media_tag_id, 
		datetime_user_deleted, 
		media_share_id,
		media_share.created_by_user_id,
		media_share.datetime_created AS datetime_media_share_created,
		times_used
	FROM 
		vw_video 
		INNER JOIN media_share 
			ON media_share.created_by_user_id = @logged_in_user_id 
			AND media_share.media_id = vw_video.video_id
	WHERE  
		vw_video.created_by_user_id = @created_by_user_id	
END
GO


