SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 10/05/2020
-- Description:	SELECT media which an user is tagged in
-- =============================================
-- CHANGELOG
-- V1.0 - 10/05/2020 - Initial create
-- =============================================
CREATE PROCEDURE [dbo].[media_SELECT_WHERE_media_user_pair_user_id] 
	@user_id int, 
	@logged_in_user_id int = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @media_ids TABLE 
	(
		[media_id] char(8)
	) 
	  
	INSERT INTO @media_ids 
	(
		[media_id]
	) 
	SELECT 
		[media_id]
	FROM 
		[vw_media_user_pair] 
	WHERE 
		[user_id] = @user_id
		AND media_user_pair_datetime_deleted IS NULL 
		AND media_user_pair_created_by_user_datetime_deleted IS NULL 
		AND user_datetime_deleted IS NULL
	
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
		NULL, --[vw_media].user_id,
		[media_share].id,
		[media_share].created_by_user_id,
		[media_share].datetime_created AS datetime_media_share_created,
		[vw_media].[type]
	FROM
		[vw_media]
		LEFT JOIN media_share 
			ON media_share.created_by_user_id = @logged_in_user_id 
			AND media_share.media_id = [vw_media].id
	WHERE
		[vw_media].datetime_deleted IS NULL	  
		AND [vw_media].id IN 
			(SELECT 
				media_id 
			FROM 
				@media_ids
			)
END
GO
