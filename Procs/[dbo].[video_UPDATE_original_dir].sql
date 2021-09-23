SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 18/06/2021
-- Description:	Updates a video's original directory
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 23/09/2021 - Initial create
-- =============================================

CREATE PROCEDURE [dbo].[video_UPDATE_original_dir]
	@media_id char(8),
	@original_dir char(1024) = NULL
AS
BEGIN
	SET NOCOUNT ON
	
	IF @original_dir IS NOT NULL BEGIN
		UPDATE
			video
		SET
			original_dir = @original_dir
		WHERE 
			media_id = @media_id
	END
END
