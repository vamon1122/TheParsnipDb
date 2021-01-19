SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 19/01/2021
-- Description:	19/01/2021
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 19/01/2021 - Fix wrong view count retrieved
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
		(SELECT COUNT(*) FROM media_share_view MSV INNER JOIN media_share MS ON MSV.media_share_id = MS.id  WHERE MS.id = @id),
		[media_id] 
	FROM 
		media_share 
		INNER JOIN [user] ON [user].[id] = media_share.created_by_user_id 
	WHERE 
		[media_share].[id] = @id 
		AND [user].datetime_deleted IS NULL
	END
GO
