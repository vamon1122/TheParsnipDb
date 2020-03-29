/****** Object:  StoredProcedure [dbo].[media_share_view_INSERT]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 05/03/2020
-- Description: Increments view count for share	
-- =============================================
CREATE PROCEDURE [dbo].[media_share_view_INSERT] 
	@id char(8),
	@created_by_user_id int = NULL,
	@date_time_created datetime = GETDATE
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @media_id char(8) = (SELECT media_id FROM media_share WHERE id = @id)
	EXEC media_view_INSERT @media_id, @created_by_user_id, @date_time_created

	INSERT INTO media_share_view VALUES
	(@@IDENTITY, 
	@id)
END
GO
