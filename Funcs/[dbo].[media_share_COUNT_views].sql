/****** Object:  UserDefinedFunction [dbo].[media_share_COUNT_views]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 04/03/2020
-- Description:	Counts number of times a media share has been viewed
-- =============================================
CREATE FUNCTION [dbo].[media_share_COUNT_views] 
(	
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT 
		media_share_id, 
		COUNT(*) AS times_used
	FROM 
		media_share_view 
		INNER JOIN media_share ON media_share.id = media_share_view.media_share_id 
	GROUP BY 
	media_share_id
)
GO
