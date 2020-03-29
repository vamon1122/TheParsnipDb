/****** Object:  StoredProcedure [dbo].[media_view_INSERT]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 04/03/2020
-- Description: Increments view count for share	
-- =============================================
CREATE PROCEDURE [dbo].[media_view_INSERT] 
	@media_id char(8),
	@created_by_user_id int = NULL,
	@date_time_created datetime = GETDATE
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO 
		media_view 
			(media_id, created_by_user_id, datetime_created) 
		VALUES
			(@media_id, @created_by_user_id, @date_time_created)
END
GO
