/****** Object:  StoredProcedure [dbo].[user_SELECT]    Script Date: 29/03/2020 12:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ben Barton
-- Create date: 17/02/2020
-- Description:	Selects all users
-- =============================================
CREATE PROCEDURE [dbo].[user_SELECT] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		[id],
		[username],
		[email],
		[password],
		[forename],
		[surname],
		[dob],
		[gender],
		[address_1],
		[address_2],
		[address_3],
		[post_code],
		[mobile_phone],
		[home_phone],
		[work_phone],
		[datetime_created],
		[datetime_last_login],
		[type],
		[status],
		[profile_image_media_id],
		[datetime_deleted]
	FROM 
		[user] 
	WHERE 
		datetime_deleted IS NULL
END
GO
