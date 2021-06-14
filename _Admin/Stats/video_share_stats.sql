SELECT vw_video.title AS media_title, 
uploaded_by.forename AS uploaded_by, 
shared_by.forename AS shared_by, 
vw_media_share.times_used,
vw_video.original_dir AS media_directory,
vw_media_share.media_id AS media_id 

FROM vw_media_share 
INNER JOIN vw_video ON vw_media_share.media_id = vw_video.media_id 
INNER JOIN [user] AS uploaded_by ON vw_video.created_by_user_id = uploaded_by.id 
INNER JOIN [user] AS shared_by ON vw_media_share.created_by_user_id = shared_by.id 

ORDER BY times_used DESC;