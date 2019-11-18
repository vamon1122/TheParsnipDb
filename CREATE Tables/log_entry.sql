/****** Object:  Table [dbo].[log_entry]    Script Date: 06/07/2019 11:16:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[log_entry](
	[log_entry_id] [uniqueidentifier] NOT NULL,
	[log_id] [uniqueidentifier] NOT NULL,
	[session_id] [char](32) NOT NULL,
	[date_time_created] [datetime] NOT NULL,
	[type] [nchar](10) NULL,
	[text] [varchar](4000) NOT NULL,
 CONSTRAINT [PK_t_LogEntries] PRIMARY KEY CLUSTERED 
(
	[log_entry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


