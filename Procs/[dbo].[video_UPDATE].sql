SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 30/08/2020
-- Description:	Updates a video's data
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 30/08/2020 - Initial Create
-- V1.1 - 10/10/2020 - Added status
-- V1.2 - 13/10/2020 - Removed metadata
-- =============================================

CREATE PROCEDURE dbo.video_UPDATE
	@media_id char(8),
	@compressed_dir char(1024) = NULL,
	@x_scale smallint = NULL,
	@y_scale smallint = NULL,
	@duration int = NULL,
	@status char(10)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE
		video
	SET
		compressed_dir = @compressed_dir,
		x_scale = @x_scale,
		y_scale = @y_scale,
		duration = @duration
	WHERE 
		media_id = @media_id
		
	UPDATE 
		media 
	SET 
		[status] = @status 
	WHERE 
		id = @media_id
END
