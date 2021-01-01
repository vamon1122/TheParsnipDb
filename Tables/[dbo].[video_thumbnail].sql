SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[video_thumbnail](
	[media_id] [char](8) NOT NULL,
	[created_by_user_id] [int] NULL,
	[datetime_deleted] [datetime] NULL,
	[datetime_created] [datetime] NOT NULL,
	[x_scale] [smallint] NOT NULL,
	[y_scale] [smallint] NOT NULL,
	[display_order] [smallint] NOT NULL,
	[active] [bit] NOT NULL,
	[placeholder_dir] [char](1000) NOT NULL,
	[compressed_dir] [char](1000) NOT NULL,
	[original_dir] [char](1000) NOT NULL,
	
) ON [PRIMARY]
GO

ALTER TABLE dbo.video_thumbnail
ADD CONSTRAINT [UQ_video_thumbnail_media_id_AND_video_thumbnail_display_order] UNIQUE NONCLUSTERED 
(
	[media_id] ASC,
	[display_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE dbo.video_thumbnail
ADD CONSTRAINT FK_video_thumbnail_created_by_user FOREIGN KEY
(
	created_by_user_id
)
REFERENCES [dbo].[user] 
(
	id
)
GO

ALTER TABLE [dbo].[video_thumbnail]
ADD CONSTRAINT [FK_video_thumbnail_video] FOREIGN KEY
(
	[media_id]
)
REFERENCES [dbo].[video] 
(
	[media_id]
)
GO
