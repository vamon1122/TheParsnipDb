/****** Object:  StoredProcedure [dbo].[user_DELETE_WHERE_id]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 23/02/2020
-- Description:	Delete user by id
-- =============================================
CREATE PROCEDURE [dbo].[user_DELETE_WHERE_id] 
	@id char(10)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE 
		[user]
	SET
		datetime_deleted = GETDATE()
	WHERE 
		id = @id
END
GO
