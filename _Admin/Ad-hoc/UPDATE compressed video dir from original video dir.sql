BEGIN TRANSACTION

SELECT media_id AS 'Affected media ids:' FROM video WHERE compressed_dir IS NULL

UPDATE 
	video 
SET 
	compressed_dir = 
	CONCAT(
		'Resources/Media/Videos/Compressed/' 
		,SUBSTRING(original_dir, 34, LEN(original_dir) - 36)
		, 'mp4')
	,original_dir = SUBSTRING(original_dir, 34, LEN(original_dir) - 33)
WHERE 
	compressed_dir IS NULL

SELECT original_dir, compressed_dir FROM vw_video ORDER BY datetime_created DESC

ROLLBACK TRANSACTION