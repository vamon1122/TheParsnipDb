DECLARE @id char(8) = 'BBBB0000'
DECLARE @video_1_id char(8) = '84139d66'
DECLARE @new_title char(100) = 'STITCH: Let Me Entertain You 1 & 2'

INSERT INTO media (id, created_by_user_id, [type], placeholder_dir, compressed_dir, original_dir, title, x_scale, y_scale)
SELECT @id, created_by_user_id, [type], placeholder_dir, compressed_dir, original_dir, @new_title, x_scale, y_scale FROM media WHERE id = @video_1_id

INSERT INTO video (media_id) VALUES (@id)

INSERT INTO video_sequence (media_id, original_media_id, position) VALUES (@id, @video_1_id, 0)
INSERT INTO video_sequence (media_id, original_media_id, position) VALUES (@id, '071e2973', 1)
