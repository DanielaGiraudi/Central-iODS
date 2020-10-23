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
		wd.CentralWorkcellId AS WORKCELL_DIMENSION_CentralWorkCellId,
		@SiteId AS SITE_DIMENSION_SiteId
		FROM  @LastShiftDimension lsd 
		JOIN dbo.WORKCELL_DIMENSION wd ON lsd.WORKCELL_DIMENSION_CentralWorkCellId = wd.WorkcellId AND wd.SITE_DIMENSION_SiteId = @SiteId
		JOIN dbo.LINE_DIMENSION ld ON lsd.LINE_DIMENSION_CentralLineId = ld.LineId AND ld.CentralLineId = wd.LINE_DIMENSION_CentralLineId
		WHERE NOT EXISTS (  SELECT * 
							FROM dbo.LastShift_Dimension u 
							WHERE
							u.[LINE_DIMENSION_CentralLineId]				= wd.LINE_DIMENSION_CentralLineId AND 
							u.[WORKCELL_DIMENSION_CentralWorkCellId]		= wd.[CentralWorkCellId] AND 
							u.SITE_DIMENSION_SiteId = @SiteId
							) 




Update T SET
	t.[Starttime] 		=		s.[Starttime],
	t.[Endtime] 		=		s.[Endtime],
	t.[PLdesc] 			=		s.[PLdesc],
	t.[PUDesc] 			=		s.[PUDesc],
	t.[Dateid] 			=		s.[Dateid],
	t.[Datedesc] 		=		s.[Datedesc],
	t.[LastDate] 		=		s.[LastDate]
from dbo.LastShift_Dimension T 
JOIN (
                SELECT                              
					lsd.[Starttime],
					lsd.[Endtime],
					lsd.[PLdesc],
					lsd.[PUDesc],
					lsd.[Dateid],
					lsd.[Datedesc],
					lsd.[LastDate],
					wd.LINE_DIMENSION_CentralLineId,
					wd.CentralWorkcellId AS WORKCELL_DIMENSION_CentralWorkCellId,
					@SiteId AS SITE_DIMENSION_SiteId
                FROM @LastShiftDimension lsd
				JOIN dbo.WORKCELL_DIMENSION wd ON lsd.WORKCELL_DIMENSION_CentralWorkCellId = wd.WorkcellId AND wd.SITE_DIMENSION_SiteId = @SiteId
				JOIN dbo.LINE_DIMENSION ld ON lsd.LINE_DIMENSION_CentralLineId = ld.LineId AND ld.CentralLineId = wd.LINE_DIMENSION_CentralLineId
) S ON (
			T.[SITE_DIMENSION_SiteId]						= s.[SITE_DIMENSION_SiteId]							AND
			T.[WORKCELL_DIMENSION_CentralWorkCellId]		= s.[WORKCELL_DIMENSION_CentralWorkCellId]			AND
			T.[LINE_DIMENSION_CentralLineId]				= S.[LINE_DIMENSION_CentralLineId]
	    )


RETURN
;
GO

GRANT EXEC ON TYPE::[dbo].[LastShift_Dimension_Type]  TO [LocalUser]
GO

GRANT EXECUTE ON OBJECT ::[dbo].splocal_InsertLastShiftDimension  TO [LocalUser]
GO