SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 10/05/2020
-- Description:	INSERTs a media user pair
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 10/05/20 - Initial Create
-- =============================================
CREATE PROCEDURE [dbo].[media_user_pair_INSERT] 
	@media_id char(8), 
	@user_id int,
	@created_by_user_id int
AS
BEGIN
	SET NOCOUNT ON;

	IF (SELECT TOP(1) [user_id] FROM media_user_pair WHERE media_id = @media_id AND [user_id] = @user_id) IS NOT NULL BEGIN
		UPDATE media_user_pair SET datetime_deleted = NULL WHERE media_id = @media_id AND [user_id] = @user_id;
	END ELSE BEGIN
		INSERT INTO media_user_pair (media_id, [user_id], created_by_user_id) VALUES (@media_id, @user_id, @created_by_user_id);
	END
END
GO