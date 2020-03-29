/****** Object:  StoredProcedure [dbo].[log_entry_DELETE]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[log_entry_DELETE] 
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM log_entry
END
GO
