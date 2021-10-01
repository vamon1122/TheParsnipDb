SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 22/07/2021
-- Description:	SELECT latest media
-- =============================================
-- CHANGELOG
-- V1.0 - 22/07/2021 - Initial create
-- V1.1 - 05/08/2021 - Return media for logged in user regardless of status
-- V1.2 - 01/10/2021 - Ignore media status when logged in user is admin
-- =============================================

CREATE PROCEDURE [dbo].[media_SELECT_latest] 
	@now datetime = NULL,
	@logged_in_user_id int = NULL
AS
BEGIN
	SET NOCOUNT ON

	IF @now IS NULL BEGIN
		SET @now = GETDATE()
	END

	DECLARE @three_months_ago datetime = DATEADD(month, -3, @now)

	SELECT 
		[vw_media].id,
		[vw_media].title,
		[vw_media].[description],
		[vw_media].alt,
		[vw_media].datetime_captured,
		[vw_media].datetime_created,
		[vw_media].x_scale,
		[vw_media].y_scale,
		[vw_media].original_dir,
		[vw_media].compressed_dir,
		[vw_media].placeholder_dir,
		[vw_media].created_by_user_id,
		NULL, --[vw_media].media_tag_id,
		[media_share].id,
		[media_share].created_by_user_id,
		[media_share].datetime_created AS datetime_media_share_created,
		[vw_media].[type],
		[vw_media].[status]
	FROM
		[vw_media]
		LEFT JOIN media_share 
			ON media_share.created_by_user_id = @logged_in_user_id 
			AND media_share.media_id = [vw_media].id
		INNER JOIN [user] logged_in_user ON logged_in_user.id = @logged_in_user_id
	WHERE
		[vw_media].datetime_created > @three_months_ago
		AND [vw_media].datetime_deleted IS NULL	  
		AND 
		(
			[vw_media].[status] = 'complete' OR 
			[vw_media].created_by_user_id = @logged_in_user_id OR 
			logged_in_user.[type] = 'admin'
		)
	ORDER BY
		[vw_media].datetime_created DESC
END
GO
