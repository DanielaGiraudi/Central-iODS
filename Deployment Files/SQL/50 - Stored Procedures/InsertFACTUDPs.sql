--DROP PROCEDURE splocal_InsertFACTUDPs;
--GO

CREATE PROCEDURE splocal_InsertFACTUDPs
  @FACTUDPs [dbo].[FACT_UDPs_Type] READONLY
AS
	DECLARE @SiteId INTEGER

	SELECT TOP 1 @SiteId = sd.SiteId 
	FROM @FACTUDPs fudp
	JOIN SITE_DIMENSION sd ON fudp.DataServerName = sd.DataServerName
	
	INSERT INTO dbo.FACT_UDPs (
		[VarId],
		[VarDesc],
		[Value],
		[EffectiveDate],
		[ExpirationDate],
		[UDP_Dimension_UDPIdx],
		[History_id],
		[Idx],
		[SITE_DIMENSION_SiteId]
	)	
	SELECT
		fudp.[VarId],
		fudp.[VarDesc],
		fudp.[Value],
		fudp.[EffectiveDate],
		fudp.[ExpirationDate],
		udpd.[centralUDPIdx],
		fudp.[History_id],
		fudp.[Idx],
		@SiteId AS SITE_DIMENSION_SiteId
		FROM  @FACTUDPs fudp 
		JOIN dbo.UDP_Dimension udpd ON
						fudp.UDP_Dimension_UDPIdx = udpd.UDPIdx AND
						udpd.SITE_DIMENSION_SiteId = @SiteId
		WHERE NOT EXISTS (  SELECT * 
							FROM dbo.FACT_UDPs u 
							WHERE
							u.[Idx]					= fudp.[Idx] AND 
							u.SITE_DIMENSION_SiteId = @SiteId
							) 




Update T SET
	T.[VarId]					=	S.[VarId],	
	T.[VarDesc]					=	S.[VarDesc],
	T.[Value]					=	S.[Value],
	T.[EffectiveDate]			=	S.[EffectiveDate],
	T.[ExpirationDate]			=	S.[ExpirationDate],
	T.[UDP_Dimension_UDPIdx]	=	S.[UDP_Dimension_UDPIdx],
	T.[History_id]				=	S.[History_id],
	T.[Idx]						=	S.[Idx]
from dbo.FACT_UDPs T 
JOIN (
                SELECT                              
					fudp.[VarId],
					fudp.[VarDesc],
					fudp.[Value],
					fudp.[EffectiveDate],
					fudp.[ExpirationDate],
					udpd.[centralUDPIdx] AS [UDP_Dimension_UDPIdx],
					fudp.[History_id],
					fudp.[Idx],
					@SiteId AS SITE_DIMENSION_SiteId
                FROM @FACTUDPs fudp
				JOIN dbo.UDP_Dimension udpd ON
						fudp.UDP_Dimension_UDPIdx = udpd.UDPIdx AND
						udpd.SITE_DIMENSION_SiteId = @SiteId
) S ON (
			T.SITE_DIMENSION_SiteId			= s.SITE_DIMENSION_SiteId AND
			T.Idx							= s.Idx	
	    )


	UPDATE [dbo].[Transfer_Parameter_Data]
		SET LastModifytime = ( SELECT MAX(EffectiveDate) FROM @FACTUDPs )
	WHERE TableName = 'FACT_UDPs'
	AND SiteId = @SiteId

RETURN
;
GO

GRANT EXEC ON TYPE::[dbo].[FACT_UDPs_Type]  TO [LocalUser]
GO

GRANT EXECUTE ON OBJECT ::[dbo].splocal_InsertFACTUDPs  TO [LocalUser]
GO