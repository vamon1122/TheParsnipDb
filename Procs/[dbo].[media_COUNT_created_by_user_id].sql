SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 15/08/2020
-- Description:	Returns some user data and a the 
-- number of media that they've uploaded
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 15/08/2020 - Initial create
-- =============================================

CREATE PROCEDURE [dbo].[media_COUNT_created_by_user_id] 
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @upload_data TABLE ([user_id] int, upload_count int)

	INSERT INTO 
		@upload_data 
	SELECT 
		created_by_user_id, 
		COUNT(0) 
	FROM 
		media 
	GROUP BY 
		created_by_user_id

	SELECT 
		UD.[user_id] 'User ID',
		CONCAT(RTRIM(U.forename), ' ', RTRIM(U.surname)) [Name],
		UD.upload_count 'Upload Count' 
	FROM 
		@upload_data UD 
		LEFT JOIN [user] U ON U.id = UD.[user_id]
	ORDER BY
		UD.upload_count DESC

END
GO
