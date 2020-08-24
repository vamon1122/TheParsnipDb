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
-- CHANGELOG
-- V1.0 - 20/02/2020 - Initial create
-- V1.1 - 17/03/2020 - EXEC media_UPDATE upon completion
-- V1.2 - 29/05/2020 - Added default value for
-- V1.3 - 29/08/2020 - Changed scales to smallint
-- =============================================

CREATE PROCEDURE [dbo].[media_INSERT] 
	@id char(8), 
	@type char(10), 
	@datetime_captured datetime = GETDATE,
	@datetime_created datetime = GETDATE,
	@x_scale smallint,
	@y_scale smallint,
	@original_dir char(1024),
	@compressed_dir char(1024),
	@placeholder_dir char(1024), 
	@created_by_user_id int,
	@media_tag_id char(8) = NULL,
	@title nchar(100) = NULL,
	@description nchar(1000) = NULL,
	@alt nchar(1024) = NULL
AS
BEGIN
	SET NOCOUNT ON

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
		
	DECLARE @media_tag_created_by_user_id int
	IF @media_tag_id IS NOT NULL BEGIN
		SET @media_tag_created_by_user_id = @created_by_user_id
	END ELSE BEGIN
		SET @media_tag_created_by_user_id = NULL
	END

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
