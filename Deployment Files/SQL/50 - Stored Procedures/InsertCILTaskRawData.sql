--DROP PROCEDURE splocal_InsertCILTasksRawData
--GO

CREATE PROCEDURE splocal_InsertCILTasksRawData
  @CILTasksRawdata [dbo].[Opsdb_CILTasks_Rawdata_Type] READONLY
AS
	DECLARE @SiteId INTEGER

	SELECT TOP 1 @SiteId = sd.SiteId
	FROM @CILTasksRawdata dtd
	JOIN SITE_DIMENSION sd ON dtd.DataServerName = sd.DataServerName

	INSERT INTO dbo.Opsdb_CILTasks_Rawdata (
		[Deptid],
		[DeptDesc],
		[PLId],
		[PLDesc],
		[PLDescGlobal],
		[PUId],
		[PUDesc],
		[PUDescGlobal],
		[PUGDesc],
		[MasterUnit],
		[MasterUnitDesc],
		[MasterUnitDescGlobal],
		[VarId],
		[VarDesc],
		[VarDescGlobal],
		[DataType],
		[ProdId],
		[ProdCode],
		[ProdDesc],
		[ProdDescGlobal],
		[ProcessOrder],
		[ProductGrpDesc],
		[ProductGrpDescGlobal],
		[LineStatus],
		[Result],
		[UserDesc],
		[TeamDesc],
		[RouteDesc],
		[Frequency],
		[ProdDay],
		[EntryOn],
		[ResultOn],
		[ModifiedOn],
		[SamplesTaken],
		[OnTime],
		[DoneLate],
		[DefectsFound],
		[OpenedDefects],
		[Canceled],
		[UDEDesc],
		[SheetDesc],
		[Site],
		[StubberUser],
		[RcdIdx],
		[SITE_DIMENSION_SiteId],
		[LINE_DIMENSION_CentralLineId])
	SELECT
		crd.[Deptid],
		crd.[DeptDesc],
		crd.[PLId],
		crd.[PLDesc],
		crd.[PLDescGlobal],
		crd.[PUId],
		crd.[PUDesc],
		crd.[PUDescGlobal],
		crd.[PUGDesc],
		crd.[MasterUnit],
		crd.[MasterUnitDesc],
		crd.[MasterUnitDescGlobal],
		crd.[VarId],
		crd.[VarDesc],
		crd.[VarDescGlobal],
		crd.[DataType],
		crd.[ProdId],
		crd.[ProdCode],
		crd.[ProdDesc],
		crd.[ProdDescGlobal],
		crd.[ProcessOrder],
		crd.[ProductGrpDesc],
		crd.[ProductGrpDescGlobal],
		crd.[LineStatus],
		crd.[Result],
		crd.[UserDesc],
		crd.[TeamDesc],
		crd.[RouteDesc],
		crd.[Frequency],
		crd.[ProdDay],
		crd.[EntryOn],
		crd.[ResultOn],
		crd.[ModifiedOn],
		crd.[SamplesTaken],
		crd.[OnTime],
		crd.[DoneLate],
		crd.[DefectsFound],
		crd.[OpenedDefects],
		crd.[Canceled],
		crd.[UDEDesc],
		crd.[SheetDesc],
		crd.[Site],
		crd.[StubberUser],
		crd.[RcdIdx],
		@SiteId AS SITE_DIMENSION_SiteId,
		ld.CentralLineId AS LINE_DIMENSION_CentralLineId
	FROM  @CILTasksRawdata crd
		INNER JOIN dbo.LINE_DIMENSION ld ON ld.LineDesc = al.PLDesc AND ld.SITE_DIMENSION_SiteId = @SiteId
		LEFT OUTER JOIN dbo.Opsdb_CILTasks_Rawdata u ON u.RcdIdx = ld.RcdIdx
	WHERE u.RcdIdx IS NULL

	UPDATE T SET
		T.[Deptid]				  = S.[Deptid],
		T.[DeptDesc]				= S.[DeptDesc],
		T.[PLId]					= S.[PLId],
		T.[PLDesc]				  = S.[PLDesc],
		T.[PLDescGlobal]			= S.[PLDescGlobal],
		T.[PUId]					= S.[PUId],
		T.[PUDesc]				  = S.[PUDesc],
		T.[PUDescGlobal]			= S.[PUDescGlobal],
		T.[PUGDesc]				 = S.[PUGDesc],
		T.[MasterUnit]			  = S.[MasterUnit],
		T.[MasterUnitDesc]		  = S.[MasterUnitDesc],
		T.[MasterUnitDescGlobal]	= S.[MasterUnitDescGlobal],
		T.[VarId]				   = S.[VarId],
		T.[VarDesc]				 = S.[VarDesc],
		T.[VarDescGlobal]		   = S.[VarDescGlobal],
		T.[DataType]				= S.[DataType],
		T.[ProdId]				  = S.[ProdId],
		T.[ProdCode]				= S.[ProdCode],
		T.[ProdDesc]				= S.[ProdDesc],
		T.[ProdDescGlobal]		  = S.[ProdDescGlobal],
		T.[ProcessOrder]			= S.[ProcessOrder],
		T.[ProductGrpDesc]		  = S.[ProductGrpDesc],
		T.[ProductGrpDescGlobal]	= S.[ProductGrpDescGlobal],
		T.[LineStatus]			  = S.[LineStatus],
		T.[Result]				  = S.[Result],
		T.[UserDesc]				= S.[UserDesc],
		T.[TeamDesc]				= S.[TeamDesc],
		T.[RouteDesc]			   = S.[RouteDesc],
		T.[Frequency]			   = S.[Frequency],
		T.[ProdDay]				 = S.[ProdDay],
		T.[EntryOn]				 = S.[EntryOn],
		T.[ResultOn]				= S.[ResultOn],
		T.[ModifiedOn]			  = S.[ModifiedOn],
		T.[SamplesTaken]			= S.[SamplesTaken],
		T.[OnTime]				  = S.[OnTime],
		T.[DoneLate]				= S.[DoneLate],
		T.[DefectsFound]			= S.[DefectsFound],
		T.[OpenedDefects]		   = S.[OpenedDefects],
		T.[Canceled]				= S.[Canceled],
		T.[UDEDesc]				 = S.[UDEDesc],
		T.[SheetDesc]			   = S.[SheetDesc],
		T.[Site]					= S.[Site],
		T.[StubberUser]			 = S.[StubberUser],
		T.[RcdIdx]				  = S.[RcdIdx]
