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
-- V1.1 - 22/08/2020 - Added check for NULL original_dir
-- V1.2 - 23/08/2020 - Added TOP 1
-- V1.3 - 11/10/2020 - Added check for media status error
-- V1.4 - 13/10/2020 - Return media status
-- V1.5 - 14/10/2020 - Added ORDER BY datetime_created ASC
-- V1.6 - 02/02/2021 - Also return rows for 'reprocess' status
-- V1.7 - 04/02/2021 - Check that not a video sequence
-- V1.8 - 25/09/2021 - Add check to ensure only videos of type 'video' are returned
-- v1.9 - 25/09/2021 - Prioritise media with status of 'raw' over 'reprocess'
-- =============================================

CREATE PROCEDURE dbo.video_SELECT_WHERE_uncompressed
AS
BEGIN
	SET NOCOUNT ON

	SELECT TOP 1
		vw_video.media_id,
		vw_video.title,
		vw_video.[description],
		vw_video.alt,
		vw_video.datetime_captured,
		vw_video.datetime_created,
		vw_video.x_scale,
		vw_video.y_scale,
		vw_video.original_dir,
		vw_video.compressed_dir,
		vw_video.thumbnail_x_scale,
		vw_video.thumbnail_y_scale,
		vw_video.thumbnail_original_dir,
		vw_video.thumbnail_compressed_dir,
		vw_video.thumbnail_placeholder_dir,
		vw_video.created_by_user_id,
		vw_video.datetime_deleted,
		vw_video.datetime_user_deleted,
		null,
		null,
		null,
		null,
		vw_video.[status]
	FROM
		vw_video
		LEFT JOIN video_sequence ON video_sequence.media_id = vw_video.media_id
	WHERE
		vw_video.[type] = 'video' AND 
		(
			(
				vw_video.original_dir IS NOT NULL
				AND vw_video.compressed_dir IS NULL
				AND vw_video.[status] <> 'error'
			)
			OR vw_video.[status] = 'reprocess' AND video_sequence.media_id IS NULL
		)
	ORDER BY
		(CASE WHEN vw_video.[status] = 'raw' THEN 1 ELSE 2 END),
		vw_video.datetime_created ASC
END
