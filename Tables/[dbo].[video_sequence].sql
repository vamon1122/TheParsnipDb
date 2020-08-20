SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.video_sequence
(
	media_id char(8) NOT NULL,
	original_media_id char(8) NOT NULL,
	position int NOT NULL
)
ON [PRIMARY]
GO

ALTER TABLE dbo.video_sequence
SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE dbo.video_sequence
ADD CONSTRAINT UQ_video_sequence_media_id_AND_original_media_id UNIQUE
(
	media_id,
	original_media_id
)
GO

ALTER TABLE dbo.video_sequence
ADD CONSTRAINT UQ_video_sequence_media_id_AND_position UNIQUE
(
	media_id,
	position
)
GO

ALTER TABLE dbo.video_sequence
ADD CONSTRAINT FK_video_sequence_media FOREIGN KEY
(
	media_id
)
REFERENCES dbo.media
(
	id
)
ON UPDATE  NO ACTION
ON DELETE  NO ACTION
GO

ALTER TABLE dbo.video_sequence
ADD CONSTRAINT FK_video_sequence_original_media FOREIGN KEY
(
	original_media_id
)
REFERENCES dbo.media
(
	id
)
ON UPDATE  NO ACTION
ON DELETE  NO ACTION
GO
