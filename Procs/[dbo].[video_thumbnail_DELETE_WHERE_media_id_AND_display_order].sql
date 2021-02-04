SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 09/01/2021
-- Description:	Deletes video thumbnail
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 09/01/2021 - Initial create
-- V1.1 - 04/02/2021 - Fix video thumbnails are never deleted because @now is always NULL
-- =============================================
CREATE PROCEDURE [dbo].[video_thumbnail_DELETE_WHERE_media_id_AND_display_order]
	@media_id char(8),
	@display_order smallint,
	@now datetime = NULL
AS
BEGIN
	SET NOCOUNT ON

	IF @now IS NULL BEGIN
		SET @now = GETDATE()
	END

	UPDATE 
		video_thumbnail 
	SET 
		datetime_deleted = @now 
	WHERE 
		media_id = @media_id 
		AND display_order = @display_order
END
GO
