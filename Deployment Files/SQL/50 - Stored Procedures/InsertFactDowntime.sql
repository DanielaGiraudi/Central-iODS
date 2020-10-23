--DROP PROCEDURE splocal_InsertFactDowntime;
--GO


CREATE PROCEDURE splocal_InsertFactDowntime
  @FactDownTime [dbo].[OpsDB_FactDowntime_Data_Type] READONLY
AS
	DECLARE @SiteId INTEGER

	SELECT TOP 1 @SiteId = sd.SiteId 
	FROM @FactDownTime dtd
	JOIN SITE_DIMENSION sd ON dtd.DataServerName = sd.DataServerName
	
	
	
Update T SET								
			T.[LineStatus]					 = S.[LineStatus]								,
			T.[DeleteFlag]					 = S.[DeleteFlag]								,
			T.[StartTime]					 = S.[StartTime]								,
			T.[EndTime]						 = S.[EndTime]									,
			T.[TotalStops]					 = S.[TotalStops]								,
			T.[Duration]					 = S.[Duration]								,
			T.[TotalUpdDowntime]			 = S.[TotalUpdDowntime]						,
			T.[TotalPlannedDowntime]		 = S.[TotalPlannedDowntime]					,
			T.[TotalUpdStops]				 = S.[TotalUpdStops]							,
			T.[MinorStops]					 = S.[MinorStops]								,
			T.[ProcFailures]				 = S.[ProcFailures]							,
			T.[MajorStops]					 = S.[MajorStops]								,
			T.[Uptime]						 = S.[Uptime]									,
			T.[MTBF]						 = S.[MTBF]									,
			T.[MTBFUpd]						 = S.[MTBFUpd]									,
			T.[MTTR]						 = S.[MTTR]									,
			T.[UpsDTPRLoss]					 = S.[UpsDTPRLoss]								,
			T.[PlannedDTPRLoss]				 = S.[PlannedDTPRLoss]							,
			T.[R0]							 = S.[R0]										,
			T.[R2]							 = S.[R2]										,
			T.[R210]						 = S.[R210]									,
			T.[R240]						 = S.[R240]									,
			T.[BreakDown]					 = S.[BreakDown]								,
			T.[MTTRUpd]						 = S.[MTTRUpd]									,
			T.[UpdDownPerc]					 = S.[UpdDownPerc]								,
			T.[StopsDay]					 = S.[StopsDay]								,
			T.[ProcFailuresDay]				 = S.[ProcFailuresDay]							,
			T.[Availability_Unpl_DT]		 = S.[Availability_Unpl_DT]					,
			T.[Availability_Planned_DT]		 = S.[Availability_Planned_DT]					,
			T.[Availability_Total_DT]		 = S.[Availability_Total_DT]					,
			T.[MTBS]						 = S.[MTBS]									,
			T.[ACPStops]					 = S.[ACPStops]								,
			T.[ACPStopsDay]					 = S.[ACPStopsDay]								,
			T.[RepairTimeT]					 = S.[RepairTimeT]								,
			T.[FalseStarts0]				 = S.[FalseStarts0]							,
			T.[FalseStarts0Per]				 = S.[FalseStarts0Per]							,
			T.[FalseStartsT]				 = S.[FalseStartsT]							,
			T.[FalseStartsTPer]				 = S.[FalseStartsTPer]							,
			T.[Survival210Rate]				 = S.[Survival210Rate]							,
			T.[Survival210RatePer]			 = S.[Survival210RatePer]						,
			T.[Survival240Rate]				 = S.[Survival240Rate]							,
			T.[Survival240RatePer]			 = S.[Survival240RatePer]						,
			T.[EditedStops]					 = S.[EditedStops]								,
			T.[EditedStopsPer]				 = S.[EditedStopsPer]							,
			T.[TotalUpdStopDay]				 = S.[TotalUpdStopDay]							,
			T.[StopsBDSDay]					 = S.[StopsBDSDay]								,
			T.[TotalPlannedStops]			 = S.[TotalPlannedStops]						,
			T.[TotalPlannedStopsDay]		 = S.[TotalPlannedStopsDay]					,
			T.[MajorStopsDay]				 = S.[MajorStopsDay]							,
			T.[MinorStopsDay]				 = S.[MinorStopsDay]							,
			T.[TotalStarvedStops]			 = S.[TotalStarvedStops]						,
			T.[TotalBlockedStops]			 = S.[TotalBlockedStops]						,
			T.[TotalStarvedDowntime]		 = S.[TotalStarvedDowntime]					,
			T.[TotalBlockedDowntime]		 = S.[TotalBlockedDowntime]					,
			T.[VSScheduledTime]				 = S.[VSScheduledTime]							,
			T.[VSPRLossPlanned]				 = S.[VSPRLossPlanned]							,
			T.[VSPRLossUnplanned]			 = S.[VSPRLossUnplanned]						,
			T.[VSPRLossBreakdown]			 = S.[VSPRLossBreakdown]						,
			T.[teamdesc]					 = S.[teamdesc]								,
			T.[shiftdesc]					 = S.[shiftdesc]								,
			T.[Repulper_Tons]				 = S.[Repulper_Tons]							,
			T.[DChangeOverAlltypesStops]	 = S.[DChangeOverAlltypesStops]				,
			T.[DChangeOverPackingCOStops]	 = S.[DChangeOverPackingCOStops]				,
			T.[DChangeOverAlltypesDuration]	 = S.[DChangeOverAlltypesDuration]				,
			T.[DChangeOverPackingCODuration] = S.[DChangeOverPackingCODuration]			,
			T.[Modified_ON]					 = S.[Modified_ON]								
	
