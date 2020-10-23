
GO

DROP TYPE [dbo].[UDP_Dimension_Type]
--GO

/****** Object:  UserDefinedTableType [dbo].[UDP_Dimension_Type]    Script Date: 9/1/2020 2:56:17 PM ******/
CREATE TYPE [dbo].[UDP_Dimension_Type] AS TABLE(
	[DataServerName] [varchar](100) NULL,
	[TableId] [int] NOT NULL,
	[TableName] [varchar](200) NOT NULL,
	[UDPName] [varchar](500) NOT NULL,
	[DataType] [varchar](50) NOT NULL,
	[UDPIdx] [bigint] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[UDPIdx] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO