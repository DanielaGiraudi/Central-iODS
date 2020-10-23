--DROP PROCEDURE splocal_InsertUDPDimension
--GO

CREATE PROCEDURE splocal_InsertUDPDimension
  @UDPDimensions [dbo].[UDP_Dimension_Type] READONLY
AS
	DECLARE @SiteId INTEGER

	SELECT TOP 1 @SiteId = sd.SiteId
	FROM @UDPDimensions udpd
	JOIN SITE_DIMENSION sd ON udpd.DataServerName = sd.DataServerName

	INSERT INTO dbo.UDP_Dimension (
		[TableId],
		[TableName],
		[UDPName],
		[DataType],
		[UDPIdx],
		[SITE_DIMENSION_SiteId]
	)
	SELECT
		udpd.[TableId],
		udpd.[TableName],
		udpd.[UDPName],
		udpd.[DataType],
		udpd.[UDPIdx],
		@SiteId AS SITE_DIMENSION_SiteId
		FROM  @UDPDimensions udpd
		WHERE NOT EXISTS (  SELECT *
							FROM dbo.UDP_Dimension u
							WHERE
							u.UDPIdx					= udpd.UDPIdx AND
							u.SITE_DIMENSION_SiteId		= @SiteId
							)

Update T SET
	T.[TableId]					= T.[TableId],
	T.[TableName]				= T.[TableName],
	T.[UDPName]					= T.[UDPName],
	T.[DataType]				= T.[DataType],
	T.[UDPIdx]					= T.[UDPIdx]
from dbo.UDP_Dimension T
JOIN (
				SELECT
					udpd.[TableId],
					udpd.[TableName],
					udpd.[UDPName],
					udpd.[DataType],
					udpd.[UDPIdx],
					@SiteId AS SITE_DIMENSION_SiteId
				FROM @UDPDimensions udpd
) S ON (
			T.SITE_DIMENSION_SiteId			= s.SITE_DIMENSION_SiteId AND
			T.UDPIdx						= s.UDPIdx
		)

RETURN
GO

GRANT EXEC ON TYPE::[dbo].[UDP_Dimension_Type]  TO [LocalUser]
GO

GRANT EXECUTE ON OBJECT ::[dbo].splocal_InsertUDPDimension  TO [LocalUser]
GO