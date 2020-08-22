SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 23/08/2020
-- Description:	SELECT video sequence
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 23/08/2020 - Initial create
-- =============================================

CREATE PROCEDURE dbo.video_sequence_SELECT_WHERE_media_id
	@media_id char(8),
	@logged_in_user_id int = NULL
AS
BEGIN
	SET NOCOUNT ON

	EXEC dbo.video_SELECT_WHERE_media_id
		@id = @media_id,
		@logged_in_user_id = @logged_in_user_id
		
	EXEC dbo.video_sequence_original_media_SELECT_WHERE_media_id
		@media_id,
		@logged_in_user_id
END
GO
