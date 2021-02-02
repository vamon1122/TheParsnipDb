SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 02/02/2021
-- Description:	Deletes video thumbnails for video
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 02/02/2021 - Initial create
-- =============================================
CREATE PROCEDURE [dbo].[video_thumbnail_DELETE_WHERE_media_id]
	@media_id char(8),
	@now datetime = NULL
AS
BEGIN
	SET NOCOUNT ON

	IF @now = NULL BEGIN
		SET @now = GETDATE()
	END

	UPDATE 
		video_thumbnail 
	SET 
		datetime_deleted = @now 
	WHERE 
		media_id = @media_id 
		AND datetime_deleted IS NULL
END
