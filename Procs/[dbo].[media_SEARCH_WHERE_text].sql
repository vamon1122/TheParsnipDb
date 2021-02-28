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
-- V1.3 - 27/02/2021 - Added search terms for media tags and users
-- V1.4 - 28/02/2020 - Stop returning media, which was uploaded by a deleted user, in search results
-- V1.5 - 01/03/2020 - Optimise views for search
-- =============================================
CREATE PROCEDURE [dbo].[media_SEARCH_WHERE_text] 
	@text nchar(100), 
	@logged_in_user_id int = NULL,
	@now datetime = null
AS
BEGIN
	SET NOCOUNT ON

	IF @now IS NULL BEGIN
		SET @now = GETDATE()
	END

	INSERT INTO 
		media_search ([text], created_by_user_id, datetime_created) 
	VALUES 
		(@text, @logged_in_user_id, @now)

	DECLARE @media_tag_pair_table_var table 
    ( 
		media_id char(8), 
		media_tag_id int, 
		created_by_user_id int, 
		datetime_created datetime
    )

	DECLARE @media_user_pair_table_var table 
    ( 
		media_id char(8), 
		[user_id] int, 
		created_by_user_id int, 
		datetime_created datetime
    )

	DECLARE @media_tag_table_var table 
    ( 
		id int, 
		created_by_user_id int, 
		datetime_created datetime, 
		[name] nchar(200),
		[description] nchar(2000),
		search_terms char(1000)
    )

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
		search_terms char(1000)
    )

	DECLARE @media_table_var TABLE
	(
		id char(8),
		title nchar(100),
		[description] nchar(1000),
		alt char(1024),
		datetime_captured datetime,
		datetime_created datetime,
		x_scale smallint,
		y_scale smallint,
		original_dir char(1024),
		compressed_dir char(1024),
		placeholder_dir char(1024),
		created_by_user_id int,
		media_share_id char(8),
		media_share_created_by_user_id int,
		media_share_datetime_created datetime,
		[type] char(10),
		[status] char(10),
		search_terms char(1000)
	)

	INSERT INTO 
		@media_tag_table_var 
	SELECT
		media_tag.id,
		created_by_user_id,
		media_tag.datetime_created,
		[name],
		[description],
		search_terms
	FROM 
		media_tag 
	WHERE 
		media_tag.datetime_deleted IS NULL
		AND 
		(
			FREETEXT(media_tag.[name], @text)
			OR FREETEXT(media_tag.search_terms, @text)
		)

	INSERT INTO 
		@user_table_var
	SELECT
		id,
		username,
		email,
		[password],
		forename,
		surname,
		dob,
		gender,
		address_1,
		address_2,
		address_3,
		post_code,
		mobile_phone,
		home_phone,
		work_phone,
		datetime_created,
		datetime_last_login,
		[type],
		[status],
		profile_image_media_id,
		search_terms
	FROM 
		[user] 
	WHERE 
		datetime_deleted IS NULL
		AND 
		(
			FREETEXT([user].forename, @text)
			OR FREETEXT([user].surname, @text)
			OR FREETEXT([user].username, @text)
			OR FREETEXT([user].search_terms, @text)
		)

	INSERT INTO 
		@media_tag_pair_table_var 
	SELECT
		media_id,
		media_tag_id,
		created_by_user_id,
		datetime_created
	FROM 
		media_tag_pair 
	WHERE 
		datetime_deleted IS NULL
		AND media_tag_id IN (SELECT id FROM @media_tag_table_var)

	INSERT INTO 
		@media_user_pair_table_var 
	SELECT
		media_id,
		[user_id],
		created_by_user_id,
		datetime_created
	FROM 
		media_user_pair 
	WHERE 
		datetime_deleted IS NULL
		AND [user_id] IN (SELECT id FROM @user_table_var)
	
	INSERT INTO
		@media_table_var
	SELECT 
		vw_media.id,
		vw_media.title,
		vw_media.[description],
		vw_media.alt,
		vw_media.datetime_captured,
		vw_media.datetime_created,
		vw_media.x_scale,
		vw_media.y_scale,
		vw_media.original_dir,
		vw_media.compressed_dir,
		vw_media.placeholder_dir,
		vw_media.created_by_user_id,
		media_share.id,
		media_share.created_by_user_id,
		media_share.datetime_created AS datetime_media_share_created,
		vw_media.[type],
		vw_media.[status],
		vw_media.search_terms
	FROM
		vw_media 
		LEFT JOIN media_share
			ON media_share.created_by_user_id = @logged_in_user_id 
			AND media_share.media_id = vw_media.id
	WHERE
		vw_media.datetime_deleted IS NULL	
		AND vw_media.created_by_user_datetime_deleted IS NULL
		AND vw_media.[status] = 'complete'
		AND (FREETEXT(vw_media.title, @text)
		OR FREETEXT(vw_media.search_terms, @text))
	
	INSERT INTO
		@media_table_var
	SELECT 
		vw_media.id,
		vw_media.title,
		vw_media.[description],
		vw_media.alt,
		vw_media.datetime_captured,
		vw_media.datetime_created,
		vw_media.x_scale,
		vw_media.y_scale,
		vw_media.original_dir,
		vw_media.compressed_dir,
		vw_media.placeholder_dir,
		vw_media.created_by_user_id,
		media_share.id,
		media_share.created_by_user_id,
		media_share.datetime_created AS datetime_media_share_created,
		vw_media.[type],
		vw_media.[status],
		vw_media.search_terms
	FROM
		@media_tag_pair_table_var pair
		INNER JOIN vw_media ON vw_media.id = pair.media_id
		LEFT JOIN media_share ON 
			media_share.created_by_user_id = @logged_in_user_id 
			AND media_share.media_id = vw_media.id
	WHERE 
		vw_media.datetime_deleted IS NULL
		AND vw_media.created_by_user_datetime_deleted IS NULL
		AND vw_media.[status] = 'complete'
	
	INSERT INTO
		@media_table_var
	SELECT 
		vw_media.id,
		vw_media.title,
		vw_media.[description],
		vw_media.alt,
		vw_media.datetime_captured,
		vw_media.datetime_created,
		vw_media.x_scale,
		vw_media.y_scale,
		vw_media.original_dir,
		vw_media.compressed_dir,
		vw_media.placeholder_dir,
		vw_media.created_by_user_id,
		media_share.id,
		media_share.created_by_user_id,
		media_share.datetime_created AS datetime_media_share_created,
		vw_media.[type],
		vw_media.[status],
		vw_media.search_terms
	FROM
		@media_user_pair_table_var pair
		INNER JOIN vw_media ON vw_media.id = pair.media_id
		LEFT JOIN media_share ON 
			media_share.created_by_user_id = @logged_in_user_id 
			AND media_share.media_id = vw_media.id
	WHERE 
		vw_media.datetime_deleted IS NULL
		AND vw_media.created_by_user_datetime_deleted IS NULL
		AND vw_media.status = 'complete'

	SELECT DISTINCT
		id,
		title,
		[description],
		alt,
		datetime_captured,
		datetime_created,
		x_scale,
		y_scale,
		original_dir,
		compressed_dir,
		placeholder_dir,
		created_by_user_id,
		NULL, --vw_media.media_tag_id
		media_share_id,
		media_share_created_by_user_id,
		media_share_datetime_created,
		[type],
		[status],
		search_terms
	FROM
		@media_table_var

	SELECT
		id,
		created_by_user_id,
        datetime_created,
        [name],
        [description],
		search_terms
	FROM
		@media_tag_table_var

	SELECT
		media_id,
		media_tag_id,
		created_by_user_id,
		datetime_created
	FROM 
		@media_tag_pair_table_var

	SELECT
		id,
		username,
		email,
		[password],
		forename,
		surname,
		dob,
		gender,
		address_1,
		address_2,
		address_3,
		post_code,
		mobile_phone,
		home_phone,
		work_phone,
		datetime_created,
		datetime_last_login,
		[type],
		[status],
		profile_image_media_id,
		NULL, --datetime_deleted
		search_terms
	FROM 
		@user_table_var

	SELECT
		media_id,
		[user_id],
		created_by_user_id,
		datetime_created
	FROM 
		@media_user_pair_table_var
END
GO
