SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 20/09/2021
-- Description:	SELECT all unprocessed youtube videos
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 20/09/2021 - Initial create
-- v1.1 - 25/09/2021 - Prioritise media with status of 'raw' over 'reprocess'
-- =============================================

CREATE PROCEDURE dbo.youtube_SELECT_WHERE_unprocessed
AS
BEGIN
	SET NOCOUNT ON

	SELECT TOP 1
		[vw_youtube].media_id, 
		[vw_youtube].data_id, 
		[vw_youtube].datetime_captured, 
		[vw_youtube].datetime_created, 
		[vw_youtube].created_by_user_id, 
		[vw_youtube].title, 
		[vw_youtube].[description], 
		[vw_youtube].datetime_deleted, 
		NULL, 
		NULL,
		NULL,
		NULL,
		NULL,
		[vw_youtube].thumbnail_placeholder_dir, 
		[vw_youtube].thumbnail_compressed_dir, 
		[vw_youtube].thumbnail_original_dir,
		[vw_youtube].alt,
		[vw_youtube].x_scale,
		[vw_youtube].y_scale,
		[vw_youtube].search_terms
	FROM
		vw_youtube 
	WHERE
		vw_youtube.[status] = 'raw' OR 
		vw_youtube.[status] = 'reprocess'
	ORDER BY
		(CASE WHEN vw_youtube.[status] = 'raw' THEN 1 ELSE 2 END),
		vw_youtube.datetime_created ASC
END
