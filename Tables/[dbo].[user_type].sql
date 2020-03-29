/****** Object:  Table [dbo].[user_type]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_type](
	[type] [char](10) NOT NULL,
 CONSTRAINT [PK_user_type_type] PRIMARY KEY CLUSTERED 
(
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[user_type] ([type]) VALUES (N'user      ')
INSERT [dbo].[user_type] ([type]) VALUES (N'member    ')
INSERT [dbo].[user_type] ([type]) VALUES (N'media     ')
INSERT [dbo].[user_type] ([type]) VALUES (N'admin     ')
GO