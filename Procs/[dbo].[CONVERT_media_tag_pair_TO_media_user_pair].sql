SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 15/08/2020
-- Description:	Creates media user pairs based 
-- on existing media tag pairs. Then deletes 
-- media tag pairs and media tag
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 15/08/2020 - Initial create
-- =============================================

CREATE PROCEDURE [dbo].[CONVERT_media_tag_pair_TO_media_user_pair] 
	@media_tag_id int,
	@user_id int
	@datetime_now datetime
AS
BEGIN
	SET NOCOUNT ON;

	IF @datetime_now IS NULL BEGIN
		@datetime_now = GETDATE()
	END

	INSERT INTO 
		media_user_pair 
			(media_id,
			[user_id],
			created_by_user_id) 
	SELECT 
		media_id, 
		@mediaUserPairUserId, 
		created_by_user_id
	FROM 
		media_tag_pair 
	WHERE 
		media_tag_id = @mediaTagId
		AND media_tag_pair.datetime_deleted IS NULL

	UPDATE 
		media_tag_pair 
	SET 
		datetime_deleted = @datetime_now 
	WHERE 
		datetime_deleted IS NULL 
		AND media_tag_id = @mediaTagId

	UPDATE 
		media_tag 
	SET 
		datetime_deleted = @datetime_now 
	WHERE 
		datetime_deleted IS NULL 
		AND id = @mediaTagId

END
GO
