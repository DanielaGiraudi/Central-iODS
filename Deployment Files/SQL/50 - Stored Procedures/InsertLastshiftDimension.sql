--DROP PROCEDURE splocal_InsertLastShiftDimension;
--GO

CREATE PROCEDURE splocal_InsertLastShiftDimension
  @LastShiftDimension [dbo].[LastShift_Dimension_Type] READONLY
AS
	DECLARE @SiteId INTEGER

	SELECT TOP 1 @SiteId = sd.SiteId 
	FROM @LastShiftDimension lsd
	JOIN SITE_DIMENSION sd ON lsd.DataServerName = sd.DataServerName
	
	INSERT INTO dbo.LastShift_Dimension (
		[Starttime],
		[Endtime],
		[PLdesc],
		[PUDesc],
		[Dateid],
		[Datedesc],
		[LastDate],
		[LINE_DIMENSION_CentralLineId],
		[WORKCELL_DIMENSION_CentralWorkCellId],
		[SITE_DIMENSION_SiteId]
	)	
	SELECT
		lsd.[Starttime],
		lsd.[Endtime],
		lsd.[PLdesc],
		lsd.[PUDesc],
		lsd.[Dateid],
		lsd.[Datedesc],
		lsd.[LastDate],
		wd.LINE_DIMENSION_CentralLineId,
		wd.CentralWorkCellId AS WORKCELL_DIMENSION_CentralWorkCellId,
		@SiteId AS SITE_DIMENSION_SiteId
		FROM  @LastShiftDimension lsd 
			INNER JOIN dbo.WORKCELL_DIMENSION wd ON wd.WorkcellId = lsd.WORKCELL_DIMENSION_CentralWorkCellId AND wd.SITE_DIMENSION_SiteId = @SiteId
		WHERE NOT EXISTS
			(SELECT 1 FROM dbo.LastShift_Dimension u 
				WHERE	u.SITE_DIMENSION_SiteId = @SiteId AND 
						u.LINE_DIMENSION_CentralLineId = wd.LINE_DIMENSION_CentralLineId AND 
						u.WORKCELL_DIMENSION_CentralWorkCellId = wd.CentralWorkCellId)

	UPDATE T SET
		t.[Starttime] 	= s.[Starttime],
		t.[Endtime] 	= s.[Endtime],
		t.[PLdesc] 		= s.[PLdesc],
		t.[PUDesc] 		= s.[PUDesc],
		t.[Dateid] 		= s.[Dateid],
		t.[Datedesc] 	= s.[Datedesc],
		t.[LastDate] 	= s.[LastDate]
	FROM dbo.LastShift_Dimension T 
		INNER JOIN dbo.WORKCELL_DIMENSION wd ON	wd.CentralWorkcellId 	= T.WORKCELL_DIMENSION_CentralWorkCellId
		INNER JOIN dbo.LINE_DIMENSION ld ON		ld.CentralLineId 		= T.LINE_DIMENSION_CentralLineId
		INNER JOIN @LastShiftDimension lsd ON	lsd.WORKCELL_DIMENSION_CentralWorkCellId 	= wd.CentralWorkCellId AND
												lsd.LINE_DIMENSION_CentralLineId 			= ld.LineId
	WHERE T.SITE_DIMENSION_SiteId = @SiteId

RETURN
GO

GRANT EXEC ON TYPE::[dbo].[LastShift_Dimension_Type]  TO [LocalUser]
GO

GRANT EXECUTE ON OBJECT ::[dbo].splocal_InsertLastShiftDimension  TO [LocalUser]
GO