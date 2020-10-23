SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpsDB_Production_Data]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OpsDB_Production_Data] (
	[CentralRcdIdx] bigint IDENTITY(1, 1) NOT NULL,
	[StartTime] datetime NULL,
	[EndTime] datetime NULL,
	[POStatus] nvarchar(300) NULL,
	[EndTimeUTC] datetimeoffset(7) NULL,
	[StartTimeUTC] datetimeoffset(7) NULL,
	[LineGroup] nvarchar(300) NULL,
	[PLID] int NULL,
	[PLDesc] varchar(75) NULL,
	[PLDescGlobal] varchar(50) NULL,
	[PUID] int NULL,
	[PUDesc] varchar(200) NULL,
	[PUDescGlobal] varchar(50) NULL,
	[Site] varchar(50) NULL,
	[PPId] int NULL,
	[EventId] int NULL,
	[ProcessOrder] nvarchar(50) NULL,
	[ProdId] int NULL,
	[ProdCode] varchar(25) NULL,
	[ProdDesc] nvarchar(255) NULL,
	[ProdFam] nvarchar(100) NULL,
	[ProdGroup] nvarchar(100) NULL,
	[ProdGroupGlobal] varchar(50) NULL,
	[ShiftDesc] varchar(25) NULL,
	[TeamDesc] varchar(25) NULL,
	[LineStatus] nvarchar(50) NULL,
	[TotalProduct] bigint NULL,
	[GoodProduct] bigint NULL,
	[TotalScrap] bigint NULL,
	[ActualRate] float NULL,
	[TargetRate] float NULL,
	[IdealRate] float NULL,
	[TotalCases] int NULL,
	[RunningScrap] bigint NULL,
	[StartingScrap] bigint NULL,
	[FirstPackCount] int NULL,
	[SecondPackCount] int NULL,
	[ThirdPackCount] int NULL,
	[FourthPackCount] int NULL,
	[ProdPerStat] float NULL,
	[StatFactor] float NULL,
	[StatUnits] float NULL,
	[ConvertedCases] float NULL,
	[UnitOfMeasure] varchar(50) NULL,
	[Uptime] float NULL,
	[DownTime] float NULL,
	[ScheduledTime] float NULL,
	[Stops] int NULL,
	[BatchNumber] nvarchar(100) NULL,
	[CalcSpeed] float NULL,
	[Ts] datetime NULL,
	[TransferFlag] int NULL,
	[DeleteFlag] bit NOT NULL,
	[ZoneDesc] nvarchar(255) NULL,
	[ZoneGrpDesc] nvarchar(255) NULL,
	[ProdRecHash] varbinary(64) NULL,
	[SITE_DIMENSION_SiteId] int NOT NULL,
	[LINE_DIMENSION_CentralLineId] int NOT NULL,
	[RcdIdx] bigint NOT NULL,
CONSTRAINT [FK_OpsDB_Production_Data_LINE_DIMENSION]
	FOREIGN KEY ([LINE_DIMENSION_CentralLineId])
	REFERENCES [dbo].[LINE_DIMENSION] ([CentralLineId]),
CONSTRAINT [FK_OpsDB_Production_Data_SITE_DIMENSION]
	FOREIGN KEY ([SITE_DIMENSION_SiteId])
	REFERENCES [dbo].[SITE_DIMENSION] ([SiteId]),
CONSTRAINT [PK_OpsDB_Production_Data]
	PRIMARY KEY NONCLUSTERED ([CentralRcdIdx]))
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OpsDB_Production_Data]') AND name = N'IDX_UQ_OpsDB_Production_Data_SiteId_RcdIdx')
	CREATE UNIQUE NONCLUSTERED INDEX [IDX_UQ_OpsDB_Production_Data_SiteId_RcdIdx] ON [dbo].[OpsDB_Production_Data]
		([SITE_DIMENSION_SiteId], [RcdIdx])
GO
