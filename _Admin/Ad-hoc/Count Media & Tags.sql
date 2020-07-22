DECLARE @pictures int = (SELECT COUNT(*) FROM vw_image)
DECLARE @videos int = (SELECT COUNT(*) FROM vw_video)
DECLARE @youtube int = (SELECT COUNT(*) FROM vw_youtube)
DECLARE @mediaTags int = (SELECT COUNT(*) FROM media_tag_pair)
DECLARE @userTags int = (SELECT COUNT(*) FROM media_user_pair)

SELECT @pictures + @videos + @userTags Media

SELECT @mediaTags + @userTags Tags
