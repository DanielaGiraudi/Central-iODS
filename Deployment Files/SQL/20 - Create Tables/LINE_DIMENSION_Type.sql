
DROP TYPE [dbo].[LINE_DIMENSION_Type]
GO

CREATE TYPE [dbo].[LINE_DIMENSION_Type] AS TABLE(
	[DataServerName] [varchar](100) NULL,
	[LineId] [int] NOT NULL,
	[LineDesc] [nvarchar](50) NULL,
	[LineDescGlobal] [nvarchar](50) NULL,
	[BUDesc] [nvarchar](200) NULL,
	[PlatformDesc] [nvarchar](200) NULL,
	[InitiativeDesc] [nvarchar](15) NULL,
	[DeptId] [int] NULL,
	[DeptDesc] [nvarchar](50) NULL,
	[ShiftStartTime] [nvarchar](10) NULL,
	[WeekStartTime] [datetime] NULL,
	[StartOfProd] [datetime] NULL,
	[StartOfConst] [datetime] NULL,
	[StartOfWeek] [varchar](20) NULL,
	[StartOfQtr] [varchar](20) NULL,
	[PLId] [int] NULL,
	[ConfigType] [nvarchar](50) NULL,
	[Category] [varchar](250) NULL,
	[IsActive] [bit] NOT NULL,
	PRIMARY KEY CLUSTERED ([LineId]))
GO
