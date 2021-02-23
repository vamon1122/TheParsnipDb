SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.media
(
	id char(8) NOT NULL,
	[type] char(10) NULL,
	[status] char(10) NULL,
	created_by_user_id int NULL,
	datetime_deleted datetime NULL,
	datetime_created datetime NOT NULL,
	datetime_captured datetime NOT NULL,
	title nchar(100) NULL,
	[description] nchar(1000) NULL,
	alt char(1024) NULL,
	x_scale smallint NULL,
	y_scale smallint NULL,
	placeholder_dir char(1024) NULL,
	compressed_dir char(1024) NULL,
	original_dir char(1024) NULL,
	search_terms char(1000) NULL,
	CONSTRAINT PK_media_id PRIMARY KEY CLUSTERED
	(
		id ASC
	)
	WITH 
	(
		PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON
	)
	ON [PRIMARY]
) 
ON [PRIMARY]
GO

ALTER TABLE [dbo].[media] ADD  CONSTRAINT [DF_media_status]  DEFAULT ('raw') FOR [status]
GO

ALTER TABLE dbo.media
ADD CONSTRAINT DF_media_datetime_created
DEFAULT (getdate()) FOR datetime_created
GO

ALTER TABLE dbo.media 
ADD  CONSTRAINT DF_media_datetime_captured
DEFAULT (getdate()) FOR datetime_captured
GO

ALTER TABLE dbo.media  WITH CHECK
ADD CONSTRAINT FK_media_created_by_user
FOREIGN KEY
(
	created_by_user_id
)
REFERENCES dbo.[user]
(
	id
)
GO

ALTER TABLE dbo.media
CHECK CONSTRAINT FK_media_created_by_user
GO

ALTER TABLE [dbo].[media]  WITH CHECK ADD  CONSTRAINT [FK_media_media_status] FOREIGN KEY([status])
REFERENCES [dbo].[media_status] ([status])
GO

ALTER TABLE [dbo].[media] CHECK CONSTRAINT [FK_media_media_status]
GO

ALTER TABLE dbo.media  WITH CHECK
ADD CONSTRAINT FK_media_media_type
FOREIGN KEY
(
	[type]
)
REFERENCES dbo.media_type
(
	[type]
)
GO

ALTER TABLE dbo.media CHECK CONSTRAINT FK_media_media_type
GO
