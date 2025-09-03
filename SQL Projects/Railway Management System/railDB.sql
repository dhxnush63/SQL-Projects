create database if not exists railDB;
use railDB;

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(15),
    Address TEXT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Stations (
    StationID INT PRIMARY KEY,
    StationName VARCHAR(255) NOT NULL,
    Location VARCHAR(255) NOT NULL
);

CREATE TABLE Routes (
    RouteID INT PRIMARY KEY,
    SourceStationID INT,
    DestinationStationID INT,
    Distance DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (SourceStationID) REFERENCES Stations(StationID),
    FOREIGN KEY (DestinationStationID) REFERENCES Stations(StationID)
);

CREATE TABLE Trains (
    TrainID INT PRIMARY KEY,
    TrainNumber VARCHAR(10) NOT NULL,
    TrainName VARCHAR(255),
    RouteID INT,
    FOREIGN KEY (RouteID) REFERENCES Routes(RouteID)
);

CREATE TABLE Schedules (
    ScheduleID INT PRIMARY KEY,
    TrainID INT,
    DepartureTime TIMESTAMP NOT NULL,
    ArrivalTime TIMESTAMP NOT NULL,
    DaysOfOperation VARCHAR(50) NOT NULL,  -- e.g., 'Mon-Wed-Fri'
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID)
);


CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    UserID INT,
    TrainID INT,
    ScheduleID INT,
    BookingStatus VARCHAR(50) NOT NULL,  -- e.g., 'Confirmed', 'Cancelled'
    BookingDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (ScheduleID) REFERENCES Schedules(ScheduleID)
);


CREATE TABLE Seats (
    SeatID INT PRIMARY KEY,
    TrainID INT,
    SeatNumber VARCHAR(10) NOT NULL,
    ClassType VARCHAR(50) NOT NULL,  -- e.g., 'Economy', 'Business'
    AvailabilityStatus VARCHAR(50) NOT NULL,  -- e.g., 'Available', 'Booked'
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID)
);

INSERT INTO Stations (StationID, StationName, Location) VALUES (1, 'StationA', 'City1');
INSERT INTO Stations (StationID, StationName, Location) VALUES (2, 'StationB', 'City2');

INSERT INTO Routes (RouteID, SourceStationID, DestinationStationID, Distance) VALUES (1, 1, 2, 150.5);

INSERT INTO Trains (TrainID, TrainNumber, TrainName, RouteID) VALUES (1, 'T123', 'Express Train', 1);

INSERT INTO Schedules (ScheduleID, TrainID, DepartureTime, ArrivalTime, DaysOfOperation)
VALUES 
(
  1,
  1,
  STR_TO_DATE('2025-08-21 08:00:00','%Y-%m-%d %H:%i:%s'), 
  STR_TO_DATE('2025-08-21 12:00:00','%Y-%m-%d %H:%i:%s'),
  'Daily'
);

SELECT 
    t.TrainNumber,
    r.Distance,
    s.ClassType,
    CASE 
  WHEN DATE_FORMAT(sch.DepartureTime, '%a') IN ('Sat', 'Sun') THEN r.Distance * 0.5 * 1.1
  ELSE r.Distance * 0.5
END AS CalculatedFare
FROM 
    Trains t
    JOIN Routes r ON t.RouteID = r.RouteID
    JOIN Schedules sch ON t.TrainID = sch.TrainID
    JOIN Seats s ON t.TrainID = s.TrainID
WHERE 
    t.TrainID = 1  
    AND s.ClassType = 'Economy'
    AND sch.DepartureTime > SYSDATE(); 
    
    SELECT 
    t.TrainNumber,
    sch.DepartureTime,
    COUNT(s.SeatID) AS AvailableSeats
FROM 
    Trains t
    JOIN Schedules sch ON t.TrainID = sch.TrainID
    JOIN Seats s ON t.TrainID = s.TrainID
    LEFT JOIN Bookings b ON s.SeatID = b.BookingID AND b.BookingDate = STR_TO_DATE('2025-08-21', 'YYYY-MM-DD')  
WHERE 
    s.AvailabilityStatus = 'Available'
    AND sch.DepartureTime BETWEEN '2025-08-21 00:00:00'
                          AND '2025-08-21 23:59:59'
    AND b.BookingID IS NULL  
GROUP BY 
    t.TrainNumber, sch.DepartureTime
HAVING 
    COUNT(s.SeatID) > 0;
    
  SELECT 
  t.TrainNumber,
  GROUP_CONCAT(st.StationName ORDER BY sch.DepartureTime SEPARATOR ' -> ') AS RoutePath
FROM 
  Trains t
  JOIN Routes r ON t.RouteID = r.RouteID
  JOIN Stations st ON r.SourceStationID = st.StationID OR r.DestinationStationID = st.StationID
  JOIN Schedules sch ON t.TrainID = sch.TrainID
GROUP BY t.TrainNumber;

