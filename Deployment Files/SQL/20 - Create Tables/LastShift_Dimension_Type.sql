
GO

DROP TYPE [dbo].[LastShift_Dimension_Type]
GO

/****** Object:  UserDefinedTableType [dbo].[WorkCell_Dimension_Type]    Script Date: 9/1/2020 2:56:17 PM ******/
CREATE TYPE [dbo].[LastShift_Dimension_Type] AS TABLE(
	[DataServerName] [varchar](100) NULL,
	[Starttime] [datetime] NOT NULL,
	[Endtime] [datetime] NOT NULL,
	[PLdesc] [nchar](50) NULL,
	[PUDesc] [nchar](50) NULL,
	[Dateid] [int] NULL,
	[LINE_DIMENSION_CentralLineId] [int],
	[WORKCELL_DIMENSION_CentralWorkCellId] [int],
	[Datedesc] [nchar](50) NULL,
	[LastDate] [datetime] NULL
	PRIMARY KEY CLUSTERED
(
	[LINE_DIMENSION_CentralLineId] ASC,
	[WORKCELL_DIMENSION_CentralWorkCellId] asc
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
