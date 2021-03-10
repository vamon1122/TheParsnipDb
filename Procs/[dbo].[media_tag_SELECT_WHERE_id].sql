SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 08/05/2020
-- Description:	SELECT a media_tag by it's id
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 08/05/2020 - Initial create 
-- V1.1 - 10/03/2021 - Added check for deleted media tag
-- =============================================

CREATE PROCEDURE [dbo].[media_tag_SELECT_WHERE_id] 
	@id int
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
		media_tag.datetime_deleted IS NULL
		AND [user].datetime_deleted IS NULL
		AND media_tag.id = @id
END
GO
