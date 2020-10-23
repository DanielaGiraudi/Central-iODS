--DROP PROCEDURE splocal_InsertProductionRawData;
--GO


CREATE PROCEDURE splocal_InsertProductionRawData
  @ProductionRawdata [dbo].[OpsDB_Production_Data_Type] READONLY
AS
	DECLARE @SiteId INTEGER

	SELECT TOP 1 @SiteId = sd.SiteId 
	FROM @ProductionRawdata p
	JOIN SITE_DIMENSION sd ON p.DataServerName = sd.DataServerName
	
	INSERT INTO [dbo].[OpsDB_Production_Data] (
		[StartTime]				,
		[EndTime]				,
		[POStatus]				,
		[EndTimeUTC]			,
		[StartTimeUTC]			,
		[LineGroup]				,
		[PLID]					,
		[PLDesc]				,
		[PLDescGlobal]			,
		[PUID]					,
		[PUDesc]				,
		[PUDescGlobal]			,
		[Site]					,
		[PPId]					,
		[EventId]				,
		[ProcessOrder]			,
		[ProdId]				,
		[ProdCode]				,
		[ProdDesc]				,
		[ProdFam]				,
		[ProdGroup]				,
		[ProdGroupGlobal]		,
		[ShiftDesc]				,
		[TeamDesc]				,
		[LineStatus]			,
		[TotalProduct]			,
		[GoodProduct]			,
		[TotalScrap]			,
		[ActualRate]			,
		[TargetRate]			,
		[IdealRate]				,
		[TotalCases]			,
		[RunningScrap]			,
		[StartingScrap]			,
		[FirstPackCount]		,
		[SecondPackCount]		,
		[ThirdPackCount]		,
		[FourthPackCount]		,
		[ProdPerStat]			,
		[StatFactor]			,
		[StatUnits]				,
		[ConvertedCases]		,
		[UnitOfMeasure]			,
		[Uptime]				,
		[DownTime]				,
		[ScheduledTime]			,
		[Stops]					,
		[BatchNumber]			,
		[CalcSpeed]				,
		[Ts]					,
		[TransferFlag]			,
		[DeleteFlag]			,
		[ZoneDesc]				,
		[ZoneGrpDesc]			,
		[ProdRecHash]			,
		[SITE_DIMENSION_SiteId]			,
		[LINE_DIMENSION_CentralLineId]	,
		[RcdIdx]
	)	
	SELECT
		p.[StartTime]				,
		p.[EndTime]					,
		p.[POStatus]				,
		p.[EndTimeUTC]				,
		p.[StartTimeUTC]			,
		p.[LineGroup]				,
		p.[PLID]					,
		p.[PLDesc]					,
		p.[PLDescGlobal]			,
		p.[PUID]					,
		p.[PUDesc]					,
		p.[PUDescGlobal]			,
		p.[Site]					,
		p.[PPId]					,
		p.[EventId]					,
		p.[ProcessOrder]			,
		p.[ProdId]					,
		p.[ProdCode]				,
		p.[ProdDesc]				,
		p.[ProdFam]					,
		p.[ProdGroup]				,
		p.[ProdGroupGlobal]			,
		p.[ShiftDesc]				,
		p.[TeamDesc]				,
		p.[LineStatus]				,
		p.[TotalProduct]			,
		p.[GoodProduct]				,
		p.[TotalScrap]				,
		p.[ActualRate]				,
		p.[TargetRate]				,
		p.[IdealRate]				,
		p.[TotalCases]				,
		p.[RunningScrap]			,
		p.[StartingScrap]			,
		p.[FirstPackCount]			,
		p.[SecondPackCount]			,
		p.[ThirdPackCount]			,
		p.[FourthPackCount]			,
		p.[ProdPerStat]				,
		p.[StatFactor]				,
		p.[StatUnits]				,
		p.[ConvertedCases]			,
		p.[UnitOfMeasure]			,
		p.[Uptime]					,
		p.[DownTime]				,
		p.[ScheduledTime]			,
		p.[Stops]					,
		p.[BatchNumber]				,
		p.[CalcSpeed]				,
		p.[Ts]						,
		p.[TransferFlag]			,
		p.[DeleteFlag]				,
		p.[ZoneDesc]				,
		p.[ZoneGrpDesc]				,
		p.[ProdRecHash]				,
		@SiteId AS SITE_DIMENSION_SiteId,
		ld.CentralLineId AS LINE_DIMENSION_CentralLineId,
		p.[RcdIdx] 
		FROM  @ProductionRawdata p
		JOIN dbo.LINE_DIMENSION ld ON p.PLID = ld.PLId AND ld.SITE_DIMENSION_SiteId = @SiteId
		WHERE NOT EXISTS (  SELECT * 
							FROM [dbo].[OpsDB_Production_Data] u 
							WHERE
							u.RCDIDX				= p.RcdIdx AND 
							u.SITE_DIMENSION_SiteId = ld.SITE_DIMENSION_SiteId  AND
							u.LINE_DIMENSION_CentralLineId	= ld.CentralLineId
							) 




