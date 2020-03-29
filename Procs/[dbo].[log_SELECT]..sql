/****** Object:  StoredProcedure [dbo].[log_SELECT]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 17/02/2020
-- Description:	Selects all logs
-- =============================================
CREATE PROCEDURE [dbo].[log_SELECT] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		[id]
        ,[name]
		,[datetime_created]
	FROM 
		[log]
END
GO
