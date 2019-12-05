GO

/****** Object:  StoredProcedure [dbo].[sp_update_image]    Script Date: 05/12/2019 21:39:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ben Barton
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_update_image] 
	-- Add the parameters for the stored procedure here
	@image_id uniqueidentifier = NEWID, 
	@title nchar(100) = NULL,
	@description nchar(1000) = NULL,
	@alt nchar(1024) = NULL,
	@date_time_media_created datetime = GETDATE,
	@media_tag_id uniqueidentifier = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @existing_media_tag_id uniqueidentifier;
	
	IF @media_tag_id IS NOT NULL
	BEGIN
	
		IF (SELECT TOP(1) media_tag_id FROM media_tag_pair WHERE media_id = @image_id) IS NOT NULL
		DELETE FROM media_tag_pair WHERE media_id = @image_id;
	
		INSERT INTO media_tag_pair (media_id, media_tag_id) VALUES (@image_id, @media_tag_id);
	END

	UPDATE image SET title = @title, description = @description, alt = @alt, date_time_media_created = @date_time_media_created WHERE image_id = @image_id;
END
GO


