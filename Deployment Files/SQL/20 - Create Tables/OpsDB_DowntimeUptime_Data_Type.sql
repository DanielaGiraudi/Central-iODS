
GO

--DROP TYPE [dbo].[OpsDB_DowntimeUptime_Data_Type]
--GO

/****** Object:  UserDefinedTableType [dbo].[OpsDB_DowntimeUptime_Data_Type]    Script Date: 9/1/2020 2:56:17 PM ******/
CREATE TYPE [dbo].[OpsDB_DowntimeUptime_Data_Type] AS TABLE(
	[DataServerName] [varchar](100) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[StartTimeUTC] [datetimeoffset](7) NULL,
	[EndTimeUTC] [datetimeoffset](7) NULL,
	[Duration] [decimal](12, 3) NULL,
	[Total_Uptime] [float] NULL,
	[Uptime] [decimal](12, 3) NULL,
	[Fault] [varchar](100) NULL,
	[FaultGlobal] [varchar](100) NULL,
	[FaultCode] [varchar](30) NULL,
	[Reason1Id] [int] NULL,
	[Reason1] [varchar](100) NULL,
	[Reason1Global] [varchar](100) NULL,
	[Reason1Code] [varchar](30) NULL,
	[Reason1Category] [varchar](4000) NULL,
	[Reason1CategoryGlobal] [varchar](4000) NULL,
	[Reason2Id] [int] NULL,
	[Reason2] [varchar](100) NULL,
	[Reason2Global] [varchar](100) NULL,
	[Reason2Code] [varchar](30) NULL,
	[Reason2Category] [varchar](4000) NULL,
	[Reason2CategoryGlobal] [varchar](4000) NULL,
	[Reason3Id] [int] NULL,
	[Reason3] [varchar](100) NULL,
	[Reason3Global] [varchar](100) NULL,
	[Reason3Code] [varchar](30) NULL,
	[Reason3Category] [varchar](4000) NULL,
	[Reason3CategoryGlobal] [varchar](4000) NULL,
	[Reason4Id] [int] NULL,
	[Reason4] [varchar](100) NULL,
	[Reason4Global] [varchar](100) NULL,
	[Reason4Code] [varchar](30) NULL,
	[Reason4Category] [varchar](4000) NULL,
	[Reason4CategoryGlobal] [varchar](4000) NULL,
	[Action1] [varchar](100) NULL,
	[Action1Code] [varchar](30) NULL,
	[Action2] [varchar](100) NULL,
	[Action2Code] [varchar](30) NULL,
	[Action3] [varchar](100) NULL,
	[Action3Code] [varchar](30) NULL,
	[Action4] [varchar](100) NULL,
	[Action4Code] [varchar](30) NULL,
	[Planned] [bit] NULL,
	[DChangeOverAlltypes] [bit] NULL,
	[DChangeOverPackingCO] [bit] NULL,
	[Location] [varchar](100) NULL,
	[LocationGlobal] [varchar](100) NULL,
	[ProdDesc] [nvarchar](255) NULL,
	[ProdDescGlobal] [varchar](50) NULL,
	[ProdCode] [varchar](25) NULL,
	[ProdFam] [nvarchar](100) NULL,
	[ProdGroup] [nvarchar](100) NULL,
	[ProdGroupGlobal] [varchar](50) NULL,
	[ProcessOrder] [nvarchar](50) NULL,
	[TeamDesc] [varchar](25) NULL,
	[ShiftDesc] [varchar](25) NULL,
	[LineStatus] [nvarchar](50) NULL,
	[DTStatus] [int] NULL,
	[Comments] [nvarchar](1000) NULL,
	[MainComments] [nvarchar](1000) NULL,
	[PLDesc] [varchar](100) NULL,
	[PUDesc] [varchar](200) NULL,
	[PLDescGlobal] [varchar](50) NULL,
	[PUDescGlobal] [varchar](50) NULL,
	[PUID] [int] NULL,
	[PLID] [int] NULL,
	[BreakDown] [bit] NULL,
	[ProcFailure] [bit] NULL,
	[TransferFlag] [int] NULL,
	[DeleteFlag] [bit] NOT NULL,
	[Site] [varchar](50) NULL,
	[TEDetId] [int] NOT NULL,
	[Ts] [datetime] NULL,
	[IsContraint] [bit] NULL,
	[ProductionDay] [datetime] NULL,
	[IsStarved] [bit] NULL,
	[IsBlocked] [bit] NULL,
	[ManualStops] [bit] NOT NULL,
	[MinorStop] [int] NULL,
	[MajorStop] [int] NULL,
	[ZoneDesc] [nvarchar](255) NULL,
	[ZoneGrpDesc] [nvarchar](255) NULL,
	[LineGroup] [nvarchar](255) NULL,
	[StopsEquipFails] [int] NULL,
	[StopsELP] [int] NULL,
	[StopsScheduled] [int] NULL,
	[StopsUnscheduled] [int] NULL,
	[StopsUnscheduledInternal] [int] NULL,
	[StopsUnscheduledBS] [int] NULL,
	[StopsBlockedStarved] [int] NULL,
	[ERTD_ID] [int] NULL,
	[RawRateloss] [float] NULL,
	[RateLossRatio] [float] NULL,
	[CommentId] [int] NULL,
	[CommentModifOn] [datetime] NULL,
	[Comment_Rtf] [text] NULL,
	[Repulper_Tons] [decimal](12, 3) NULL,
	[RcdIdx] [int] NOT NULL
	PRIMARY KEY CLUSTERED 
(
	[RcdIdx] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO

