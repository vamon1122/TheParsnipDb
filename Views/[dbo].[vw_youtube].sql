/****** Object:  View [dbo].[vw_youtube]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_youtube]
AS
SELECT        dbo.youtube.media_id, dbo.youtube.data_id, dbo.media.datetime_deleted, dbo.media.datetime_created, dbo.media.datetime_captured, dbo.media.created_by_user_id, dbo.media.title, dbo.media.description, dbo.media.alt, 
                         dbo.media.x_scale, dbo.media.y_scale, dbo.media.placeholder_dir, dbo.media.compressed_dir, dbo.media.original_dir, dbo.media_tag_pair.media_tag_id, dbo.[user].datetime_deleted AS datetime_user_deleted
FROM            dbo.youtube INNER JOIN
                         dbo.media ON dbo.media.id = dbo.youtube.media_id LEFT OUTER JOIN
                         dbo.media_tag_pair ON dbo.youtube.media_id = dbo.media_tag_pair.media_id LEFT OUTER JOIN
                         dbo.media_tag ON dbo.media_tag.id = dbo.media_tag_pair.media_tag_id INNER JOIN
                         dbo.[user] ON dbo.[user].id = dbo.media.created_by_user_id
GO
