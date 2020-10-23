
GO

--DROP TYPE [dbo].[OpsDB_Rejects_Data_Type]
--GO


CREATE TYPE [dbo].[OpsDB_Rejects_Data_Type] AS TABLE(
	[DataServerName] [varchar](100) NULL,
	[Timestamp] [datetime] NULL,
	[TimestampUTC] [datetime] NULL,
	[Amount] [float] NULL,
	[Units] [varchar](30) NULL,
	[Type] [varchar](30) NULL,
	[Fault] [varchar](100) NULL,
	[FaultGlobal] [varchar](100) NULL,
	[FaultCode] [varchar](100) NULL,
	[Reason1] [varchar](100) NULL,
	[Reason1Global] [varchar](100) NULL,
	[ReasonCode] [varchar](30) NULL,
	[Location] [varchar](75) NULL,
	[LocationGlobal] [varchar](100) NULL,
	[ProdId] [int] NOT NULL,
	[ProdCode] [varchar](25) NOT NULL,
	[ProdDesc] [nvarchar](255) NULL,
	[ProdDescGlobal] [varchar](50) NULL,
	[ProdFam] [nvarchar](100) NULL,
	[ProdGroup] [nvarchar](100) NULL,
	[ProdGroupGlobal] [varchar](50) NULL,
	[ProcessOrder] [nvarchar](50) NULL,
	[TeamDesc] [varchar](25) NULL,
	[ShiftDesc] [varchar](25) NULL,
	[Comments] [varchar](255) NULL,
	[PLDesc] [varchar](75) NULL,
	[PLDescGlobal] [varchar](50) NULL,
	[PUID] [int] NULL,
	[SourcePUId] [int] NULL,
	[PUDesc] [varchar](200) NULL,
	[PUDescGlobal] [varchar](50) NULL,
	[PLId] [int] NULL,
	[ManualWaste] [int] NULL,
	[TransferFlag] [int] NULL,
	[WedId] [int] NULL,
	[Site] [varchar](50) NULL,
	[ZoneDesc] [nvarchar](255) NULL,
	[ZoneGrpDesc] [nvarchar](255) NULL,
	[RcdIdx] [int] NOT NULL
	PRIMARY KEY CLUSTERED 
(
	[RcdIdx] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO


