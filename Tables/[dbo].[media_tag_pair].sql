SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[media_tag_pair](
	[media_id] [char](8) NOT NULL,
	[media_tag_id] [int] NOT NULL,
	[created_by_user_id] [int] NOT NULL,
	[datetime_deleted] [datetime] NULL,
	[datetime_created] [datetime] NOT NULL,
 CONSTRAINT [UQ_media_tag_pair_media_id_AND_media_tag_id] UNIQUE NONCLUSTERED 
(
	[media_id] ASC,
	[media_tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[media_tag_pair] ADD  CONSTRAINT [DF_media_tag_pair_datetime_created]  DEFAULT (getdate()) FOR [datetime_created]
GO
ALTER TABLE [dbo].[media_tag_pair]  WITH CHECK ADD  CONSTRAINT [FK_media_tag_pair_created_by_user] FOREIGN KEY([created_by_user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[media_tag_pair] CHECK CONSTRAINT [FK_media_tag_pair_created_by_user]
GO
ALTER TABLE [dbo].[media_tag_pair]  WITH CHECK ADD  CONSTRAINT [FK_media_tag_pair_media] FOREIGN KEY([media_id])
REFERENCES [dbo].[media] ([id])
GO
ALTER TABLE [dbo].[media_tag_pair] CHECK CONSTRAINT [FK_media_tag_pair_media]
GO
ALTER TABLE [dbo].[media_tag_pair]  WITH CHECK ADD  CONSTRAINT [FK_media_tag_pair_media_tag] FOREIGN KEY([media_tag_id])
REFERENCES [dbo].[media_tag] ([id])
GO
ALTER TABLE [dbo].[media_tag_pair] CHECK CONSTRAINT [FK_media_tag_pair_media_tag]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex_media_tag_pair_media_tag_id] ON [dbo].[media_tag_pair]
(
	[media_tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

GO