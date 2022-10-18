/****** Object:  Table [dbo].[media_view]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[media_view](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[media_id] [char](8) NOT NULL,
	[created_by_user_id] [int] NULL,
	[datetime_created] [datetime] NOT NULL,
	[is_scroll] [bit] NOT NULL CONSTRAINT DF_media_view_is_scroll DEFAULT 0,
	[view_timespan] [time](7) NULL
 CONSTRAINT [PK_media_view] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[media_view] ADD  CONSTRAINT [DF_media_view_datetime_created]  DEFAULT (getdate()) FOR [datetime_created]
GO
ALTER TABLE [dbo].[media_view]  WITH CHECK ADD  CONSTRAINT [FK_media_view_created_by_user_id] FOREIGN KEY([created_by_user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[media_view] CHECK CONSTRAINT [FK_media_view_created_by_user_id]
GO
ALTER TABLE [dbo].[media_view]  WITH CHECK ADD  CONSTRAINT [FK_media_view_media] FOREIGN KEY([media_id])
REFERENCES [dbo].[media] ([id])
GO
ALTER TABLE [dbo].[media_view] CHECK CONSTRAINT [FK_media_view_media]
GO
