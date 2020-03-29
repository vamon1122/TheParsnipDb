/****** Object:  StoredProcedure [dbo].[youtube_INSERT]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 28/02/2020
-- Description:	Inserts youtube video
-- =============================================
CREATE PROCEDURE [dbo].[youtube_INSERT] 
	@media_id char(8), 
	@data_id char(11), 
	@type char(10), 
	@datetime_captured datetime = GETDATE,
	@datetime_created datetime = GETDATE,
	@x_scale float,
	@y_scale float,
	@original_dir char(1024),
	@compressed_dir char(1024),
	@placeholder_dir char(1024), 
	@created_by_user_id int,
	@media_tag_id char(8),
	@title nchar(100) = NULL,
	@description nchar(1000) = NULL,
	@alt nchar(1024) = NULL
AS
BEGIN
	SET NOCOUNT ON;
	EXEC media_INSERT
	@media_id,
	@type,
	@datetime_captured,
	@datetime_created,
	@x_scale,
	@y_scale,
	@original_dir,
	@compressed_dir,
	@placeholder_dir, 
	@created_by_user_id,
	@media_tag_id,
	@title,
	@description,
	@alt

	INSERT INTO 
		youtube 
		(media_id,
		data_id) 
	VALUES
		(@media_id,
		@data_id)
END
GO
