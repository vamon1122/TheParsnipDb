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
-- =============================================

CREATE PROCEDURE dbo.video_sequence_original_media_SELECT_WHERE_media_id
	@media_id char(8),
	@logged_in_user_id int = NULL
AS
BEGIN
	SET NOCOUNT ON

	SELECT
		vw_media.id,
		vw_media.title,
		vw_media.description,
		vw_media.alt,
		vw_media.datetime_captured,
		vw_media.datetime_created,
		vw_media.x_scale,
		vw_media.y_scale,
		vw_media.original_dir,
		vw_media.compressed_dir,
		vw_media.placeholder_dir,
		vw_media.created_by_user_id,
		NULL, --vw_media.media_tag_id,
		media_share.id,
		media_share.created_by_user_id,
		media_share.datetime_created AS datetime_media_share_created,
		vw_media.type,
		video_sequence.position
	FROM
		video_sequence
		INNER JOIN vw_media ON vw_media.id = video_sequence.original_media_id
		LEFT JOIN media_share
			ON media_share.created_by_user_id = @logged_in_user_id
			AND media_share.media_id = vw_media.id
	WHERE
		video_sequence.media_id = @media_id
END
GO