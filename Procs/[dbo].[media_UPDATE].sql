/****** Object:  StoredProcedure [dbo].[media_UPDATE]    Script Date: 28/03/2020 18:53:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 20/02/2020
-- Description:	Updates an media
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 20/02/2020 - Initial Create
-- V1.1 - 28/03/2020 - Removed DELETE of existing media_tag_pair
-- V1.2 - 06/05/2020 - Added proc for media tag inserts
-- V1.3 - 29/05/2020 - Corrected media tag logic
-- =============================================
CREATE PROCEDURE [dbo].[media_UPDATE] 
	@id char(8), 
	@title nchar(100) = NULL,
	@description nchar(1000) = NULL,
	@alt nchar(1024) = NULL,
	@datetime_captured datetime = NULL,
	@media_tag_id int = NULL,
	@media_tag_created_by_user_id int = NULL,
	@x_scale float = NULL,
	@y_scale float = NULL,
	@placeholder_dir char(1024) = NULL,
	@compressed_dir char(1024) = NULL,
	@original_dir char(1024) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF @media_tag_id IS NOT NULL AND @media_tag_created_by_user_id IS NOT NULL
	BEGIN
		EXEC media_tag_pair_INSERT @id, @media_tag_id, @media_tag_created_by_user_id
	END

	UPDATE 
		media 
	SET 
		title = @title, 
		description = @description, 
		alt = @alt, 
		datetime_captured = COALESCE(@datetime_captured, datetime_captured),
		x_scale = COALESCE(@x_scale, x_scale),
		y_scale = COALESCE(@y_scale, y_scale),
		placeholder_dir = COALESCE(@placeholder_dir, placeholder_dir),
		compressed_dir = COALESCE(@compressed_dir, compressed_dir),
		original_dir = COALESCE(@original_dir, original_dir)
	WHERE 
		id = @id;
END
GO
