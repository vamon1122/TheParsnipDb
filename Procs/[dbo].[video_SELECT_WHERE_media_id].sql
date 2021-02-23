SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 30/11/2019
-- Description:	SELECT video
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 30/11/2019 - Initial create
-- V1.1 - 27/03/2020 - Removed [vw_video].media_tag_id & added SELECT for media_tags
-- V1.2 - 10/05/2020 - Added SELECT for media_user_pairs
-- V1.3 - 11/10/2020 - Added media status
-- V1.4 - 02/01/2021 - Retrieve video thumbnails
-- V1.5 - 23/02/2021 - Added search terms
-- =============================================

CREATE PROCEDURE [dbo].[video_SELECT_WHERE_media_id] 
	@media_id char(8), 
	@logged_in_user_id int = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		@media_id,
		[vw_video].title, 
		[vw_video].description, 
		[vw_video].alt, 
		[vw_video].datetime_captured,
		[vw_video].datetime_created AS datetime_video_created,
		[vw_video].x_scale,
		[vw_video].y_scale,
		[vw_video].original_dir,
		[vw_video].compressed_dir,
		[vw_video].thumbnail_x_scale,
		[vw_video].thumbnail_y_scale,
		[vw_video].thumbnail_original_dir,
		[vw_video].thumbnail_compressed_dir,
		[vw_video].thumbnail_placeholder_dir,
		[vw_video].created_by_user_id,
		[vw_video].datetime_deleted,
		NULL, --[vw_video].media_tag_id 
		[vw_video].datetime_user_deleted, 
		[media_share].id,
		[media_share].created_by_user_id,
		[media_share].datetime_created AS datetime_vw_media_share_created,
		[vw_video].[status],
		[vw_video].[search_terms]
	FROM 
		vw_video 
		LEFT JOIN [media_share] 
			ON [media_share].created_by_user_id = @logged_in_user_id 
			AND media_share.media_id = vw_video.media_id
	WHERE  
		[vw_video].datetime_deleted IS NULL	
		AND [vw_video].datetime_user_deleted IS NULL	
		AND [vw_video].media_id = @media_id

	EXEC [dbo].[media_tag_pair_SELECT_WHERE_media_id] @media_id

	EXEC [dbo].[media_user_pair_SELECT_WHERE_media_id] @media_id

	EXEC [dbo].[video_thumbnail_SELECT_WHERE_media_id] @media_id
END
GO
