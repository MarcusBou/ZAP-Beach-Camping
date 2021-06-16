CREATE OR ALTER PROCEDURE AddNewBooking
	@fName VARCHAR(255),
	@lName VARCHAR(255),
	@email VARCHAR(255),
	@phoneNum VARCHAR(12),
	@address VARCHAR(255),
	@startDate DATE,
	@endDate DATE,
	@type VARCHAR(255),
	@adult INT,
	@child INT,
	@dogs INT,
	@AdgangBadB INT,
	@AdgangBadA INT,
	@Cykelleje INT,
	@MorgenKompletB INT,
	@MorgenKompletA INT,
	@Sengelinned INT,
	@Slutrengoring TINYINT,
	@hasView TINYINT
AS
BEGIN
	INSERT INTO [dbo].[Customer](firstName, lastName, email, phonenumb, adress) VALUES (@fName, @lName, @email, @phoneNum, @address);
	DECLARE @CustID INT;
	SELECT @CustID = SCOPE_IDENTITY();
	INSERT INTO [dbo].[Booking](startDATE, endDATE, type, adult, child, dogs) VALUES (@startDate, @endDate, @type, @adult, @child, @dogs);
	DECLARE @BookID INT;
	SELECT @BookID = SCOPE_IDENTITY();
	INSERT INTO [dbo].[BookingsLinked](customerID, bookingID) VALUES (@CustID, @BookID);
	INSERT INTO [dbo].[Attributeslinked](bookingID, attributeID, amount) VALUES (@BookID, 'Adgang til Badeland (Barn)', @AdgangBadB);
	INSERT INTO [dbo].[Attributeslinked](bookingID, attributeID, amount) VALUES (@BookID, 'Adgang til Badeland (Voksen)', @AdgangBadA);
	INSERT INTO [dbo].[Attributeslinked](bookingID, attributeID, amount) VALUES (@BookID, 'Cykelleje', @Cykelleje);
	INSERT INTO [dbo].[Attributeslinked](bookingID, attributeID, amount) VALUES (@BookID, 'MorgenKomplet (Barn)', @MorgenKompletB);
	INSERT INTO [dbo].[Attributeslinked](bookingID, attributeID, amount) VALUES (@BookID, 'MorgenKomplet (Voksen)', @MorgenKompletA);
	INSERT INTO [dbo].[Attributeslinked](bookingID, attributeID, amount) VALUES (@BookID, 'Sengelinned', @Sengelinned);
	INSERT INTO [dbo].[Attributeslinked](bookingID, attributeID, amount) VALUES (@BookID, 'Slutrengoring', @Slutrengoring);
	EXEC CheckSpot @type, @hasView, @startDate, @endDate, @BookID;
END

EXEC AddNewBooking 'Cusser', 'Kasser', 'PabloEscobar@gmail.com', '88888888', 'Bævervej 88', '2021-07-18', '2021-07-20', 'Luksus Hytte', 4, 6, 1, 6, 4, 2, 6, 4, 1, 0, 0;
SELECT * FROM SpotsPriceLinked;