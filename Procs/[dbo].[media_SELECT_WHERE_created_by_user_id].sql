SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 30/11/2019
-- Description:	SELECT image
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 30/11/2019 - Initial create
-- V1.1 - 18/03/2020 - Added order by datetime created
-- V1.2 - 19/03/2020 - Removed check for user NOT being deleted
-- V1.3 - 27/03/2020 - Removed [vw_video].media_tag_id (implemented multiple media tags)
-- V1.4 - 11/10/2020 - Added media status
-- =============================================

CREATE PROCEDURE [dbo].[media_SELECT_WHERE_created_by_user_id] 
	@created_by_user_id int, 
	@logged_in_user_id int = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
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
		LEFT JOIN media_share 
			ON media_share.created_by_user_id = @logged_in_user_id 
			AND media_share.media_id = vw_media.id
	WHERE 
		vw_media.datetime_deleted IS NULL
		AND vw_media.created_by_user_id = @created_by_user_id	
	ORDER BY
		vw_media.datetime_created DESC
END
GO
