
GO

--DROP TYPE [dbo].[Opsdb_CILTasks_Rawdata_Type]
--GO

/****** Object:  UserDefinedTableType [dbo].[Opsdb_CILTasks_Rawdata_Type]    Script Date: 9/1/2020 2:56:17 PM ******/
CREATE TYPE [dbo].[Opsdb_CILTasks_Rawdata_Type] AS TABLE(
	[DataServerName] [varchar](100) NULL,
	[Deptid] [int] NOT NULL,
	[DeptDesc] [nvarchar](150) NOT NULL,
	[PLId] [int] NOT NULL,
	[PLDesc] [nvarchar](255) NOT NULL,
	[PLDescGlobal] [varchar](50) NULL,
	[PUId] [int] NOT NULL,
	[PUDesc] [nvarchar](200) NOT NULL,
	[PUDescGlobal] [varchar](50) NULL,
	[PUGDesc] [nvarchar](200) NULL,
	[MasterUnit] [int] NULL,
	[MasterUnitDesc] [nvarchar](200) NULL,
	[MasterUnitDescGlobal] [varchar](50) NULL,
	[VarId] [int] NOT NULL,
	[VarDesc] [nvarchar](255) NULL,
	[VarDescGlobal] [nvarchar](255) NULL,
	[DataType] [nchar](100) NULL,
	[ProdId] [int] NULL,
	[ProdCode] [varchar](25) NULL,
	[ProdDesc] [nvarchar](255) NULL,
	[ProdDescGlobal] [varchar](50) NULL,
	[ProcessOrder] [nvarchar](50) NULL,
	[ProductGrpDesc] [nvarchar](255) NULL,
	[ProductGrpDescGlobal] [varchar](50) NULL,
	[LineStatus] [nvarchar](50) NULL,
	[Result] [varchar](25) NULL,
	[UserDesc] [nvarchar](255) NULL,
	[TeamDesc] [nvarchar](255) NULL,
	[RouteDesc] [nvarchar](150) NULL,
	[Frequency] [nvarchar](200) NULL,
	[ProdDay] [varchar](10) NULL,
	[EntryOn] [datetime] NOT NULL,
	[ResultOn] [datetime] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[SamplesTaken] [int] NULL,
	[OnTime] [int] NULL,
	[DoneLate] [int] NULL,
	[DefectsFound] [int] NULL,
	[OpenedDefects] [int] NULL,
	[Canceled] [bit] NULL,
	[UDEDesc] [nvarchar](50) NULL,
	[SheetDesc] [nvarchar](50) NULL,
	[Site] [nvarchar](200) NOT NULL,
	[StubberUser] [bit] NULL,
	[RcdIdx] [bigint] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[RcdIdx] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO


select * from [dbo].[Transfer_Parameter_Data]

update