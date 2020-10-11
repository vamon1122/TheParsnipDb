SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.media_status
(
	[status] char(10) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE dbo.media_status ADD CONSTRAINT
	PK_media_status PRIMARY KEY CLUSTERED 
	(
		[status]
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

ALTER TABLE dbo.media_status SET (LOCK_ESCALATION = TABLE)
GO
