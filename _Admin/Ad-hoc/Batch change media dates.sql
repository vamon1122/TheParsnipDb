SELECT * FROM media WHERE datetime_captured > CONVERT(datetime, '17/05/2020', 103)

BEGIN TRANSACTION

UPDATE media SET datetime_captured = DATEADD(dd,-660,datetime_captured) WHERE datetime_captured > CONVERT(datetime, '17/05/2020', 103)
SELECT * FROM media WHERE datetime_captured > CONVERT(datetime, '17/05/2020', 103)

SELECT * FROM media WHERE datetime_created > CONVERT(datetime, '17/05/2020', 103)

ROLLBACK TRANSACTION