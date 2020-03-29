/****** Object:  StoredProcedure [dbo].[user_UPDATE]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 23/02/2020
-- Description:	Updates an user
-- =============================================
CREATE PROCEDURE [dbo].[user_UPDATE] 
	-- Add the parameters for the stored procedure here
	@id int,
	@username nchar(50), 
	@email varchar(254) = null,
	@password nchar(50) = null,
	@forename nchar(50),
	@surname nchar(50),
	@gender char(1) = null,
	@dob datetime = null,
	@address_1 nchar(50) = null,
	@address_2 nchar(50) = null,
	@address_3 nchar(50) = null,
	@post_code char(16) = null,
	@mobile_phone char(32) = null,
	@home_phone char(32) = null,
	@work_phone char(32) = null,
	@type char(10),
	@status char(10)
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE 
		[user]
	SET
		username = @username,
		email = @email,
		[password] = @password,
		forename = @forename,
		surname = @surname,
		gender = @gender,
		dob = @dob,
		address_1 = @address_1,
		address_2 = @address_2,
		address_3 = @address_3,
		post_code = @post_code,
		mobile_phone = @mobile_phone,
		home_phone = @home_phone,
		work_phone = @work_phone,
		[type] = @type,
		[status] = @status
	WHERE
		id = @id
END
GO
