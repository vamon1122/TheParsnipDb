/****** Object:  UserDefinedFunction [dbo].[media_COUNT_views]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 04/03/2020
-- Description:	Counts number of times a media has been viewed
-- =============================================
CREATE FUNCTION [dbo].[media_COUNT_views] 
(	
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT 
		media.id, 
		COUNT(*) AS times_used
	FROM 
		media_view 
		INNER JOIN media ON media.id = media_view.media_id 
	GROUP BY 
	media.id
)
GO
