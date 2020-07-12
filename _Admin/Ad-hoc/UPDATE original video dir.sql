BEGIN TRANSACTION

DECLARE @affectedMedia AS TABLE (media_id char(8), original_dir char(1024), compressed_dir char(1024))

INSERT INTO @affectedMedia SELECT media_id, original_dir, compressed_dir FROM video WHERE original_dir LIKE '%/compressed/%'

SELECT media_id AS 'Affected media ids:', original_dir, compressed_dir FROM @affectedMedia

UPDATE 
	video 
SET 
	original_dir = CONCAT('Resources/Media/Videos/Originals/', SUBSTRING(original_dir, 35, LEN(original_dir) - 34))
WHERE 
	original_dir LIKE '%/compressed/%'

SELECT media_id, original_dir, compressed_dir FROM video WHERE media_id IN (SELECT media_id FROM @affectedMedia)

ROLLBACK TRANSACTION