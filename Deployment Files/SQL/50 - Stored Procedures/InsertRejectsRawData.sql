--DROP PROCEDURE splocal_InsertRejectsRawData;
--GO


CREATE PROCEDURE splocal_InsertRejectsRawData
  @RejectsRawdata [dbo].[OpsDB_Rejects_Data_Type] READONLY
AS
	DECLARE @SiteId INTEGER

	SELECT TOP 1 @SiteId = sd.SiteId 
	FROM @RejectsRawdata r
	JOIN SITE_DIMENSION sd ON r.DataServerName = sd.DataServerName
	
	INSERT INTO [dbo].[OpsDB_Reject_Data] (
		[Timestamp]						,
		[TimestampUTC]					,
		[Amount]						,
		[Units]							,
		[Type]							,
		[Fault]							,
		[FaultGlobal]					,
		[FaultCode]						,
		[Reason1]						,
		[Reason1Global]					,
		[ReasonCode]					,
		[Location]						,
		[LocationGlobal]				,
		[ProdId]						,
		[ProdCode]						,
		[ProdDesc]						,
		[ProdDescGlobal]				,
		[ProdFam]						,
		[ProdGroup]						,
		[ProdGroupGlobal]				,
		[ProcessOrder]					,
		[TeamDesc]						,
		[ShiftDesc]						,
		[Comments]						,
		[PLDesc]						,
		[PLDescGlobal]					,
		[PUID]							,
		[SourcePUId]					,
		[PUDesc]						,
		[PUDescGlobal]					,
		[PLId]							,
		[ManualWaste]					,
		[TransferFlag]					,
		[WedId]							,
		[Site]							,
		[ZoneDesc]						,
		[ZoneGrpDesc]					,
		[SITE_DIMENSION_SiteId]			,
		[LINE_DIMENSION_CentralLineId]	,
		[RcdIdx]
	)	
	SELECT
		drd.[Timestamp]						,
		drd.[TimestampUTC]					,
		drd.[Amount]						,
		drd.[Units]							,
		drd.[Type]							,
		drd.[Fault]							,
		drd.[FaultGlobal]					,
		drd.[FaultCode]						,
		drd.[Reason1]						,
		drd.[Reason1Global]					,
		drd.[ReasonCode]					,
		drd.[Location]						,
		drd.[LocationGlobal]				,
		drd.[ProdId]						,
		drd.[ProdCode]						,
		drd.[ProdDesc]						,
		drd.[ProdDescGlobal]				,
		drd.[ProdFam]						,
		drd.[ProdGroup]						,
		drd.[ProdGroupGlobal]				,
		drd.[ProcessOrder]					,
		drd.[TeamDesc]						,
		drd.[ShiftDesc]						,
		drd.[Comments]						,
		drd.[PLDesc]						,
		drd.[PLDescGlobal]					,
		drd.[PUID]							,
		drd.[SourcePUId]					,
		drd.[PUDesc]						,
		drd.[PUDescGlobal]					,
		drd.[PLId]							,
		drd.[ManualWaste]					,
		drd.[TransferFlag]					,
		drd.[WedId]							,
		drd.[Site]							,
		drd.[ZoneDesc]						,
		drd.[ZoneGrpDesc]					,
		@SiteId AS SITE_DIMENSION_SiteId,
		ld.CentralLineId AS LINE_DIMENSION_CentralLineId,
		drd.[RcdIdx] 
		FROM  @RejectsRawdata drd
		JOIN dbo.LINE_DIMENSION ld ON drd.PLID = ld.PLId AND ld.SITE_DIMENSION_SiteId = @SiteId
		WHERE NOT EXISTS (  SELECT * 
							FROM [dbo].[OpsDB_Reject_Data] u 
							WHERE
							u.RCDIDX				= drd.RcdIdx AND 
							u.SITE_DIMENSION_SiteId = ld.SITE_DIMENSION_SiteId  AND
							u.LINE_DIMENSION_CentralLineId	= ld.CentralLineId
							) 




