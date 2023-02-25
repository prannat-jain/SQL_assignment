-- Table `Region`
-- -----------------------------------------------------
CREATE DATABASE tourista_db;
USE tourista_db;

SET AUTOCOMMIT = 0;
SET FOREIGN_KEY_CHECKS=0;
START TRANSACTION;
-- START TRANSACTION;
DROP TABLE IF EXISTS `Booking` ;
DROP TABLE IF EXISTS `Cottage_Facility` ;
DROP TABLE IF EXISTS `Facility` ;
DROP TABLE IF EXISTS `Cottage` ;
DROP TABLE IF EXISTS `Customer` ;
DROP TABLE IF EXISTS `Region` ;

CREATE TABLE IF NOT EXISTS `Region` (
  `Region_Code` INT NOT NULL,
  `Region_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Region_Code`)
);

-- -----------------------------------------------------
-- Table `Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Customer` (
  `Customer_ID` INT NOT NULL,
  `Customer_LName` VARCHAR(45) NOT NULL,
  `Customer_FName` VARCHAR(45) NOT NULL,
  `Customer_MInitial` VARCHAR(5) NULL,
  `Customer_Email` VARCHAR(45) NULL,
  `Customer_Phone` VARCHAR(15) NULL,
  PRIMARY KEY (`Customer_ID`)
);

-- -----------------------------------------------------
-- Table `Facility`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Facility` (
  `Facility_ID` INT NOT NULL,
  `Facility_Name` VARCHAR(45) NOT NULL,
  `Facility_IsShared` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Facility_ID`)
);

-- -----------------------------------------------------
-- Table `Cottage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cottage` (
  `Cottage_ID` INT NOT NULL,
  `Cottage_Name` VARCHAR(45) NOT NULL,
  `Cottage_NumRooms` INT NOT NULL,
  `Region_Code` INT NOT NULL,
  PRIMARY KEY (`Cottage_ID`),
  CONSTRAINT `fk_Cottage_Region`
    FOREIGN KEY (`Region_Code`)
    REFERENCES `Region` (`Region_Code`)
);

