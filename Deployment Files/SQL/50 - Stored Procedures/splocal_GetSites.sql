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
				AND specific_name = 'splocal_GetSites' 
				AND Routine_Type = 'PROCEDURE')

BEGIN
	DROP PROCEDURE [dbo].[splocal_GetSites]
END
GO

------------------------------------------------------------------------------------------------------------------------
-- 												OPS Database Script													--	
--				This Script will create the splocal_GetSites stored procedure in OpsDataStore			--
--										SPROC to get the Sites.										--
------------------------------------------------------------------------------------------------------------------------
-- 												SET TAB SPACING TO 4												--	
------------------------------------------------------------------------------------------------------------------------
--  1.0			2020-10-07		Carreno Maximiliano			created
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[splocal_GetSites]  

--------------------------------------------------------------------------------------------------	
WITH ENCRYPTION 
AS	

	SELECT * FROM dbo.[SITE_DIMENSION] WITH (NOLOCK)

GO

GRANT EXECUTE ON OBJECT ::[dbo].[splocal_GetSites] TO [LocalUser];
GO