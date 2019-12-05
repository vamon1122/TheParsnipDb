GO

/****** Object:  StoredProcedure [dbo].[sp_select_media_tag]    Script Date: 05/12/2019 21:37:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ben Barton
-- Create date: 30/11/2019
-- Description:	SELECT media_tag
-- =============================================
CREATE PROCEDURE [dbo].[sp_select_media_tag] 
	@media_tag_id uniqueidentifier = NULL,
	@created_by_user_id uniqueidentifier = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		* 
	FROM 
		media_tag 
		INNER JOIN [user] ON [user].user_id = media_tag.created_by_user_id 
	WHERE 
		[user].datetime_deleted IS NULL
		
		AND (@media_tag_id IS NULL 
		OR media_tag.media_tag_id = @media_tag_id)
		 
		AND (@created_by_user_id IS NULL 
		OR media_tag.created_by_user_id = @created_by_user_id)
END
GO


