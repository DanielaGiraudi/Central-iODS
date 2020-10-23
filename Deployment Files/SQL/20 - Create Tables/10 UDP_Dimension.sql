SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UDP_Dimension]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UDP_Dimension] (
	[centralUDPIdx] bigint IDENTITY(1, 1) NOT NULL,
	[TableId] int NOT NULL,
	[TableName] varchar(200) NOT NULL,
	[UDPName] varchar(500) NOT NULL,
	[DataType] varchar(50) NOT NULL,
	[SITE_DIMENSION_SiteId] int NOT NULL,
	[UDPIdx] bigint NOT NULL,
CONSTRAINT [FK_UDP_Dimension_SITE_DIMENSION]
	FOREIGN KEY ([SITE_DIMENSION_SiteId])
	REFERENCES [dbo].[SITE_DIMENSION] ([SiteId]),
CONSTRAINT [PK_UDP_Dimension]
	PRIMARY KEY NONCLUSTERED ([centralUDPIdx] ASC))
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UDP_Dimension]') AND name = N'IDX_UQ_UDP_Dimension_SiteId_UDPIdx')
	CREATE UNIQUE NONCLUSTERED INDEX [IDX_UQ_UDP_Dimension_SiteId_UDPIdx] ON [dbo].[UDP_Dimension]
		([SITE_DIMENSION_SiteId] , [UDPIdx])
GO
