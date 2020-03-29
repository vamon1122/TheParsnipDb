/****** Object:  StoredProcedure [dbo].[media_SELECT_share_stats]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 20/02/2020
-- Description:	Gets share stats for images
-- =============================================
CREATE PROCEDURE [dbo].[media_SELECT_share_stats]
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		[vw_media].id, 
		COALESCE(NULLIF([vw_media].title, ''), '[NO TITLE]') AS title,
		uploaded_by.forename AS uploaded_by, 
		shared_by.forename AS shared_by, 
        vw_media_share.times_used, 
		vw_media_share.id, 
		[vw_media].[type], 
        shared_by.id AS shared_by_id
    FROM 
		vw_media_share 
        INNER JOIN vw_media ON vw_media_share.media_id = vw_media.id 
        INNER JOIN[user] AS uploaded_by ON vw_media.created_by_user_id = uploaded_by.id 
        INNER JOIN[user] AS shared_by ON vw_media_share.created_by_user_id = shared_by.id 

    WHERE 
		[vw_media].datetime_deleted IS NULL
		AND [vw_media].datetime_user_deleted IS NULL
		AND vw_media_share.times_used > 0 
	ORDER BY 
		vw_media_share.times_used DESC
END
GO
