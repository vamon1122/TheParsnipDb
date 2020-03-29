/****** Object:  Table [dbo].[user]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[profile_image_media_id] [char](8) NULL,
	[datetime_deleted] [datetime] NULL,
	[datetime_last_login] [datetime] NULL,
	[datetime_created] [datetime] NOT NULL,
	[type] [char](10) NOT NULL,
	[status] [char](10) NOT NULL,
	[username] [nchar](50) NOT NULL,
	[email] [varchar](254) NULL,
	[password] [nchar](50) NULL,
	[forename] [nchar](50) NOT NULL,
	[surname] [nchar](50) NOT NULL,
	[dob] [date] NULL,
	[gender] [char](1) NULL,
	[address_1] [nchar](50) NULL,
	[address_2] [nchar](50) NULL,
	[address_3] [nchar](50) NULL,
	[post_code] [char](16) NULL,
	[mobile_phone] [char](32) NULL,
	[home_phone] [char](32) NULL,
	[work_phone] [char](32) NULL,
 CONSTRAINT [PK_user_id_ASC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_user_username_ASC] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF_user_datetime_created]  DEFAULT (getdate()) FOR [datetime_created]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_profile_media] FOREIGN KEY([profile_image_media_id])
REFERENCES [dbo].[media] ([id])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_profile_media]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_user_status] FOREIGN KEY([status])
REFERENCES [dbo].[user_status] ([status])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_user_status]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_user_type] FOREIGN KEY([type])
REFERENCES [dbo].[user_type] ([type])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_user_type]
GO
SET IDENTITY_INSERT [dbo].[user] ON 
INSERT [dbo].[user] ([id], [profile_image_media_id], [datetime_deleted], [datetime_last_login], [datetime_created], [type], [status], [username], [email], [password], [forename], [surname], [dob], [gender], [address_1], [address_2], [address_3], [post_code], [mobile_phone], [home_phone], [work_phone]) VALUES (1, NULL, NULL, NULL, CAST(N'2020-02-24T00:28:49.380' AS DateTime), N'admin     ', N'active    ', N'vamon1122                                         ', N'benbartontablet@gmail.com', N'password', N'Ben                                               ', N'Barton                                            ', CAST(N'1999-04-17' AS Date), N'M', N'106 Butterstile Lane                              ', N'Prestwich                                         ', N'Manchester                                        ', N'M259PP          ', N'07982087077                     ', N'01612805566                     ', N'07983198188                     ')
SET IDENTITY_INSERT [dbo].[user] OFF
GO
