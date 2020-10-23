--DROP PROCEDURE splocal_InsertProductionRawDataPM;
--GO

create PROCEDURE splocal_InsertProductionRawDataPM
  @ProductionRawDataPM [dbo].[OpsDB_Production_Data_PM_Type] READONLY
AS
	DECLARE @SiteId INTEGER

	SELECT TOP 1 @SiteId = sd.SiteId 
	FROM @ProductionRawDataPM prd
	JOIN SITE_DIMENSION sd ON prd.DataServerName = sd.DataServerName
	
	INSERT INTO dbo.OpsDB_Production_Data_PM (
		[StartTime],
		[EndTime],
		[StartTimeUTC],
		[EndTimeUTC],
		[Site],
		[PLID],
		[PLDesc],
		[PUID],
		[PUDesc],
		[ProdId],
		[ProdCode],
		[ProdDesc],
		[ProdFam],
		[ProdGroup],
		[ShiftDesc],
		[TeamDesc],
		[NPTStatus],
		[ProcessOrder],
		[ProductTime],
		[GoodTons],
		[RejectTons],
		[HoldTons],
		[FireTons],
		[LastCleaningBlades],
		[LastCrepingBlades],
		[LifeCrepingBlades],
		[LifeCleaningBlades],
		[TAYTons],
		[SlabTons],
		[RepulperTons],
		[TeardownTons],
		[RATons],
		[TotalTons],
		[UnExpTons],
		[GoodRolls],
		[RejectRolls],
		[HoldRolls],
		[FireRolls],
		[CleaningBlades],
		[CrepingBlades],
		[Sheetbreaks],
		[SheetbreaksTime],
		[Stops],
		[YankeeSpeedSum],
		[YankeeSpeedCount],
		[ReelSpeedSum],
		[ReelSpeedCount],
		[FormingWireLife],
		[BackingWireLife],
		[BeltLife],
		[Belt_Id],
		[T3rd_Furnish_Sum],
		[CTMP_Sum],
		[Fiber_1_Sum],
		[Fiber_2_Sum],
		[Long_Fiber_Sum],
		[Machine_Broke_Sum],
		[Product_Broke_Sum],
		[Short_Fiber_Sum],
		[Absorb_Aid_Towel_Sum],
		[Aloe_E_Additive_Sum],
		[Biocide_Sum],
		[Cat_Promoter_Sum],
		[Chem_1_Sum],
		[Chem_2_Sum],
		[Chlorine_Control_Sum],
		[Defoamer_Sum],
		[Dry_Strength_Facial_Sum],
		[Dry_Strength_Tissue_Sum],
		[Recycle_Fiber_Sum],
		[Dry_Strength_Towel_Sum],
		[Dye_1_Sum],
		[Dye_2_Sum],
		[Emulsion_1_Sum],
		[Emulsion_2_Sum],
		[Flocculant_Sum],
		[Glue_Adhesive_Sum],
		[Glue_Crepe_Aid_Sum],
		[Glue_Release_Aid_Sum],
		[Glue_Total_Sum],
		[pH_Control_Tissue_Acid_Sum],
		[pH_Control_Towel_Base_Sum],
		[Single_Glue_Sum],
		[Softener_Facial_Sum],
		[Softener_Tissue_Sum],
		[Softener_Towel_Sum],
		[Wet_Strength_Facial_Sum],
		[Wet_Strength_Tissue_Sum],
		[Wet_Strength_Towel_Sum],
		[Air_Sum],
		[Air_UOM],
		[Air_Per_YKT],
		[Electric_Sum],
		[Electric_UOM],
		[Electric_Per_YKT],
		[Gas_Sum],
		[Gas_UOM],
		[Gas_Per_YKT],
		[Steam_Sum],
		[Steam_UOM],
		[Steam_Per_YKT],
		[Water_Sum],
		[Water_UOM],
		[Water_Per_YKT],
		[GRHF_Tons],
		[All_Tons],
		[All_Furnish],
		[All_Furnish_Perc_Calc],
		[Total_Roll_Status_Cnt],
		[Ts],
		[DeleteFlag],
		[GI_Downtime],
		[GE_Downtime],
		[GI_Uptime],
		[GE_Uptime],
		[RcdIdx],
		[SITE_DIMENSION_SiteId],
		[LINE_DIMENSION_CentralLineId]
	)	
	SELECT
		prd.[StartTime],
		prd.[EndTime],
		prd.[StartTimeUTC],
		prd.[EndTimeUTC],
		prd.[Site],
		prd.[PLID],
		prd.[PLDesc],
		prd.[PUID],
		prd.[PUDesc],
		prd.[ProdId],
		prd.[ProdCode],
		prd.[ProdDesc],
		prd.[ProdFam],
		prd.[ProdGroup],
		prd.[ShiftDesc],
		prd.[TeamDesc],
		prd.[NPTStatus],
		prd.[ProcessOrder],
		prd.[ProductTime],
		prd.[GoodTons],
		prd.[RejectTons],
		prd.[HoldTons],
		prd.[FireTons],
		prd.[LastCleaningBlades],
		prd.[LastCrepingBlades],
		prd.[LifeCrepingBlades],
		prd.[LifeCleaningBlades],
		prd.[TAYTons],
		prd.[SlabTons],
		prd.[RepulperTons],
		prd.[TeardownTons],
		prd.[RATons],
		prd.[TotalTons],
		prd.[UnExpTons],
		prd.[GoodRolls],
		prd.[RejectRolls],
		prd.[HoldRolls],
		prd.[FireRolls],
		prd.[CleaningBlades],
		prd.[CrepingBlades],
		prd.[Sheetbreaks],
		prd.[SheetbreaksTime],
		prd.[Stops],
		prd.[YankeeSpeedSum],
		prd.[YankeeSpeedCount],
		prd.[ReelSpeedSum],
		prd.[ReelSpeedCount],
		prd.[FormingWireLife],
		prd.[BackingWireLife],
		prd.[BeltLife],
		prd.[Belt_Id],
		prd.[T3rd_Furnish_Sum],
		prd.[CTMP_Sum],
		prd.[Fiber_1_Sum],
		prd.[Fiber_2_Sum],
		prd.[Long_Fiber_Sum],
		prd.[Machine_Broke_Sum],
		prd.[Product_Broke_Sum],
		prd.[Short_Fiber_Sum],
		prd.[Absorb_Aid_Towel_Sum],
		prd.[Aloe_E_Additive_Sum],
		prd.[Biocide_Sum],
		prd.[Cat_Promoter_Sum],
		prd.[Chem_1_Sum],
		prd.[Chem_2_Sum],
		prd.[Chlorine_Control_Sum],
		prd.[Defoamer_Sum],
		prd.[Dry_Strength_Facial_Sum],
		prd.[Dry_Strength_Tissue_Sum],
		prd.[Recycle_Fiber_Sum],
		prd.[Dry_Strength_Towel_Sum],
		prd.[Dye_1_Sum],
		prd.[Dye_2_Sum],
		prd.[Emulsion_1_Sum],
		prd.[Emulsion_2_Sum],
		prd.[Flocculant_Sum],
		prd.[Glue_Adhesive_Sum],
		prd.[Glue_Crepe_Aid_Sum],
		prd.[Glue_Release_Aid_Sum],
		prd.[Glue_Total_Sum],
		prd.[pH_Control_Tissue_Acid_Sum],
		prd.[pH_Control_Towel_Base_Sum],
		prd.[Single_Glue_Sum],
		prd.[Softener_Facial_Sum],
		prd.[Softener_Tissue_Sum],
		prd.[Softener_Towel_Sum],
		prd.[Wet_Strength_Facial_Sum],
		prd.[Wet_Strength_Tissue_Sum],
		prd.[Wet_Strength_Towel_Sum],
		prd.[Air_Sum],
		prd.[Air_UOM],
		prd.[Air_Per_YKT],
		prd.[Electric_Sum],
		prd.[Electric_UOM],
		prd.[Electric_Per_YKT],
		prd.[Gas_Sum],
		prd.[Gas_UOM],
		prd.[Gas_Per_YKT],
		prd.[Steam_Sum],
		prd.[Steam_UOM],
		prd.[Steam_Per_YKT],
		prd.[Water_Sum],
		prd.[Water_UOM],
		prd.[Water_Per_YKT],
		prd.[GRHF_Tons],
		prd.[All_Tons],
		prd.[All_Furnish],
		prd.[All_Furnish_Perc_Calc],
		prd.[Total_Roll_Status_Cnt],
		prd.[Ts],
		prd.[DeleteFlag],
		prd.[GI_Downtime],
		prd.[GE_Downtime],
		prd.[GI_Uptime],
		prd.[GE_Uptime],
		prd.[RcdIdx],
		@SiteId AS SITE_DIMENSION_SiteId,
		ld.CentralLineId AS LINE_DIMENSION_CentralLineId
		FROM  @ProductionRawDataPM prd
		JOIN dbo.LINE_DIMENSION ld ON prd.PLID = ld.PLId AND ld.SITE_DIMENSION_SiteId = @SiteId
		WHERE NOT EXISTS (  SELECT * 
							FROM dbo.OpsDB_Production_Data_PM u 
							WHERE
							u.RCDIDX				= prd.RcdIdx AND 
							u.SITE_DIMENSION_SiteId = ld.SITE_DIMENSION_SiteId  AND
							u.LINE_DIMENSION_CentralLineId	= ld.CentralLineId
							) 




