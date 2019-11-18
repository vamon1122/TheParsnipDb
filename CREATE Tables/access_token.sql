/****** Object:  Table [dbo].[access_token]    Script Date: 06/07/2019 11:14:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[access_token](
	[access_token_id] [uniqueidentifier] NOT NULL,
	[created_by_user_id] [uniqueidentifier] NOT NULL,
	[date_time_created] [datetime] NOT NULL,
	[times_used] [int] NOT NULL,
	[media_id] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[access_token] ADD  CONSTRAINT [DF_access_token_access_token_id]  DEFAULT (newid()) FOR [access_token_id]
GO


