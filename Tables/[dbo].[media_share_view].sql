/****** Object:  Table [dbo].[media_share_view]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[media_share_view](
	[media_view_id] [int] NOT NULL,
	[media_share_id] [char](8) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[media_share_view] ADD  CONSTRAINT [DF_media_share_view_media_id]  DEFAULT (getdate()) FOR [media_share_id]
GO
ALTER TABLE [dbo].[media_share_view]  WITH CHECK ADD  CONSTRAINT [FK_media_share_view_media_share] FOREIGN KEY([media_share_id])
REFERENCES [dbo].[media_share] ([id])
GO
ALTER TABLE [dbo].[media_share_view] CHECK CONSTRAINT [FK_media_share_view_media_share]
GO
ALTER TABLE [dbo].[media_share_view]  WITH CHECK ADD  CONSTRAINT [FK_media_share_view_media_view] FOREIGN KEY([media_view_id])
REFERENCES [dbo].[media_view] ([id])
GO
ALTER TABLE [dbo].[media_share_view] CHECK CONSTRAINT [FK_media_share_view_media_view]
GO