Update T SET
				T.[StartTime]		=	s.[StartTime]			,
				T.[EndTime]			=	s.[EndTime]				,
				T.[POStatus]		=	s.[POStatus]			,
				T.[EndTimeUTC]		=	s.[EndTimeUTC]			,
				T.[StartTimeUTC]	=	s.[StartTimeUTC]		,
				T.[LineGroup]		=	s.[LineGroup]			,
				T.[PLID]			=	s.[PLID]				,
				T.[PLDesc]			=	s.[PLDesc]				,
				T.[PLDescGlobal]	=	s.[PLDescGlobal]		,
				T.[PUID]			=	s.[PUID]				,
				T.[PUDesc]			=	s.[PUDesc]				,
				T.[PUDescGlobal]	=	s.[PUDescGlobal]		,
				T.[Site]			=	s.[Site]				,
				T.[PPId]			=	s.[PPId]				,
				T.[EventId]			=	s.[EventId]				,
				T.[ProcessOrder]	=	s.[ProcessOrder]		,
				T.[ProdId]			=	s.[ProdId]				,
				T.[ProdCode]		=	s.[ProdCode]			,
				T.[ProdDesc]		=	s.[ProdDesc]			,
				T.[ProdFam]			=	s.[ProdFam]				,
				T.[ProdGroup]		=	s.[ProdGroup]			,
				T.[ProdGroupGlobal]	=	s.[ProdGroupGlobal]		,
				T.[ShiftDesc]		=	s.[ShiftDesc]			,
				T.[TeamDesc]		=	s.[TeamDesc]			,
				T.[LineStatus]		=	s.[LineStatus]			,
				T.[TotalProduct]	=	s.[TotalProduct]		,
				T.[GoodProduct]		=	s.[GoodProduct]			,
				T.[TotalScrap]		=	s.[TotalScrap]			,
				T.[ActualRate]		=	s.[ActualRate]			,
				T.[TargetRate]		=	s.[TargetRate]			,
				T.[IdealRate]		=	s.[IdealRate]			,
				T.[TotalCases]		=	s.[TotalCases]			,
				T.[RunningScrap]	=	s.[RunningScrap]		,
				T.[StartingScrap]	=	s.[StartingScrap]		,
				T.[FirstPackCount]	=	s.[FirstPackCount]		,
				T.[SecondPackCount]	=	s.[SecondPackCount]		,
				T.[ThirdPackCount]	=	s.[ThirdPackCount]		,
				T.[FourthPackCount]	=	s.[FourthPackCount]		,
				T.[ProdPerStat]		=	s.[ProdPerStat]			,
				T.[StatFactor]		=	s.[StatFactor]			,
				T.[StatUnits]		=	s.[StatUnits]			,
				T.[ConvertedCases]	=	s.[ConvertedCases]		,
				T.[UnitOfMeasure]	=	s.[UnitOfMeasure]		,
				T.[Uptime]			=	s.[Uptime]				,
				T.[DownTime]		=	s.[DownTime]			,
				T.[ScheduledTime]	=	s.[ScheduledTime]		,
				T.[Stops]			=	s.[Stops]				,
				T.[BatchNumber]		=	s.[BatchNumber]			,
				T.[CalcSpeed]		=	s.[CalcSpeed]			,
				T.[Ts]				=	s.[Ts]					,
				T.[TransferFlag]	=	s.[TransferFlag]		,
				T.[DeleteFlag]		=	s.[DeleteFlag]			,
				T.[ZoneDesc]		=	s.[ZoneDesc]			,
				T.[ZoneGrpDesc]		=	s.[ZoneGrpDesc]			,
				T.[ProdRecHash]		=	s.[ProdRecHash]			
