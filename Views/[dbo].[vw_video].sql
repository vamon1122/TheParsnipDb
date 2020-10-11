SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_video]
AS
SELECT        dbo.video.media_id, dbo.media.created_by_user_id, dbo.media.datetime_deleted, dbo.media.datetime_created, dbo.media.datetime_captured, dbo.media.title, dbo.media.description, dbo.media.alt, 
                         dbo.media.x_scale AS thumbnail_x_scale, dbo.media.y_scale AS thumbnail_y_scale, dbo.media.placeholder_dir AS thumbnail_placeholder_dir, dbo.media.compressed_dir AS thumbnail_compressed_dir, 
                         dbo.media.original_dir AS thumbnail_original_dir, dbo.video.x_scale, dbo.video.y_scale, dbo.video.compressed_dir, dbo.video.original_dir, dbo.media.[status], 
						 dbo.[user].datetime_deleted AS datetime_user_deleted, dbo.[user].type
FROM            dbo.video INNER JOIN
                         dbo.media ON dbo.video.media_id = dbo.media.id LEFT OUTER JOIN
                         dbo.[user] ON dbo.media.created_by_user_id = dbo.[user].id
GO