Update T SET
	T.[StartTime]                        =   S.[StartTime],
	T.[EndTime]                          =   S.[EndTime],
	T.[StartTimeUTC]                     =   S.[StartTimeUTC],
	T.[EndTimeUTC]                       =   S.[EndTimeUTC],
	T.[Site]                             =   S.[Site],
	T.[PLID]                             =   S.[PLID],
	T.[PLDesc]                           =   S.[PLDesc],
	T.[PUID]                             =   S.[PUID],
	T.[PUDesc]                           =   S.[PUDesc],
	T.[ProdId]                           =   S.[ProdId],
	T.[ProdCode]                         =   S.[ProdCode],
	T.[ProdDesc]                         =   S.[ProdDesc],
	T.[ProdFam]                          =   S.[ProdFam],
	T.[ProdGroup]                        =   S.[ProdGroup],
	T.[ShiftDesc]                        =   S.[ShiftDesc],
	T.[TeamDesc]                         =   S.[TeamDesc],
	T.[NPTStatus]                        =   S.[NPTStatus],
	T.[ProcessOrder]                     =   S.[ProcessOrder],
	T.[ProductTime]                      =   S.[ProductTime],
	T.[GoodTons]                         =   S.[GoodTons],
	T.[RejectTons]                       =   S.[RejectTons],
	T.[HoldTons]                         =   S.[HoldTons],
	T.[FireTons]                         =   S.[FireTons],
	T.[LastCleaningBlades]				 =	 S.[LastCleaningBlades],
	T.[LastCrepingBlades]				 =	 S.[LastCrepingBlades],
	T.[LifeCrepingBlades]				 =	 S.[LifeCrepingBlades],
	T.[LifeCleaningBlades]				 =	 S.[LifeCleaningBlades],
	T.[TAYTons]                          =   S.[TAYTons],
	T.[SlabTons]                         =   S.[SlabTons],
	T.[RepulperTons]                     =   S.[RepulperTons],
	T.[TeardownTons]                     =   S.[TeardownTons],
	T.[RATons]                           =   S.[RATons],
	T.[TotalTons]                        =   S.[TotalTons],
	T.[UnExpTons]                        =   S.[UnExpTons],
	T.[GoodRolls]                        =   S.[GoodRolls],
	T.[RejectRolls]                      =   S.[RejectRolls],
	T.[HoldRolls]                        =   S.[HoldRolls],
	T.[FireRolls]                        =   S.[FireRolls],
	T.[CleaningBlades]                   =   S.[CleaningBlades],
	T.[CrepingBlades]                    =   S.[CrepingBlades],
	T.[Sheetbreaks]                      =   S.[Sheetbreaks],
	T.[SheetbreaksTime]                  =   S.[SheetbreaksTime],
	T.[Stops]                            =   S.[Stops],
	T.[YankeeSpeedSum]                   =   S.[YankeeSpeedSum],
	T.[YankeeSpeedCount]                 =   S.[YankeeSpeedCount],
	T.[ReelSpeedSum]                     =   S.[ReelSpeedSum],
	T.[ReelSpeedCount]                   =   S.[ReelSpeedCount],
	T.[FormingWireLife]                  =   S.[FormingWireLife],
	T.[BackingWireLife]                  =   S.[BackingWireLife],
	T.[BeltLife]                         =   S.[BeltLife],
	T.[Belt_Id]                          =   S.[Belt_Id],
	T.[T3rd_Furnish_Sum]                 =   S.[T3rd_Furnish_Sum],
	T.[CTMP_Sum]                         =   S.[CTMP_Sum],
	T.[Fiber_1_Sum]                      =   S.[Fiber_1_Sum],
	T.[Fiber_2_Sum]                      =   S.[Fiber_2_Sum],
	T.[Long_Fiber_Sum]                   =   S.[Long_Fiber_Sum],
	T.[Machine_Broke_Sum]                =   S.[Machine_Broke_Sum],
	T.[Product_Broke_Sum]                =   S.[Product_Broke_Sum],
	T.[Short_Fiber_Sum]                  =   S.[Short_Fiber_Sum],
	T.[Absorb_Aid_Towel_Sum]             =   S.[Absorb_Aid_Towel_Sum],
	T.[Aloe_E_Additive_Sum]              =   S.[Aloe_E_Additive_Sum],
	T.[Biocide_Sum]                      =   S.[Biocide_Sum],
	T.[Cat_Promoter_Sum]                 =   S.[Cat_Promoter_Sum],
	T.[Chem_1_Sum]                       =   S.[Chem_1_Sum],
	T.[Chem_2_Sum]                       =   S.[Chem_2_Sum],
	T.[Chlorine_Control_Sum]             =   S.[Chlorine_Control_Sum],
	T.[Defoamer_Sum]                     =   S.[Defoamer_Sum],
	T.[Dry_Strength_Facial_Sum]          =   S.[Dry_Strength_Facial_Sum],
	T.[Dry_Strength_Tissue_Sum]          =   S.[Dry_Strength_Tissue_Sum],
	T.[Recycle_Fiber_Sum]                =   S.[Recycle_Fiber_Sum],
	T.[Dry_Strength_Towel_Sum]           =   S.[Dry_Strength_Towel_Sum],
	T.[Dye_1_Sum]                        =   S.[Dye_1_Sum],
	T.[Dye_2_Sum]                        =   S.[Dye_2_Sum],
	T.[Emulsion_1_Sum]                   =   S.[Emulsion_1_Sum],
	T.[Emulsion_2_Sum]                   =   S.[Emulsion_2_Sum],
	T.[Flocculant_Sum]                   =   S.[Flocculant_Sum],
	T.[Glue_Adhesive_Sum]                =   S.[Glue_Adhesive_Sum],
	T.[Glue_Crepe_Aid_Sum]               =   S.[Glue_Crepe_Aid_Sum],
	T.[Glue_Release_Aid_Sum]             =   S.[Glue_Release_Aid_Sum],
	T.[Glue_Total_Sum]                   =   S.[Glue_Total_Sum],
	T.[pH_Control_Tissue_Acid_Sum]       =   S.[pH_Control_Tissue_Acid_Sum],
	T.[pH_Control_Towel_Base_Sum]        =   S.[pH_Control_Towel_Base_Sum],
	T.[Single_Glue_Sum]                  =   S.[Single_Glue_Sum],
	T.[Softener_Facial_Sum]              =   S.[Softener_Facial_Sum],
	T.[Softener_Tissue_Sum]              =   S.[Softener_Tissue_Sum],
	T.[Softener_Towel_Sum]               =   S.[Softener_Towel_Sum],
	T.[Wet_Strength_Facial_Sum]          =   S.[Wet_Strength_Facial_Sum],
	T.[Wet_Strength_Tissue_Sum]          =   S.[Wet_Strength_Tissue_Sum],
	T.[Wet_Strength_Towel_Sum]           =   S.[Wet_Strength_Towel_Sum],
	T.[Air_Sum]                          =   S.[Air_Sum],
	T.[Air_UOM]                          =   S.[Air_UOM],
	T.[Air_Per_YKT]                      =   S.[Air_Per_YKT],
	T.[Electric_Sum]                     =   S.[Electric_Sum],
	T.[Electric_UOM]                     =   S.[Electric_UOM],
	T.[Electric_Per_YKT]                 =   S.[Electric_Per_YKT],
	T.[Gas_Sum]                          =   S.[Gas_Sum],
	T.[Gas_UOM]                          =   S.[Gas_UOM],
	T.[Gas_Per_YKT]                      =   S.[Gas_Per_YKT],
	T.[Steam_Sum]                        =   S.[Steam_Sum],
	T.[Steam_UOM]                        =   S.[Steam_UOM],
	T.[Steam_Per_YKT]                    =   S.[Steam_Per_YKT],
	T.[Water_Sum]                        =   S.[Water_Sum],
	T.[Water_UOM]                        =   S.[Water_UOM],
	T.[Water_Per_YKT]                    =   S.[Water_Per_YKT],
	T.[GRHF_Tons]                        =   S.[GRHF_Tons],
	T.[All_Tons]                         =   S.[All_Tons],
	T.[All_Furnish]                      =   S.[All_Furnish],
	T.[All_Furnish_Perc_Calc]            =   S.[All_Furnish_Perc_Calc],
	T.[Total_Roll_Status_Cnt]            =   S.[Total_Roll_Status_Cnt],
	T.[Ts]                               =   S.[Ts],
	T.[DeleteFlag]                       =   S.[DeleteFlag],
	T.[GI_Downtime]                      =   S.[GI_Downtime],
	T.[GE_Downtime]                      =   S.[GE_Downtime],
	T.[GI_Uptime]                        =   S.[GI_Uptime],
	T.[GE_Uptime]                        =   S.[GE_Uptime],
	T.[RcdIdx]                           =   S.[RcdIdx]
