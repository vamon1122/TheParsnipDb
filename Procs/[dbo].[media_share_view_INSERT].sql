SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 05/03/2020
-- Description: Increments view count for share	
-- =============================================
-- CHANGELOG
-- 05/03/2020 - Initial create
-- 26/07/2020 - Accommodations for new media_view_INSERT
-- =============================================

CREATE PROCEDURE [dbo].[media_share_view_INSERT] 
	@media_share_id char(8),
	@created_by_user_id int = NULL,
	@datetime_now datetime = NULL
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @media_id char(8) = (SELECT media_id FROM media_share WHERE id = @media_share_id)
	EXEC media_view_INSERT @media_id, @created_by_user_id, @datetime_now

	INSERT INTO 
		media_share_view 
	VALUES
		(@@IDENTITY, 
		@media_share_id)
END
GO
