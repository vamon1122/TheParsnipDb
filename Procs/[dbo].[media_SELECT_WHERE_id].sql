SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 20/02/2020
-- Description:	SELECT image by image id
-- =============================================
-- CHANGELOG
-- V1.0 - 20/02/2020 - Initial create
-- V1.1 - 19/03/2020 - Amended field names
-- V1.2 - 27/03/2020 - Added SELECT for media_tags
-- V1.3 - 10/05/2020 - Added SELECT for media_user_pairs
-- V1.4 - 16/07/2020 - Added view count
-- =============================================
CREATE PROCEDURE [dbo].[media_SELECT_WHERE_id] 
	@id char(8), 
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
		NULL, --media_tag_id
		[media_share].id,
		[media_share].created_by_user_id,
		[media_share].datetime_created AS datetime_vw_media_share_created,
		[vw_media].[type]
	FROM
		vw_media
		LEFT JOIN media_share 
			ON media_share.created_by_user_id = @logged_in_user_id 
			AND media_share.media_id = vw_media.id
	WHERE 
		vw_media.created_by_user_datetime_deleted IS NULL 
		AND vw_media.datetime_deleted IS NULL	
		AND vw_media.id = @id
		
	EXEC [dbo].[media_tag_pair_SELECT_WHERE_media_id] @media_id = @id

	EXEC [dbo].[media_user_pair_SELECT_WHERE_media_id] @media_id = @id

	EXEC [dbo].[media_SELECT_view_count_WHERE_id] @id
END
GO
