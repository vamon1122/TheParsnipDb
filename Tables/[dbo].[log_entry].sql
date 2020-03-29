/****** Object:  Table [dbo].[log_entry]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[log_entry](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[log_id] [int] NOT NULL,
	[datetime_created] [datetime] NOT NULL,
	[session_id] [char](32) NOT NULL,
	[text] [varchar](4000) NOT NULL,
 CONSTRAINT [PK_log_entry_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[log_entry] ADD  CONSTRAINT [DF_log_entry_datetime_created]  DEFAULT (getdate()) FOR [datetime_created]
GO
ALTER TABLE [dbo].[log_entry]  WITH CHECK ADD  CONSTRAINT [FK_log_entry_log] FOREIGN KEY([log_id])
REFERENCES [dbo].[log] ([id])
GO
ALTER TABLE [dbo].[log_entry] CHECK CONSTRAINT [FK_log_entry_log]
GO
