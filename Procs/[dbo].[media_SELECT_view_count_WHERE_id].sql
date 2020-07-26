SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 26/07/2020
-- Description:	SELECT view count of media
-- =============================================
-- CHANGELOG
-- V1.0 - 26/07/2020 - Initial create
-- =============================================

CREATE PROCEDURE [dbo].[media_SELECT_view_count_WHERE_id] 
	@id char(8) 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT COUNT(id) FROM media_view WHERE media_id = @id
END
GO
