/****** Object:  StoredProcedure [dbo].[log_SELECT_WHERE_id]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Ben Barton
-- Create date: 13/02/2020
-- Description:	select log by id
-- =============================================
CREATE PROCEDURE [dbo].[log_SELECT_WHERE_id]
	@id int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		[id],
		[name],
		[datetime_created]
		
	 FROM 
		log
	WHERE 
		id = @id
END
GO
