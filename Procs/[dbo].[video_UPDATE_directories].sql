SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 21/06/2020
-- Description:	Updates a video's directories
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 21/06/20 - Initial Create
-- =============================================
CREATE PROCEDURE [dbo].[video_UPDATE_directories] 
	@media_id char(8), 
	@compressed_dir char(1024),
	@original_dir char(1024)
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE 
		video 
	SET 
		compressed_dir = @compressed_dir,
		original_dir = @original_dir
	WHERE 
		media_id = @media_id;
END
