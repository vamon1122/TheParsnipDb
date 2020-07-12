BEGIN TRANSACTION

UPDATE media SET compressed_dir = CONCAT(SUBSTRING(compressed_dir, 0, LEN(compressed_dir) - 2), 'jpg') WHERE compressed_dir LIKE '%.png'

UPDATE media SET placeholder_dir = CONCAT(SUBSTRING(placeholder_dir, 0, LEN(placeholder_dir) - 2), 'jpg') WHERE placeholder_dir LIKE '%.png'

ROLLBACK TRANSACTION