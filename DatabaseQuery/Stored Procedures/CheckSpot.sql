SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE CheckSpot
	-- Add the parameters for the stored procedure here
	@type varChar(50),
	@hasView bit,
	@startDato date,
	@slutDato date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON
	
    
	DECLARE @spotIDTable TABLE(
		id int IDENTITY(1,1),
		spotID int
	);
	DECLARE @startEndDate Table (
			id int IDENTITY(1,1),
			startDate date,
			endDate date
		);

	--- Gets all the spots that is the right type(hasView or not and type).
	INSERT INTO @spotIDTable
		SELECT Spot.spotID
		FROM Spot
			INNER JOIN SpotsPriceLinked ON Spot.spotID = SpotsPriceLinked.spotID
			WHERE SpotsPriceLinked.priceID = @type AND Spot.hasView = @hasView;

	
	DECLARE @idsForEachSpot INT;
	SELECT @idsForEachSpot = Max(id) FROM @spotIDTable;

	DECLARE @i int = 1;

	--- Loops through each spot that match the settings (hasView or not and type).
	WHILE @i <= @idsForEachSpot
	BEGIN
		--- Gets all bookings and thier start and end date and saves it in @startEndDate.
		INSERT INTO @startEndDate
		SELECT Booking.startDate, Booking.endDate
			FROM @spotIDTable 
				INNER JOIN SpotsLinked ON [@spotIDTable].[spotID] = SpotsLinked.spotID
				INNER JOIN Booking ON SpotsLinked.bookingID = Booking.bookingID
				WHERE id = @idsForEachSpot;

		
		

		--- Gets the number of bookings for each spot to be looped through later.
		DECLARE @bookingsPerSpot INT;
		SELECT @bookingsPerSpot = MAX(id) FROM @startEndDate;
		--- The number used to loop throgh bookings.
		DECLARE @j int = 0;

		---Is true is the spot is booked in on the specific days.
		DECLARE @Booked bit = 0;
		
		--- Loopes one per booking to check the new booking overlaps a booking already made.
		WHILE @j < @bookingsPerSpot
		BEGIN
			SET @j = @j + 1;
			---Gets the start and end date for the booking that is being looped through.
			DECLARE @startDate DATE;
			DECLARE @endDate DATE;
			SELECT @startDate = startDate FROM @startEndDate WHERE id = @j;
			SELECT @endDate = endDate FROM @startEndDate WHERE id = @j;

			---If the booking being looped through and the new booking collide then the bit @booked change to 1. 
			IF (@startDato > @startDate AND @startDato < @endDate OR @slutDato > @startDate AND @slutDato < @endDate)
			BEGIN
				SET @Booked = 1;
				BREAK
			END
			---If the booking being looped through and the new booking collide then the bit @booked change to 1. 
			ELSE IF (@startDate > @startDato AND @startDate < @slutDato OR @endDate> @startDato AND @endDate < @slutDato)
			BEGIN
				SET @Booked = 1;
				BREAK
			END

			--- Deletes the table so its ready for the next loop
			DELETE FROM @startEndDate;
			
		END
		--- If the spot is clear then the spot that is clear is returned.
		if(@Booked = 0)
		BEGIN

			DECLARE @clearSpot int = 0;
			SELECT @clearSpot = spotID FROM @spotIDTable WHERE @i = id;
			PRINT(@clearSpot);
			RETURN (@clearSpot);
		END
		--- Makes so the next spot will be looped though if the spot is not clear.
		SET @i = @i + 1;
	END
	PRINT('No spots are clear');
	--- IF nothing hasa already been returned then it will return 0 to signifie that there are no avalible booking on the specific dates.
	RETURN 0;
END
GO