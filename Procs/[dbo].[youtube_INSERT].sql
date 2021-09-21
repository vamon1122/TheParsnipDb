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
-- V1.4 - 13/10/2020 - Added default status
-- V1.5 - 23/09/2021 - Remove redundant parameters and change default status to raw
-- =============================================

CREATE PROCEDURE [dbo].[youtube_INSERT] 
	@media_id char(8), 
	@data_id char(11), 
	@datetime_created datetime = NULL,
	@created_by_user_id int,
	@media_tag_id char(8) = NULL
AS
BEGIN
	SET NOCOUNT ON
	
	EXEC media_INSERT
		@id = @media_id,
		@type = 'youtube',
		@status = 'raw',
		@datetime_created = @datetime_created,
		@created_by_user_id = @created_by_user_id,
		@media_tag_id = @media_tag_id

	INSERT INTO 
		youtube 
		(media_id,
		data_id) 
	VALUES
		(@media_id,
		@data_id)
END
GO
