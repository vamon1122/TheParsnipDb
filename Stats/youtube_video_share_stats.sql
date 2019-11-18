SELECT youtube_video.title AS media_title, 
uploaded_by.forename AS uploaded_by, 
shared_by.forename AS shared_by, 
access_token.times_used,
youtube_video.data_id AS media_directory,
access_token.media_id AS media_id 

FROM access_token 
INNER JOIN youtube_video ON access_token.media_id = youtube_video.youtube_video_id 
INNER JOIN [user] AS uploaded_by ON youtube_video.created_by_user_id = uploaded_by.user_id 
INNER JOIN [user] AS shared_by ON access_token.created_by_user_id = shared_by.user_id 

ORDER BY times_used DESC;