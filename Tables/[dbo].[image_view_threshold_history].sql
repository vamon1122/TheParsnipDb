/****** Object:  Table [dbo].[image_view_threshold_history]    Script Date: 21/11/2022 17:45:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image_view_threshold_history]
	(
	threshold_timespan time(7) NOT NULL,
	datetime_updated datetime NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE [dbo].[image_view_threshold_history] SET (LOCK_ESCALATION = TABLE)
GO
