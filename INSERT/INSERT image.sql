DECLARE @image_id AS uniqueidentifier;
DECLARE @src AS char(1024);
DECLARE @date_time_created AS datetime;
DECLARE @created_by_user_id AS uniqueidentifier;
DECLARE @title AS nchar(100);
DECLARE @media_tag_id AS uniqueidentifier;


SET @image_id = NEWID();
SET @src = 'Resources/Media/Images/Local/Memes/Loldred_Abuse.jpg'
SET @date_time_created = '2019-02-13 19:24:49.476';
SET @created_by_user_id = '37b894df-1311-402b-b451-97d3ab73b294'; /*Admin user*/
SET @title = 'Loldred Abuse!';
SET @media_tag_id = '5f15861a-689c-482a-8e31-2f13429c36e5'; /*Memes*/

INSERT INTO image (image_id, src, date_time_created, created_by_user_id, title) VALUES (@image_id, @src, @date_time_created, @created_by_user_id, @title);
INSERT INTO media_tag_pair VALUES(@image_id, @media_tag_id);