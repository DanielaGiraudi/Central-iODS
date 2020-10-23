DROP PROCEDURE splocal_InsertWorkCellDimension
GO

CREATE PROCEDURE splocal_InsertWorkCellDimension
  @WorkCellDimension [dbo].[WorkCell_Dimension_Type] READONLY
AS
	DECLARE @SiteId INTEGER

	SELECT TOP 1 @SiteId = sd.SiteId
	FROM @WorkCellDimension wd
	JOIN SITE_DIMENSION sd ON wd.DataServerName = sd.DataServerName

	INSERT INTO dbo.WorkCell_Dimension (
		[PUDesc],
		[PUDescGlobal],
		[PUId],
		[WorkCellId],
		[PLId],
		[VSId],
		[Class],
		[IsActiveDowntime],
		[Equipment_Type],
		[Extended_Info],
		[SITE_DIMENSION_SiteId],
		[LINE_DIMENSION_CentralLineId]
	)
	SELECT
		wd.[PUDesc],
		wd.[PUDescGlobal],
		wd.[PUId],
		wd.[WorkCellId],
		wd.[PLId],
		wd.[VSId],
		wd.[Class],
		wd.[IsActiveDowntime],
		wd.[Equipment_Type],
		wd.[Extended_Info],
		@SiteId AS SITE_DIMENSION_SiteId,
		ld.CentralLineId AS LINE_DIMENSION_CentralLineId
		FROM  @WorkCellDimension wd
		JOIN dbo.LINE_DIMENSION ld ON wd.PLID = ld.PLId AND ld.SITE_DIMENSION_SiteId = @SiteId
		WHERE NOT EXISTS (  SELECT *
							FROM dbo.WorkCell_Dimension u
							WHERE
							u.[WorkCellId]					= wd.[WorkCellId] AND
							u.SITE_DIMENSION_SiteId = @SiteId
							)

Update T SET
		t.[PUDesc]			= s.[PUDesc],
		t.[PUDescGlobal]	= s.[PUDescGlobal],
		t.[PUId]			= s.[PUId],
		t.[WorkCellId]		= s.[WorkCellId],
		t.[PLId]			= s.[PLId],
		t.[VSId]			= s.[VSId],
		t.[Class]			= s.[Class],
		t.[IsActiveDowntime]= s.[IsActiveDowntime],
		t.[Equipment_Type]	= s.[Equipment_Type],
		t.[Extended_Info]	= s.[Extended_Info]
from dbo.WorkCell_Dimension T
JOIN (
				SELECT
					wd.[PUDesc],
					wd.[PUDescGlobal],
					wd.[PUId],
					wd.[WorkCellId],
					wd.[PLId],
					wd.[VSId],
					wd.[Class],
					wd.[IsActiveDowntime],
					wd.[Equipment_Type],
					wd.[Extended_Info],
					@SiteId AS SITE_DIMENSION_SiteId,
					ld.CentralLineId AS LINE_DIMENSION_CentralLineId
				FROM @WorkCellDimension wd
				JOIN dbo.LINE_DIMENSION ld ON wd.PLID = ld.PLId AND ld.SITE_DIMENSION_SiteId = @SiteId
) S ON (
			T.SITE_DIMENSION_SiteId			= s.SITE_DIMENSION_SiteId	AND
			T.[WorkCellId]					= s.[WorkCellId]			AND
			T.LINE_DIMENSION_CentralLineId	= s.LINE_DIMENSION_CentralLineId
		)

RETURN
GO

GRANT EXEC ON TYPE::[dbo].[WorkCell_Dimension_Type]  TO [LocalUser]
GO

GRANT EXECUTE ON OBJECT ::[dbo].splocal_InsertWorkCellDimension  TO [LocalUser]
GO
