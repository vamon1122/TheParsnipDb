SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_media] WITH SCHEMABINDING
AS
SELECT        dbo.media.id, dbo.media.created_by_user_id, dbo.media.datetime_deleted, dbo.media.datetime_created, dbo.media.datetime_captured, dbo.media.title, dbo.media.description, dbo.media.alt, dbo.media.type, 
                         dbo.media.[status], dbo.[user].username AS created_by_user_username, dbo.media.x_scale, dbo.media.y_scale, dbo.media.placeholder_dir, dbo.media.compressed_dir, dbo.media.original_dir, 
                         dbo.[user].datetime_deleted AS created_by_user_datetime_deleted, dbo.media.search_terms AS search_terms
FROM            dbo.media INNER JOIN
                         dbo.[user] ON dbo.media.created_by_user_id = dbo.[user].id
GO
CREATE UNIQUE CLUSTERED INDEX IDX_vw_media_id
   ON vw_media (id);
GO