-- -----------------------------------------------------
-- Table `Cottage_Facility`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cottage_Facility` (
  `CF_Num` INT NOT NULL,
  `Facility_ID` INT NOT NULL,
  `Cottage_ID` INT NOT NULL,
  PRIMARY KEY (`CF_Num`),
  CONSTRAINT `fk_Cottage_Facility_Facility1`
    FOREIGN KEY (`Facility_ID`)
    REFERENCES `Facility` (`Facility_ID`),
  CONSTRAINT `fk_Cottage_Facility_Cottage1`
    FOREIGN KEY (`Cottage_ID`)
    REFERENCES `Cottage` (`Cottage_ID`)
);

-- -----------------------------------------------------
-- Table `Booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Booking` (
  `Booking_ID` INT NOT NULL,
  `Booking_Date` DATE NOT NULL,
  `Booking_Price` INT NOT NULL,
  `Customer_ID` INT NOT NULL,
  `Cottage_ID` INT NOT NULL,
  PRIMARY KEY (`Booking_ID`),
  CONSTRAINT `fk_Booking_Customer1`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `Customer` (`Customer_ID`),
  CONSTRAINT `fk_Booking_Cottage1`
    FOREIGN KEY (`Cottage_ID`)
    REFERENCES `Cottage` (`Cottage_ID`)
);

-- -----------------------------------------------------
-- Data Insertion
-- -----------------------------------------------------
insert into Region values (7821,'Halifax');
insert into Region values (7822,'Bear River');
insert into Region values (7823,'Pictou');
insert into Region values (9021,'Sherbrooke');
insert into Region values (9022,'Digby');
insert into Region values (9023,'Kingston');
insert into Region values (9024,'Shelburne');

insert into Cottage values (1,'Atlantic Beach Resort Cottage 1',4,9021);
insert into Cottage values (2,'Atlantic Beach Resort Cottage 2',3,9021);
insert into Cottage values (3,'Atlantic Beach Resort Cottage 3',2,9021);
insert into Cottage values (4,'Green Ocean Cottage 20',3,9024);
insert into Cottage values (5,'Green Ocean Cottage 30',2,9024);
insert into Cottage values (6,'Green Ocean Cottage 40',1,9024);
insert into Cottage values (7,'Surf Cottage 1',2,7821);
insert into Cottage values (8,'Surf Cottage 2',3,7821);
insert into Cottage values (9,'Lagoona',4,7823);
insert into Cottage values (10,'Pine Resort A',1,9021);

insert into Customer values (10010,'DalFCS','Student','','myemail@mymail.com','9021234567');
insert into Customer values (10011,'Perkins','Bob','','bob@whatmail.ca','5901293456');
insert into Customer values (10012,'Oscar','Charlie','','coscar@nomail.org','6222257079');
insert into Customer values (10013,'Sybil','Dave','G','devensy007@mymail.com','4140069876');
insert into Customer values (10014,'Evenfield','Eve','S.Y','eve@whymail.ca','2121129987');
insert into Customer values (10015,'Mitchell','Frank','','frankmitchell@nomail.org','2134567890');
insert into Customer values (10016,'Damon','Grace','K','gracep@mymail.com','9024346565');
insert into Customer values (10017,'Singh','Robin','C','rsingh@yahoo.com ','9011237745');


insert into Facility values (1,'Coffee Machine',0);
insert into Facility values (2,'Refrigerator',0);
insert into Facility values (3,'Air Conditioner',0);
insert into Facility values (4,'Stove',0);
insert into Facility values (5,'Parking',0);
insert into Facility values (6,'Pool',1);
insert into Facility values (7,'Playground',1);
insert into Facility values (8,'Gym',1);
insert into Facility values (9,'Sauna',1);
insert into Facility values (10,'Beach',1);

insert into Cottage_Facility values (1,1,1);
insert into Cottage_Facility values (2,2,1);
insert into Cottage_Facility values (3,3,1);
insert into Cottage_Facility values (4,1,2);
insert into Cottage_Facility values (5,2,2);
insert into Cottage_Facility values (6,3,2);
insert into Cottage_Facility values (7,1,3);
insert into Cottage_Facility values (8,2,3);
insert into Cottage_Facility values (9,3,3);
insert into Cottage_Facility values (10,6,3);
insert into Cottage_Facility values (11,7,3);
insert into Cottage_Facility values (12,10,3);
insert into Cottage_Facility values (13,1,9);
insert into Cottage_Facility values (14,6,9);
insert into Cottage_Facility values (15,10,9);
insert into Cottage_Facility values (16,1,10);
insert into Cottage_Facility values (17,10,10);
insert into Cottage_Facility values (18,2,4);
insert into Cottage_Facility values (19,5,4);

insert into Booking values (1,'2018/01/15',594,10010,9);
insert into Booking values (2,'2018/01/15',384,10015,1);
insert into Booking values (3,'2018/01/15',1176,10012,4);
insert into Booking values (4,'2018/01/10',300,10010,3);
insert into Booking values (5,'2018/01/10',144,10011,3);
insert into Booking values (6,'2018/01/01',144,10016,3);
insert into Booking values (7,'2017/12/24',654,10010,9);
insert into Booking values (8,'2017/12/22',654,10014,9);
insert into Booking values (9,'2017/12/20',588,10012,7);
insert into Booking values (10,'2017/12/15',180,10010,10);

COMMIT;

select Cottage_Name from Cottage Co, Region R where Co.Region_Code = R.Region_Code;

select Cottage_Name, Cottage_NumRooms from Cottage Co where Cottage_NumRooms >= 2;

select Cottage_ID, Cottage_Name, Cottage_NumRooms, Co.Region_Code from Cottage Co, Region R where Co.Region_Code = R.Region_Code and Co.Region_Code = 7821;

select * from Facility where Facility_IsShared = TRUE;

select Facility_ID from Cottage_Facility where Cottage_ID = 1;

select count(distinct C.Customer_ID) as NUM_CUSTOMERS from Customer C, Booking B where year(Booking_Date) = 2017 and C.Customer_ID = B.Customer_ID;

select CF.Cottage_ID, COUNT(CF.Facility_ID) from Cottage_Facility CF GROUP BY CF.Cottage_ID ;

select Facility_Name from Facility where Facility_IsShared = false;

select count(DISTINCT(Cottage_ID)) from Booking;

select Co.Cottage_Name,Region_Name, Booking_Price from Cottage Co, Booking B, Region R where Co.Cottage_ID = B.Cottage_ID and Co.Region_Code = R.Region_Code;

select distinct(Customer_FName) , 
(select distinct(Customer_LName)) as Customer_LName from Customer C, Booking B where C.Customer_ID = B.Customer_ID;

select C.Customer_FName, C.Customer_LName, Co.Cottage_Name, B.Booking_Date from Customer C, Cottage Co, Booking B where C.Customer_ID = B.Customer_ID and B.Cottage_ID = Co.Cottage_ID;

select C.Customer_LName, COUNT(Booking.Booking_ID) from Customer C, Booking where C.Customer_ID = Booking.Customer_ID group by C.Customer_ID;

select Co.Cottage_Name, COUNT(Facility_ID) from Cottage Co, Cottage_Facility where Co.Cottage_ID = Cottage_Facility.Cottage_ID group by Co.Cottage_ID;

select F.Facility_Name from Facility F, Cottage_Facility CF, Cottage Co where F.Facility_ID = CF.Facility_ID and CF.Cottage_ID = Co.Cottage_ID and Cottage_Name = 'Lagoona' and F.Facility_IsShared = true;

select distinct(F.Facility_Name) from Facility F, Cottage_Facility CF, Booking B where F.Facility_ID = CF.Facility_ID and CF.Cottage_ID = B.Cottage_ID and F.Facility_IsShared = false; 

select * from Cottage Co, Region R where Co.Region_Code = R.Region_Code and R.Region_name = 'Halifax';

select MAX(Booking_Price) - MIN(Booking_Price) from Booking;

select R.Region_Name, AVG(Booking_Price), MAX(Booking_Price), MIN(Booking_Price) from Region R, Booking, Cottage where R.Region_Code = Cottage.Region_Code and Cottage.Cottage_ID = Booking.Cottage_ID group by R.Region_Code;

select Co.Cottage_Name, COUNT(B.Cottage_ID) as Num_Booked, SUM(B.Booking_Price) as Cottage_Income, truncate((SUM(B.Booking_Price) * 5)/100, 2) as Cottage_Commission from Cottage Co, Booking B where Co.Cottage_ID = B.Cottage_ID group by Co.Cottage_ID;













