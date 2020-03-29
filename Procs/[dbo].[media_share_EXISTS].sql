/****** Object:  StoredProcedure [dbo].[media_share_EXISTS]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 16/02/2020
-- Description:	Check if media share exists
-- =============================================
CREATE PROCEDURE [dbo].[media_share_EXISTS] 
	@media_id char(8),
	@user_id int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT CASE WHEN EXISTS (
		SELECT 
			id
		FROM
			[media_share]
		WHERE 
			created_by_user_id = @user_id
			AND media_id = @media_id
	)
	THEN 
		CAST(1 AS BIT)
	ELSE 
		CAST(0 AS BIT) 
	END
END
GO
