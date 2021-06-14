SELECT
	TOP 1 RTRIM(MS.[text]) 'Most recent search',
	 CONCAT(RTRIM(U.forename),' ', RTRIM(U.Surname)) 'Searched by',
	MS.datetime_created 'Time searched'
FROM
	media_search MS
	INNER JOIN [user] U ON MS.created_by_user_id = U.id
WHERE
	created_by_user_id NOT IN (1, 19) 
ORDER BY
	MS.datetime_created DESC

SELECT
	COUNT(*) 'Total searches performed',
	(SELECT TOP 1 datetime_created FROM media_search WHERE created_by_user_id NOT IN (1, 19) ORDER BY datetime_created) 'Since'
FROM
	media_search
WHERE
	created_by_user_id NOT IN (1, 19)

SELECT
	CONCAT(RTRIM(U.Forename), ' ', RTRIM(U.Surname)) 'Name',
	COUNT(MS.created_by_user_id) 'Total searches performed'
FROM
	media_search MS
	INNER JOIN [user] U ON MS.created_by_user_id = U.id
WHERE
	MS.created_by_user_id NOT IN (1, 19)
GROUP BY
	U.Forename,
	U.Surname
ORDER BY
	COUNT(MS.created_by_user_id) DESC

SELECT
	[text] 'Search terms',
	COUNT([text]) 'Times searched'
FROM
	media_search
WHERE
	created_by_user_id NOT IN (1, 19)
GROUP BY
	[text]
ORDER BY
	COUNT([text]) DESC

SELECT
	CONCAT(RTRIM(U.Forename), ' ', RTRIM(U.Surname)) 'Name',
	MS.[text] 'Search terms', 
	MS.datetime_created 'Time searched' 
FROM 
	media_search MS 
	INNER JOIN [user] U ON MS.created_by_user_id = U.id
WHERE 
	created_by_user_id NOT IN (1, 19)
ORDER BY
	MS.datetime_created DESC