from dbo.Opsdb_CILTasks_Rawdata T
JOIN (
				SELECT
					crd.[Deptid],
					crd.[DeptDesc],
					crd.[PLId],
					crd.[PLDesc],
					crd.[PLDescGlobal],
					crd.[PUId],
					crd.[PUDesc],
					crd.[PUDescGlobal],
					crd.[PUGDesc],
					crd.[MasterUnit],
					crd.[MasterUnitDesc],
					crd.[MasterUnitDescGlobal],
					crd.[VarId],
					crd.[VarDesc],
					crd.[VarDescGlobal],
					crd.[DataType],
					crd.[ProdId],
					crd.[ProdCode],
					crd.[ProdDesc],
					crd.[ProdDescGlobal],
					crd.[ProcessOrder],
					crd.[ProductGrpDesc],
					crd.[ProductGrpDescGlobal],
					crd.[LineStatus],
					crd.[Result],
					crd.[UserDesc],
					crd.[TeamDesc],
					crd.[RouteDesc],
					crd.[Frequency],
					crd.[ProdDay],
					crd.[EntryOn],
					crd.[ResultOn],
					crd.[ModifiedOn],
					crd.[SamplesTaken],
					crd.[OnTime],
					crd.[DoneLate],
					crd.[DefectsFound],
					crd.[OpenedDefects],
					crd.[Canceled],
					crd.[UDEDesc],
					crd.[SheetDesc],
					crd.[Site],
					crd.[StubberUser],
					crd.[RcdIdx],
					@SiteId AS SITE_DIMENSION_SiteId,
					ld.CentralLineId AS LINE_DIMENSION_CentralLineId
				FROM @CILTasksRawdata crd
				JOIN dbo.LINE_DIMENSION ld ON crd.PLID = ld.PLId AND ld.SITE_DIMENSION_SiteId = @SiteId
) S ON (
			T.SITE_DIMENSION_SiteId			= s.SITE_DIMENSION_SiteId AND
			T.LINE_DIMENSION_CentralLineId	= S.LINE_DIMENSION_CentralLineId AND
			T.RcdIdx						= s.RcdIdx
		)

	UPDATE [dbo].[Transfer_Parameter_Data]
		SET LastModifytime = ( SELECT MAX(ModifiedOn) FROM @CILTasksRawdata )
	WHERE TableName = 'Opsdb_CILTasks_Rawdata'
	AND SiteId = @SiteId

RETURN
GO

GRANT EXEC ON TYPE::[dbo].[Opsdb_CILTasks_Rawdata_Type]  TO [LocalUser]
GO

GRANT EXECUTE ON OBJECT ::[dbo].splocal_InsertCILTasksRawData  TO [LocalUser]
GO