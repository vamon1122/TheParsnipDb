SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 29/03/2020
-- Description:	Selects top 1000 log entries for a given log id
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 29/03/2020 - Initial commit
-- V1.1 - 12/06/2020 - Changed to select top 1000
-- V1.2 - 22/01/2021 - Added ORDER BY
-- =============================================
CREATE PROCEDURE [dbo].[log_entry_SELECT_WHERE_log_id]
	@log_id int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT TOP(1000)
		id,
		log_id,
		session_id,
		datetime_created,
		[text] 
	FROM 
		log_entry 
	WHERE 
		log_id = @log_id  
	ORDER BY
		datetime_created DESC
END
GO
