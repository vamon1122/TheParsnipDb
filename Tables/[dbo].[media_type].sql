/****** Object:  Table [dbo].[media_type]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[media_type](
	[type] [char](10) NOT NULL,
 CONSTRAINT [PK_media_type_type] PRIMARY KEY CLUSTERED 
(
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[media_type] ([type]) VALUES (N'image     ')
INSERT [dbo].[media_type] ([type]) VALUES (N'video     ')
INSERT [dbo].[media_type] ([type]) VALUES (N'youtube   ')
GO