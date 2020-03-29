/****** Object:  StoredProcedure [dbo].[media_INSERT]    Script Date: 17/03/2020 18:38:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 20/02/2020
-- Description:	Inserts media
-- =============================================
-- =============================================
--CHANGELOG
--V1.1 - 17/03/2020 - EXEC media_UPDATE upon completion
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
		
	DECLARE @media_tag_created_by_user_id int = @created_by_user_id
	EXEC media_UPDATE 
	@id, 
	@title, 
	@description, 
	@alt, 
	@datetime_captured, 
	@media_tag_id, 
	@media_tag_created_by_user_id, 
	@x_scale, 
	@y_scale, 
	@placeholder_dir, 
	@compressed_dir, 
	@original_dir
END
GO
