
GO

DROP TYPE [dbo].[OpsDB_Production_Data_Type]
GO

/****** Object:  UserDefinedTableType [dbo].[WorkCell_Dimension_Type]    Script Date: 9/1/2020 2:56:17 PM ******/
CREATE TYPE [dbo].[OpsDB_Production_Data_Type] AS TABLE(
	[DataServerName] [varchar](100) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[POStatus] [nvarchar](300) NULL,
	[EndTimeUTC] [datetimeoffset](7) NULL,
	[StartTimeUTC] [datetimeoffset](7) NULL,
	[LineGroup] [nvarchar](300) NULL,
	[PLID] [int] NULL,
	[PLDesc] [varchar](75) NULL,
	[PLDescGlobal] [varchar](50) NULL,
	[PUID] [int] NULL,
	[PUDesc] [varchar](200) NULL,
	[PUDescGlobal] [varchar](50) NULL,
	[Site] [varchar](50) NULL,
	[PPId] [int] NULL,
	[EventId] [int] NULL,
	[ProcessOrder] [nvarchar](50) NULL,
	[ProdId] [int] NULL,
	[ProdCode] [varchar](25) NULL,
	[ProdDesc] [nvarchar](255) NULL,
	[ProdFam] [nvarchar](100) NULL,
	[ProdGroup] [nvarchar](100) NULL,
	[ProdGroupGlobal] [varchar](50) NULL,
	[ShiftDesc] [varchar](25) NULL,
	[TeamDesc] [varchar](25) NULL,
	[LineStatus] [nvarchar](50) NULL,
	[TotalProduct] [bigint] NULL,
	[GoodProduct] [bigint] NULL,
	[TotalScrap] [bigint] NULL,
	[ActualRate] [float] NULL,
	[TargetRate] [float] NULL,
	[IdealRate] [float] NULL,
	[TotalCases] [int] NULL,
	[RunningScrap] [bigint] NULL,
	[StartingScrap] [bigint] NULL,
	[FirstPackCount] [int] NULL,
	[SecondPackCount] [int] NULL,
	[ThirdPackCount] [int] NULL,
	[FourthPackCount] [int] NULL,
	[ProdPerStat] [float] NULL,
	[StatFactor] [float] NULL,
	[StatUnits] [float] NULL,
	[ConvertedCases] [float] NULL,
	[UnitOfMeasure] [varchar](50) NULL,
	[Uptime] [float] NULL,
	[DownTime] [float] NULL,
	[ScheduledTime] [float] NULL,
	[Stops] [int] NULL,
	[BatchNumber] [nvarchar](100) NULL,
	[CalcSpeed] [float] NULL,
	[Ts] [datetime] NULL,
	[TransferFlag] [int] NULL,
	[DeleteFlag] [bit] NOT NULL,
	[ZoneDesc] [nvarchar](255) NULL,
	[ZoneGrpDesc] [nvarchar](255) NULL,
	[ProdRecHash] [varbinary](64) NULL,
	[RcdIdx] [bigint] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[RcdIdx] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO


