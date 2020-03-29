/****** Object:  StoredProcedure [dbo].[log_INSERT]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[log_INSERT] 
	@name char(50),
	@datetime_created datetime = GETDATE
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO 
		log 
		(datetime_created, 
		[name]) 
	VALUES
	(@datetime_created, 
	@name)
END
GO
