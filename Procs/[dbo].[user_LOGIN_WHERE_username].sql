SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 29/03/2020
-- Description:	Selects user with corresponding username and password combination & updates datetime_last_login
-- =============================================
-- CHANGELOG
-- 29/03/2020 - Initial create
-- 22/07/2020 added parameter & UPDATE for datetime_last_login
-- =============================================
CREATE PROCEDURE [dbo].[user_LOGIN_WHERE_username] 
	@username nchar(50), 
	@password nchar(50),
	@datetime_now datetime = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF @datetime_now IS NULL 
	BEGIN
		SET @datetime_now = GETDATE()
	END

	UPDATE 
		[user]
	SET 
		datetime_last_login = @datetime_now
	OUTPUT  
		INSERTED.id,
		INSERTED.username,
		INSERTED.email,
		INSERTED.[password],
		INSERTED.forename,
		INSERTED.surname,
		INSERTED.dob,
		INSERTED.gender,
		INSERTED.address_1,
		INSERTED.address_2,
		INSERTED.address_3,
		INSERTED.post_code,
		INSERTED.mobile_phone,
		INSERTED.home_phone,
		INSERTED.work_phone,
		INSERTED.datetime_created,
		INSERTED.datetime_last_login,
		INSERTED.[type],
		INSERTED.[status],
		INSERTED.profile_image_media_id,
		INSERTED.datetime_deleted 
	WHERE 
		datetime_deleted IS NULL 
		AND username = @username 
		AND [password] = @password
END
GO
