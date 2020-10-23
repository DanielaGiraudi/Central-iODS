SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FACT_DOWNTIME]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FACT_DOWNTIME] (
	[StartTime] datetime NOT NULL,
	[EndTime] datetime NOT NULL,
	[TotalStops] int NULL,
	[Duration] float NULL,
	[TotalUpdDowntime] float NULL,
	[TotalPlannedDowntime] float NULL,
	[TotalUpdStops] int NULL,
	[MinorStops] int NULL,
	[ProcFailures] int NULL,
	[MajorStops] int NULL,
	[Uptime] float NULL,
	[MTBF] float NULL,
	[MTBFUpd] float NULL,
	[MTTR] float NULL,
	[UpsDTPRLoss] float NULL,
	[PlannedDTPRLoss] float NULL,
	[R0] float NULL,
	[R2] float NULL,
	[R210] float NULL,
	[R240] float NULL,
	[BreakDown] int NULL,
	[MTTRUpd] float NULL,
	[UpdDownPerc] float NULL,
	[StopsDay] float NULL,
	[ProcFailuresDay] float NULL,
	[Availability_Unpl_DT] float NULL,
	[Availability_Planned_DT] float NULL,
	[Availability_Total_DT] float NULL,
	[MTBS] float NULL,
	[ACPStops] int NULL,
	[ACPStopsDay] float NULL,
	[RepairTimeT] int NULL,
	[FalseStarts0] int NULL,
	[FalseStarts0Per] float NULL,
	[FalseStartsT] int NULL,
	[FalseStartsTPer] float NULL,
	[Survival210Rate] float NULL,
	[Survival210RatePer] float NULL,
	[Survival240Rate] float NULL,
	[Survival240RatePer] float NULL,
	[EditedStops] int NULL,
	[EditedStopsPer] float NULL,
	[TotalUpdStopDay] float NULL,
	[StopsBDSDay] float NULL,
	[TotalPlannedStops] int NULL,
	[TotalPlannedStopsDay] float NULL,
	[MajorStopsDay] float NULL,
	[MinorStopsDay] float NULL,
	[TotalStarvedStops] int NULL,
	[TotalBlockedStops] int NULL,
	[TotalStarvedDowntime] float NULL,
	[TotalBlockedDowntime] float NULL,
	[VSScheduledTime] float NULL,
	[VSPRLossPlanned] float NULL,
	[VSPRLossUnplanned] float NULL,
	[VSPRLossBreakdown] float NULL,
	[teamdesc] varchar(25) NOT NULL,
	[shiftdesc] varchar(25) NOT NULL,
	[Repulper_Tons] float NULL,
	[DChangeOverAlltypesStops] int NULL,
	[DChangeOverPackingCOStops] int NULL,
	[DChangeOverAlltypesDuration] int NULL,
	[DChangeOverPackingCODuration] int NULL,
	[LineStatus] nvarchar(50) NOT NULL,
	[DeleteFlag] bit NOT NULL,
	[Modified_ON] datetime NULL,
	[SITE_DIMENSION_SiteId] int NOT NULL,
	[LINE_DIMENSION_CentralLineId] int NOT NULL,
	[WORKCELL_DIMENSION_CentralWorkcellId] int NOT NULL,
	[DATE_DIMENSION_DateId] int NOT NULL,
CONSTRAINT [FK_FACT_DOWNTIME_DATE_DIMENSION]
	FOREIGN KEY ([DATE_DIMENSION_DateId])
	REFERENCES [dbo].[DATE_DIMENSION] ([DateId]),
CONSTRAINT [FK_FACT_DOWNTIME_LINE_DIMENSION]
	FOREIGN KEY ([LINE_DIMENSION_CentralLineId])
	REFERENCES [dbo].[LINE_DIMENSION] ([CentralLineId]),
CONSTRAINT [FK_FACT_DOWNTIME_SITE_DIMENSION]
	FOREIGN KEY ([SITE_DIMENSION_SiteId])
	REFERENCES [dbo].[SITE_DIMENSION] ([SiteId]),
CONSTRAINT [FK_FACT_DOWNTIME_WorkCell_Dimension]
	FOREIGN KEY ([WORKCELL_DIMENSION_CentralWorkcellId])
	REFERENCES [dbo].[WorkCell_Dimension] ([CentralWorkcellId]),
CONSTRAINT [PK_FACT_DOWNTIME]
	PRIMARY KEY NONCLUSTERED ([SITE_DIMENSION_SiteId], [LINE_DIMENSION_CentralLineId], [WORKCELL_DIMENSION_CentralWorkcellId], [DATE_DIMENSION_DateId], [teamdesc], [shiftdesc], [LineStatus], [StartTime], [EndTime])
	WITH (FILLFACTOR = 75))
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[FACT_DOWNTIME]') AND name = N'IDX_UFACT_DOWNTIME_DateId')
	CREATE NONCLUSTERED INDEX [IDX_UFACT_DOWNTIME_DateId] ON [dbo].[FACT_DOWNTIME]
		([DATE_DIMENSION_DateId])
GO
