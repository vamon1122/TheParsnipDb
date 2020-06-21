SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 21/06/2020
-- Description:	SELECT all uncompressed videos
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 21/06/2020 - Initial create
-- =============================================
CREATE PROCEDURE [dbo].[video_SELECT_WHERE_uncompressed] 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		[media_id],
		[title], 
		[description], 
		[alt], 
		[datetime_captured],
		[datetime_created],
		[x_scale],
		[y_scale],
		[original_dir],
		[compressed_dir],
		[thumbnail_x_scale],
		[thumbnail_y_scale],
		[thumbnail_original_dir],
		[thumbnail_compressed_dir],
		[thumbnail_placeholder_dir],
		[created_by_user_id],
		[datetime_deleted],
		[datetime_user_deleted]
	FROM 
		[vw_video] 
	WHERE  
		[compressed_dir] IS NULL
END
