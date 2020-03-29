/****** Object:  StoredProcedure [dbo].[log_entry_SELECT]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[log_entry_SELECT]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT [id]
      ,[log_id]
      ,[session_id]
      ,[datetime_created]
      ,[text] FROM log_entry ORDER BY datetime_created DESC
END
GO
