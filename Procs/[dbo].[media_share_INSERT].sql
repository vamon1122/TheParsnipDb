/****** Object:  StoredProcedure [dbo].[media_share_INSERT]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[media_share_INSERT] 
	@id char(8), 
		@created_by_user_id int, 
		@datetime_created datetime = GETDATE,  
		@media_id char(8)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO 
		media_share 
		(id, 
		created_by_user_id, 
		datetime_created,
		media_id) 
	VALUES 
		(@id, 
		@created_by_user_id, 
		@datetime_created, 
		@media_id)
END
GO
