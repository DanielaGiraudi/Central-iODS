SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FACT_UDPs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FACT_UDPs] (
	[CentralIdx] bigint IDENTITY(1, 1) NOT NULL,
	[VarId] int NOT NULL,
	[VarDesc] nvarchar(255) NOT NULL,
	[Value] varchar(7000) NOT NULL,
	[EffectiveDate] datetime NOT NULL,
	[ExpirationDate] datetime NULL,
	[UDP_Dimension_UDPIdx] bigint NOT NULL,
	[History_id] bigint NULL,
	[Idx] bigint NOT NULL,
	[SITE_DIMENSION_SiteId] int NOT NULL,
CONSTRAINT [PK_FACT_UDPs]
	PRIMARY KEY NONCLUSTERED ([CentralIdx]),
CONSTRAINT [FK_FACT_UDPs_SITE_DIMENSION]
	FOREIGN KEY ([SITE_DIMENSION_SiteId])
	REFERENCES [dbo].[SITE_DIMENSION] ([SiteId]),
CONSTRAINT [FK_FACT_UDPs_UDP_Dimension]
	FOREIGN KEY ([UDP_Dimension_UDPIdx])
	REFERENCES [dbo].[UDP_Dimension] ([centralUDPIdx]))
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[FACT_UDPs]') AND name = N'IDX_UQ_FACT_UDPs_SiteId_Idx_Include')
	CREATE UNIQUE NONCLUSTERED INDEX [IDX_UQ_FACT_UDPs_SiteId_Idx_Include] ON [dbo].[FACT_UDPs]
		([SITE_DIMENSION_SiteId], [Idx])
		INCLUDE ([Value])
GO
