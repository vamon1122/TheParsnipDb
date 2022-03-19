SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 09/01/2021
-- Description:	Selects video thumbnail
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 09/01/2021 - Initial create
-- V1.1 - 30/03/2022 - Return new display order
-- =============================================
CREATE PROCEDURE [dbo].[video_thumbnail_UPDATE_active] 
	@media_id char(8),
	@display_order smallint
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE @new_display_order smallint

	UPDATE 
		media 
	SET 
		media.x_scale = video_thumbnail.x_scale,
		media.y_scale = video_thumbnail.y_scale,
		media.placeholder_dir = video_thumbnail.placeholder_dir,
		media.compressed_dir = video_thumbnail.compressed_dir,
		media.original_dir = video_thumbnail.original_dir
	FROM
		media INNER JOIN video_thumbnail ON media.id = video_thumbnail.media_id AND video_thumbnail.display_order = @display_order
	WHERE
		media.id = @media_id

	UPDATE video_thumbnail SET active = 0 WHERE media_id = @media_id
	 
	SELECT @new_display_order = MAX(display_order) + 1 FROM video_thumbnail WHERE media_id = @media_id

	UPDATE 
		video_thumbnail 
	SET 
		active = 1, 
		display_order = @new_display_order 
	WHERE 
		media_id = @media_id 
		AND display_order = @display_order

		RETURN @new_display_order
END
GO
