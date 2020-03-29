/****** Object:  View [dbo].[vw_media_share]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_media_share]
AS
SELECT        dbo.media_share.id, dbo.media_share.media_id, dbo.media_share.created_by_user_id, dbo.media_share.datetime_created, media_share_COUNT_views_1.times_used
FROM            dbo.media_share_COUNT_views() AS media_share_COUNT_views_1 INNER JOIN
                         dbo.media_share ON media_share_COUNT_views_1.media_share_id = dbo.media_share.id
GO
