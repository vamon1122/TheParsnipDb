/****** Object:  StoredProcedure [dbo].[media_tag_pair_DELETE_WHERE_media_id_AND_media_tag_id]    Script Date: 28/03/2020 18:40:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 28/03/20
-- Description:	Delete media tags by user_id
-- =============================================
-- CHANGELOG
-- V1.0 - 28/03/20 - Initial Create
-- =============================================
CREATE PROCEDURE [dbo].[media_tag_pair_DELETE_WHERE_media_id_AND_media_tag_id] 
	@media_id char(8),
	@media_tag_id int,
	@datetime_deleted datetime = GETDATE
AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE 
		media_tag_pair 
	SET 
		datetime_deleted = @datetime_deleted 
	WHERE 
		media_id = @media_id
		AND media_tag_id = @media_tag_id
END
GO
