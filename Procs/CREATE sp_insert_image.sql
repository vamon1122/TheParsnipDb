GO

/****** Object:  StoredProcedure [dbo].[sp_insert_image]    Script Date: 05/12/2019 21:34:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_insert_image] 
	-- Add the parameters for the stored procedure here
	@image_id uniqueidentifier = NEWID, 
	@date_time_media_created datetime = GETDATE,
	@date_time_created datetime = GETDATE,
	@x_scale float,
	@y_scale float,
	@original_dir char(1024),
	@compressed_dir char(1024),
	@placeholder_dir char(1024), 
	@created_by_user_id uniqueidentifier,
	@media_tag_id uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO image (image_id, placeholder_dir, compressed_dir, original_dir, x_scale, y_scale, date_time_created, date_time_media_created, created_by_user_id) VALUES(@image_id, @placeholder_dir, @compressed_dir, @original_dir, @x_scale, @y_scale, @date_time_created, @date_time_media_created, @created_by_user_id)
	INSERT INTO media_tag_pair VALUES(@image_id, @media_tag_id)
END
GO


