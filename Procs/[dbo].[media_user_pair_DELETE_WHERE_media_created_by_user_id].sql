SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 10/05/20
-- Description:	Delete media_user_pairs by user_id
-- =============================================
-- CHANGELOG
-- V1.0 - 10/05/2020 - Initial Create
-- =============================================
CREATE PROCEDURE [dbo].[media_user_pair_DELETE_WHERE_media_created_by_user_id] 
	@created_by_user_id int,
	@datetime_deleted datetime = GETDATE
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE 
		media_user_pair 
	SET 
		datetime_deleted = @datetime_deleted 
	WHERE 
		media_id IN (SELECT id FROM media WHERE created_by_user_id = @created_by_user_id)
END
