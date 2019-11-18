SELECT media_tag_pair.media_id FROM media_tag_pair 

LEFT JOIN image ON media_tag_pair.media_id = image.image_id 
LEFT JOIN video ON media_tag_pair.media_id = video.video_id 
LEFT JOIN youtube_video ON media_tag_pair.media_id = youtube_video.youtube_video_id 

WHERE image.image_id IS NULL AND video.video_id IS NULL AND youtube_video.youtube_video_id IS NULL;