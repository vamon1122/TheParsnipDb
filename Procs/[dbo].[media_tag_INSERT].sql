SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 16/05/2020
-- Description:	INSERT a media tag
-- =============================================
-- =============================================
-- CHANGELOG
-- V1.0 - 16/05/2020 - Initial create 
-- V1.1 - 18/03/2022 - Return identity
-- =============================================
CREATE PROCEDURE [dbo].[media_tag_INSERT] 
      @created_by_user_id int
      ,@datetime_created datetime = NULL
      ,@name char(100)
      ,@description char(1000) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF(@datetime_created IS NULL) BEGIN
		SET @datetime_created = GETDATE()
	END

	INSERT INTO  
		media_tag
			([created_by_user_id]
			 ,[datetime_created]
			 ,[name]
			 ,[description])
		VALUES
			(@created_by_user_id
			 ,@datetime_created 
			 ,@name
			 ,@description)

	RETURN @@IDENTITY
END
