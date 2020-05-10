SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[media_user_pair](
	[media_id] [char](8) NOT NULL,
	[user_id] [int] NOT NULL,
	[created_by_user_id] [int] NOT NULL,
	[datetime_deleted] [datetime] NULL,
	[datetime_created] [datetime] NOT NULL,
 CONSTRAINT [UQ_media_user_pair_media_id_AND_user_id] UNIQUE NONCLUSTERED 
(
	[media_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[media_user_pair] ADD  CONSTRAINT [DF_media_user_pair_datetime_created]  DEFAULT (getdate()) FOR [datetime_created]
GO

ALTER TABLE [dbo].[media_user_pair]  WITH CHECK ADD  CONSTRAINT [FK_media_user_pair_created_by_user] FOREIGN KEY([created_by_user_id])
REFERENCES [dbo].[user] ([id])
GO

ALTER TABLE [dbo].[media_user_pair] CHECK CONSTRAINT [FK_media_user_pair_created_by_user]
GO

ALTER TABLE [dbo].[media_user_pair]  WITH CHECK ADD  CONSTRAINT [FK_media_user_pair_media] FOREIGN KEY([media_id])
REFERENCES [dbo].[media] ([id])
GO

ALTER TABLE [dbo].[media_user_pair] CHECK CONSTRAINT [FK_media_user_pair_media]
GO

ALTER TABLE [dbo].[media_user_pair]  WITH CHECK ADD  CONSTRAINT [FK_media_user_pair_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO

ALTER TABLE [dbo].[media_user_pair] CHECK CONSTRAINT [FK_media_user_pair_user]
GO


