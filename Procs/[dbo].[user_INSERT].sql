SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 23/02/2020
-- Description:	Inserts an user
-- =============================================
-- CHANGELOG
-- 23/03/2020 - Initial create
-- 27/07/2020 - Added parameters for UPDATE
-- =============================================

CREATE PROCEDURE [dbo].[user_INSERT] 
	@username nchar(50), 
	@forename nchar(50), 
	@surname nchar(50), 
	@datetime_created datetime = GETDATE, 
	@type char(10), 
	@status char(10),
	@email varchar(254) = null,
	@password nchar(50) = null,
	@gender char(1) = null,
	@dob datetime = null,
	@address_1 nchar(50) = null,
	@address_2 nchar(50) = null,
	@address_3 nchar(50) = null,
	@post_code char(16) = null,
	@mobile_phone char(32) = null,
	@home_phone char(32) = null,
	@work_phone char(32) = null
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [user] 
		(username, 
		forename, 
		surname, 
		datetime_created, 
		[type], 
		[status]) 
	VALUES
		(@username, 
		@forename, 
		@surname, 
		@datetime_created, 
		@type, 
		@status)

	DECLARE @id int = @@IDENTITY
	EXEC media_UPDATE 
		@id,
		@username, 
		@email,
		@password,
		@forename,
		@surname,
		@gender,
		@dob,
		@address_1,
		@address_2,
		@address_3,
		@post_code,
		@mobile_phone,
		@home_phone,
		@work_phone,
		@type,
		@status
END
GO
