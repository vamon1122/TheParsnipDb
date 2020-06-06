DECLARE @media_tag_pairs int = (SELECT COUNT(media_id) FROM media_tag_pair WHERE datetime_deleted IS NULL)
DECLARE @media_user_pairs int = (SELECT COUNT(media_id) FROM media_user_pair WHERE datetime_deleted IS NULL)
DECLARE @all_media_pairs int = @media_tag_pairs + @media_user_pairs

SELECT @media_tag_pairs AS 'Media tag pairs:'
SELECT @media_user_pairs AS 'Media user pairs:'
SELECT @all_media_pairs AS 'ALL media pairs:'