/****** Object:  View [dbo].[vw_media]    Script Date: 19/03/2020 20:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_media]
AS
SELECT        dbo.media.id, dbo.media.created_by_user_id, dbo.media_tag_pair.media_tag_id, dbo.media.datetime_deleted, dbo.media.datetime_created, dbo.media.datetime_captured, dbo.media.title, dbo.media.description, dbo.media.alt, 
                         dbo.media.type, dbo.[user].username AS created_by_user_username, dbo.media_tag.name AS media_tag_name, dbo.media.x_scale, dbo.media.y_scale, dbo.media.placeholder_dir, dbo.media.compressed_dir, 
                         dbo.media.original_dir, dbo.[user].datetime_deleted AS created_by_user_datetime_deleted, dbo.media_tag_pair.datetime_deleted AS media_tag_pair_datetime_deleted, 
                         dbo.media_tag.datetime_deleted AS media_tag_datetime_deleted
FROM            dbo.media LEFT OUTER JOIN
                         dbo.media_tag_pair ON dbo.media_tag_pair.media_id = dbo.media.id LEFT OUTER JOIN
                         dbo.media_tag ON dbo.media_tag.id = dbo.media_tag_pair.media_tag_id INNER JOIN
                         dbo.[user] ON dbo.media.created_by_user_id = dbo.[user].id
GO
