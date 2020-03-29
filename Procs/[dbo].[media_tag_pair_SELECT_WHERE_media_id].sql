/****** Object:  StoredProcedure [dbo].[media_tag_pair_SELECT_WHERE_media_id]    Script Date: 27/03/2020 21:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 27/03/20
-- Description:	Select media tag pair where media id
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 27/03/2020 - Initial create
-- =============================================
CREATE PROCEDURE [dbo].[media_tag_pair_SELECT_WHERE_media_id] 
	@media_id char(8)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		[media_id]
		,[media_tag_id]
		,[media_tag_pair_created_by_user_id]
		,[media_tag_pair_datetime_created]
		,[media_tag_created_by_user_id]
		,[media_tag_datetime_created]
		,[media_tag_name]
		,[media_tag_description]
	FROM 
		[vw_media_tag_pair]
	WHERE 
		media_id = @media_id	
		AND [media_tag_pair_datetime_deleted] IS NULL
		AND [media_tag_pair_created_by_user_datetime_deleted] IS NULL
		AND [media_tag_datetime_deleted] IS NULL
		AND media_tag_created_by_user_datetime_deleted IS NULL
END
GO
