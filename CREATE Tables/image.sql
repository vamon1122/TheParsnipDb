/****** Object:  Table [dbo].[image]    Script Date: 24/10/2019 09:58:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[image](
	[image_id] [uniqueidentifier] NOT NULL,
	[title] [nchar](100) NULL,
	[description] [nchar](1000) NULL,
	[alt] [char](1024) NULL,
	[date_time_media_created] [datetime] NULL,
	[date_time_created] [datetime] NOT NULL,
	[x_scale] [float] NULL,
	[y_scale] [float] NULL,
	[original_dir] [char](1024) NULL,
	[compressed_dir] [char](1024) NOT NULL,
	[placeholder_dir] [char](1024) NULL,
	[created_by_user_id] [uniqueidentifier] NOT NULL,
	[deleted] [datetime] NULL,
 CONSTRAINT [PK_t_Images] PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[image] ADD  CONSTRAINT [DF_t_Photos_id]  DEFAULT (newid()) FOR [image_id]
GO

ALTER TABLE [dbo].[image]  WITH CHECK ADD  CONSTRAINT [FK_image_user] FOREIGN KEY([created_by_user_id])
REFERENCES [dbo].[user] ([user_id])
GO

ALTER TABLE [dbo].[image] CHECK CONSTRAINT [FK_image_user]
GO


