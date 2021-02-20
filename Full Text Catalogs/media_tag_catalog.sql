CREATE FULLTEXT CATALOG [media_tag_catalog] WITH ACCENT_SENSITIVITY = ON
GO
CREATE FULLTEXT INDEX ON [dbo].[media_tag] KEY INDEX [PK_media_tag_id] ON ([media_tag_catalog]) WITH (CHANGE_TRACKING AUTO)
GO
ALTER FULLTEXT INDEX ON [dbo].[media_tag] ADD ([name])
GO
ALTER FULLTEXT INDEX ON [dbo].[media_tag] ENABLE
GO
