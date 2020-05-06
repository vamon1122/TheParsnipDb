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
-- =============================================
CREATE PROCEDURE [dbo].[media_tag_pair_INSERT] 
	@media_id char(8), 
	@media_tag_id int,
	@media_tag_created_by_user_id int
AS
BEGIN
	SET NOCOUNT ON;

	IF (SELECT TOP(1) media_tag_id FROM media_tag_pair WHERE media_id = @media_id AND media_tag_id = @media_tag_id) IS NOT NULL BEGIN
		UPDATE media_tag_pair SET datetime_deleted = NULL WHERE media_id = @media_id AND media_tag_id = @media_tag_id;
	END ELSE BEGIN
		INSERT INTO media_tag_pair (media_id, media_tag_id, created_by_user_id) VALUES (@media_id, @media_tag_id, @media_tag_created_by_user_id);
	END
END
