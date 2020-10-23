SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LINE_DIMENSION]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LINE_DIMENSION] (
	[CentralLineId] int IDENTITY(1, 1) NOT NULL,
	[LineId] int NOT NULL,
	[LineDesc] nvarchar(50) NULL,
	[LineDescGlobal] nvarchar(50) NULL,
	[SITE_DIMENSION_SiteId] int NOT NULL,
	[BUDesc] nvarchar(200) NULL,
	[PlatformDesc] nvarchar(200) NULL,
	[InitiativeDesc] nvarchar(15) NULL,
	[DeptId] int NULL,
	[DeptDesc] nvarchar(50) NULL,
	[ShiftStartTime] nvarchar(10) NULL,
	[WeekStartTime] datetime NULL,
	[StartOfProd] datetime NULL,
	[StartOfConst] datetime NULL,
	[StartOfWeek] varchar(20) NULL,
	[StartOfQtr] varchar(20) NULL,
	[PLId] int NULL,
	[ConfigType] nvarchar(50) NULL,
	[Category] varchar(250) NULL,
	[IsActive] bit NOT NULL,
CONSTRAINT [PK_LINE_DIMENSION]
	PRIMARY KEY NONCLUSTERED ([CentralLineId]),
CONSTRAINT [FK_LINE_DIMENSION_SITE_DIMENSION]
	FOREIGN KEY ([SITE_DIMENSION_SiteId])
	REFERENCES [dbo].[SITE_DIMENSION] ([SiteId]))
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[LINE_DIMENSION]') AND name = N'IDX_UQ_LINE_DIMENSION_SiteId_LineDesc')
	CREATE UNIQUE NONCLUSTERED INDEX [IDX_UQ_LINE_DIMENSION_SiteId_LineDesc] ON [dbo].[LINE_DIMENSION]
		([SITE_DIMENSION_SiteId], [LineDesc])
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[LINE_DIMENSION]') AND name = N'IDX_UQ_LINE_DIMENSION_SiteId_LineId')
	CREATE UNIQUE NONCLUSTERED INDEX [IDX_UQ_LINE_DIMENSION_SiteId_LineId] ON [dbo].[LINE_DIMENSION]
		([SITE_DIMENSION_SiteId], [LineId])
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[LINE_DIMENSION]') AND name = N'IDX_UQ_LINE_DIMENSION_SiteId_PlId')
	CREATE UNIQUE NONCLUSTERED INDEX [IDX_UQ_LINE_DIMENSION_SiteId_PlId] ON [dbo].[LINE_DIMENSION]
		([SITE_DIMENSION_SiteId], [PLId])
GO
