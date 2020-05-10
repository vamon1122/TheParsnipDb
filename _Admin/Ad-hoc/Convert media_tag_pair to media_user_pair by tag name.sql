DECLARE @mediaTagName nchar(100) = '';
DECLARE @mediaUserPairUserId int = 0;

INSERT INTO 
	media_user_pair 
		(media_id
		, [user_id]
		, created_by_user_id) 
SELECT 
	media_tag_pair.media_id, @mediaUserPairUserId, media_tag_pair.created_by_user_id
FROM 
	media_tag_pair 
	INNER JOIN media_tag ON media_tag_pair.media_tag_id = media_tag.id 
WHERE 
	media_tag.[name] = @mediaTagName
	AND media_tag_pair.datetime_deleted IS NULL

UPDATE media_tag_pair SET datetime_deleted = GETDATE() WHERE datetime_deleted IS NULL AND media_tag_id =
(SELECT TOP(1)
	media_tag.id
FROM 
	media_tag_pair 
	INNER JOIN media_tag ON media_tag_pair.media_tag_id = media_tag.id 
WHERE 
	media_tag.[name] = @mediaTagName)

UPDATE media_tag SET datetime_deleted = GETDATE() WHERE datetime_deleted IS NULL AND id = (
SELECT TOP (1)
	media_tag.id
FROM 
	media_tag_pair 
	INNER JOIN media_tag ON media_tag_pair.media_tag_id = media_tag.id 
WHERE 
	media_tag.[name] = @mediaTagName)
			
		