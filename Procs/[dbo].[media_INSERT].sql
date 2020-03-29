/****** Object:  StoredProcedure [dbo].[media_INSERT]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Name
-- Create date: 20/02/2020
-- Description:	Inserts media
-- =============================================
CREATE PROCEDURE [dbo].[media_INSERT] 
	@id char(8), 
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

	INSERT INTO 
		media 
		(id,
		[type],
		placeholder_dir, 
		compressed_dir, 
		original_dir, 
		x_scale, 
		y_scale, 
		datetime_created, 
		datetime_captured, 
		created_by_user_id) 
	VALUES
		(@id,
		@type,
		@placeholder_dir, 
		@compressed_dir, 
		@original_dir, 
		@x_scale, 
		@y_scale, 
		@datetime_created, 
		@datetime_captured, 
		@created_by_user_id)
	
	IF @media_tag_id IS NOT NULL BEGIN
		INSERT INTO 
			media_tag_pair 
			(media_id, media_tag_id, created_by_user_id, datetime_created)
		VALUES
			(@id, @media_tag_id, @created_by_user_id, @datetime_created)
	END
END
GO
