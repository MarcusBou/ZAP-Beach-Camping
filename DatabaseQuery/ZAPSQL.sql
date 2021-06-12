USE ZAP_Beach_Camping;

DROP TABLE IF EXISTS BookingsLinked;
DROP TABLE IF EXISTS Attributeslinked;
DROP TABLE IF EXISTS SpotsLinked;
DROP TABLE IF EXISTS SpotsPriceLinked;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Booking;
DROP TABLE IF EXISTS Spot;
DROP TABLE IF EXISTS Prices;
DROP TABLE IF EXISTS Attributes;

--Tables
CREATE TABLE Customer (
	customerID INT IDENTITY(1,1) PRIMARY KEY,
	firstName VARCHAR(255),
	lastName VARCHAR(255),
	email VARCHAR(255),
	phonenumb VARCHAR(12),
	adress VARCHAR(255)
);

CREATE TABLE Booking(
	bookingID INT IDENTITY(1,1) PRIMARY KEY,
	startDate DATE,
	endDate DATE,
	type VARCHAR(255),
	adult INT,
	child INT,
	dogs INT,
	fullprice FLOAT
);

CREATE TABLE Spot(
	spotID INT IDENTITY(1,1) PRIMARY KEY,
	hasView BIT
);

CREATE TABLE Prices(
	nameKey VARCHAR(255) PRIMARY KEY,
	lowSeason FLOAT,
	highSeason FLOAT
);

CREATE TABLE Attributes(
	attrType VARCHAR(255) PRIMARY KEY,
	price FLOAT
);

--Table's with foreign keys
CREATE TABLE BookingsLinked(
	customerID INT,
	bookingID INT,
	CONSTRAINT FK_Bookings_CustomerIDBook FOREIGN KEY (customerID) REFERENCES Customer(customerID),
	CONSTRAINT FK_Bookings_BookingIDBook FOREIGN KEY (bookingID) REFERENCES Booking(bookingID),
	CONSTRAINT PK_BookingsLinked PRIMARY KEY (customerID, bookingID)
);

CREATE TABLE Attributeslinked(
	bookingID INT,
	attributeID VARCHAR(255),
	amount INT,
	CONSTRAINT FK_Attributes_BookingID FOREIGN KEY (bookingID) REFERENCES Booking(bookingID),
	CONSTRAINT FK_Attributes_AttributeID FOREIGN KEY (attributeID) REFERENCES Attributes(attrType),
	CONSTRAINT PK_AtrributesLinked PRIMARY KEY (bookingID, attributeID)
);

CREATE TABLE SpotsLinked(
	bookingID INT,
	spotID INT,
	CONSTRAINT FK_Spots_BookingID FOREIGN KEY (bookingID) REFERENCES Booking(bookingID),
	CONSTRAINT FK_Spots_SpotID FOREIGN KEY (spotID) REFERENCES Spot(spotID),
	CONSTRAINT FK_SpotsLinked PRIMARY KEY (bookingID, spotID)
);

CREATE TABLE SpotsPriceLinked(
	spotID INT,
	priceID VARCHAR(255),
	CONSTRAINT FK_SpotsPrice_PriceID FOREIGN KEY (priceID) REFERENCES Prices(nameKey),
	CONSTRAINT FK_SpotsPrice_SpotID FOREIGN KEY (spotID) REFERENCES Spot(spotID),
	CONSTRAINT PK_SpotsPriceLinked PRIMARY KEY (spotID,priceID)
);

--Attributes;
INSERT INTO Attributes VALUES ('Sengelinned',30);
INSERT INTO Attributes VALUES ('MorgenKomplet (Voksen)', 75);
INSERT INTO Attributes VALUES ('MorgenKomplet (Børn)', 50);
INSERT INTO Attributes VALUES ('Slutrengøring', 150);
INSERT INTO Attributes VALUES ('Cykelleje', 200);
INSERT INTO Attributes VALUES ('Adgang til Badeland (Voksen)', 30);
INSERT INTO Attributes VALUES ('Adgang til Badeland (Børn)', 15);

--Prices
INSERT INTO Prices VALUES ('Campingvognplads (lille)', 60,50);
INSERT INTO Prices VALUES ('Campingvognplads (Stor)', 80, 65);
INSERT INTO Prices VALUES ('Teltplads', 35, 45);
INSERT INTO Prices VALUES ('Standard Hytte', 500, 350);
INSERT INTO Prices VALUES ('Luksus Hytte', 850, 600);
INSERT INTO Prices VALUES ('Voksne', 82, 87);
INSERT INTO Prices VALUES ('Børn', 42, 49);
INSERT INTO Prices VALUES ('Hund', 30, 30);