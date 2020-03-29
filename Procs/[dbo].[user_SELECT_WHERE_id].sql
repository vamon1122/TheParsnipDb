/****** Object:  StoredProcedure [dbo].[user_SELECT_WHERE_id]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 17/02/2020
-- Description:	Selects user by ID
-- =============================================
CREATE PROCEDURE [dbo].[user_SELECT_WHERE_id] 
	@id int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		[id]
      ,[username]
      ,[email]
      ,[password]
      ,[forename]
      ,[surname]
      ,[dob]
      ,[gender]
      ,[address_1]
      ,[address_2]
      ,[address_3]
      ,[post_code]
      ,[mobile_phone]
      ,[home_phone]
      ,[work_phone]
      ,[datetime_created]
      ,[datetime_last_login]
      ,[type]
      ,[status]
      ,[profile_image_media_id]
      ,[datetime_deleted]
	FROM 
		[user] 
	WHERE 
		id = @id 
		AND datetime_deleted IS NULL
END
GO
