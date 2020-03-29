/****** Object:  StoredProcedure [dbo].[user_LOGIN_WHERE_username]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[user_LOGIN_WHERE_username] 
	@username nchar(50), 
	@password nchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT TOP 1 
		id,
		username,
		email,
		[password],
		forename,
		surname,
		dob,
		gender,
		address_1,
		address_2,
		address_3,
		post_code,
		mobile_phone,
		home_phone,
		work_phone,
		datetime_created,
		datetime_last_login,
		[type],
		[status],
		profile_image_media_id,
		datetime_deleted 
	FROM 
		[user] 
	WHERE 
		datetime_deleted IS NULL 
		AND username = @username 
		AND password = @password
END
GO
