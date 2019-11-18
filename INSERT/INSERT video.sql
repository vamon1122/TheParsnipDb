/*2019-08-23 23:39:00.000*/

DECLARE @video_id AS uniqueidentifier;
DECLARE @directory AS char(1024);
DECLARE @date_time_created AS datetime;
DECLARE @date_time_media_created AS datetime;
DECLARE @created_by_user_id AS uniqueidentifier;
DECLARE @title AS nchar(100);
DECLARE @media_tag_id AS uniqueidentifier;
DECLARE @thumbnail_directory AS char(1024);


SET @video_id = NEWID();
SET @directory = 'Resources/Media/Videos/Local/Ben''s BBQ Video!!!.mp4'
SET @date_time_created = '2019-08-23 23:37:00.000';
SET @date_time_media_created = '2019-08-23 23:37:00.000';
SET @created_by_user_id = '37b894df-1311-402b-b451-97d3ab73b294'; /*Admin user*/
SET @title = 'Ben''s BBQ Video!!!';
SET @media_tag_id = 'ff3127df-70b2-47ef-b77b-2e086d2ef370'; /*Krakow*/
SET @thumbnail_directory = 'Resources/Media/Images/Video_Thumbnails/Ben''s BBQ Video!!!.png'

INSERT INTO video (video_id, directory, thumbnail_directory, date_time_media_created, date_time_created, created_by_user_id, title) VALUES (@video_id, @directory, @thumbnail_directory, @date_time_media_created, @date_time_created, @created_by_user_id, @title);
INSERT INTO media_tag_pair VALUES(@video_id, @media_tag_id);