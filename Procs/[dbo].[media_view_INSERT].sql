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
-- =============================================

CREATE PROCEDURE [dbo].[media_view_INSERT] 
	@media_id char(8),
	@created_by_user_id int = NULL,
	@datetime_now datetime = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF @datetime_now IS NULL BEGIN
		SET @datetime_now = GETDATE()
	END

	INSERT INTO 
		media_view (media_id, created_by_user_id, datetime_created) 
	VALUES
		(@media_id, @created_by_user_id, @datetime_now)
END
GO
