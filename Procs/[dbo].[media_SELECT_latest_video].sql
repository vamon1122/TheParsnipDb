/****** Object:  StoredProcedure [dbo].[media_SELECT_latest_video]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 20/02/2020
-- Description:	SELECT video
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
		[vw_media].media_tag_id,
		[media_share].id,
		[media_share].created_by_user_id,
		[media_share].datetime_created AS datetime_media_share_created,
		[vw_media].[type]
	FROM 
		vw_media 
		LEFT JOIN media_share 
			ON media_share.created_by_user_id = @logged_in_user_id 
			AND media_share.media_id = vw_media.id
	WHERE 
		vw_media.datetime_deleted IS NULL 
		AND vw_media.datetime_user_deleted IS NULL
		AND [vw_media].[type] <> 'image'
	ORDER BY
		vw_media.datetime_created DESC
END
GO
