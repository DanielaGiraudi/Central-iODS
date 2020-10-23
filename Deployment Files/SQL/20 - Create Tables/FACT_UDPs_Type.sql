
GO

DROP TYPE [dbo].[FACT_UDPs_Type]
GO

/****** Object:  UserDefinedTableType [dbo].[FACT_UDPs_Type]    Script Date: 9/1/2020 2:56:17 PM ******/
CREATE TYPE [dbo].[FACT_UDPs_Type] AS TABLE(
	[DataServerName] [varchar](100) NULL,
	[VarId] [int] NOT NULL,
	[VarDesc] [nvarchar](255) NOT NULL,
	[Value] [varchar](200) NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NULL,
	[UDP_Dimension_UDPIdx] [bigint] NOT NULL,
	[History_id] [bigint] NULL,
	[Idx] [bigint] NOT NULL,
	PRIMARY KEY CLUSTERED
(
	[Idx] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
