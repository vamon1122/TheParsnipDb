SELECT video.title AS media_title, 
uploaded_by.forename AS uploaded_by, 
shared_by.forename AS shared_by, 
access_token.times_used,
video.directory AS media_directory,
access_token.media_id AS media_id 

FROM access_token 
INNER JOIN video ON access_token.media_id = video.video_id 
INNER JOIN [user] AS uploaded_by ON video.created_by_user_id = uploaded_by.user_id 
INNER JOIN [user] AS shared_by ON access_token.created_by_user_id = shared_by.user_id 

ORDER BY times_used DESC;