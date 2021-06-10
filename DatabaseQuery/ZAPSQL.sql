DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Booking;
DROP TABLE IF EXISTS Spot;
DROP TABLE IF EXISTS Prices;
DROP TABLE IF EXISTS Attributes;

CREATE TABLE Customer (
	customerID INT PRIMARY KEY,
	firstName VARCHAR(255),
	lastName VARCHAR(255),
	email VARCHAR(255),
	phonenumb VARCHAR(12),
	adress VARCHAR(255)
);


CREATE TABLE Booking(
	bookingID INT PRIMARY KEY,
	startDATE DATE,
	endDATE DATE,
	type VARCHAR(255),
	adult INT,
	child INT,
	dogs INT,
	fullprice FLOAT
);

CREATE TABLE Spot(
	spotID INT PRIMARY KEY,
	hasView BIT
);

CREATE TABLE Prices(
	nameKey VARCHAR(255) PRIMARY KEY,
	lowSeason FLOAT,
	highSeason FLOAT
);

CREATE TABLE Attributes(
	attrType VARCHAR(255),
	price FLOAT
);

CREATE TABLE BookingsLinked(
	customerID INT,
	bookingID INT,
	CONSTRAINT FK_CustomerID FOREIGN KEY (customerID) REFERENCES Customer(customerID),
	CONSTRAINT FK_BookingID FOREIGN KEY (bookingID) REFERENCES Booking(bookingID),
	CONSTRAINT PK_BookingsLinked PRIMARY KEY (customerID, bookingID)
);
