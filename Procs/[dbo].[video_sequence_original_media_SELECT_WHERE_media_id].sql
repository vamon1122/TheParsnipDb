SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 23/08/2020
-- Description:	SELECT original media from a video sequence
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 23/08/2020 - Initial create
-- V1.1 - 23/08/2020 - Get data from vw_video rather than vw_media
-- =============================================

CREATE PROCEDURE dbo.video_sequence_original_media_SELECT_WHERE_media_id
	@media_id char(8),
	@logged_in_user_id int = NULL
AS
BEGIN
	SET NOCOUNT ON

	SELECT
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
		NULL, --vw_video.media_tag_id,
		media_share.id,
		media_share.created_by_user_id,
		media_share.datetime_created AS datetime_media_share_created,
		vw_video.type,
		video_sequence.position
	FROM
		video_sequence
		INNER JOIN vw_video ON vw_video.media_id = video_sequence.original_media_id
		LEFT JOIN media_share
			ON media_share.created_by_user_id = @logged_in_user_id
			AND media_share.media_id = vw_video.media_id
	WHERE
		video_sequence.media_id = @media_id
END
GO
