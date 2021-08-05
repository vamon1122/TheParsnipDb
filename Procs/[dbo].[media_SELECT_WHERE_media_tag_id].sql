SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 30/11/2019
-- Description:	SELECT media
-- =============================================
-- CHANGELOG
-- V1.0 - 30/11/2019 - Initial create
-- V1.1 - 19/03/2020 - Added check if media tag or media tag pair has been deleted
-- V1.2 - 27/03/2020 - Removed [vw_video].media_tag_id (implemented multiple media tags)
-- V1.3 - 05/05/2020 - Removed is_album (removed from table)
-- V1.4 - 11/10/2020 - Added media status
-- V1.5 - 05/08/2021 - Return media for logged in user regardless of status
-- =============================================

CREATE PROCEDURE [dbo].[media_SELECT_WHERE_media_tag_id] 
	@media_tag_id int, 
	@logged_in_user_id int = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @media_tag_pairs TABLE 
	(
		[media_id] char(8)
		,[media_tag_id] int
		,[media_tag_pair_created_by_user_id] int
		,[media_tag_pair_datetime_deleted] datetime
		,[media_tag_pair_datetime_created] datetime
		,[media_tag_pair_created_by_user_datetime_deleted] datetime
		,[media_tag_datetime_deleted] datetime
		,[media_tag_datetime_created] datetime
		,[media_tag_created_by_user_datetime_deleted] datetime
		,[media_tag_name] nchar(100) 
		,[media_tag_description] nchar(1000)
	) 
	  
	INSERT INTO @media_tag_pairs 
	(
		[media_id]
		,[media_tag_id]
		,[media_tag_pair_created_by_user_id]
		,[media_tag_pair_datetime_deleted]
		,[media_tag_pair_datetime_created]
		,[media_tag_pair_created_by_user_datetime_deleted]
		,[media_tag_datetime_deleted]
		,[media_tag_datetime_created]
		,[media_tag_created_by_user_datetime_deleted]
		,[media_tag_name]
		,[media_tag_description]
	) 
	SELECT 
		[media_id]
		,[media_tag_id]
		,[media_tag_pair_created_by_user_id]
		,[media_tag_pair_datetime_deleted]
		,[media_tag_pair_datetime_created]
		,[media_tag_pair_created_by_user_datetime_deleted]
		,[media_tag_datetime_deleted]
		,[media_tag_datetime_created]
		,[media_tag_created_by_user_datetime_deleted]
		,[media_tag_name]
		,[media_tag_description]
	FROM 
		[vw_media_tag_pair] 
	WHERE 
		[media_tag_id] = @media_tag_id
		AND media_tag_pair_datetime_deleted IS NULL 
		AND media_tag_pair_created_by_user_datetime_deleted IS NULL 
		AND media_tag_datetime_deleted IS NULL
		AND media_tag_created_by_user_datetime_deleted IS NULL

	SELECT 
		[vw_media].id,
		[vw_media].title,
		[vw_media].[description],
		[vw_media].alt,
		[vw_media].datetime_captured,
		[vw_media].datetime_created,
		[vw_media].x_scale,
		[vw_media].y_scale,
		[vw_media].original_dir,
		[vw_media].compressed_dir,
		[vw_media].placeholder_dir,
		[vw_media].created_by_user_id,
		NULL, --[vw_media].media_tag_id,
		[media_share].id,
		[media_share].created_by_user_id,
		[media_share].datetime_created AS datetime_media_share_created,
		[vw_media].[type],
		[vw_media].[status]
	FROM
		[vw_media]
		LEFT JOIN media_share 
			ON media_share.created_by_user_id = @logged_in_user_id 
			AND media_share.media_id = [vw_media].id
	WHERE
		[vw_media].datetime_deleted IS NULL	  
		AND ([vw_media].[status] = 'complete' OR [vw_media].created_by_user_id = @logged_in_user_id)
		AND [vw_media].id IN 
			(SELECT 
				media_id 
			FROM 
				@media_tag_pairs
			)
END
GO
