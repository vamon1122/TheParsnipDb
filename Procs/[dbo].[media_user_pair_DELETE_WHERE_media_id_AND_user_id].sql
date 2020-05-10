SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 10/05/20
-- Description:	Delete media user pairs by media & user_id
-- =============================================
-- CHANGELOG
-- V1.0 - 10/05/20 - Initial Create
-- =============================================
CREATE PROCEDURE [dbo].[media_user_pair_DELETE_WHERE_media_id_AND_user_id] 
	@media_id char(8),
	@user_id int,
	@datetime_deleted datetime = GETDATE
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE 
		media_user_pair 
	SET 
		datetime_deleted = @datetime_deleted 
	WHERE 
		media_id = @media_id
		AND [user_id] = @user_id
END
