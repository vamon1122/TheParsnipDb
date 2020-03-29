/****** Object:  StoredProcedure [dbo].[media_SELECT_media_tag_id]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 21/02/2020
-- Description:	Gets all of media's media tags
-- =============================================
CREATE PROCEDURE [dbo].[media_SELECT_media_tag_id] 
	@media_id char(8)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		media_tag_id 
	FROM 
		media_tag_pair 
	WHERE 
		media_id = @media_id
END
GO
