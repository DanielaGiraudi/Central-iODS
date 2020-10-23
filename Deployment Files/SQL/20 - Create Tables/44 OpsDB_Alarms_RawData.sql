SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpsDB_Alarms_RawData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OpsDB_Alarms_RawData] (
	[CentralRcdIdx] bigint IDENTITY(1, 1) NOT NULL,
	[PLDesc] nvarchar(200) NOT NULL,
	[PLDescGlobal] varchar(50) NULL,
	[PUDesc] nvarchar(200) NOT NULL,
	[PUDescGlobal] varchar(50) NULL,
	[MasterPUDesc] nvarchar(200) NOT NULL,
	[MasterPUDescGlobal] varchar(50) NULL,
	[VarId] int NOT NULL,
	[VarDesc] nvarchar(255) NOT NULL,
	[AlarmDesc] nvarchar(500) NOT NULL,
	[AlarmTemplate] nvarchar(500) NULL,
	[StartTime] datetime NOT NULL,
	[EndTime] datetime NULL,
	[MaxValue] nvarchar(25) NULL,
	[MinValue] nvarchar(25) NULL,
	[CommentId] int NULL,
	[CommentModifOn] datetime NULL,
	[StartValue] nvarchar(25) NOT NULL,
	[EndValue] nvarchar(25) NULL,
	[ModifiedOn] datetime NOT NULL,
	[UserName] nvarchar(200) NOT NULL,
	[EventTypeDesc] nvarchar(200) NOT NULL,
	[EventSubTypeDesc] nvarchar(200) NULL,
	[ProcessOrder] nvarchar(50) NULL,
	[ProdCode] varchar(25) NOT NULL,
	[ProdDesc] nvarchar(255) NOT NULL,
	[ProdDescGlobal] varchar(50) NULL,
	[LReject] nvarchar(25) NULL,
	[Target] nvarchar(25) NULL,
	[UReject] nvarchar(25) NULL,
	[AlarmId] int NOT NULL,
	[DeleteFlag] bit NOT NULL DEFAULT ((0)),
	[PUGDesc] nvarchar(200) NOT NULL,
	[CauseCommentText] nvarchar(MAX) NULL,
	[ActionCommentText] nvarchar(MAX) NULL,
	[CauseCommentId] int NULL,
	[CauseCommentModifOn] datetime NULL,
	[CauseComment_Rtf] text NULL,
	[ActionCommentId] int NULL,
	[ActionCommentModifOn] datetime NULL,
	[ActionComment_Rtf] text NULL,
	[Action1] nvarchar(100) NULL,
	[Action2] nvarchar(100) NULL,
	[Action3] nvarchar(100) NULL,
	[Cause1] nvarchar(100) NULL,
	[Cause2] nvarchar(100) NULL,
	[Cause3] nvarchar(100) NULL,
	[SourceVarId] int NULL,
	[SITE_DIMENSION_SiteId] int NOT NULL,
	[LINE_DIMENSION_CentralLineId] int NOT NULL,
	[RcdIdx] bigint NOT NULL,
CONSTRAINT [FK_OpsDB_Alarms_RawData_LINE_DIMENSION]
	FOREIGN KEY ([LINE_DIMENSION_CentralLineId])
	REFERENCES [dbo].[LINE_DIMENSION] ([CentralLineId]),
CONSTRAINT [FK_OpsDB_Alarms_RawData_SITE_DIMENSION]
	FOREIGN KEY ([SITE_DIMENSION_SiteId])
	REFERENCES [dbo].[SITE_DIMENSION] ([SiteId]),
CONSTRAINT [PK_OpsDB_Alarms_RawData]
	PRIMARY KEY NONCLUSTERED ([CentralRcdIdx]))
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OpsDB_Alarms_RawData]') AND name = N'IDX_UQ_OpsDB_Alarms_RawData_SiteId_RcdIdx')
	CREATE UNIQUE NONCLUSTERED INDEX [IDX_UQ_OpsDB_Alarms_RawData_SiteId_RcdIdx] ON [dbo].[OpsDB_Alarms_RawData]
		([SITE_DIMENSION_SiteId], [RcdIdx])
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OpsDB_Alarms_RawData]') AND name = N'IDX_UQ_OpsDB_Alarms_SiteId_RcdIdx')
	CREATE UNIQUE NONCLUSTERED INDEX [IDX_UQ_OpsDB_Alarms_SiteId_RcdIdx] ON [dbo].[OpsDB_Alarms_RawData]
		([SITE_DIMENSION_SiteId], [RcdIdx])
GO
