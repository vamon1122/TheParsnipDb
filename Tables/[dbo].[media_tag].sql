SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[media_tag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_by_user_id] [int] NOT NULL,
	[url] [char](1000) NULL,
	[datetime_deleted] [datetime] NULL,
	[datetime_created] [datetime] NOT NULL,
	[name] [nchar](100) NOT NULL,
	[description] [nchar](1000) NULL,
	[search_terms] char(1000) NULL,
 CONSTRAINT [PK_media_tag_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[media_tag] ADD  CONSTRAINT [DF_media_tag_datetime_created]  DEFAULT (getdate()) FOR [datetime_created]
GO
ALTER TABLE [dbo].[media_tag]  WITH CHECK ADD  CONSTRAINT [FK_media_tag_created_by_user] FOREIGN KEY([created_by_user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[media_tag] CHECK CONSTRAINT [FK_media_tag_created_by_user]
GO
SET IDENTITY_INSERT [dbo].[media_tag] ON 
INSERT [dbo].[media_tag] ([id], [created_by_user_id], [url], [datetime_deleted], [datetime_created], [name], [description]) VALUES (1, 1, 'photos', NULL, CAST(N'2020-02-24T00:28:49.393' AS DateTime), N'Photos                                                                                              ', NULL)
INSERT [dbo].[media_tag] ([id], [created_by_user_id], [url], [datetime_deleted], [datetime_created], [name], [description]) VALUES (2, 1, 'videos', NULL, CAST(N'2020-02-24T00:28:49.397' AS DateTime), N'Videos                                                                                              ', NULL)
INSERT [dbo].[media_tag] ([id], [created_by_user_id], [url], [datetime_deleted], [datetime_created], [name], [description]) VALUES (3, 1, 'memes', NULL, CAST(N'2020-02-24T00:28:49.393' AS DateTime), N'Memes                                                                                               ', NULL)
INSERT [dbo].[media_tag] ([id], [created_by_user_id], [url], [datetime_deleted], [datetime_created], [name], [description]) VALUES (4, 1, 'amsterdam', NULL, CAST(N'2020-02-24T00:28:49.393' AS DateTime), N'Amsterdam                                                                                           ', NULL)
INSERT [dbo].[media_tag] ([id], [created_by_user_id], [url], [datetime_deleted], [datetime_created], [name], [description]) VALUES (5, 1, 'portugal', NULL, CAST(N'2020-02-24T00:28:49.393' AS DateTime), N'Portugal                                                                                            ', NULL)
INSERT [dbo].[media_tag] ([id], [created_by_user_id], [url], [datetime_deleted], [datetime_created], [name], [description]) VALUES (6, 1, 'krakow', NULL, CAST(N'2020-02-24T00:28:49.393' AS DateTime), N'Krakow                                                                                              ', NULL)
SET IDENTITY_INSERT [dbo].[media_tag] OFF
GO