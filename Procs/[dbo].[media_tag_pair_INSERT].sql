SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 06/05/2020
-- Description:	INSERTs a media tag pair
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 06/05/20 - Initial Create
-- V1.1 - 18/03/22 - Changed insert by id to insert by name
-- =============================================
CREATE PROCEDURE [dbo].[media_tag_pair_INSERT] 
	@media_id char(8), 
	@media_tag_name char(100),
	@media_tag_created_by_user_id int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @media_tag_id INT = (SELECT TOP(1) id FROM media_tag WHERE [name] = @media_tag_name COLLATE SQL_Latin1_General_CP1_CS_AS)
	IF(@media_tag_id IS NULL) BEGIN
		EXEC @media_tag_id = media_tag_INSERT @media_tag_created_by_user_id, NULL, @media_tag_name, NULL
	END

	IF (SELECT TOP(1) media_tag_id FROM media_tag_pair WHERE media_id = @media_id AND media_tag_id = @media_tag_id) IS NOT NULL BEGIN
		UPDATE media_tag_pair SET datetime_deleted = NULL WHERE media_id = @media_id AND media_tag_id = @media_tag_id;
	END ELSE BEGIN
		INSERT INTO media_tag_pair (media_id, media_tag_id, created_by_user_id) VALUES (@media_id, @media_tag_id, @media_tag_created_by_user_id);
	END
END
