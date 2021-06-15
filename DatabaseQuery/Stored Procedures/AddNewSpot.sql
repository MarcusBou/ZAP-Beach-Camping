SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Daniel Vuust
-- Create date: 15-06-21
-- Description:	Adds a new spot and connectes it to a price.
-- =============================================
CREATE OR ALTER PROCEDURE AddNewSpot 
	-- Add the parameters for the stored procedure here
	 
	@hasView bit,
	@type varChar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--- Creates a new table to save the spotID that is inserted to the Spot table.
	DECLARE @newSpot table(
		spotID int
	);

    -- Inserts the Spot to the table and saves the spotID in the @newSpot table.
	 INSERT INTO Spot (hasView)
		OUTPUT Inserted.spotID INTO @newSpot
		Values (@hasView);	

	--- Connectes the spotID to the priceKey in the SpotPriceLinked table.
	INSERT INTO SpotsPriceLinked (spotID, priceID) VALUES ((SELECT spotID FROM Spot WHERE spotID = (SELECT spotID FROM @newSpot)), (SELECT nameKey FROM Prices WHERE nameKey = @type));
	IF (@type ='Campingvognplads (lille)')
	BEGIN
	INSERT INTO SpotsPriceLinked (spotID, priceID) VALUES ((SELECT spotID FROM Spot WHERE spotID = (SELECT spotID FROM @newSpot)), (SELECT nameKey FROM Prices WHERE nameKey = 'Teltplads'));
	END
END
GO