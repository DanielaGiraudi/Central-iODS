--DROP PROCEDURE splocal_InsertAlarmsRawData
--GO
-- Index OK. Update Order OK
CREATE PROCEDURE splocal_InsertAlarmsRawData
  @AlarmsRawdata [dbo].[OpsDB_Alarms_Data_Type] READONLY
AS
	DECLARE @SiteId INTEGER

	SELECT TOP 1 @SiteId = sd.SiteId
	FROM @AlarmsRawdata a
	JOIN SITE_DIMENSION sd ON a.DataServerName = sd.DataServerName

	Update T SET
			T.[PLDesc]					= s.[PLDesc],
			T.[PLDescGlobal]			= s.[PLDescGlobal],
			T.[PUDesc]					= s.[PUDesc],
			T.[PUDescGlobal]			= s.[PUDescGlobal],
			T.[MasterPUDesc]			= s.[MasterPUDesc],
			T.[MasterPUDescGlobal]		= s.[MasterPUDescGlobal],
			T.[VarId]					= s.[VarId],
			T.[VarDesc]					= s.[VarDesc],
			T.[AlarmDesc]				= s.[AlarmDesc],
			T.[AlarmTemplate]			= s.[AlarmTemplate],
			T.[StartTime]				= s.[StartTime],
			T.[EndTime]					= s.[EndTime],
			T.[MaxValue]				= s.[MaxValue],
			T.[MinValue]				= s.[MinValue],
			T.[CommentId]				= s.[CommentId],
			T.[CommentModifOn]			= s.[CommentModifOn],
			T.[StartValue]				= s.[StartValue],
			T.[EndValue]				= s.[EndValue],
			T.[ModifiedOn]				= s.[ModifiedOn],
			T.[UserName]				= s.[UserName],
			T.[EventTypeDesc]			= s.[EventTypeDesc],
			T.[EventSubTypeDesc]		= s.[EventSubTypeDesc],
			T.[ProcessOrder]			= s.[ProcessOrder],
			T.[ProdCode]				= s.[ProdCode],
			T.[ProdDesc]				= s.[ProdDesc],
			T.[ProdDescGlobal]			= s.[ProdDescGlobal],
			T.[LReject]					= s.[LReject],
			T.[Target]					= s.[Target],
			T.[UReject]					= s.[UReject],
			T.[AlarmId]					= s.[AlarmId],
			T.[DeleteFlag]				= s.[DeleteFlag],
			T.[PUGDesc]					= s.[PUGDesc],
			T.[CauseCommentText]		= s.[CauseCommentText],
			T.[ActionCommentText]		= s.[ActionCommentText],
			T.[CauseCommentId]			= s.[CauseCommentId],
			T.[CauseCommentModifOn]		= s.[CauseCommentModifOn],
			T.[CauseComment_Rtf]		= s.[CauseComment_Rtf],
			T.[ActionCommentId]			= s.[ActionCommentId],
			T.[ActionCommentModifOn]	= s.[ActionCommentModifOn],
			T.[ActionComment_Rtf]		= s.[ActionComment_Rtf],
			T.[Action1]					= s.[Action1],
			T.[Action2]					= s.[Action2],
			T.[Action3]					= s.[Action3],
			T.[Cause1]					= s.[Cause1],
			T.[Cause2]					= s.[Cause2],
			T.[Cause3]					= s.[Cause3],
			T.[SourceVarId]				= s.[SourceVarId]
	FROM [dbo].[OpsDB_Alarms_RawData] T
		INNER JOIN @AlarmsRawdata s ON s.RcdIdx = T.RcdIdx
	WHERE s.SITE_DIMENSION_SiteId = @SiteId

	INSERT INTO [dbo].[OpsDB_Alarms_RawData](
		[PLDesc],
		[PLDescGlobal],
		[PUDesc],
		[PUDescGlobal],
		[MasterPUDesc],
		[MasterPUDescGlobal],
		[VarId],
		[VarDesc],
		[AlarmDesc],
		[AlarmTemplate],
		[StartTime],
		[EndTime],
		[MaxValue],
		[MinValue],
		[CommentId],
		[CommentModifOn],
		[StartValue],
		[EndValue],
		[ModifiedOn],
		[UserName],
		[EventTypeDesc],
		[EventSubTypeDesc],
		[ProcessOrder],
		[ProdCode],
		[ProdDesc],
		[ProdDescGlobal],
		[LReject],
		[Target],
		[UReject],
		[AlarmId],
		[DeleteFlag],
		[PUGDesc],
		[CauseCommentText],
		[ActionCommentText],
		[CauseCommentId],
		[CauseCommentModifOn],
		[CauseComment_Rtf],
		[ActionCommentId],
		[ActionCommentModifOn],
		[ActionComment_Rtf],
		[Action1],
		[Action2],
		[Action3],
		[Cause1],
		[Cause2],
		[Cause3],
		[SourceVarId],
		[SITE_DIMENSION_SiteId],
		[LINE_DIMENSION_CentralLineId],
		[RcdIdx])
	SELECT
		al.[PLDesc],
		al.[PLDescGlobal],
		al.[PUDesc],
		al.[PUDescGlobal],
		al.[MasterPUDesc],
		al.[MasterPUDescGlobal],
		al.[VarId],
		al.[VarDesc],
		al.[AlarmDesc],
		al.[AlarmTemplate],
		al.[StartTime],
		al.[EndTime],
		al.[MaxValue],
		al.[MinValue],
		al.[CommentId],
		al.[CommentModifOn],
		al.[StartValue],
		al.[EndValue],
		al.[ModifiedOn],
		al.[UserName],
		al.[EventTypeDesc],
		al.[EventSubTypeDesc],
		al.[ProcessOrder],
		al.[ProdCode],
		al.[ProdDesc],
		al.[ProdDescGlobal],
		al.[LReject],
		al.[Target],
		al.[UReject],
		al.[AlarmId],
		al.[DeleteFlag],
		al.[PUGDesc],
		al.[CauseCommentText],
		al.[ActionCommentText],
		al.[CauseCommentId],
		al.[CauseCommentModifOn],
		al.[CauseComment_Rtf],
		al.[ActionCommentId],
		al.[ActionCommentModifOn],
		al.[ActionComment_Rtf],
		al.[Action1],
		al.[Action2],
		al.[Action3],
		al.[Cause1],
		al.[Cause2],
		al.[Cause3],
		al.[SourceVarId],
		@SiteId AS SITE_DIMENSION_SiteId,
		ld.CentralLineId AS LINE_DIMENSION_CentralLineId,
		al.[RcdIdx]
	FROM  @AlarmsRawdata al
		INNER JOIN dbo.LINE_DIMENSION ld ON ld.LineDesc = al.PLDesc AND ld.SITE_DIMENSION_SiteId = @SiteId
		LEFT OUTER JOIN dbo.OpsDB_Alarms_RawData u ON u.RcdIdx = ld.RcdIdx
	WHERE u.RcdIdx IS NULL

	UPDATE [dbo].[Transfer_Parameter_Data]
		SET LastModifytime = ( SELECT MAX(ModifiedOn) FROM @AlarmsRawdata )
	WHERE TableName = 'OpsDB_Alarms_RawData'
	AND SiteId = @SiteId

RETURN
GO

GRANT EXEC ON TYPE::[dbo].[OpsDB_Alarms_Data_Type]  TO [LocalUser]
GO

GRANT EXECUTE ON OBJECT ::[dbo].splocal_InsertAlarmsRawData  TO [LocalUser]
GO
