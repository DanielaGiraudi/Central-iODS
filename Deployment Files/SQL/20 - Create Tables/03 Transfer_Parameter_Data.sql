SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Transfer_Parameter_Data]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Transfer_Parameter_Data] (
	[SiteId] int NULL,
	[TableName] varchar(255) NULL,
	[Order] int NULL,
	[LastModifytime] datetime NULL,
	[DelimiterColumn] varchar(50) NULL,
	[SPROCMergeData] varchar(50) NULL,
	[ColumnsNoTransfered] varchar(200) NULL,
	[TableTypeName] varchar(50) NULL,
	[TableTypeParameterName] varchar(50) NULL,
	[ColumnsRenamed] varchar(200) NULL,
	[IsActive] bit NULL DEFAULT ((1)))
END
GO