from dbo.Fact_Downtime T 
JOIN (
				SELECT							  
				[LineStatus]										,
				[DeleteFlag]										,
				[StartTime]											,
				[EndTime]											,
				[TotalStops]										,
				[Duration]											,
				[TotalUpdDowntime]									,
				[TotalPlannedDowntime]								,
				[TotalUpdStops]										,
				[MinorStops]										,
				[ProcFailures]										,
				[MajorStops]										,
				[Uptime]											,
				[MTBF]												,
				[MTBFUpd]											,
				[MTTR]												,
				[UpsDTPRLoss]										,
				[PlannedDTPRLoss]									,
				[R0]												,
				[R2]												,
				[R210]												,
				[R240]												,
				[BreakDown]											,
				[MTTRUpd]											,
				[UpdDownPerc]										,
				[StopsDay]											,
				[ProcFailuresDay]									,
				[Availability_Unpl_DT]								,
				[Availability_Planned_DT]							,
				[Availability_Total_DT]								,
				[MTBS]												,
				[ACPStops]											,
				[ACPStopsDay]										,
				[RepairTimeT]										,
				[FalseStarts0]										,
				[FalseStarts0Per]									,
				[FalseStartsT]										,
				[FalseStartsTPer]									,
				[Survival210Rate]									,
				[Survival210RatePer]								,
				[Survival240Rate]									,
				[Survival240RatePer]								,
				[EditedStops]										,
				[EditedStopsPer]									,
				[TotalUpdStopDay]									,
				[StopsBDSDay]										,
				[TotalPlannedStops]									,
				[TotalPlannedStopsDay]								,
				[MajorStopsDay]										,
				[MinorStopsDay]										,
				[TotalStarvedStops]									,
				[TotalBlockedStops]									,
				[TotalStarvedDowntime]								,
				[TotalBlockedDowntime]								,
				[VSScheduledTime]									,
				[VSPRLossPlanned]									,
				[VSPRLossUnplanned]									,
				[VSPRLossBreakdown]									,
				[teamdesc]											,
				[shiftdesc]											,
				[Repulper_Tons]										,
				[DChangeOverAlltypesStops]							,
				[DChangeOverPackingCOStops]							,
				[DChangeOverAlltypesDuration]						,
				[DChangeOverPackingCODuration]						,
				[Modified_ON]										,
				ld.CentralLineId									,
				wd.CentralWorkCellId								,
				[DATE_DIMENSION_DateId]								,
				ld.SITE_DIMENSION_SiteId											  
				FROM @FactDownTime d 
				JOIN dbo.LINE_DIMENSION ld ON d.LINE_DIMENSION_CentralLineId= ld.LineId AND ld.SITE_DIMENSION_SiteId = @SiteId
				JOIN dbo.WorkCell_Dimension wd on wd.workcellid=d.WORKCELL_DIMENSION_CentralWorkcellId AND wd.SITE_DIMENSION_SiteId = @SiteId
) S ON (
			T.SITE_DIMENSION_SiteId			= s.SITE_DIMENSION_SiteId AND
			T.LINE_DIMENSION_CentralLineId	= s.CentralLineid AND
			T.WORKCELL_DIMENSION_CentralWorkCellId = s.CentralWorkCellId AND
			T.Date_Dimension_DateId			= s.DATE_DIMENSION_DateId AND 
			T.TeamDesc						= s.TeamDesc AND
			T.ShiftDesc						= s.ShiftDesc AND
			T.LineStatus					= s.LineStatus AND
			T.Starttime						= (CASE WHEN [T].[Date_Dimension_DateId] IN (2, 6, 10) THEN [S].[Starttime] ELSE [T].[Starttime] END)
					 
		)

