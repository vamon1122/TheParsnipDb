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
-- =============================================

CREATE PROCEDURE dbo.video_SELECT_WHERE_uncompressed
AS
BEGIN
	SET NOCOUNT ON

	SELECT TOP 1
		media_id,
		title,
		[description],
		alt,
		datetime_captured,
		datetime_created,
		x_scale,
		y_scale,
		original_dir,
		compressed_dir,
		thumbnail_x_scale,
		thumbnail_y_scale,
		thumbnail_original_dir,
		thumbnail_compressed_dir,
		thumbnail_placeholder_dir,
		created_by_user_id,
		datetime_deleted,
		datetime_user_deleted,
		null,
		null,
		null,
		null,
		[status]
	FROM
		vw_video
	WHERE
		original_dir IS NOT NULL
		AND compressed_dir IS NULL
		AND [status] <> 'error'
	ORDER BY
		datetime_created ASC
END
