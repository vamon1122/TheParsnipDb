SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 20/02/2020
-- Description:	SELECT video
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 20/02/2020 - Initial create
-- V1.1 - 19/03/2020 - Added check if media tag or media tag pair has been deleted
-- V1.2 - 27/03/2020 - Removed [vw_video].media_tag_id (implemented multiple media tags)
-- V1.3 - 11/10/2020 - Added media status
-- =============================================

CREATE PROCEDURE [dbo].[media_SELECT_latest_video] 
	@logged_in_user_id int = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT TOP 1
		[vw_media].id,
		[vw_media].title,
		[vw_media].description,
		[vw_media].alt,
		[vw_media].datetime_captured,
		[vw_media].datetime_created AS datetime_image_created,
		[vw_media].x_scale,
		[vw_media].y_scale,
		[vw_media].original_dir,
		[vw_media].compressed_dir,
		[vw_media].placeholder_dir,
		[vw_media].created_by_user_id,
		NULL, --[vw_media].media_tag_id,
		[media_share].id,
		[media_share].created_by_user_id,
		[media_share].datetime_created AS datetime_media_share_created,
		[vw_media].[type],
		[vw_media].[status]
	FROM 
		vw_media 
		INNER JOIN [vw_media_tag_pair] ON [vw_media_tag_pair].[media_id] = [vw_media].[id]
		LEFT JOIN media_share 
			ON media_share.created_by_user_id = @logged_in_user_id 
			AND media_share.media_id = vw_media.id
	WHERE 
		vw_media.datetime_deleted IS NULL 
		AND vw_media.[status] = 'complete'
		AND vw_media.created_by_user_datetime_deleted IS NULL
		AND vw_media.[type] <> 'image'
		AND media_tag_pair_datetime_deleted IS NULL 
		AND media_tag_pair_created_by_user_datetime_deleted IS NULL 
		AND media_tag_datetime_deleted IS NULL
		AND media_tag_created_by_user_datetime_deleted IS NULL
	ORDER BY
		vw_media.datetime_created DESC
END
GO
