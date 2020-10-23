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
				AND specific_name = 'splocal_OpsProductionCvtgRawData'
				AND Routine_Type = 'PROCEDURE')

BEGIN
	DROP PROCEDURE [dbo].[splocal_OpsProductionCvtgRawData]
END
GO

------------------------------------------------------------------------------------------------------------------------
-- 												OPS Database Script													--
--				This Script will create the splocal_OpsProductionCvtgRawData stored procedure in OpsDataStore			--
--										SPROC to get Row Data from Production Cvtg.										--
------------------------------------------------------------------------------------------------------------------------
-- 												SET TAB SPACING TO 4												--
------------------------------------------------------------------------------------------------------------------------
--  1.0			2020-10-07		Carreno Maximiliano			created
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[splocal_OpsProductionCvtgRawData]
--DECLARE
		@StartTime			DATETIME,
		@EndTime			DATETIME,
		@Site				NVARCHAR(MAX),
		@Lines				NVARCHAR(MAX),
		@Units				NVARCHAR(MAX),
		@pagenum			INT,
		@pagesize			INT,
		@Order		NVARCHAR(MAX),
		@Columns		NVARCHAR(MAX)

--------------------------------------------------------------------------------------------------
WITH ENCRYPTION
AS
-------------------------------------------------------------------------------------------------
--SELECT
--	@StartTime		= '2020-10-01',
--	@EndTime		= '2020-10-10',
--	@Site			= 1,
--	@Lines			= 118,
--	@Units			= NULL,
--	@Order	= NUll

-------------------------------------------------------------------------------------------------
DECLARE	@strQuery		NVARCHAR(MAX),
		@is_id_site		BIT,
		@is_id_line		BIT,
		@is_id_unit		BIT

select
	@Units				= NULLIF(@Units, ''),
	@pagenum			= ISNULL(NULLIF(@pagenum, ''), 0),
	@pagesize			= ISNULL(NULLIF(@pagesize, ''), 0),
	@Order				= ISNULL(@Order, ''),
	@Columns			= ISNULL(NULLIF(@Columns, ''), '*')
--------------------------------------------------------------------------------------------------
--	Add replace of | per each order field
-------------------------------------------------------------------------------------------------
IF LEN(@Order) > 0
BEGIN
	SET @Order = REPLACE ( @Order, '|', ' ' )
END
--------------------------------------------------------------------------------------------------
--	Init local variables
-------------------------------------------------------------------------------------------------
SELECT @is_id_site = ISNUMERIC(@Site)

SELECT TOP 1 @is_id_line = ISNUMERIC(String)
	FROM [dbo].[fnLocal_Split](@Lines,',')
SELECT TOP 1 @is_id_unit = ISNUMERIC(String)
	FROM [dbo].[fnLocal_Split](@Units,',')

IF @is_id_site = 0
	SELECT @Site = ISNULL((SELECT SiteId
					FROM dbo.SITE_DIMENSION
					WHERE SiteDesc = @Site), 0)

SELECT @Lines = sTUFF((
						SELECT DISTINCT ',''' + CONVERT(VARCHAR,CentralLineId) + ''''
						FROM dbo.Line_Dimension
						WHERE
							CASE WHEN @is_id_line = 0 THEN LineDesc ELSE CONVERT(VARCHAR,PLId) END IN (
								SELECT String FROM [dbo].[fnLocal_Split](@Lines,',')
						) FOR XML PATH ('')), 1, 1, '')

IF @is_id_unit = 0
	SELECT @Units = sTUFF((
						SELECT DISTINCT ',''' + CONVERT(VARCHAR,PUId) + ''''
						FROM dbo.WorkCell_Dimension
						WHERE PUDesc IN (
								SELECT String FROM [dbo].[fnLocal_Split](@Units,',')
						) FOR XML PATH ('')), 1, 1, '')

--------------------------------------------------------------------------------------------------
--	Retrieve raw data
-------------------------------------------------------------------------------------------------

	Set @strQuery = N'
		SELECT '+ @Columns +' FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY '+ CASE -- ORDERING
														WHEN @Order <> ''
															THEN @Order
															ELSE 'StartTime'
													END
			+') AS RowNum, opsPD.*
			FROM [dbo].[OpsDB_Production_Data_Cvtg] opsPD WITH(NOLOCK) ' +
			'WHERE DeleteFlag = 0 AND StartTime >= '''+ CONVERT(VARCHAR,@StartTime) +''' AND EndTime <= '''+ CONVERT(VARCHAR,@EndTime) +''''
			+ ' AND opsPD.SITE_DIMENSION_SiteId = ' + @Site
			+ ISNULL(' AND opsPD.LINE_DIMENSION_CentralLineId in ('+ @Lines +')', '')
			+ ISNULL(CASE WHEN @is_id_unit = 1 AND @Units IS NOT NULL AND @Units <> '' THEN ' AND opsPD.PUID in ('+ @Units +')' ELSE ' AND ( opsPD.PUDesc in ('+ @Units +') )' END, '')
		+ ') s ' + CASE -- PAGINATION
						WHEN @pagenum <> 0 AND @pagesize <> 0
							THEN ' WHERE s.rownum BETWEEN ('+ CONVERT(VARCHAR,@pagenum) +' - 1) * '+ CONVERT(VARCHAR,@pagesize) +' + 1 AND '+ CONVERT(VARCHAR,@pagenum) +' * '+ CONVERT(VARCHAR,@pagesize)
							ELSE ''
					END
		+ ' ORDER BY RowNum;'

EXEC sp_executesql @strQuery

GO

GRANT EXECUTE ON OBJECT ::[dbo].[splocal_OpsProductionCvtgRawData] TO [LocalUser]
GO