INSERT INTO Users (UserID, Username, Email, PasswordHash, PhoneNumber, Address, CreatedAt)
SELECT 2, 'alice', 'alice@email.com', 'hash1', '1234567890', 'Address 1', CURRENT_TIMESTAMP UNION ALL
SELECT 3, 'bob', 'bob@email.com', 'hash2', '1234567891', 'Address 2', CURRENT_TIMESTAMP UNION ALL
SELECT 4, 'carol', 'carol@email.com', 'hash3', '1234567892', 'Address 3', CURRENT_TIMESTAMP UNION ALL
SELECT 5, 'dave', 'dave@email.com', 'hash4', '1234567893', 'Address 4', CURRENT_TIMESTAMP UNION ALL
SELECT 6, 'eve', 'eve@email.com', 'hash5', '1234567894', 'Address 5', CURRENT_TIMESTAMP UNION ALL
SELECT 7, 'frank', 'frank@email.com', 'hash6', '1234567895', 'Address 6', CURRENT_TIMESTAMP UNION ALL
SELECT 8, 'grace', 'grace@email.com', 'hash7', '1234567896', 'Address 7', CURRENT_TIMESTAMP UNION ALL
SELECT 9, 'heidi', 'heidi@email.com', 'hash8', '1234567897', 'Address 8', CURRENT_TIMESTAMP UNION ALL
SELECT 10, 'ivan', 'ivan@email.com', 'hash9', '1234567898', 'Address 9', CURRENT_TIMESTAMP UNION ALL
SELECT 11, 'judy', 'judy@email.com', 'hash10', '1234567899', 'Address 10', CURRENT_TIMESTAMP;


INSERT INTO Stations (StationID, StationName, Location)
SELECT 3, 'StationC', 'City3' UNION ALL
SELECT 4, 'StationD', 'City4' UNION ALL
SELECT 5, 'StationE', 'City5' UNION ALL
SELECT 6, 'StationF', 'City6' UNION ALL
SELECT 7, 'StationG', 'City7' UNION ALL
SELECT 8, 'StationH', 'City8' UNION ALL
SELECT 9, 'StationI', 'City9' UNION ALL
SELECT 10, 'StationJ', 'City10' UNION ALL
SELECT 11, 'StationK', 'City11' UNION ALL
SELECT 12, 'StationL', 'City12';


INSERT INTO Routes (RouteID, SourceStationID, DestinationStationID, Distance)
SELECT 2, 3, 4, 120.0 UNION ALL
SELECT 3, 5, 6, 180.5 UNION ALL
SELECT 4, 7, 8, 75.3 UNION ALL
SELECT 5, 9, 10, 200.0 UNION ALL
SELECT 6, 1, 5, 250.0 UNION ALL
SELECT 7, 2, 7, 60.0 UNION ALL
SELECT 8, 4, 9, 140.5 UNION ALL
SELECT 9, 6, 10, 90.0 UNION ALL
SELECT 10, 3, 11, 110.0 UNION ALL
SELECT 11, 8, 12, 95.5;


INSERT INTO Trains (TrainID, TrainNumber, TrainName, RouteID)
SELECT 2, 'T124', 'Local Train', 2 UNION ALL
SELECT 3, 'T125', 'Rapid Train', 3 UNION ALL
SELECT 4, 'T126', 'Express A', 4 UNION ALL
SELECT 5, 'T127', 'Express B', 5 UNION ALL
SELECT 6, 'T128', 'Cargo Train', 6 UNION ALL
SELECT 7, 'T129', 'Night Train', 7 UNION ALL
SELECT 8, 'T130', 'Metro', 8 UNION ALL
SELECT 9, 'T131', 'Tourist', 9 UNION ALL
SELECT 10, 'T132', 'Shuttle', 10 UNION ALL
SELECT 11, 'T133', 'High-Speed', 11;


INSERT INTO Schedules (ScheduleID, TrainID, DepartureTime, ArrivalTime, DaysOfOperation)
SELECT 2, 2, '2025-08-22 07:00:00', '2025-08-22 09:00:00', 'Mon-Wed-Fri' UNION ALL
SELECT 3, 3, '2025-08-23 08:00:00', '2025-08-23 12:00:00', 'Tue-Thu' UNION ALL
SELECT 4, 4, '2025-08-24 15:00:00', '2025-08-24 18:00:00', 'Daily' UNION ALL
SELECT 5, 5, '2025-08-25 14:00:00', '2025-08-25 17:00:00', 'Weekends' UNION ALL
SELECT 6, 6, '2025-08-26 06:00:00', '2025-08-26 10:00:00', 'Mon-Fri' UNION ALL
SELECT 7, 7, '2025-08-27 22:00:00', '2025-08-28 03:00:00', 'Mon,Wed' UNION ALL
SELECT 8, 8, '2025-08-28 05:00:00', '2025-08-28 08:00:00', 'Fri' UNION ALL
SELECT 9, 9, '2025-08-29 10:00:00', '2025-08-29 14:00:00', 'Daily' UNION ALL
SELECT 10, 10, '2025-08-30 09:00:00', '2025-08-30 13:00:00', 'Weekly' UNION ALL
SELECT 11, 11, '2025-08-31 11:00:00', '2025-08-31 15:00:00', 'Daily';


