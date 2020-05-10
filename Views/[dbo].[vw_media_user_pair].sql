SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_media_user_pair]
AS
SELECT        dbo.media_user_pair.media_id, dbo.media_user_pair.user_id, dbo.media_user_pair.created_by_user_id AS media_user_pair_created_by_user_id, dbo.media_user_pair.datetime_deleted AS media_user_pair_datetime_deleted, 
                         dbo.media_user_pair.datetime_created AS media_user_pair_datetime_created, media_user_pair_created_by_user.datetime_deleted AS media_user_pair_created_by_user_datetime_deleted, 
                         dbo.[user].datetime_created AS user_datetime_created, dbo.[user].datetime_deleted AS user_datetime_deleted, 
                         dbo.[user].username, media_user_pair_created_by_user.id AS created_by_user_id
FROM            dbo.[user] INNER JOIN
                         dbo.media_user_pair ON dbo.[user].id = dbo.media_user_pair.user_id INNER JOIN
                         dbo.[user] AS media_user_pair_created_by_user ON dbo.media_user_pair.created_by_user_id = media_user_pair_created_by_user.id
GO
