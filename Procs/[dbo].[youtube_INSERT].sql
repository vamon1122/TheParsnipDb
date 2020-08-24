SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Barton
-- Create date: 28/02/2020
-- Description:	Inserts youtube video
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 28/02/2020 - Initial create
-- V1.1 - 03/06/2020 - media_tag_id is now an optional parameter
-- V1.3 - 29/08/2020 - Changed scales to smallint
-- =============================================

CREATE PROCEDURE [dbo].[youtube_INSERT] 
	@media_id char(8), 
	@data_id char(11), 
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
