GO

/****** Object:  StoredProcedure [dbo].[sp_select_youtube_video_by_data_id]    Script Date: 05/12/2019 21:38:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Ben Barton
-- Create date: 30/11/2019
-- Description:	SELECT youtube_video
-- =============================================
CREATE PROCEDURE [dbo].[sp_select_youtube_video_by_data_id] 
	-- Add the parameters for the stored procedure here
	@data_id uniqueidentifier = NULL, 
	@logged_in_user_id uniqueidentifier = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		vw_youtube_video.youtube_video_id, 
		vw_youtube_video.data_id, 
		vw_youtube_video.datetime_captured, 
		vw_youtube_video.datetime_created, 
		vw_youtube_video.created_by_user_id, 
		vw_youtube_video.title, 
		vw_youtube_video.[description], 
		vw_youtube_video.datetime_youtube_video_deleted, 
		vw_youtube_video.media_tag_id, 
		media_share.media_share_id, 
		media_share.created_by_user_id, 
		media_share.datetime_created, 
		media_share.times_used, 
		media_share.media_id 
	FROM 
		vw_youtube_video 
        LEFT JOIN media_share 
			ON media_share.created_by_user_id = @logged_in_user_id 
			AND media_share.media_id = vw_youtube_video.youtube_video_id 
    WHERE 
	vw_youtube_video.datetime_user_deleted IS NULL 
		AND vw_youtube_video.datetime_youtube_video_deleted IS NULL	
		AND vw_youtube_video.data_id = @data_id
END
GO


