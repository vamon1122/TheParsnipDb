/****** Object:  StoredProcedure [dbo].[media_SELECT_media_tag_id]    Script Date: 28/03/2020 18:43:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 21/02/2020
-- Description:	Gets all of media's media tags
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 20/02/2020 - Initial create
-- V1.1 - 28/03/2020 - Added checks for media tag / media tag pair is deleted
-- =============================================
CREATE PROCEDURE [dbo].[media_SELECT_media_tag_id] 
	@media_id char(8)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		media_tag_id 
	FROM 
		vw_media_tag_pair 
	WHERE 
		media_id = @media_id
		AND media_tag_datetime_deleted IS NULL
		AND media_tag_pair_datetime_deleted IS NULL
END
GO
