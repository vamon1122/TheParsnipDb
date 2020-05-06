SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_media_tag_pair]
AS
SELECT        dbo.media_tag_pair.media_id, dbo.media_tag_pair.media_tag_id, dbo.media_tag_pair.created_by_user_id AS media_tag_pair_created_by_user_id, dbo.media_tag_pair.datetime_deleted AS media_tag_pair_datetime_deleted, 
                         dbo.media_tag_pair.datetime_created AS media_tag_pair_datetime_created, media_tag_pair_created_by_user.datetime_deleted AS media_tag_pair_created_by_user_datetime_deleted, 
                         dbo.media_tag.datetime_created AS media_tag_datetime_created, dbo.media_tag.datetime_deleted AS media_tag_datetime_deleted, 
                         media_tag_created_by_user.datetime_deleted AS media_tag_created_by_user_datetime_deleted, dbo.media_tag.name AS media_tag_name, 
                         dbo.media_tag.description AS media_tag_description, dbo.media_tag.created_by_user_id AS media_tag_created_by_user_id
FROM            dbo.media_tag INNER JOIN
                         dbo.media_tag_pair ON dbo.media_tag.id = dbo.media_tag_pair.media_tag_id INNER JOIN
                         dbo.[user] AS media_tag_pair_created_by_user ON dbo.media_tag_pair.created_by_user_id = media_tag_pair_created_by_user.id INNER JOIN
                         dbo.[user] AS media_tag_created_by_user ON dbo.media_tag.created_by_user_id = media_tag_created_by_user.id
GO
