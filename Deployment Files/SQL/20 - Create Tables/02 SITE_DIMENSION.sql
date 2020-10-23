SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SITE_DIMENSION]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SITE_DIMENSION] (
	[SiteId] int IDENTITY(1, 1) NOT NULL,
	[SiteDesc] nvarchar(50) NULL,
	[RegionDesc] nvarchar(25) NULL,
	[DataServerName] nvarchar(200) NULL,
	[RptServerName] nvarchar(200) NULL,
	[AppServerName] nvarchar(200) NULL,
	[GBU] nvarchar(50) NULL,
	[TimeZone] nvarchar(255) NULL,
	[LDAPGroups] nvarchar(MAX) NULL,
	[IsActive] bit NOT NULL DEFAULT ((1)),
CONSTRAINT [PK_SITE_DIMENSION]
	PRIMARY KEY NONCLUSTERED ([SiteId] ASC))
END
GO
