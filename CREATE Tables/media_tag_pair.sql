/****** Object:  Table [dbo].[media_tag_pair]    Script Date: 06/07/2019 11:17:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[media_tag_pair](
	[media_id] [uniqueidentifier] NOT NULL,
	[media_tag_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_t_ImageAlbumPairs] PRIMARY KEY CLUSTERED 
(
	[media_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


