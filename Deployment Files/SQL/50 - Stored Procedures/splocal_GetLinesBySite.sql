USE [MIP_DEV]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------------------------------------------------------------------------------------------------
-- DROP StoredProcedure
----------------------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT 1 FROM Information_schema.Routines 
				WHERE Specific_schema = 'dbo' 
				AND specific_name = 'splocal_GetLinesBySite' 
				AND Routine_Type = 'PROCEDURE')

BEGIN
	DROP PROCEDURE [dbo].[splocal_GetLinesBySite]
END
GO

------------------------------------------------------------------------------------------------------------------------
-- 												OPS Database Script													--	
--				This Script will create the splocal_GetLinesBySite stored procedure in OpsDataStore			--
--										SPROC to get Lines by Site.										--
------------------------------------------------------------------------------------------------------------------------
-- 												SET TAB SPACING TO 4												--	
------------------------------------------------------------------------------------------------------------------------
--  1.0			2020-10-07		Carreno Maximiliano			created
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[splocal_GetLinesBySite]  
--DECLARE
		@Site				NVARCHAR(MAX)
--------------------------------------------------------------------------------------------------	
WITH ENCRYPTION 
AS	
-------------------------------------------------------------------------------------------------
--SET @Site = 'Albany'

-------------------------------------------------------------------------------------------------
DECLARE	@strQuery		NVARCHAR(MAX),
		@is_id_site		BIT

--------------------------------------------------------------------------------------------------
--	Init local variables
-------------------------------------------------------------------------------------------------
SELECT @is_id_site = ISNUMERIC(@Site) 

IF @is_id_site = 0
	SELECT @Site = ISNULL((SELECT SiteId
					FROM dbo.SITE_DIMENSION
					WHERE SiteDesc = @Site), 0)

--------------------------------------------------------------------------------------------------
--	Retrieve raw data
-------------------------------------------------------------------------------------------------

	Set @strQuery = N'
		SELECT *
		FROM [dbo].[LINE_DIMENSION] ld WITH(NOLOCK)
		WHERE ld.SITE_DIMENSION_SiteId = ''' + @Site + ''''

	EXEC sp_executesql @strQuery;

GO

GRANT EXECUTE ON OBJECT ::[dbo].[splocal_GetLinesBySite] TO [LocalUser];
GO