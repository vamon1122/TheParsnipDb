SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 15/08/2020
-- Description:	Returns some user data and a the 
-- number of views which they have created
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 15/08/2020 - Initial create
-- =============================================

CREATE PROCEDURE [dbo].[media_view_COUNT_created_by_user_id] 
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @view_data TABLE ([user_id] int, view_count int)

	INSERT INTO 
		@view_data 
	SELECT 
		created_by_user_id, 
		COUNT(0) 
	FROM 
		media_view 
	GROUP BY 
		created_by_user_id

	SELECT 
		VD.[user_id] 'User ID',
		COALESCE
		(
			NULLIF(CONCAT(RTRIM(U.forename), ' ', RTRIM(U.surname)), ''), 
			'Not Logged In'
		) [Name], 
		VD.view_count 'View Count' 
	FROM 
		@view_data VD 
		LEFT JOIN [user] U ON U.id = VD.[user_id]
	ORDER BY
		VD.view_count DESC
	
END
GO
