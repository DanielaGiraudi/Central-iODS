DROP PROCEDURE splocal_InsertFactDowntime;
GO
DROP TYPE [dbo].[OpsDB_FactDowntime_Data_Type]
GO

CREATE TYPE [dbo].[OpsDB_FactDowntime_Data_Type] AS TABLE(
	[DataServerName] [varchar](100) NULL,
	[LineStatus] [nvarchar](50) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[TotalStops] [int] NULL,
	[Duration] [float] NULL,
	[TotalUpdDowntime] [float] NULL,
	[TotalPlannedDowntime] [float] NULL,
	[TotalUpdStops] [int] NULL,
	[MinorStops] [int] NULL,
	[ProcFailures] [int] NULL,
	[MajorStops] [int] NULL,
	[Uptime] [float] NULL,
	[MTBF] [float] NULL,
	[MTBFUpd] [float] NULL,
	[MTTR] [float] NULL,
	[UpsDTPRLoss] [float] NULL,
	[PlannedDTPRLoss] [float] NULL,
	[R0] [float] NULL,
	[R2] [float] NULL,
	[R210] [float] NULL,
	[R240] [float] NULL,
	[BreakDown] [int] NULL,
	[MTTRUpd] [float] NULL,
	[UpdDownPerc] [float] NULL,
	[StopsDay] [float] NULL,
	[ProcFailuresDay] [float] NULL,
	[Availability_Unpl_DT] [float] NULL,
	[Availability_Planned_DT] [float] NULL,
	[Availability_Total_DT] [float] NULL,
	[MTBS] [float] NULL,
	[ACPStops] [int] NULL,
	[ACPStopsDay] [float] NULL,
	[RepairTimeT] [int] NULL,
	[FalseStarts0] [int] NULL,
	[FalseStarts0Per] [float] NULL,
	[FalseStartsT] [int] NULL,
	[FalseStartsTPer] [float] NULL,
	[Survival210Rate] [float] NULL,
	[Survival210RatePer] [float] NULL,
	[Survival240Rate] [float] NULL,
	[Survival240RatePer] [float] NULL,
	[EditedStops] [int] NULL,
	[EditedStopsPer] [float] NULL,
	[TotalUpdStopDay] [float] NULL,
	[StopsBDSDay] [float] NULL,
	[TotalPlannedStops] [int] NULL,
	[TotalPlannedStopsDay] [float] NULL,
	[MajorStopsDay] [float] NULL,
	[MinorStopsDay] [float] NULL,
	[TotalStarvedStops] [int] NULL,
	[TotalBlockedStops] [int] NULL,
	[TotalStarvedDowntime] [float] NULL,
	[TotalBlockedDowntime] [float] NULL,
	[LINE_DIMENSION_CentralLineId] [int] NOT NULL,
	[WORKCELL_DIMENSION_CentralWorkcellId] [int] NOT NULL,
	[DATE_DIMENSION_DateId] [int] NOT NULL,
	[VSScheduledTime] [float] NULL,
	[VSPRLossPlanned] [float] NULL,
	[VSPRLossUnplanned] [float] NULL,
	[VSPRLossBreakdown] [float] NULL,
	[teamdesc] [varchar](25) NOT NULL,
	[shiftdesc] [varchar](25) NOT NULL,
	[Repulper_Tons] [float] NULL,
	[DChangeOverAlltypesStops] [int] NULL,
	[DChangeOverPackingCOStops] [int] NULL,
	[DChangeOverAlltypesDuration] [int] NULL,
	[DChangeOverPackingCODuration] [int] NULL,
	[Modified_ON] [datetime] NULL
)
GO
