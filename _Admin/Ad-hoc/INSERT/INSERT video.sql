/*2020-04-06 21:41:00.000*/

DECLARE @videoTitle nchar(100) = N''
DECLARE @fileName varchar(1000) = ''
DECLARE @thumbnailOriginalExt varchar(10) = '.png'
DECLARE @videoOriginalExt varchar(10) = '.MOV'
DECLARE @videoCompressedExt varchar(10) = '.mp4'
DECLARE @dateTimeCaptured datetime = CONVERT(datetime, '2017-12-27T22:49:07')
DECLARE @media_x_scale int = 16
DECLARE @media_y_scale int = 9

DECLARE @mediaTagId int = 4
DECLARE @createdByUserId int = 1
DECLARE @newMediaId char(8) = (SELECT LEFT(NEWID(), 8))
DECLARE @now datetime = GETDATE()
DECLARE @vlcExt char(5) = '00001'
DECLARE @thumbnailOriginalDir varchar(1000) = CONCAT('Resources/Media/Videos/Thumbnails/Originals/', @fileName, @videoOriginalExt, @vlcExt, @thumbnailOriginalExt)
DECLARE @thumbnailCompressedDir varchar(1000) = CONCAT('Resources/Media/Videos/Thumbnails/Compressed/', @fileName, @videoOriginalExt, @vlcExt, '.jpg')
DECLARE @thumbnailPlaceholderDir varchar(1000) = CONCAT('Resources/Media/Videos/Thumbnails/Placeholders/', @fileName, @videoOriginalExt, @vlcExt, '.jpg')
DECLARE @videoCompressedDir varchar(1000) = CONCAT('Resources/Media/Videos/Compressed/', @fileName, @videoCompressedExt)
DECLARE @videoOriginalDir varchar(1000) = NULL --CONCAT('Resources/Media/Videos/Compressed', @fileName, @videoOriginalExt)
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

INSERT INTO [dbo].[video] ([media_id]
           ,[x_scale]
           ,[y_scale]
           ,[compressed_dir]
           ,[original_dir]) VALUES (@newMediaId, @media_x_scale, @media_y_scale, @videoCompressedDir, @videoOriginalDir)
