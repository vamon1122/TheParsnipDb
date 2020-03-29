/****** Object:  StoredProcedure [dbo].[log_entry_INSERT]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Ben Barton
-- Create date: 13/02/2020
-- Description:	Inserts a row in to log_entry
-- =============================================
CREATE PROCEDURE [dbo].[log_entry_INSERT] 
	@log_id char(50),
	@session_id char(32),
	@text varchar(4000),
	@datetime_created datetime
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO 
		log_entry (log_id, session_id, datetime_created, text) 
	VALUES
		(@log_id, @session_id, @datetime_created, @text)
END
GO
