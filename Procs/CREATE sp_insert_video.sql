GO

/****** Object:  StoredProcedure [dbo].[sp_insert_video]    Script Date: 05/12/2019 21:35:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Ben Barton
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_insert_video] 
	-- Add the parameters for the stored procedure here
	@video_id uniqueidentifier = NEWID, 
	@date_time_media_created datetime = GETDATE,
	@date_time_created datetime = GETDATE,
	@video_x_scale float,
	@video_y_scale float,
	@video_original_dir char(1024) = NULL,
	@video_compressed_dir char(1024),
	@thumbnail_x_scale float,
	@thumbnail_y_scale float,
	@thumbnail_original_dir char(1024),
	@thumbnail_compressed_dir char(1024),
	@thumbnail_placeholder_dir char(1024),
	@created_by_user_id uniqueidentifier,
	@media_tag_id uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO video (video_id, thumbnail_placeholder_dir, thumbnail_compressed_dir, thumbnail_original_dir, thumbnail_x_scale, thumbnail_y_scale, video_original_dir, video_compressed_dir, date_time_media_created, date_time_created, created_by_user_id) VALUES (@video_id, @thumbnail_placeholder_dir, @thumbnail_compressed_dir, @thumbnail_original_dir, @thumbnail_x_scale, @thumbnail_y_scale, @video_original_dir, @video_compressed_dir, @date_time_media_created, @date_time_created, @created_by_user_id);
	INSERT INTO media_tag_pair VALUES(@video_id, @media_tag_id);
END
GO


