/****** Object:  StoredProcedure [dbo].[media_SELECT_WHERE_media_tag_id]    Script Date: 19/03/2020 18:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 30/11/2019
-- Description:	SELECT media
-- =============================================
-- CHANGELOG
-- V1.0 - 30/11/2019 - Initial create
-- V1.1 - 19/03/2020 - Added check if media tag or media tag pair has been deleted
-- =============================================
CREATE PROCEDURE [dbo].[media_SELECT_WHERE_media_tag_id] 
	@media_tag_id int, 
	@logged_in_user_id int = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		[vw_media].id,
		[vw_media].title,
		[vw_media].[description],
		[vw_media].alt,
		[vw_media].datetime_captured,
		[vw_media].datetime_created,
		[vw_media].x_scale,
		[vw_media].y_scale,
		[vw_media].original_dir,
		[vw_media].compressed_dir,
		[vw_media].placeholder_dir,
		[vw_media].created_by_user_id,
		[vw_media].media_tag_id,
		[media_share].id,
		[media_share].created_by_user_id,
		[media_share].datetime_created AS datetime_media_share_created,
		[vw_media].[type]
	FROM
		[vw_media]
		LEFT JOIN media_share 
			ON media_share.created_by_user_id = @logged_in_user_id 
			AND media_share.media_id = [vw_media].id
	WHERE
		[vw_media].datetime_deleted IS NULL	 
		AND [vw_media].media_tag_datetime_deleted IS NULL
		AND [vw_media].media_tag_pair_datetime_deleted IS NULL
		AND [vw_media].created_by_user_datetime_deleted IS NULL 
		AND [vw_media].media_tag_id = @media_tag_id 
END
GO
