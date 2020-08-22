SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.video
(
	media_id char(8) NOT NULL,
	x_scale float NOT NULL,
	y_scale float NOT NULL,
	compressed_dir char(1024) NULL,
	original_dir char(1024) NULL,
	CONSTRAINT PK_video_media_id PRIMARY KEY CLUSTERED
	(
		media_id ASC
	)
	WITH
	(
		PAD_INDEX = OFF,
		STATISTICS_NORECOMPUTE = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON
	)
	ON [PRIMARY]
)
ON [PRIMARY]
GO

ALTER TABLE dbo.video
SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE dbo.video
ADD CONSTRAINT FK_video_media FOREIGN KEY
(
	media_id
)
REFERENCES dbo.media
(
	id
)
GO
