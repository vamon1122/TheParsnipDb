SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 22/02/2021
-- Description:	SELECT media
-- =============================================
-- CHANGELOG
-- V1.0 - 22/02/2021 - Initial create
-- V1.1 - 23/02/2021 - Add search terms
-- =============================================
CREATE PROCEDURE [dbo].[media_SEARCH_WHERE_text] 
	@text nchar(100), 
	@logged_in_user_id int = NULL,
	@now datetime = null
AS
BEGIN
	SET NOCOUNT ON;
	IF @now IS NULL BEGIN
		SET @now = GETDATE()
	END
	INSERT INTO 
		media_search ([text], created_by_user_id, datetime_created) 
	VALUES 
		(@text, @logged_in_user_id, @now)
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
		[vw_media].[status],
		[vw_media].[search_terms]
	FROM
		[vw_media]
		INNER JOIN [dbo].[media] ON [media].[id] = [vw_media].[id]
		LEFT JOIN media_share 
			ON media_share.created_by_user_id = @logged_in_user_id 
			AND media_share.media_id = [vw_media].id
	WHERE
		[vw_media].datetime_deleted IS NULL	  
		AND [vw_media].[status] = 'complete'
		AND (FREETEXT(media.[title], @text)
		OR FREETEXT(media.[search_terms], @text))

	SELECT 
		media_tag.[id]
      ,[created_by_user_id]
      ,[media_tag].[datetime_created]
      ,[name]
      ,[description]
	FROM 
		media_tag 
		INNER JOIN [user] ON [user].id = media_tag.created_by_user_id 
	WHERE 
		[user].datetime_deleted IS NULL
		AND media_tag.datetime_deleted IS NULL
		AND FREETEXT(media_tag.[name], @text)
	ORDER BY
		[name]

	SELECT 
		[id],
		[username],
		[email],
		[password],
		[forename],
		[surname],
		[dob],
		[gender],
		[address_1],
		[address_2],
		[address_3],
		[post_code],
		[mobile_phone],
		[home_phone],
		[work_phone],
		[datetime_created],
		[datetime_last_login],
		[type],
		[status],
		[profile_image_media_id],
		[datetime_deleted]
	FROM 
		[user] 
	WHERE 
		datetime_deleted IS NULL
		AND 
		(
			FREETEXT([user].[forename], @text)
			OR FREETEXT([user].[surname], @text)
			OR FREETEXT([user].[username], @text)
		)
END
GO
