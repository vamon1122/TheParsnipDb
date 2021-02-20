SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[media_search](
	[text] varchar(1000) NOT NULL,
	[created_by_user_id] [int] NOT NULL,
	[datetime_created] [datetime] NOT NULL,
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[media_search] ADD  CONSTRAINT [DF_media_search_datetime_created]  DEFAULT (getdate()) FOR [datetime_created]
GO
ALTER TABLE [dbo].[media_search]  WITH CHECK ADD  CONSTRAINT [FK_media_search_created_by_user_id] FOREIGN KEY([created_by_user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[media_search] CHECK CONSTRAINT [FK_media_search_created_by_user_id]
GO
