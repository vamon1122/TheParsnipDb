DECLARE @id char(8) = (SELECT LEFT(NEWID(), 8))
DECLARE @video_1_id char(8) = 'XXXXXX01'
DECLARE @new_title char(100) = ''
DECLARE @now datetime = (SELECT GETDATE() + '06:00:00') --BST
--DECLARE @now datetime = (SELECT GETDATE() + '08:00:00') --GMT

INSERT INTO media (id, created_by_user_id, [type], placeholder_dir, compressed_dir, original_dir, title, x_scale, y_scale, datetime_created, datetime_captured)
SELECT @id, created_by_user_id, [type], placeholder_dir, compressed_dir, original_dir, @new_title, x_scale, y_scale, @now, datetime_captured FROM media WHERE id = @video_1_id

INSERT INTO video (media_id) VALUES (@id)

INSERT INTO video_sequence (media_id, original_media_id, position) VALUES (@id, @video_1_id, 0)
INSERT INTO video_sequence (media_id, original_media_id, position) VALUES (@id, 'XXXXXX02', 1)
--INSERT INTO video_sequence (media_id, original_media_id, position) VALUES (@id, 'XXXXXX03', 2)
