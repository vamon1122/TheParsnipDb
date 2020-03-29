/****** Object:  StoredProcedure [dbo].[media_share_SELECT_WHERE_id]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[media_share_SELECT_WHERE_id]
	@id char(8)
AS
BEGIN
	SET NOCOUNT ON;

	

	SELECT 
		[media_share].[id],
		[created_by_user_id], 
		[media_share].[datetime_created], 
		(SELECT COUNT(*) media_share_view WHERE media_id = [media_id]),
		[media_id] 
	FROM 
		media_share 
		INNER JOIN [user] ON [user].[id] = media_share.created_by_user_id 
	WHERE 
		[media_share].[id] = @id 
		AND [user].datetime_deleted IS NULL
	END
GO
