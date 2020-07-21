BEGIN TRANSACTION

INSERT INTO 
	media_tag_pair (media_id, created_by_user_id, media_tag_id)
SELECT  media.id, 1, 1082
FROM 
	media
	INNER JOIN media_user_pair ON media_user_pair.media_id = media.id
WHERE
	media_user_pair.[user_id] IN (4, 5, 6)
GROUP BY
	media.id

ROLLBACK TRANSACTION
