/****** Object:  Table [dbo].[user_status]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_status](
	[status] [char](10) NOT NULL,
 CONSTRAINT [PK_user_status_status] PRIMARY KEY CLUSTERED 
(
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[user_status] ([status]) VALUES (N'active    ')
INSERT [dbo].[user_status] ([status]) VALUES (N'inactive  ')
INSERT [dbo].[user_status] ([status]) VALUES (N'suspended ')
GO