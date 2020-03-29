SELECT image.title AS media_title, 
uploaded_by.forename AS uploaded_by, 
shared_by.forename AS shared_by, 
access_token.times_used,
image.src AS media_directory,
access_token.media_id

FROM access_token 
INNER JOIN image ON access_token.media_id = image.image_id 
INNER JOIN [user] AS uploaded_by ON image.created_by_user_id = uploaded_by.user_id 
INNER JOIN [user] AS shared_by ON access_token.created_by_user_id = shared_by.user_id 

ORDER BY times_used DESC;