from dbo.OpsDB_Production_Data_PM T 
JOIN (
                SELECT                              
					prd.[StartTime],
					prd.[EndTime],
					prd.[StartTimeUTC],
					prd.[EndTimeUTC],
					prd.[Site],
					prd.[PLID],
					prd.[PLDesc],
					prd.[PUID],
					prd.[PUDesc],
					prd.[ProdId],
					prd.[ProdCode],
					prd.[ProdDesc],
					prd.[ProdFam],
					prd.[ProdGroup],
					prd.[ShiftDesc],
					prd.[TeamDesc],
					prd.[NPTStatus],
					prd.[ProcessOrder],
					prd.[ProductTime],
					prd.[GoodTons],
					prd.[RejectTons],
					prd.[HoldTons],
					prd.[FireTons],
					prd.[LastCleaningBlades],
					prd.[LastCrepingBlades],
					prd.[LifeCrepingBlades],
					prd.[LifeCleaningBlades],
					prd.[TAYTons],
					prd.[SlabTons],
					prd.[RepulperTons],
					prd.[TeardownTons],
					prd.[RATons],
					prd.[TotalTons],
					prd.[UnExpTons],
					prd.[GoodRolls],
					prd.[RejectRolls],
					prd.[HoldRolls],
					prd.[FireRolls],
					prd.[CleaningBlades],
					prd.[CrepingBlades],
					prd.[Sheetbreaks],
					prd.[SheetbreaksTime],
					prd.[Stops],
					prd.[YankeeSpeedSum],
					prd.[YankeeSpeedCount],
					prd.[ReelSpeedSum],
					prd.[ReelSpeedCount],
					prd.[FormingWireLife],
					prd.[BackingWireLife],
					prd.[BeltLife],
					prd.[Belt_Id],
					prd.[T3rd_Furnish_Sum],
					prd.[CTMP_Sum],
					prd.[Fiber_1_Sum],
					prd.[Fiber_2_Sum],
					prd.[Long_Fiber_Sum],
					prd.[Machine_Broke_Sum],
					prd.[Product_Broke_Sum],
					prd.[Short_Fiber_Sum],
					prd.[Absorb_Aid_Towel_Sum],
					prd.[Aloe_E_Additive_Sum],
					prd.[Biocide_Sum],
					prd.[Cat_Promoter_Sum],
					prd.[Chem_1_Sum],
					prd.[Chem_2_Sum],
					prd.[Chlorine_Control_Sum],
					prd.[Defoamer_Sum],
					prd.[Dry_Strength_Facial_Sum],
					prd.[Dry_Strength_Tissue_Sum],
					prd.[Recycle_Fiber_Sum],
					prd.[Dry_Strength_Towel_Sum],
					prd.[Dye_1_Sum],
					prd.[Dye_2_Sum],
					prd.[Emulsion_1_Sum],
					prd.[Emulsion_2_Sum],
					prd.[Flocculant_Sum],
					prd.[Glue_Adhesive_Sum],
					prd.[Glue_Crepe_Aid_Sum],
					prd.[Glue_Release_Aid_Sum],
					prd.[Glue_Total_Sum],
					prd.[pH_Control_Tissue_Acid_Sum],
					prd.[pH_Control_Towel_Base_Sum],
					prd.[Single_Glue_Sum],
					prd.[Softener_Facial_Sum],
					prd.[Softener_Tissue_Sum],
					prd.[Softener_Towel_Sum],
					prd.[Wet_Strength_Facial_Sum],
					prd.[Wet_Strength_Tissue_Sum],
					prd.[Wet_Strength_Towel_Sum],
					prd.[Air_Sum],
					prd.[Air_UOM],
					prd.[Air_Per_YKT],
					prd.[Electric_Sum],
					prd.[Electric_UOM],
					prd.[Electric_Per_YKT],
					prd.[Gas_Sum],
					prd.[Gas_UOM],
					prd.[Gas_Per_YKT],
					prd.[Steam_Sum],
					prd.[Steam_UOM],
					prd.[Steam_Per_YKT],
					prd.[Water_Sum],
					prd.[Water_UOM],
					prd.[Water_Per_YKT],
					prd.[GRHF_Tons],
					prd.[All_Tons],
					prd.[All_Furnish],
					prd.[All_Furnish_Perc_Calc],
					prd.[Total_Roll_Status_Cnt],
					prd.[Ts],
					prd.[DeleteFlag],
					prd.[GI_Downtime],
					prd.[GE_Downtime],
					prd.[GI_Uptime],
					prd.[GE_Uptime],
					prd.[RcdIdx],
					@SiteId AS SITE_DIMENSION_SiteId,
					ld.CentralLineId AS LINE_DIMENSION_CentralLineId
                FROM @ProductionRawDataPM prd
				JOIN dbo.LINE_DIMENSION ld ON prd.PLID = ld.PLId AND ld.SITE_DIMENSION_SiteId = @SiteId
) S ON (
			T.SITE_DIMENSION_SiteId			= s.SITE_DIMENSION_SiteId AND
			T.LINE_DIMENSION_CentralLineId	= S.LINE_DIMENSION_CentralLineId AND
			T.RcdIdx						= s.RcdIdx	
	    )


	UPDATE [dbo].[Transfer_Parameter_Data]
		SET LastModifytime = ( SELECT MAX(TS) FROM @ProductionRawDataPM )
	WHERE TableName = 'OpsDB_Production_Data_PM'
	AND SiteId = @SiteId

RETURN
;
GO

GRANT EXEC ON TYPE::[dbo].[OpsDB_Production_Data_PM_Type]  TO [LocalUser]
GO

GRANT EXECUTE ON OBJECT ::[dbo].splocal_InsertProductionRawDataPM  TO [LocalUser]
GO