USE [ParsnipTestDb]
GO

/****** Object:  StoredProcedure [dbo].[sp_select_youtube_video]    Script Date: 01/12/2019 21:44:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ben Barton
-- Create date: 30/11/2019
-- Description:	SELECT youtube_video
-- =============================================
CREATE PROCEDURE [dbo].[sp_select_youtube_video] 
	-- Add the parameters for the stored procedure here
	@youtube_video_id uniqueidentifier = NULL, 
	@data_id uniqueidentifier = NULL, 
	@media_tag_id uniqueidentifier = NULL, 
	@logged_in_user_id uniqueidentifier = NULL,
	@is_deleted bit = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		youtube_video.youtube_video_id, 
		youtube_video.data_id, 
		youtube_video.datetime_captured, 
		youtube_video.datetime_created, 
		youtube_video.created_by_user_id, 
		youtube_video.title, 
		youtube_video.description, 
		youtube_video.datetime_deleted, 
		media_tag_pair.media_tag_id, 
		media_share.media_share_id, 
		media_share.created_by_user_id, 
		media_share.datetime_created, 
		media_share.times_used, 
		media_share.media_id 
	FROM 
		youtube_video 
        INNER JOIN media_tag_pair ON youtube_video.youtube_video_id = media_tag_pair.media_id 
        INNER JOIN[user] ON[user].user_id = youtube_video.created_by_user_id 
        LEFT JOIN media_share ON media_share.created_by_user_id = @logged_in_user_id AND media_share.media_id = youtube_video.youtube_video_id 
    WHERE 
		[user].datetime_deleted IS NULL 

		AND (@youtube_video_id IS NULL 
		OR youtube_video_id = @youtube_video_id)

		AND (@data_id IS NULL 
		OR youtube_video.data_id = @data_id)

		AND (@media_tag_id IS NULL 
		OR media_tag_pair.media_tag_id = @media_tag_id)

		AND((@is_deleted = 1 AND youtube_video.datetime_deleted IS NOT NULL) 
		OR (@is_deleted = 0 AND youtube_video.datetime_deleted IS NULL)
		OR @is_deleted IS NULL)
END
GO