INSERT INTO [dbo].[FACT_DOWNTIME] (
	[LineStatus]								,
	[DeleteFlag]								,
	[StartTime]									,
	[EndTime]									,
	[TotalStops]								,
	[Duration]									,
	[TotalUpdDowntime]							,
	[TotalPlannedDowntime]						,
	[TotalUpdStops]								,
	[MinorStops]								,
	[ProcFailures]								,
	[MajorStops]								,
	[Uptime]									,
	[MTBF]										,
	[MTBFUpd]									,
	[MTTR]										,
	[UpsDTPRLoss]								,
	[PlannedDTPRLoss]							,
	[R0]										,
	[R2]										,
	[R210]										,
	[R240]										,
	[BreakDown]									,
	[MTTRUpd]									,
	[UpdDownPerc]								,
	[StopsDay]									,
	[ProcFailuresDay]							,
	[Availability_Unpl_DT]						,
	[Availability_Planned_DT]					,
	[Availability_Total_DT]						,
	[MTBS]										,
	[ACPStops]									,
	[ACPStopsDay]								,
	[RepairTimeT]								,
	[FalseStarts0]								,
	[FalseStarts0Per]							,
	[FalseStartsT]								,
	[FalseStartsTPer]							,
	[Survival210Rate]							,
	[Survival210RatePer]						,
	[Survival240Rate]							,
	[Survival240RatePer]						,
	[EditedStops]								,
	[EditedStopsPer]							,
	[TotalUpdStopDay]							,
	[StopsBDSDay]								,
	[TotalPlannedStops]							,
	[TotalPlannedStopsDay]						,
	[MajorStopsDay]								,
	[MinorStopsDay]								,
	[TotalStarvedStops]							,
	[TotalBlockedStops]							,
	[TotalStarvedDowntime]						,
	[TotalBlockedDowntime]						,
	[VSScheduledTime]							,
	[VSPRLossPlanned]							,
	[VSPRLossUnplanned]							,
	[VSPRLossBreakdown]							,
	[teamdesc]									,
	[shiftdesc]									,
	[Repulper_Tons]								,
	[DChangeOverAlltypesStops]					,
	[DChangeOverPackingCOStops]					,
	[DChangeOverAlltypesDuration]				,
	[DChangeOverPackingCODuration]				,
	[Modified_ON]								,
	[LINE_DIMENSION_CentralLineId]				,
	[WORKCELL_DIMENSION_CentralWorkCellId]		,
	[DATE_DIMENSION_DateId]						,
	[SITE_DIMENSION_SITEId]					
	)	
	SELECT
	[LineStatus]										,
	[DeleteFlag]										,
	[StartTime]											,
	[EndTime]											,
	[TotalStops]										,
	[Duration]											,
	[TotalUpdDowntime]									,
	[TotalPlannedDowntime]								,
	[TotalUpdStops]										,
	[MinorStops]										,
	[ProcFailures]										,
	[MajorStops]										,
	[Uptime]											,
	[MTBF]												,
	[MTBFUpd]											,
	[MTTR]												,
	[UpsDTPRLoss]										,
	[PlannedDTPRLoss]									,
	[R0]												,
	[R2]												,
	[R210]												,
	[R240]												,
	[BreakDown]											,
	[MTTRUpd]											,
	[UpdDownPerc]										,
	[StopsDay]											,
	[ProcFailuresDay]									,
	[Availability_Unpl_DT]								,
	[Availability_Planned_DT]							,
	[Availability_Total_DT]								,
	[MTBS]												,
	[ACPStops]											,
	[ACPStopsDay]										,
	[RepairTimeT]										,
	[FalseStarts0]										,
	[FalseStarts0Per]									,
	[FalseStartsT]										,
	[FalseStartsTPer]									,
	[Survival210Rate]									,
	[Survival210RatePer]								,
	[Survival240Rate]									,
	[Survival240RatePer]								,
	[EditedStops]										,
	[EditedStopsPer]									,
	[TotalUpdStopDay]									,
	[StopsBDSDay]										,
	[TotalPlannedStops]									,
	[TotalPlannedStopsDay]								,
	[MajorStopsDay]										,
	[MinorStopsDay]										,
	[TotalStarvedStops]									,
	[TotalBlockedStops]									,
	[TotalStarvedDowntime]								,
	[TotalBlockedDowntime]								,
	[VSScheduledTime]									,
	[VSPRLossPlanned]									,
	[VSPRLossUnplanned]									,
	[VSPRLossBreakdown]									,
	[teamdesc]											,
	[shiftdesc]											,
	[Repulper_Tons]										,
	[DChangeOverAlltypesStops]							,
	[DChangeOverPackingCOStops]							,
	[DChangeOverAlltypesDuration]						,
	[DChangeOverPackingCODuration]						,
	[Modified_ON]										,
	ld.CentralLineId AS LINE_DIMENSION_CentralLineId	,
	wd.CentralWorkCellId AS	WORKCELL_DIMENSION_centralWorkCellId,
	[DATE_DIMENSION_DateId]	AS	[DATE_DIMENSION_DateId]	,
	ld.SITE_DIMENSION_SiteId AS SITE_DIMENSION_SiteId
	FROM  @FACTDownTime drd
	JOIN dbo.LINE_DIMENSION ld ON drd.[LINE_DIMENSION_CentralLineId] = ld.LineId AND ld.SITE_DIMENSION_SiteId = @SiteId
	JOIN dbo.WorkCell_Dimension wd on wd.workcellid=drd.WORKCELL_DIMENSION_CentralWorkcellId AND wd.SITE_DIMENSION_SiteId = @SiteId
	WHERE NOT EXISTS ( SELECT * 
						FROM dbo.FACT_DOWNTIME u with(nolock) 
						WHERE
						u.Line_Dimension_CentralLineId = ld.CentralLineId AND 
						u.Site_Dimension_SiteId = ld.SITE_DIMENSION_SiteId AND 
						u.WORKCELL_DIMENSION_CentralWorkCellId = wd.CentralWorkCellId AND
						u.Date_Dimension_DateId = drd.DATE_DIMENSION_DateId AND 
						u.TeamDesc=drd.TeamDesc AND
						u.ShiftDesc=drd.ShiftDesc AND
						u.LineStatus=drd.LineStatus AND
						u.Starttime=drd.Starttime 
					 )
	
				
	UPDATE [dbo].[Transfer_Parameter_Data]
		SET LastModifytime = ( SELECT MAX([EndTime]) FROM @FactDownTime )
	WHERE TableName = 'Fact_Downtime'
	AND SiteId = @SiteId

RETURN
;

GO
GRANT EXEC ON TYPE::[dbo].[OpsDB_FactDowntime_Data_Type]  TO [LocalUser]
GO

GRANT EXECUTE ON OBJECT ::[dbo].splocal_InsertFactDowntime  TO [LocalUser]
GO



