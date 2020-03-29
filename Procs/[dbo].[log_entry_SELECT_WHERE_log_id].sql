/****** Object:  StoredProcedure [dbo].[log_entry_SELECT_WHERE_log_id]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[log_entry_SELECT_WHERE_log_id]
	@log_id int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		id,
		log_id,
		session_id,
		datetime_created,
		[text] 
	FROM 
		log_entry 
	WHERE 
		log_id = @log_id  
END
GO
