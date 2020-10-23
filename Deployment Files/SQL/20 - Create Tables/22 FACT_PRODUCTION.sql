SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FACT_PRODUCTION]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FACT_PRODUCTION] (
	[StartTime] datetime NOT NULL,
	[DeleteFlag] bit NOT NULL,
	[LineStatus] nvarchar(50) NOT NULL,
	[EndTime] datetime NOT NULL,
	[GoodProduct] bigint NULL,
	[TotalProduct] float NULL,
	[TotalScrap] float NULL,
	[ActualRate] float NULL,
	[TargetRate] float NULL,
	[ScheduleTime] float NULL,
	[PR] float NULL,
	[ScrapPer] float NULL,
	[IdealRate] float NULL,
	[STNU] float NULL,
	[CapacityUtilization] float NULL,
	[ScheduleUtilization] float NULL,
	[Availability] float NULL,
	[PRAvailability] float NULL,
	[StopsMSU] float NULL,
	[DownMSU] float NULL,
	[RunningScrapPer] float NULL,
	[RunningScrap] int NULL,
	[StartingScrapPer] float NULL,
	[StartingScrap] int NULL,
	[RoomLoss] float NULL,
	[MSU] float NULL,
	[TotalCases] float NULL,
	[RateUtilization] float NULL,
	[RunEff] float NULL,
	[Site_DIMENSION_SiteId] int NOT NULL,
	[LINE_DIMENSION_CentralLineId] int NOT NULL,
	[DATE_DIMENSION_DateId] int NOT NULL,
	[WORKCELL_DIMENSION_CentralWorkCellId] int NOT NULL,
	[SafetyTrigg] int NULL,
	[QualityTrigg] int NULL,
	[VSNetProduction] float NULL,
	[VSPR] float NULL,
	[VSPRLossPer] float NULL,
	[PRRateLoss] float NULL,
	[TeamDesc] varchar(25) NOT NULL,
	[ShiftDesc] varchar(25) NOT NULL,
	[Area4LossPer] float NULL,
	[StatUnits] float NULL,
	[ConvertedCases] bigint NULL,
	[NetProduction] float NULL,
	[FactProductionId] int NOT NULL,
	[STNUPer] float NULL,
	[BrandProjectPer] float NULL,
	[EO_NonShippablePer] float NULL,
	[LineNotStaffedPer] float NULL,
	[Modified_ON] datetime NULL,
	[PRLossScrap] float NULL,
	[PR_Excl_PRInDev] float NULL,
	[NetProductionExcDev] float NULL,
	[ScheduleTimeExcDev] float NULL,
	[MSUExcDev] float NULL,
CONSTRAINT [FK_FACT_PRODUCTION_DATE_DIMENSION]
	FOREIGN KEY ([DATE_DIMENSION_DateId])
	REFERENCES [dbo].[DATE_DIMENSION] ([DateId]),
CONSTRAINT [FK_FACT_PRODUCTION_LINE_DIMENSION]
	FOREIGN KEY ([LINE_DIMENSION_CentralLineId])
	REFERENCES [dbo].[LINE_DIMENSION] ([CentralLineId]),
CONSTRAINT [FK_FACT_PRODUCTION_SITE_DIMENSION]
	FOREIGN KEY ([Site_DIMENSION_SiteId])
	REFERENCES [dbo].[SITE_DIMENSION] ([SiteId]),
CONSTRAINT [FK_FACT_PRODUCTION_WorkCell_Dimension]
	FOREIGN KEY ([WORKCELL_DIMENSION_CentralWorkCellId])
	REFERENCES [dbo].[WorkCell_Dimension] ([CentralWorkcellId]),
CONSTRAINT [PK_FACT_PRODUCTION]
	PRIMARY KEY NONCLUSTERED ([Site_DIMENSION_SiteId], [FactProductionId]))
END
GO
