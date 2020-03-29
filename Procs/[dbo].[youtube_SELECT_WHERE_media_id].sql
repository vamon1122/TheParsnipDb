/****** Object:  StoredProcedure [dbo].[youtube_SELECT_WHERE_media_id]    Script Date: 17/03/2020 19:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 30/11/2019
-- Description:	SELECT youtube
-- =============================================
-- =============================================
--CHANGELOG
--V1.1 - 17/03/2020 - Added X & Y scale
-- =============================================
CREATE PROCEDURE [dbo].[youtube_SELECT_WHERE_media_id] 
	@media_id char(8), 
	@logged_in_user_id int = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		[vw_youtube].media_id, 
		[vw_youtube].data_id, 
		[vw_youtube].datetime_captured, 
		[vw_youtube].datetime_created, 
		[vw_youtube].created_by_user_id, 
		[vw_youtube].title, 
		[vw_youtube].[description], 
		[vw_youtube].datetime_deleted, 
		[vw_youtube].media_tag_id, 
		[media_share].id, 
		[media_share].created_by_user_id, 
		[media_share].datetime_created, 
		[media_share].media_id, 
		[vw_youtube].placeholder_dir, 
		[vw_youtube].compressed_dir, 
		[vw_youtube].original_dir,
		[vw_youtube].alt,
		[vw_youtube].x_scale,
		[vw_youtube].y_scale
	FROM 
		vw_youtube 
        LEFT JOIN media_share 
			ON media_share.created_by_user_id = @logged_in_user_id 
			AND media_share.media_id = vw_youtube.media_id 
    WHERE 
	vw_youtube.datetime_user_deleted IS NULL 
		AND vw_youtube.datetime_deleted IS NULL	
		AND vw_youtube.media_id = @media_id
END
GO
