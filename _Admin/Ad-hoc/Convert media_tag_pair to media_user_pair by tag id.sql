DECLARE @mediaTagId int = 0;
DECLARE @mediaUserPairUserId int = 0;

INSERT INTO 
	media_user_pair 
		(media_id
		, [user_id]
		, created_by_user_id) 
SELECT 
	media_id, @mediaUserPairUserId, created_by_user_id
FROM 
	media_tag_pair 
WHERE 
	media_tag_id = @mediaTagId
	AND media_tag_pair.datetime_deleted IS NULL

UPDATE media_tag_pair SET datetime_deleted = GETDATE() WHERE datetime_deleted IS NULL AND media_tag_id = @mediaTagId

UPDATE media_tag SET datetime_deleted = GETDATE() WHERE datetime_deleted IS NULL AND id = @mediaTagId
			
		