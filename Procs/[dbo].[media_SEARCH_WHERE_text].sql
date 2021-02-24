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
-- V1.2 - 24/02/2021 - Return media for tags and users found
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

		DECLARE @media_tag_table_var table 
   ( 
   id int, 
   created_by_user_id int, 
   datetime_created datetime, 
   [name] nchar(200),
   [description] nchar(2000)
   )

	INSERT INTO @media_tag_table_var 
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
		id
      ,created_by_user_id
      ,datetime_created
      ,[name]
      ,[description]
	  FROM
	  @media_tag_table_var

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
		[media_tag].[name] search_terms
	FROM
		media_tag_pair
		INNER JOIN media_tag ON media_tag.id = media_tag_pair.media_tag_id
		INNER JOIN vw_media ON vw_media.id = media_tag_pair.media_id
		LEFT JOIN media_share ON 
			media_share.created_by_user_id = @logged_in_user_id 
			AND media_share.media_id = [vw_media].id
	WHERE 
		media_tag_pair.media_tag_id IN (SELECT id FROM @media_tag_table_var)
	  
	DECLARE @user_table_var table 
   ( 
   id int, 
   username nchar(100), 
   email varchar(254), 
   [password] nchar(100),
   forename nchar(100),
   surname nchar(100),
   dob datetime,
   gender char(1),
   address_1 nchar(100),
   address_2 nchar(100),
   address_3 nchar(100),
   post_code char(16),
   mobile_phone char(32),
   home_phone char(32),
   work_phone char(32),
   datetime_created datetime,
   datetime_last_login datetime,
   [type] char(10),
   [status] char(10),
   profile_image_media_id char(8),
   datetime_deleted datetime
   )

	INSERT INTO @user_table_var
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
		@user_table_var

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
		CONCAT(RTRIM([user].forename), ' ', RTRIM([user].surname)) search_terms
	FROM
		media_user_pair
		INNER JOIN [user] ON [user].id = media_user_pair.[user_id]
		INNER JOIN vw_media ON vw_media.id = media_user_pair.media_id
		LEFT JOIN media_share ON 
			media_share.created_by_user_id = @logged_in_user_id 
			AND media_share.media_id = [vw_media].id
	WHERE 
		media_user_pair.[user_id] IN (SELECT id FROM @user_table_var)
END
GO
