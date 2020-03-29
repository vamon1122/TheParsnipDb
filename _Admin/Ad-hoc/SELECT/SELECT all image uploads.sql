SELECT image.image_id, image.title, [user].forename, [user].surname

FROM image 

LEFT JOIN [user] ON image.created_by_user_id = [user].user_id