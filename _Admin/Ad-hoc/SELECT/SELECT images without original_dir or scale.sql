--I need sorting out
SELECT 
	media_tag.name, image.* 
FROM 
	image WITH (NOLOCK) 
	INNER JOIN media_tag_pair tag ON tag.media_id = image.image_id 
	INNER JOIN media_tag ON media_tag.media_tag_id = tag.media_tag_id 
WHERE 
	original_dir IS NULL;

--I am not in an album so don't matter as much
SELECT 
	media_tag.name, image.* 
FROM 
	image WITH (NOLOCK) 
	LEFT JOIN media_tag_pair tag ON tag.media_id = image.image_id 
	LEFT JOIN media_tag ON media_tag.media_tag_id = tag.media_tag_id 
WHERE 
	original_dir IS NULL 
	AND media_tag.name IS NULL;