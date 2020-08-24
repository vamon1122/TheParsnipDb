DECLARE @latest_id char(8)

SELECT TOP 1 @latest_id = media_id FROM vw_video ORDER BY datetime_created DESC

SELECT id, x_scale, y_scale, * FROM media WHERE id = @latest_id
SELECT * FROM video WHERE media_id = @latest_id

SELECT * FROM vw_video ORDER BY datetime_created DESC
