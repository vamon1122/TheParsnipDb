/****** Object:  Table [dbo].[log]    Script Date: 06/07/2019 11:16:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[log](
	[log_id] [uniqueidentifier] NOT NULL,
	[date_time_created] [datetime] NOT NULL,
	[name] [char](50) NOT NULL,
 CONSTRAINT [PK_t_Logs] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[log] ADD  CONSTRAINT [DF_t_Logs_id]  DEFAULT (newid()) FOR [log_id]
GO

ALTER TABLE [dbo].[log] ADD  CONSTRAINT [DF_t_Logs_dateTime]  DEFAULT (getdate()) FOR [date_time_created]
GO


