DECLARE @picture int = (SELECT COUNT(*) FROM vw_image)
DECLARE @video int = (SELECT COUNT(*) FROM vw_video)
DECLARE @youtube int = (SELECT COUNT(*) FROM vw_youtube)
DECLARE @media_tag_pair int = (SELECT COUNT(*) FROM media_tag_pair)
DECLARE @media_user_pair int = (SELECT COUNT(*) FROM media_user_pair)

SELECT @picture + @video + @youtube 'Total Media'
SELECT @media_tag_pair + @media_user_pair 'Total Media Pair'

SELECT @picture 'Total Media - Picture'
SELECT @video 'Total Media - Video'
SELECT @youtube 'Total Media - Youtube'

SELECT @media_tag_pair 'Total Media Pair - Tag'
SELECT @media_user_pair 'Total Media Pair - User'
