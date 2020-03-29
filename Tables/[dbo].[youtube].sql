/****** Object:  Table [dbo].[youtube]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[youtube](
	[media_id] [char](8) NOT NULL,
	[data_id] [char](11) NOT NULL,
 CONSTRAINT [PK_youtube_video_media_id] PRIMARY KEY CLUSTERED 
(
	[media_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[youtube]  WITH CHECK ADD  CONSTRAINT [FK_youtube_video_media] FOREIGN KEY([media_id])
REFERENCES [dbo].[media] ([id])
GO
ALTER TABLE [dbo].[youtube] CHECK CONSTRAINT [FK_youtube_video_media]
GO
