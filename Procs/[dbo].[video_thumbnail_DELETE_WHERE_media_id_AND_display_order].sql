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
-- =============================================
CREATE PROCEDURE [dbo].[video_thumbnail_DELETE_WHERE_media_id_AND_display_order]
	@media_id char(8),
	@display_order smallint,
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
		AND display_order = @display_order
END
GO