from [dbo].[OpsDB_Production_Data]  T 
JOIN (
                SELECT                              
				[StartTime]				,
				[EndTime]				,
				[POStatus]				,
				[EndTimeUTC]			,
				[StartTimeUTC]			,
				[LineGroup]				,
				d.[PLID]				,
				[PLDesc]				,
				[PLDescGlobal]			,
				[PUID]					,
				[PUDesc]				,
				[PUDescGlobal]			,
				[Site]					,
				[PPId]					,
				[EventId]				,
				[ProcessOrder]			,
				[ProdId]				,
				[ProdCode]				,
				[ProdDesc]				,
				[ProdFam]				,
				[ProdGroup]				,
				[ProdGroupGlobal]		,
				[ShiftDesc]				,
				[TeamDesc]				,
				[LineStatus]			,
				[TotalProduct]			,
				[GoodProduct]			,
				[TotalScrap]			,
				[ActualRate]			,
				[TargetRate]			,
				[IdealRate]				,
				[TotalCases]			,
				[RunningScrap]			,
				[StartingScrap]			,
				[FirstPackCount]		,
				[SecondPackCount]		,
				[ThirdPackCount]		,
				[FourthPackCount]		,
				[ProdPerStat]			,
				[StatFactor]			,
				[StatUnits]				,
				[ConvertedCases]		,
				[UnitOfMeasure]			,
				[Uptime]				,
				[DownTime]				,
				[ScheduledTime]			,
				[Stops]					,
				[BatchNumber]			,
				[CalcSpeed]				,
				[Ts]					,
				[TransferFlag]			,
				[DeleteFlag]			,
				[ZoneDesc]				,
				[ZoneGrpDesc]			,
				[ProdRecHash]			,
				ld.SITE_DIMENSION_SiteId		,
				ld.CentralLineId						,
				RcdIdx	
                FROM @ProductionRawdata d 
				JOIN dbo.LINE_DIMENSION ld ON d.PLID = ld.PLId AND ld.SITE_DIMENSION_SiteId = @SiteId
) S ON (
			T.SITE_DIMENSION_SiteId			= s.SITE_DIMENSION_SiteId AND
			T.LINE_DIMENSION_CentralLineId	= s.CentralLineid AND
			T.RcdIdx						= s.RcdIdx	
	    )
--WHERE

	UPDATE [dbo].[Transfer_Parameter_Data]
		SET LastModifytime = ( SELECT MAX(TS) FROM @ProductionRawdata )
	WHERE TableName = 'OpsDB_Production_Data'
	AND SiteId = @SiteId

RETURN
;
GO

GRANT EXEC ON TYPE::[dbo].[OpsDB_Production_Data_Type]  TO [LocalUser]
GO

GRANT EXECUTE ON OBJECT ::[dbo].splocal_InsertProductionRawData  TO [LocalUser]
GO



