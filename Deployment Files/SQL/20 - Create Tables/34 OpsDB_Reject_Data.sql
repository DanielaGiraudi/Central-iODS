SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpsDB_Reject_Data]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OpsDB_Reject_Data] (
	[CentralRcdIdx] bigint IDENTITY(1, 1) NOT NULL,
	[Timestamp] datetime NULL,
	[TimestampUTC] datetime NULL,
	[Amount] float NULL,
	[Units] varchar(30) NULL,
	[Type] varchar(30) NULL,
	[Fault] varchar(100) NULL,
	[FaultGlobal] varchar(100) NULL,
	[FaultCode] varchar(100) NULL,
	[Reason1] varchar(100) NULL,
	[Reason1Global] varchar(100) NULL,
	[ReasonCode] varchar(30) NULL,
	[Location] varchar(75) NULL,
	[LocationGlobal] varchar(100) NULL,
	[ProdId] int NOT NULL,
	[ProdCode] varchar(25) NOT NULL,
	[ProdDesc] nvarchar(255) NULL,
	[ProdDescGlobal] varchar(50) NULL,
	[ProdFam] nvarchar(100) NULL,
	[ProdGroup] nvarchar(100) NULL,
	[ProdGroupGlobal] varchar(50) NULL,
	[ProcessOrder] nvarchar(50) NULL,
	[TeamDesc] varchar(25) NULL,
	[ShiftDesc] varchar(25) NULL,
	[Comments] varchar(255) NULL,
	[PLDesc] varchar(75) NULL,
	[PLDescGlobal] varchar(50) NULL,
	[PUID] int NULL,
	[SourcePUId] int NULL,
	[PUDesc] varchar(200) NULL,
	[PUDescGlobal] varchar(50) NULL,
	[PLId] int NULL,
	[ManualWaste] int NULL,
	[TransferFlag] int NULL,
	[WedId] int NULL,
	[Site] varchar(50) NULL,
	[ZoneDesc] nvarchar(255) NULL,
	[ZoneGrpDesc] nvarchar(255) NULL,
	[SITE_DIMENSION_SiteId] int NOT NULL,
	[LINE_DIMENSION_CentralLineId] int NOT NULL,
	[RcdIdx] bigint NOT NULL,
CONSTRAINT [FK_OpsDB_Reject_Data_LINE_DIMENSION]
	FOREIGN KEY ([LINE_DIMENSION_CentralLineId])
	REFERENCES [dbo].[LINE_DIMENSION] ([CentralLineId]),
CONSTRAINT [FK_OpsDB_Reject_Data_SITE_DIMENSION]
	FOREIGN KEY ([SITE_DIMENSION_SiteId])
	REFERENCES [dbo].[SITE_DIMENSION] ([SiteId]),
CONSTRAINT [PK_OpsDB_Reject_Data]
	PRIMARY KEY NONCLUSTERED ([CentralRcdIdx] ASC))
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OpsDB_Reject_Data]') AND name = N'IDX_UQ_OpsDB_Reject_Data_SiteId_RcdIdx')
	CREATE UNIQUE NONCLUSTERED INDEX [IDX_UQ_OpsDB_Reject_Data_SiteId_RcdIdx] ON [dbo].[OpsDB_Reject_Data]
		([SITE_DIMENSION_SiteId] , [RcdIdx])
GO