INSERT INTO Bookings (BookingID, UserID, TrainID, ScheduleID, BookingStatus, BookingDate, TotalAmount)
SELECT 2, 2, 2, 2, 'Confirmed', '2025-08-21', 40.0 UNION ALL
SELECT 3, 3, 3, 3, 'Cancelled', '2025-08-22', 45.0 UNION ALL
SELECT 4, 4, 4, 4, 'Confirmed', '2025-08-23', 55.0 UNION ALL
SELECT 5, 5, 5, 5, 'Confirmed', '2025-08-24', 60.0 UNION ALL
SELECT 6, 6, 6, 6, 'Cancelled', '2025-08-25', 70.0 UNION ALL
SELECT 7, 7, 7, 7, 'Confirmed', '2025-08-26', 65.0 UNION ALL
SELECT 8, 8, 8, 8, 'Confirmed', '2025-08-27', 75.0 UNION ALL
SELECT 9, 9, 9, 9, 'Confirmed', '2025-08-28', 80.0 UNION ALL
SELECT 10, 10, 10, 10, 'Cancelled', '2025-08-29', 85.0 UNION ALL
SELECT 11, 11, 11, 11, 'Confirmed', '2025-08-30', 90.0;


INSERT INTO Seats (SeatID, TrainID, SeatNumber, ClassType, AvailabilityStatus)
SELECT 2, 2, 'S1', 'Economy', 'Available' UNION ALL
SELECT 3, 2, 'S2', 'Business', 'Booked' UNION ALL
SELECT 4, 3, 'S3', 'Economy', 'Available' UNION ALL
SELECT 5, 3, 'S4', 'Economy', 'Booked' UNION ALL
SELECT 6, 4, 'S5', 'Business', 'Available' UNION ALL
SELECT 7, 4, 'S6', 'Economy', 'Available' UNION ALL
SELECT 8, 5, 'S7', 'Business', 'Booked' UNION ALL
SELECT 9, 5, 'S8', 'Economy', 'Available' UNION ALL
SELECT 10, 6, 'S9', 'Economy', 'Available' UNION ALL
SELECT 11, 6, 'S10', 'Business', 'Booked';

SELECT * FROM Stations WHERE StationName LIKE 'Station%';

DELIMITER $$
CREATE TRIGGER trg_update_seat AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    UPDATE Seats SET AvailabilityStatus = 'Booked' WHERE TrainID = NEW.TrainID LIMIT 1;  
END $$
DELIMITER ;

DELIMITER $$


CREATE PROCEDURE GetUserBookings(IN userId INT)
BEGIN
    SELECT * FROM Bookings WHERE UserID = userId;
END $$
DELIMITER ;
CALL GetUserBookings(1);

CREATE VIEW ConfirmedBookings AS
SELECT * FROM Bookings WHERE BookingStatus = 'Confirmed';
 SELECT * FROM ConfirmedBookings;
 
 SELECT TrainID, TotalAmount,
       RANK() OVER (PARTITION BY TrainID ORDER BY TotalAmount DESC) AS AmountRank
FROM Bookings;

SELECT SUM(TotalAmount) AS TotalRevenue FROM Bookings;

SELECT ScheduleID, TIMESTAMPDIFF(HOUR, DepartureTime, ArrivalTime) AS DurationHours
FROM Schedules;

SELECT CONCAT(TrainName, ' (', TrainNumber, ')') AS FullTrainName FROM Trains;

SELECT TrainName FROM Trains t
WHERE RouteID IN (SELECT RouteID FROM Routes WHERE Distance > (SELECT AVG(Distance) FROM Routes));

CREATE INDEX idx_train_number ON Trains(TrainNumber);

ALTER TABLE Routes ADD CONSTRAINT chk_positive_distance CHECK (Distance > 0);

DELIMITER $$
CREATE PROCEDURE LogBookings()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE bookingId INT;
    DECLARE cur CURSOR FOR SELECT BookingID FROM Bookings;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO bookingId;
        IF done THEN LEAVE read_loop; END IF;
    END LOOP;
    CLOSE cur;
END $$
DELIMITER ;

SET GLOBAL event_scheduler = ON;
CREATE EVENT CleanupOldBookings
ON SCHEDULE EVERY 1 DAY
DO DELETE FROM Bookings WHERE BookingDate < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

DELIMITER $$
CREATE FUNCTION CalculateFareWithTax(base DECIMAL(10,2)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN base * 1.05;  
END $$
DELIMITER ;
SELECT CalculateFareWithTax(TotalAmount) FROM Bookings;

DELIMITER $$

CREATE PROCEDURE InsertBooking(IN userId INT, IN trainId INT, IN schedId INT, IN status VARCHAR(50), IN bookDate DATE, IN amount DECIMAL(10,2))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT 'Error: Booking insertion failed!' AS Message;
    END;
    INSERT INTO Bookings (UserID, TrainID, ScheduleID, BookingStatus, BookingDate, TotalAmount)
    VALUES (userId, trainId, schedId, status, bookDate, amount);
    SELECT 'Booking inserted successfully!' AS Message;
END $$
DELIMITER ;
