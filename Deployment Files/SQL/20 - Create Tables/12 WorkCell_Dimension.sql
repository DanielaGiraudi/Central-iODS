SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkCell_Dimension]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkCell_Dimension] (
	[PUDesc] nvarchar(50) NOT NULL,
	[PUDescGlobal] varchar(50) NULL,
	[PUId] int NOT NULL,
	[CentralWorkcellId] int IDENTITY(0, 1) NOT NULL,
	[PLId] int NULL,
	[VSId] int NULL,
	[Class] int NULL,
	[IsActiveDowntime] int NOT NULL DEFAULT ((1)),
	[Equipment_Type] nvarchar(50) NULL,
	[Extended_Info] varchar(255) NULL,
	[SITE_DIMENSION_SiteId] int NOT NULL,
	[LINE_DIMENSION_CentralLineId] int NOT NULL,
	[WorkCellId] int NULL,
CONSTRAINT [FK_WorkCell_Dimension_LINE_DIMENSION]
	FOREIGN KEY ([LINE_DIMENSION_CentralLineId])
	REFERENCES [dbo].[LINE_DIMENSION] ([CentralLineId]),
CONSTRAINT [FK_WorkCell_Dimension_SITE_DIMENSION]
	FOREIGN KEY ([SITE_DIMENSION_SiteId])
	REFERENCES [dbo].[SITE_DIMENSION] ([SiteId]),
CONSTRAINT [PK_WorkCell_Dimension]
	PRIMARY KEY NONCLUSTERED ([CentralWorkcellId] ASC))
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[WorkCell_Dimension]') AND name = N'IDX_UQ_WORKCELL_DIMENSION_SiteId_WorkcellId')
	CREATE UNIQUE NONCLUSTERED INDEX [IDX_UQ_WORKCELL_DIMENSION_SiteId_WorkcellId] ON [dbo].[WorkCell_Dimension]
		([SITE_DIMENSION_SiteId] , [WorkCellId])
GO
