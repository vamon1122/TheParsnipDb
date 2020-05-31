SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 18/04/2020
-- Description:	Insert a video into the database
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 10/04/2020 - Initial create
-- V1.1 - 30/04/2020 - Removed hard-coded directories
-- V1.2 - 30/04/2020 - Added videoOriginalDir parameter
-- V1.3 - 30/05/2020 - Changed defauly media tag from 4 (Amsterdam) to NULL
-- =============================================
CREATE PROCEDURE [dbo].[video_INSERT] 
	@videoTitle nchar(100) = '',
	@videoOriginalDir varchar(1000) = NULL,
	@videoCompressedDir varchar(1000) = NULL,
	@thumbnailOriginalDir varchar(1000),
	@thumbnailCompressedDir varchar(1000),
	@thumbnailPlaceholderDir varchar(1000),
	@dateTimeCaptured datetime = GETDATE,
	@media_x_scale int = 16,
	@media_y_scale int = 9,
	@mediaTagId int = NULL,
	@createdByUserId int = 1,
	@newMediaId char(8) = NULL,
	@now datetime = GETDATE
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @newMediaId IS NULL BEGIN
		SET @newMediaId = (SELECT LEFT(NEWID(), 8))
	END

	EXEC media_INSERT
		@id = @newMediaId, 
		@type = 'video',
		@datetime_captured = @dateTimeCaptured,
		@datetime_created = @now,
		@x_scale = @media_x_scale,
		@y_scale = @media_y_scale,
		@original_dir = @thumbnailOriginalDir,
		@compressed_dir = @thumbnailCompressedDir,
		@placeholder_dir = @thumbnailPlaceholderDir,
		@created_by_user_id = @createdByUserId,
		@media_tag_id = @mediaTagId,
		@title = @videoTitle,
		@description = NULL,
		@alt = NULL
	
	EXEC media_UPDATE
		@id = @newMediaId,
		@title = @videoTitle,
		@datetime_captured = @dateTimeCaptured,
		@media_tag_id = @mediaTagId,
		@media_tag_created_by_user_id = @createdByUserId,
		@placeholder_dir = @thumbnailPlaceholderDir,
		@compressed_dir = @thumbnailCompressedDir,
		@original_dir = @thumbnailOriginalDir

	INSERT INTO [dbo].[video] 
		([media_id]
		,[x_scale]
		,[y_scale]
		,[compressed_dir]
		,[original_dir]) 
		VALUES 
		(@newMediaId 
		,@media_x_scale 
		,@media_y_scale 
		,@videoCompressedDir 
		,@videoOriginalDir)
END
GO
