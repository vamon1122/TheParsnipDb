BEGIN TRANSACTION
UPDATE video SET video.x_scale = media.y_scale, video.y_scale = media.y_scale FROM video INNER JOIN media ON media.id = video.media_id WHERE video.x_scale IS NULL
SELECT v.x_scale, v.y_scale, m.x_scale, m.y_scale FROM video v INNER JOIN media m ON m.id = v.media_id WHERE v.x_scale IS NULL
ROLLBACK TRANSACTION
