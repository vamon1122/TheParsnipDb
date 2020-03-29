/****** Object:  StoredProcedure [dbo].[media_tag_SELECT]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 14/02/2020
-- Description:	SELECT all media_tags
-- =============================================

CREATE PROCEDURE [dbo].[media_tag_SELECT] 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		media_tag.[id]
      ,[created_by_user_id]
      ,[media_tag].[datetime_created]
      ,[name]
      ,[description]
	FROM 
		media_tag 
		INNER JOIN [user] ON [user].id = media_tag.created_by_user_id 
	WHERE 
		[user].datetime_deleted IS NULL
END
GO
