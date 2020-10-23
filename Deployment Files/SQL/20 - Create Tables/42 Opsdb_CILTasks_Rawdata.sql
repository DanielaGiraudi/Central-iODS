SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Opsdb_CILTasks_Rawdata]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Opsdb_CILTasks_Rawdata] (
	[CentralRcdIdx] bigint IDENTITY(1, 1) NOT NULL,
	[Deptid] int NOT NULL,
	[DeptDesc] nvarchar(150) NOT NULL,
	[PLId] int NOT NULL,
	[PLDesc] nvarchar(255) NOT NULL,
	[PLDescGlobal] varchar(50) NULL,
	[PUId] int NOT NULL,
	[PUDesc] nvarchar(200) NOT NULL,
	[PUDescGlobal] varchar(50) NULL,
	[PUGDesc] nvarchar(200) NULL,
	[MasterUnit] int NULL,
	[MasterUnitDesc] nvarchar(200) NULL,
	[MasterUnitDescGlobal] varchar(50) NULL,
	[VarId] int NOT NULL,
	[VarDesc] nvarchar(255) NULL,
	[VarDescGlobal] nvarchar(255) NULL,
	[DataType] nchar(100) NULL,
	[ProdId] int NULL,
	[ProdCode] varchar(25) NULL,
	[ProdDesc] nvarchar(255) NULL,
	[ProdDescGlobal] varchar(50) NULL,
	[ProcessOrder] nvarchar(50) NULL,
	[ProductGrpDesc] nvarchar(255) NULL,
	[ProductGrpDescGlobal] varchar(50) NULL,
	[LineStatus] nvarchar(50) NULL,
	[Result] varchar(25) NULL,
	[UserDesc] nvarchar(255) NULL,
	[TeamDesc] nvarchar(255) NULL,
	[RouteDesc] nvarchar(150) NULL,
	[Frequency] nvarchar(200) NULL,
	[ProdDay] varchar(10) NULL,
	[EntryOn] datetime NOT NULL,
	[ResultOn] datetime NOT NULL,
	[ModifiedOn] datetime NOT NULL,
	[SamplesTaken] int NULL,
	[OnTime] int NULL,
	[DoneLate] int NULL,
	[DefectsFound] int NULL,
	[OpenedDefects] int NULL,
	[Canceled] bit NULL,
	[UDEDesc] nvarchar(50) NULL,
	[SheetDesc] nvarchar(50) NULL,
	[Site] nvarchar(200) NOT NULL,
	[StubberUser] bit NULL,
	[SITE_DIMENSION_SiteId] int NOT NULL,
	[LINE_DIMENSION_CentralLineId] int NOT NULL,
	[RcdIdx] bigint NOT NULL,
CONSTRAINT [FK_Opsdb_CILTasks_Rawdata_LINE_DIMENSION]
	FOREIGN KEY ([LINE_DIMENSION_CentralLineId])
	REFERENCES [dbo].[LINE_DIMENSION] ([CentralLineId]),
CONSTRAINT [FK_Opsdb_CILTasks_Rawdata_SITE_DIMENSION]
	FOREIGN KEY ([SITE_DIMENSION_SiteId])
	REFERENCES [dbo].[SITE_DIMENSION] ([SiteId]),
CONSTRAINT [PK_Opsdb_CILTasks_Rawdata]
	PRIMARY KEY NONCLUSTERED ([CentralRcdIdx]))
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Opsdb_CILTasks_Rawdata]') AND name = N'IDX_UQ_Opsdb_CILTasks_Rawdata_SiteId_RcdIdx')
	CREATE UNIQUE NONCLUSTERED INDEX [IDX_UQ_Opsdb_CILTasks_Rawdata_SiteId_RcdIdx] ON [dbo].[Opsdb_CILTasks_Rawdata]
		([SITE_DIMENSION_SiteId], [RcdIdx])
GO
