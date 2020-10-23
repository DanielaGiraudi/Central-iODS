SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpsDB_VariablesTasks_RawData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OpsDB_VariablesTasks_RawData] (
	[CentralRcdIdx] bigint IDENTITY(1, 1) NOT NULL,
	[VarId] int NOT NULL,
	[PLId] int NOT NULL,
	[PLDesc] varchar(50) NOT NULL,
	[PLDescGlobal] varchar(50) NULL,
	[PUId] int NOT NULL,
	[PUDesc] varchar(50) NOT NULL,
	[PUDescGlobal] varchar(50) NULL,
	[PUGDesc] varchar(50) NULL,
	[VarDesc] varchar(50) NULL,
	[VarDescGlobal] varchar(50) NULL,
	[ProdId] int NULL,
	[Frequency] varchar(200) NULL,
	[ProdCode] varchar(25) NULL,
	[ProdDesc] varchar(50) NULL,
	[ProdDescGlobal] varchar(50) NULL,
	[ProcessOrder] varchar(50) NULL,
	[Result] varchar(25) NULL,
	[LReject] varchar(25) NULL,
	[UReject] varchar(25) NULL,
	[LWarning] varchar(25) NULL,
	[UWarning] varchar(25) NULL,
	[LUser] varchar(25) NULL,
	[UUser] varchar(25) NULL,
	[Target] varchar(25) NULL,
	[LControl] varchar(25) NULL,
	[UControl] varchar(25) NULL,
	[EffectiveDate] datetime NULL,
	[Defect] int NULL,
	[Deptid] int NOT NULL,
	[DeptDesc] varchar(50) NOT NULL,
	[MasterUnit] int NULL,
	[MasterUnitDesc] varchar(50) NULL,
	[MasterUnitDescGlobal] varchar(50) NULL,
	[UserDesc] varchar(255) NULL,
	[TeamDesc] varchar(150) NULL,
	[ShiftDesc] varchar(10) NULL,
	[RouteDesc] varchar(150) NULL,
	[ProductGrpDesc] varchar(50) NULL,
	[ProductGrpDescGlobal] varchar(50) NULL,
	[LineStatus] varchar(50) NULL,
	[DataType] varchar(50) NULL,
	[ProdDay] varchar(10) NULL,
	[EntryOn] datetime NOT NULL,
	[ResultOn] datetime NOT NULL,
	[ModifiedOn] datetime NOT NULL,
	[NextStartDate] datetime NULL,
	[SamplesTaken] int NULL,
	[OnTime] int NULL,
	[DoneLate] int NULL,
	[Canceled] bit NULL,
	[UDEDesc] varchar(50) NULL,
	[SheetDesc] varchar(1000) NULL,
	[Site] varchar(200) NOT NULL,
	[StubberUser] bit NULL,
	[FACT_UDPs_Idx] bigint NULL,
	[ZoneDesc] varchar(50) NULL,
	[ZoneGrpDesc] varchar(50) NULL,
	[CommentText] nvarchar(MAX) NULL,
	[CommentId] int NULL,
	[CommentModifOn] datetime NULL,
	[Comment_Rtf] text NULL,
	[SITE_DIMENSION_SiteId] int NOT NULL,
	[LINE_DIMENSION_CentralLineId] int NOT NULL,
	[RcdIdx] bigint NOT NULL,
CONSTRAINT [FK_OpsDB_VariablesTasks_RawData_FACT_UDPs]
	FOREIGN KEY ([FACT_UDPs_Idx])
	REFERENCES [dbo].[FACT_UDPs] ([CentralIdx]),
CONSTRAINT [FK_OpsDB_VariablesTasks_RawData_LINE_DIMENSION]
	FOREIGN KEY ([LINE_DIMENSION_CentralLineId])
	REFERENCES [dbo].[LINE_DIMENSION] ([CentralLineId]),
CONSTRAINT [FK_OpsDB_VariablesTasks_RawData_SITE_DIMENSION]
	FOREIGN KEY ([SITE_DIMENSION_SiteId])
	REFERENCES [dbo].[SITE_DIMENSION] ([SiteId]),
CONSTRAINT [PK_OpsDB_VariablesTasks_RawData]
	PRIMARY KEY NONCLUSTERED ([CentralRcdIdx]))
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OpsDB_VariablesTasks_RawData]') AND name = N'IDX_UQ_OpsDB_VariablesTasks_RawData_SiteId_RcdIdx')
	CREATE UNIQUE NONCLUSTERED INDEX [IDX_UQ_OpsDB_VariablesTasks_RawData_SiteId_RcdIdx] ON [dbo].[OpsDB_VariablesTasks_RawData]
		([SITE_DIMENSION_SiteId], [RcdIdx])
END
