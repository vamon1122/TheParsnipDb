GO

/****** Object:  StoredProcedure [dbo].[sp_select_album_images]    Script Date: 04/12/2019 21:12:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ben Barton
-- Create date: 30/11/2019
-- Description:	SELECT image
-- =============================================
CREATE PROCEDURE [dbo].[sp_select_album_images] 
	@media_tag_id uniqueidentifier = NULL, 
	@logged_in_user_id uniqueidentifier = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		image_id,
		title,
		description,
		alt,
		datetime_captured,
		vw_image.datetime_created AS datetime_image_created,
		x_scale,
		y_scale,
		original_dir,
		compressed_dir,
		placeholder_dir,
		vw_image.created_by_user_id,
		image_datetime_deleted, 
		media_tag_id,
		media_share.media_share_id,
		media_share.created_by_user_id,
		media_share.datetime_created AS datetime_media_share_created,
		media_share.times_used,
		media_share.media_id
	FROM
		vw_image
		LEFT JOIN media_share 
			ON media_share.created_by_user_id = @logged_in_user_id 
			AND media_share.media_id = vw_image.image_id
	WHERE 
		vw_image.user_datetime_deleted IS NULL 
		AND vw_image.image_datetime_deleted IS NULL	
		AND vw_image.media_tag_id = @media_tag_id	
END
GO