Update T SET
				T.[Timestamp]			=		s.[Timestamp]				,
				T.[TimestampUTC]		=		s.[TimestampUTC]			,
				T.[Amount]				=		s.[Amount]					,
				T.[Units]				=		s.[Units]					,
				T.[Type]				=		s.[Type]					,
				T.[Fault]				=		s.[Fault]					,
				T.[FaultGlobal]			=		s.[FaultGlobal]				,
				T.[FaultCode]			=		s.[FaultCode]				,
				T.[Reason1]				=		s.[Reason1]					,
				T.[Reason1Global]		=		s.[Reason1Global]			,
				T.[ReasonCode]			=		s.[ReasonCode]				,
				T.[Location]			=		s.[Location]				,
				T.[LocationGlobal]		=		s.[LocationGlobal]			,
				T.[ProdId]				=		s.[ProdId]					,
				T.[ProdCode]			=		s.[ProdCode]				,
				T.[ProdDesc]			=		s.[ProdDesc]				,
				T.[ProdDescGlobal]		=		s.[ProdDescGlobal]			,
				T.[ProdFam]				=		s.[ProdFam]					,
				T.[ProdGroup]			=		s.[ProdGroup]				,
				T.[ProdGroupGlobal]		=		s.[ProdGroupGlobal]			,
				T.[ProcessOrder]		=		s.[ProcessOrder]			,
				T.[TeamDesc]			=		s.[TeamDesc]				,
				T.[ShiftDesc]			=		s.[ShiftDesc]				,
				T.[Comments]			=		s.[Comments]				,
				T.[PLDesc]				=		s.[PLDesc]					,
				T.[PLDescGlobal]		=		s.[PLDescGlobal]			,
				T.[PUID]				=		s.[PUID]					,
				T.[SourcePUId]			=		s.[SourcePUId]				,
				T.[PUDesc]				=		s.[PUDesc]					,
				T.[PUDescGlobal]		=		s.[PUDescGlobal]			,
				T.[PLId]				=		s.[PLId]					,
				T.[ManualWaste]			=		s.[ManualWaste]				,
				T.[TransferFlag]		=		s.[TransferFlag]			,
				T.[WedId]				=		s.[WedId]					,
				T.[Site]				=		s.[Site]					,
				T.[ZoneDesc]			=		s.[ZoneDesc]				,
				T.[ZoneGrpDesc]			=		s.[ZoneGrpDesc]				  
from [dbo].[OpsDB_Reject_Data]  T 
JOIN (
                SELECT                              
				[Timestamp]						,
				[TimestampUTC]					,
				[Amount]						,
				[Units]							,
				[Type]							,
				[Fault]							,
				[FaultGlobal]					,
				[FaultCode]						,
				[Reason1]						,
				[Reason1Global]					,
				[ReasonCode]					,
				[Location]						,
				[LocationGlobal]				,
				[ProdId]						,
				[ProdCode]						,
				[ProdDesc]						,
				[ProdDescGlobal]				,
				[ProdFam]						,
				[ProdGroup]						,
				[ProdGroupGlobal]				,
				[ProcessOrder]					,
				[TeamDesc]						,
				[ShiftDesc]						,
				[Comments]						,
				[PLDesc]						,
				[PLDescGlobal]					,
				[PUID]							,
				[SourcePUId]					,
				[PUDesc]						,
				[PUDescGlobal]					,
				d.[PLId]						,
				[ManualWaste]					,
				[TransferFlag]					,
				[WedId]							,
				[Site]							,
				[ZoneDesc]						,
				[ZoneGrpDesc]					,
				ld.SITE_DIMENSION_SiteId		,
				ld.CentralLineId						,
				RcdIdx	
                FROM @RejectsRawdata d 
				JOIN dbo.LINE_DIMENSION ld ON d.PLID = ld.PLId AND ld.SITE_DIMENSION_SiteId = @SiteId
) S ON (
			T.SITE_DIMENSION_SiteId			= s.SITE_DIMENSION_SiteId AND
			T.LINE_DIMENSION_CentralLineId	= s.CentralLineid AND
			T.RcdIdx						= s.RcdIdx	
	    )
--WHERE

	UPDATE [dbo].[Transfer_Parameter_Data]
		SET LastModifytime = ( SELECT MAX(Timestamp) FROM @RejectsRawdata )
	WHERE TableName = 'OpsDB_Reject_Data'
	AND SiteId = @SiteId

RETURN
;
GO

GRANT EXEC ON TYPE::[dbo].[OpsDB_Rejects_Data_Type]  TO [LocalUser]
GO

GRANT EXECUTE ON OBJECT ::[dbo].splocal_InsertRejectsRawData  TO [LocalUser]
GO



