/****** Object:  Table [dbo].[video]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[video](
	[media_id] [char](8) NOT NULL,
	[x_scale] [float] NULL,
	[y_scale] [float] NULL,
	[compressed_dir] [char](1024) NOT NULL,
	[original_dir] [char](1024) NULL,
 CONSTRAINT [PK_video_media_id] PRIMARY KEY CLUSTERED 
(
	[media_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[video]  WITH CHECK ADD  CONSTRAINT [FK_video_media] FOREIGN KEY([media_id])
REFERENCES [dbo].[media] ([id])
GO
ALTER TABLE [dbo].[video] CHECK CONSTRAINT [FK_video_media]
GO
