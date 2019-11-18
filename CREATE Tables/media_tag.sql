/****** Object:  Table [dbo].[media_tag]    Script Date: 06/07/2019 11:17:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[media_tag](
	[media_tag_id] [uniqueidentifier] NOT NULL,
	[created_by_user_id] [uniqueidentifier] NOT NULL,
	[date_time_created] [datetime] NOT NULL,
	[name] [nchar](100) NULL,
	[description] [nchar](1000) NULL,
 CONSTRAINT [PK_t_Albums] PRIMARY KEY CLUSTERED 
(
	[media_tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[media_tag] ADD  CONSTRAINT [DF_t_Albums_id]  DEFAULT (newid()) FOR [media_tag_id]
GO


