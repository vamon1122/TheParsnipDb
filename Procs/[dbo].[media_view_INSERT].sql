SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 04/03/2020
-- Description: Increments view count for share	
-- =============================================
-- =============================================
-- CHANGELOG
-- 04/03/2020 - Initial create
-- 26/07/2020 - Fixed datetime_now
-- 21/11/2022 - Added @is_scroll, @threshold_timespan & @view_timespam parameters
-- =============================================

CREATE PROCEDURE [dbo].[media_view_INSERT] 
	@media_id char(8),
	@created_by_user_id int = NULL,
	@datetime_view_started datetime = NULL,
	@is_scroll bit = 0,
	@threshold_timespan time(7) = NULL,
	@view_timespan time(7) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @current_threshold_timespan time(7) = COALESCE((SELECT TOP 1 threshold_timespan FROM image_view_threshold_history ORDER BY datetime_updated DESC), '23:59:59')

	IF @datetime_view_started IS NULL BEGIN
		SET @datetime_view_started = GETDATE()
	END

	IF @threshold_timespan <> @current_threshold_timespan BEGIN
		INSERT INTO 
			image_view_threshold_history (threshold_timespan, datetime_updated) 
		VALUES
			(@threshold_timespan, @datetime_view_started)
	END

	INSERT INTO 
		media_view (media_id, created_by_user_id, datetime_created, is_scroll, view_timespan) 
	VALUES
		(@media_id, @created_by_user_id, @datetime_view_started, @is_scroll, @view_timespan)
END
GO
