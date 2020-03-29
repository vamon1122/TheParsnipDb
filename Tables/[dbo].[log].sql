/****** Object:  Table [dbo].[log]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [char](50) NOT NULL,
	[datetime_created] [datetime] NOT NULL,
 CONSTRAINT [PK_log_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[log] ADD  CONSTRAINT [DF_log_datetime_created]  DEFAULT (getdate()) FOR [datetime_created]
GO
SET IDENTITY_INSERT [dbo].[log] ON 
INSERT [dbo].[log] ([id], [name], [datetime_created]) VALUES (1, N'General                                           ', CAST(N'2020-02-24T00:28:49.383' AS DateTime))
INSERT [dbo].[log] ([id], [name], [datetime_created]) VALUES (2, N'Debug                                             ', CAST(N'2020-02-24T00:28:49.380' AS DateTime))
INSERT [dbo].[log] ([id], [name], [datetime_created]) VALUES (3, N'Session                                           ', CAST(N'2020-02-24T00:28:49.383' AS DateTime))
INSERT [dbo].[log] ([id], [name], [datetime_created]) VALUES (4, N'Login/Out                                         ', CAST(N'2020-02-24T00:28:49.383' AS DateTime))
INSERT [dbo].[log] ([id], [name], [datetime_created]) VALUES (5, N'Access                                            ', CAST(N'2020-02-24T00:28:49.380' AS DateTime))
INSERT [dbo].[log] ([id], [name], [datetime_created]) VALUES (6, N'Access Justification                              ', CAST(N'2020-02-24T00:28:49.380' AS DateTime))
INSERT [dbo].[log] ([id], [name], [datetime_created]) VALUES (7, N'Test                                              ', CAST(N'2020-02-24T00:28:49.383' AS DateTime))
SET IDENTITY_INSERT [dbo].[log] OFF
GO