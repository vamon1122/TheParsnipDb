/****** Object:  StoredProcedure [dbo].[media_tag_pair_DELETE_WHERE_media_created_by_user_id]    Script Date: 27/03/2020 19:10:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 19/03/20
-- Description:	Delete media tags by user_id
-- =============================================
-- CHANGELOG
-- V1.0 - 19/03/2020 - Initial Create
-- V1.1 - 27/03/2020 - Added default value for datetime_deleted
-- =============================================
CREATE PROCEDURE [dbo].[media_tag_pair_DELETE_WHERE_media_created_by_user_id] 
	@created_by_user_id int,
	@datetime_deleted datetime = GETDATE
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE 
		media_tag_pair 
	SET 
		datetime_deleted = @datetime_deleted 
	WHERE 
		media_id IN (SELECT id FROM media WHERE created_by_user_id = @created_by_user_id)
END
GO
