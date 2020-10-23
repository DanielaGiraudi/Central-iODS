
GO

DROP TYPE [dbo].[WorkCell_Dimension_Type]
GO

/****** Object:  UserDefinedTableType [dbo].[WorkCell_Dimension_Type]    Script Date: 9/1/2020 2:56:17 PM ******/
CREATE TYPE [dbo].[WorkCell_Dimension_Type] AS TABLE(
	[DataServerName] [varchar](100) NULL,
	[PUDesc] [nvarchar](50) NOT NULL,
	[PUDescGlobal] [varchar](50) NULL,
	[PUId] [int] NOT NULL,
	[WorkCellId] [int] NOT NULL,
	[PLId] [int] NULL,
	[VSId] [int] NULL,
	[Class] [int] NULL,
	[IsActiveDowntime] [int] NOT NULL,
	[Equipment_Type] [nvarchar](50) NULL,
	[Extended_Info] [varchar](255) NULL,
	PRIMARY KEY CLUSTERED 
(
	[WorkCellId] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO

