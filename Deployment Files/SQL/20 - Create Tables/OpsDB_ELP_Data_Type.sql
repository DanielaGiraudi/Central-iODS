--DROP TYPE [dbo].[OpsDB_ELP_Data_Type]
--GO

CREATE TYPE [dbo].[OpsDB_ELP_Data_Type] AS TABLE(
	[DataServerName] [varchar](100) NULL,
	[Site] [varchar](50) NULL,
	[PRConvStartTime] [datetime] NULL,
	[PRConvEndTime] [datetime] NULL,
	[PRConvStartTimeUTC] [datetimeoffset](7) NULL,
	[PRConvEndTimeUTC] [datetimeoffset](7) NULL,
	[PLId] [int] NULL,
	[PLDesc] [varchar](75) NULL,
	[PUId] [int] NULL,
	[PUDesc] [varchar](200) NULL,
	[NPTStatus] [varchar](50) NULL,
	[ProcessOrder] [varchar](50) NULL,
	[ProdId] [int] NULL,
	[ProdCode] [varchar](50) NULL,
	[ProdDesc] [varchar](255) NULL,
	[ProdFam] [varchar](100) NULL,
	[ProdGroup] [varchar](100) NULL,
	[ParentType] [int] NULL,
	[ParentPRID] [varchar](50) NULL,
	[ParentPM] [varchar](50) NULL,
	[ParentTeam] [varchar](15) NULL,
	[ParentPLId] [int] NULL,
	[ParentPLDesc] [nvarchar](50) NULL,
	[ParentPUId] [int] NULL,
	[ParentPUDesc] [nvarchar](50) NULL,
	[GrandParentPRID] [nvarchar](50) NULL,
	[GrandParentPM] [nvarchar](50) NULL,
	[GrandParentTeam] [nvarchar](15) NULL,
	[PM] [nvarchar](50) NULL,
	[PMTeam] [nvarchar](15) NULL,
	[PaperSource] [varchar](50) NULL,
	[PaperRunBy] [varchar](50) NULL,
	[INTR] [varchar](50) NULL,
	[EventId] [int] NULL,
	[SourceId] [int] NULL,
	[EventNum] [varchar](50) NULL,
	[EventTimestamp] [datetime] NULL,
	[UWS] [varchar](200) NULL,
	[InputOrder] [int] NULL,
	[ParentRollTimestamp] [datetime] NULL,
	[ParentRollAge] [float] NULL,
	[TotalRuntime] [float] NULL,
	[TotalRolls] [int] NULL,
	[FreshRolls] [int] NULL,
	[StorageRolls] [int] NULL,
	[TotalStops] [int] NULL,
	[TotalDowntime] [float] NULL,
	[TotalRateLossDT] [float] NULL,
	[TotalScheduledDT] [float] NULL,
	[PaperRuntime] [float] NULL,
	[StartTimeLine] [datetime] NULL,
	[EndTimeLine] [datetime] NULL,
	[TotalRuntimeLine] [float] NULL,
	[TotalStopsLine] [int] NULL,
	[TotalDowntimeLine] [float] NULL,
	[TotalRateLossDTLine] [float] NULL,
	[TotalScheduledDTLine] [float] NULL,
	[TotalFreshRuntimeLine] [float] NULL,
	[TotalFreshStopsLine] [int] NULL,
	[TotalFreshDowntimeLine] [float] NULL,
	[TotalFreshRateLossDTLine] [float] NULL,
	[TotalFreshScheduledDTLine] [float] NULL,
	[TotalStorageRuntimeLine] [float] NULL,
	[TotalStorageStopsLine] [int] NULL,
	[TotalStorageDowntimeLine] [float] NULL,
	[TotalStorageRateLossDTLine] [float] NULL,
	[TotalStorageScheduledDTLine] [float] NULL,
	[StartTimeLinePS] [datetime] NULL,
	[EndTimeLinePS] [datetime] NULL,
	[TotalRuntimeLinePS] [float] NULL,
	[TotalStopsLinePS] [int] NULL,
	[TotalDowntimeLinePS] [float] NULL,
	[TotalRateLossDTLinePS] [float] NULL,
	[TotalScheduledDTLinePS] [float] NULL,
	[TotalFreshRuntimeLinePS] [float] NULL,
	[TotalFreshStopsLinePS] [int] NULL,
	[TotalFreshDowntimeLinePS] [float] NULL,
	[TotalFreshRateLossDTLinePS] [float] NULL,
	[TotalFreshScheduledDTLinePS] [float] NULL,
	[TotalStorageRuntimeLinePS] [float] NULL,
	[TotalStorageStopsLinePS] [int] NULL,
	[TotalStorageDowntimeLinePS] [float] NULL,
	[TotalStorageRateLossDTLinePS] [float] NULL,
	[TotalStorageScheduledDTLinePS] [float] NULL,
	[StartTimeIntrPL] [datetime] NULL,
	[EndTimeIntrPL] [datetime] NULL,
	[TotalRuntimeIntrPL] [float] NULL,
	[TotalStopsIntrPL] [int] NULL,
	[TotalDowntimeIntrPL] [float] NULL,
	[TotalRateLossDTIntrPL] [float] NULL,
	[TotalScheduledDTIntrPL] [float] NULL,
	[TotalFreshRuntimeIntrPL] [float] NULL,
	[TotalFreshStopsIntrPL] [int] NULL,
	[TotalFreshDowntimeIntrPL] [float] NULL,
	[TotalFreshRateLossDTIntrPL] [float] NULL,
	[TotalFreshScheduledDTIntrPL] [float] NULL,
	[TotalStorageRuntimeIntrPL] [float] NULL,
	[TotalStorageStopsIntrPL] [int] NULL,
	[TotalStorageDowntimeIntrPL] [float] NULL,
	[TotalStorageRateLossDTIntrPL] [float] NULL,
	[TotalStorageScheduledDTIntrPL] [float] NULL,
	[StartTimePMRunBy] [datetime] NULL,
	[EndTimePMRunBy] [datetime] NULL,
	[TotalRuntimePMRunBy] [float] NULL,
	[TotalStopsPMRunBy] [int] NULL,
	[TotalDowntimePMRunBy] [float] NULL,
	[TotalRateLossDTPMRunBy] [float] NULL,
	[TotalScheduledDTPMRunBy] [float] NULL,
	[TotalFreshRuntimePMRunBy] [float] NULL,
	[TotalFreshStopsPMRunBy] [int] NULL,
	[TotalFreshDowntimePMRunBy] [float] NULL,
	[TotalFreshRateLossDTPMRunBy] [float] NULL,
	[TotalFreshScheduledDTPMRunBy] [float] NULL,
	[TotalStorageRuntimePMRunBy] [float] NULL,
	[TotalStorageStopsPMRunBy] [int] NULL,
	[TotalStorageDowntimePMRunBy] [float] NULL,
	[TotalStorageRateLossDTPMRunBy] [float] NULL,
	[TotalStorageScheduledDTPMRunBy] [float] NULL,
	[TS] [datetime] NULL,
	[DeleteFlag] [bit] NULL,
	[RcdIdx] [bigint] NOT NULL,
	PRIMARY KEY CLUSTERED ([RcdIdx]))
GO
