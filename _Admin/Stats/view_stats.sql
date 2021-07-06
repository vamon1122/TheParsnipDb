USE vamon112_theparsnip_live

SELECT COUNT(*) 'All views' FROM media_view WHERE created_by_user_id NOT IN (1, 19) OR created_by_user_id IS NULL
SELECT COUNT(*) 'Not logged in views' FROM media_view WHERE created_by_user_id IS NULL
SELECT COUNT(*) 'Logged in views' FROM media_view WHERE created_by_user_id NOT IN (1, 19) AND created_by_user_id IS NOT NULL

SELECT COUNT(*) 'Ben''s views' FROM media_view WHERE created_by_user_id = 1


SELECT COUNT(*) 'Total number of videos' FROM media WHERE [type] = 'video'
SELECT '(See table below)' 'Never viewed by anyone:'

SELECT id 'Videos which have never viewed by anyone:', FROM media WHERE [type] = 'video' AND datetime_deleted IS NULL AND id NOT IN (SELECT DISTINCT(media_id) FROM media_view)

SELECT '(See table below)' 'Videos which have never viewed by other people:'
SELECT * FROM media WHERE [type] = 'video' AND datetime_deleted IS NULL AND id NOT IN (SELECT DISTINCT(media_id) FROM media_view WHERE created_by_user_id NOT IN (1, 19))

SELECT '(See table below)' 'Videos which have never been viewed by Ben:'
SELECT * FROM media WHERE [type] = 'video' AND datetime_deleted IS NULL AND id NOT IN (SELECT DISTINCT(media_id) FROM media_view WHERE created_by_user_id = 1)