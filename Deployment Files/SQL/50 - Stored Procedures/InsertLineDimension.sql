--DROP PROCEDURE splocal_InsertLineDimension
--GO

CREATE PROCEDURE splocal_InsertLineDimension
  @LineDimension [dbo].[LINE_DIMENSION_Type] READONLY
AS
	DECLARE @SiteId INTEGER

	SELECT TOP 1 @SiteId = sd.SiteId
	FROM @LineDimension ld
	JOIN SITE_DIMENSION sd ON ld.DataServerName = sd.DataServerName

	INSERT INTO dbo.LINE_DIMENSION (
		[LineId],
		[LineDesc],
		[LineDescGlobal],
		[BUDesc],
		[PlatformDesc],
		[InitiativeDesc],
		[DeptId],
		[DeptDesc],
		[ShiftStartTime],
		[WeekStartTime],
		[StartOfProd],
		[StartOfConst],
		[StartOfWeek],
		[StartOfQtr],
		[PLId],
		[ConfigType],
		[Category],
		[IsActive],
		[SITE_DIMENSION_SiteId]
	)
	SELECT
		ld.[LineId],
		ld.[LineDesc],
		ld.[LineDescGlobal],
		ld.[BUDesc],
		ld.[PlatformDesc],
		ld.[InitiativeDesc],
		ld.[DeptId],
		ld.[DeptDesc],
		ld.[ShiftStartTime],
		ld.[WeekStartTime],
		ld.[StartOfProd],
		ld.[StartOfConst],
		ld.[StartOfWeek],
		ld.[StartOfQtr],
		ld.[PLId],
		ld.[ConfigType],
		ld.[Category],
		ld.[IsActive],
		@SiteId AS SITE_DIMENSION_SiteId
	FROM  @LineDimension ld
	WHERE NOT EXISTS (  SELECT *
						FROM dbo.LINE_DIMENSION u
						WHERE
						u.[PLId]					= ld.[PLId] AND
						u.SITE_DIMENSION_SiteId = @SiteId
						)

Update T SET
	T.[LineId]			   = S.[LineId],
	T.[LineDesc]			 = S.[LineDesc],
	T.[LineDescGlobal]	   = S.[LineDescGlobal],
	T.[BUDesc]			   = S.[BUDesc],
	T.[PlatformDesc]		 = S.[PlatformDesc],
	T.[InitiativeDesc]	   = S.[InitiativeDesc],
	T.[DeptId]			   = S.[DeptId],
	T.[DeptDesc]			 = S.[DeptDesc],
	T.[ShiftStartTime]	   = S.[ShiftStartTime],
	T.[WeekStartTime]		= S.[WeekStartTime],
	T.[StartOfProd]		  = S.[StartOfProd],
	T.[StartOfConst]		 = S.[StartOfConst],
	T.[StartOfWeek]		  = S.[StartOfWeek],
	T.[StartOfQtr]		   = S.[StartOfQtr],
	T.[PLId]				 = S.[PLId],
	T.[ConfigType]		   = S.[ConfigType],
	T.[Category]			 = S.[Category],
	T.[IsActive]			 = S.[IsActive]
from dbo.LINE_DIMENSION T
JOIN (
				SELECT
					ld.[LineId],
					ld.[LineDesc],
					ld.[LineDescGlobal],
					ld.[BUDesc],
					ld.[PlatformDesc],
					ld.[InitiativeDesc],
					ld.[DeptId],
					ld.[DeptDesc],
					ld.[ShiftStartTime],
					ld.[WeekStartTime],
					ld.[StartOfProd],
					ld.[StartOfConst],
					ld.[StartOfWeek],
					ld.[StartOfQtr],
					ld.[PLId],
					ld.[ConfigType],
					ld.[Category],
					ld.[IsActive],
					@SiteId AS SITE_DIMENSION_SiteId
				FROM @LineDimension ld
) S ON (
			T.SITE_DIMENSION_SiteId			= s.SITE_DIMENSION_SiteId AND
			T.PLId							= s.PLId
		)

RETURN
GO

GRANT EXEC ON TYPE::[dbo].[LINE_DIMENSION_Type]  TO [LocalUser]
GO

GRANT EXECUTE ON OBJECT ::[dbo].splocal_InsertLineDimension  TO [LocalUser]
GO
