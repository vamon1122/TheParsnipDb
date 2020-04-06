BEGIN TRANSACTION

DECLARE @media_ids TABLE (media_id char(8))
INSERT INTO @media_ids SELECT id FROM media WHERE datetime_created > '200401'

DELETE FROM media_tag_pair WHERE media_id IN (SELECT * FROM @media_ids)
DELETE FROM media_share_view WHERE media_view_id IN (SELECT media_view.id FROM @media_ids ids INNER JOIN media_view ON media_view.media_id = ids.media_id)
DELETE FROM media_view WHERE media_id IN (SELECT * FROM @media_ids)
DELETE FROM media_share WHERE media_id IN (SELECT * FROM @media_ids)
DELETE FROM video WHERE media_id IN (SELECT * FROM @media_ids)
DELETE FROM youtube WHERE media_id IN (SELECT * FROM @media_ids)
DELETE FROM media WHERE id IN (SELECT * FROM @media_ids)

ROLLBACK TRANSACTION
