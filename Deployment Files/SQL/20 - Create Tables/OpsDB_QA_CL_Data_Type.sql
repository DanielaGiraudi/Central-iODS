--DROP TYPE [dbo].[OpsDB_QA_CL_Data_Type]
--GO

CREATE TYPE [dbo].[OpsDB_QA_CL_Data_Type] AS TABLE(
	[DataServerName] [varchar](100) NULL,
	[VarId] [int] NOT NULL,
	[PLId] [int] NOT NULL,
	[PLDesc] [varchar](50) NOT NULL,
	[PLDescGlobal] [varchar](50) NULL,
	[PUId] [int] NOT NULL,
	[PUDesc] [varchar](50) NOT NULL,
	[PUDescGlobal] [varchar](50) NULL,
	[PUGDesc] [varchar](50) NULL,
	[VarDesc] [varchar](50) NULL,
	[VarDescGlobal] [varchar](50) NULL,
	[ProdId] [int] NULL,
	[Frequency] [varchar](200) NULL,
	[ProdCode] [varchar](25) NULL,
	[ProdDesc] [varchar](50) NULL,
	[ProdDescGlobal] [varchar](50) NULL,
	[ProcessOrder] [varchar](50) NULL,
	[Result] [varchar](25) NULL,
	[LReject] [varchar](25) NULL,
	[UReject] [varchar](25) NULL,
	[LWarning] [varchar](25) NULL,
	[UWarning] [varchar](25) NULL,
	[LUser] [varchar](25) NULL,
	[UUser] [varchar](25) NULL,
	[Target] [varchar](25) NULL,
	[LControl] [varchar](25) NULL,
	[UControl] [varchar](25) NULL,
	[EffectiveDate] [datetime] NULL,
	[Defect] [int] NULL,
	[Deptid] [int] NOT NULL,
	[DeptDesc] [varchar](50) NOT NULL,
	[MasterUnit] [int] NULL,
	[MasterUnitDesc] [varchar](50) NULL,
	[MasterUnitDescGlobal] [varchar](50) NULL,
	[UserDesc] [varchar](255) NULL,
	[TeamDesc] [varchar](150) NULL,
	[ShiftDesc] [varchar](10) NULL,
	[RouteDesc] [varchar](150) NULL,
	[ProductGrpDesc] [varchar](50) NULL,
	[ProductGrpDescGlobal] [varchar](50) NULL,
	[LineStatus] [varchar](50) NULL,
	[DataType] [varchar](50) NULL,
	[ProdDay] [varchar](10) NULL,
	[EntryOn] [datetime] NOT NULL,
	[ResultOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[NextStartDate] [datetime] NULL,
	[SamplesTaken] [int] NULL,
	[OnTime] [int] NULL,
	[DoneLate] [int] NULL,
	[Canceled] [bit] NULL,
	[UDEDesc] [varchar](50) NULL,
	[SheetDesc] [varchar](1000) NULL,
	[Site] [varchar](200) NOT NULL,
	[StubberUser] [bit] NULL,
	[FACT_UDPs_Idx] [bigint] NULL,
	[ZoneDesc] [varchar](50) NULL,
	[ZoneGrpDesc] [varchar](50) NULL,
	[CommentText] [nvarchar](max) NULL,
	[CommentId] [int] NULL,
	[CommentModifOn] [datetime] NULL,
	[Comment_Rtf] [text] NULL,
	[RcdIdx] [bigint] NOT NULL
	PRIMARY KEY CLUSTERED ([RcdIdx]))
GO
