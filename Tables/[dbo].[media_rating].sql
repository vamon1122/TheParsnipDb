SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.media_rating
(
	media_id char(8) NOT NULL,
	created_by_user_id int NOT NULL,
	datetime_deleted datetime NULL,
	datetime_created datetime NOT NULL,
	rating bit NOT NULL
)
ON [PRIMARY]
GO

ALTER TABLE dbo.media_rating SET (LOCK_ESCALATION = TABLE)
GO

ALTER TABLE dbo.media_rating ADD  CONSTRAINT DF_media_rating_datetime_created  DEFAULT (getdate()) FOR datetime_created
GO

ALTER TABLE dbo.media_rating ADD CONSTRAINT UQ_media_rating_media_id_AND_created_by_user_id_AND_datetime_deleted UNIQUE
(
    media_id, created_by_user_id, datetime_deleted
)
GO

ALTER TABLE dbo.media_rating ADD CONSTRAINT FK_media_rating_media FOREIGN KEY
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

ALTER TABLE dbo.media_rating ADD CONSTRAINT
FK_media_rating_user FOREIGN KEY
(
	created_by_user_id
) 
REFERENCES dbo.[user]
(
	id
) 
ON UPDATE  NO ACTION 
ON DELETE  NO ACTION 
GO
