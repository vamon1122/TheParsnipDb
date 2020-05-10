SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 10/05/20
-- Description:	Select media tag pair where media id
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 10/05/2020 - Initial create
-- =============================================
CREATE PROCEDURE [dbo].[media_user_pair_SELECT_WHERE_media_id] 
	@media_id char(8)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		[media_id]
		,[user_id]
		,[created_by_user_id]
		,[username]
	FROM 
		[vw_media_user_pair]
	WHERE 
		media_id = @media_id	
		AND [media_user_pair_datetime_deleted] IS NULL
		AND [user_datetime_deleted] IS NULL
END
GO