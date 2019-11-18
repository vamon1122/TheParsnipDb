/****** Object:  Table [dbo].[video]    Script Date: 28/10/2019 19:58:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[video](
	[video_id] [uniqueidentifier] NOT NULL,
	[title] [nchar](100) NULL,
	[description] [nvarchar](1000) NULL,
	[alt] [char](125) NULL,
	[date_time_media_created] [datetime] NULL,
	[date_time_created] [datetime] NOT NULL,
	[video_x_scale] [float] NULL,
	[video_y_scale] [float] NULL,
	[video_original_dir] [char](1024) NULL,
	[video_compressed_dir] [char](1024) NOT NULL,
	[thumbnail_x_scale] [float] NULL,
	[thumbnail_y_scale] [float] NULL,
	[thumbnail_original_dir] [char](1024) NOT NULL,
	[thumbnail_compressed_dir] [char](1024) NULL,
	[thumbnail_placeholder_dir] [char](1024) NULL,
	[created_by_user_id] [uniqueidentifier] NOT NULL,
	[deleted] [datetime] NULL,
 CONSTRAINT [PK_video] PRIMARY KEY CLUSTERED 
(
	[video_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[video] ADD  CONSTRAINT [DF_video_video_id]  DEFAULT (newid()) FOR [video_id]
GO

ALTER TABLE [dbo].[video]  WITH CHECK ADD  CONSTRAINT [FK_video_user] FOREIGN KEY([created_by_user_id])
REFERENCES [dbo].[user] ([user_id])
GO

ALTER TABLE [dbo].[video] CHECK CONSTRAINT [FK_video_user]
GO


