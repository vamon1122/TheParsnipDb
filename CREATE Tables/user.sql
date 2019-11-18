/****** Object:  Table [dbo].[user]    Script Date: 29/08/2019 00:28:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[user](
	[user_id] [uniqueidentifier] NOT NULL,
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
	[date_time_created] [datetime] NOT NULL,
	[last_login] [datetime] NULL,
	[type] [char](50) NOT NULL,
	[status] [char](50) NOT NULL,
	[profile_pic_url] [char](260) NULL,
	[deleted] [datetime] NULL,
 CONSTRAINT [PK__t_Users__5B34237E38D67883] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF__t_Users__col_Dat__108B795B]  DEFAULT (getdate()) FOR [date_time_created]
GO


