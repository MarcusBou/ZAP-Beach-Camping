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
	
    -- Insert statements for procedure here
	DECLARE @spotIDTable TABLE(
		id int IDENTITY(1,1),
		spotID int
	);
	DECLARE @startEndDate Table (
			id int IDENTITY(1,1),
			startDate date,
			endDate date
		);
	--- Gets all the spots that is the right type
	INSERT INTO @spotIDTable
		SELECT Spot.spotID
		FROM Spot
			INNER JOIN SpotsPriceLinked ON Spot.spotID = SpotsPriceLinked.spotID
			WHERE SpotsPriceLinked.priceID = @type AND Spot.hasView = @hasView;

	
	DECLARE @idsForEachSpot INT;
	SELECT @idsForEachSpot = Max(id) FROM @spotIDTable;

	DECLARE @i int = 1;

	WHILE @i <= @idsForEachSpot
	BEGIN
		
		INSERT INTO @startEndDate
		SELECT Booking.startDate, Booking.endDate
			FROM @spotIDTable 
				INNER JOIN SpotsLinked ON [@spotIDTable].[spotID] = SpotsLinked.spotID
				INNER JOIN Booking ON SpotsLinked.bookingID = Booking.bookingID
				WHERE id = @idsForEachSpot;

		DECLARE @startDate DATE;
		DECLARE @endDate DATE;
		DECLARE @j int = 0;
		DECLARE @bookingsPerSpot INT;
		SELECT @bookingsPerSpot = MAX(id) FROM @startEndDate;

		WHILE @j < @bookingsPerSpot
		BEGIN
			SET @j = @j + 1;
			SELECT @startDate = startDate FROM @startEndDate WHERE id = @j;
			
			SELECT @endDate = endDate FROM @startEndDate WHERE id = @j;
			DECLARE @Booked bit = 0;
			IF (@startDato > @startDate AND @startDato < @endDate OR @slutDato > @startDate AND @slutDato < @endDate)
			BEGIN
				SET @Booked = 1;
				BREAK
			END
			ELSE IF (@startDate > @startDato AND @startDate < @slutDato OR @endDate> @startDato AND @endDate < @slutDato)
			BEGIN
				SET @Booked = 1;
				BREAK
			END
		---Deletes the table so its ready for the next loop
			DELETE FROM @startEndDate;
			
		END
		if(@Booked = 0)
		BEGIN
			PRINT('is not booked');
			RETURN (SELECT spotID FROM @spotIDTable WHERE id =@j);
		END
		SET @i = @i + 1;
	END
	RETURN 0;
END
GO