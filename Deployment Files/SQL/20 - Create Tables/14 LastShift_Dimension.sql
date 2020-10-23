SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LastShift_Dimension]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LastShift_Dimension] (
	[LINE_DIMENSION_CentralLineId] int NOT NULL,
	[WORKCELL_DIMENSION_CentralWorkCellId] int NOT NULL,
	[SITE_DIMENSION_SiteId] int NOT NULL,
	[Starttime] datetime NOT NULL,
	[Endtime] datetime NOT NULL,
	[PLdesc] nchar(50) NULL,
	[PUDesc] nchar(50) NULL,
	[Dateid] int NULL,
	[Datedesc] nchar(50) NULL,
	[LastDate] datetime NULL,
CONSTRAINT [FK_LastShift_Dimension_LINE_DIMENSION]
	FOREIGN KEY ([LINE_DIMENSION_CentralLineId])
	REFERENCES [dbo].[LINE_DIMENSION] ([CentralLineId]),
CONSTRAINT [FK_LastShift_Dimension_SITE_DIMENSION]
	FOREIGN KEY ([SITE_DIMENSION_SiteId])
	REFERENCES [dbo].[SITE_DIMENSION] ([SiteId]),
CONSTRAINT [FK_LastShift_Dimension_WorkCell_Dimension]
	FOREIGN KEY ([WORKCELL_DIMENSION_CentralWorkCellId])
	REFERENCES [dbo].[WorkCell_Dimension] ([CentralWorkcellId]),
CONSTRAINT [PK_LastShift_Dimension]
	PRIMARY KEY NONCLUSTERED ([SITE_DIMENSION_SiteId], [LINE_DIMENSION_CentralLineId], [WORKCELL_DIMENSION_CentralWorkCellId])
	WITH (FILLFACTOR = 90))
END
GO
