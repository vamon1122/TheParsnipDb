/****** Object:  Table [dbo].[media_share]    Script Date: 29/03/2020 12:49:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[media_share](
	[id] [char](8) NOT NULL,
	[media_id] [char](8) NOT NULL,
	[created_by_user_id] [int] NOT NULL,
	[datetime_created] [datetime] NOT NULL,
 CONSTRAINT [PK_access_token_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_media_share_media_id_AND_media_share_created_by_user_id] UNIQUE NONCLUSTERED 
(
	[media_id] ASC,
	[created_by_user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[media_share] ADD  CONSTRAINT [DF_media_share_datetime_created]  DEFAULT (getdate()) FOR [datetime_created]
GO
ALTER TABLE [dbo].[media_share]  WITH CHECK ADD  CONSTRAINT [FK_media_share_created_by_user] FOREIGN KEY([created_by_user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[media_share] CHECK CONSTRAINT [FK_media_share_created_by_user]
GO
ALTER TABLE [dbo].[media_share]  WITH CHECK ADD  CONSTRAINT [FK_media_share_media] FOREIGN KEY([media_id])
REFERENCES [dbo].[media] ([id])
GO
ALTER TABLE [dbo].[media_share] CHECK CONSTRAINT [FK_media_share_media]
GO
