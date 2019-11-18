/****** Object:  Table [dbo].[youtube_video]    Script Date: 24/08/2019 00:04:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[youtube_video](
	[youtube_video_id] [uniqueidentifier] NOT NULL,
	[data_id] [char](11) NOT NULL,
	[date_time_media_created] [datetime] NULL,
	[date_time_created] [datetime] NOT NULL,
	[created_by_user_id] [uniqueidentifier] NOT NULL,
	[title] [nchar](100) NULL,
	[description] [nchar](1000) NULL,
	[deleted] [datetime] NULL,
 CONSTRAINT [PK_youtube_video] PRIMARY KEY CLUSTERED 
(
	[youtube_video_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[youtube_video] ADD  CONSTRAINT [DF_youtube_video_youtube_video_id]  DEFAULT (newid()) FOR [youtube_video_id]
GO

ALTER TABLE [dbo].[youtube_video]  WITH CHECK ADD  CONSTRAINT [FK_youtube_video_user] FOREIGN KEY([created_by_user_id])
REFERENCES [dbo].[user] ([user_id])
GO

ALTER TABLE [dbo].[youtube_video] CHECK CONSTRAINT [FK_youtube_video_user]
GO


