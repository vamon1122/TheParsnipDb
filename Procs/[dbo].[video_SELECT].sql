SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 16/06/2021
-- Description:	SELECT all videos
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 16/06/2021 - Initial create
-- =============================================

CREATE PROCEDURE [dbo].[video_SELECT] 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		[vw_video].media_id,
		[vw_video].title, 
		[vw_video].[description], 
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
		NULL,
		NULL,
		NULL AS datetime_vw_media_share_created,
		[vw_video].[status],
		[vw_video].[search_terms]
	FROM 
		vw_video 
END
GO
