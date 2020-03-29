/****** Object:  StoredProcedure [dbo].[user_INSERT]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 23/02/2020
-- Description:	Inserts an user
-- =============================================
CREATE PROCEDURE [dbo].[user_INSERT] 
	@username nchar(50), 
	@forename nchar(50), 
	@surname nchar(50), 
	@datetime_created datetime = GETDATE, 
	@type char(10), 
	@status char(10)
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
END
GO
