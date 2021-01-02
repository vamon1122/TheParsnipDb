SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 02/01/2021
-- Description:	Select video thumbnails for a given media id
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 02/01/2021 - Initial create
-- =============================================
CREATE PROCEDURE [dbo].[video_thumbnail_SELECT_WHERE_media_id] 
	@media_id char(8)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		VT.media_id,
		VT.created_by_user_id,
		VT.datetime_deleted,
		VT.datetime_created,
		VT.x_scale,
		VT.y_scale,
		VT.display_order,
		VT.active,
		VT.placeholder_dir,
		VT.compressed_dir,
		VT.original_dir
	FROM 
		video_thumbnail VT
		LEFT OUTER JOIN [user] U ON U.id = VT.created_by_user_id
	WHERE 
		VT.media_id = @media_id	
		AND VT.datetime_deleted IS NULL
		AND U.datetime_deleted IS NULL
END
GO
