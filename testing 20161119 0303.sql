-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.42


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema project
--

CREATE DATABASE IF NOT EXISTS project;
USE project;

--
-- Definition of table `airbase_location`
--

DROP TABLE IF EXISTS `airbase_location`;
CREATE TABLE `airbase_location` (
  `ab_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ab_state` varchar(45) NOT NULL,
  `ab_location` char(50) DEFAULT NULL,
  `Capacity` int(11) NOT NULL,
  PRIMARY KEY (`ab_id`),
  UNIQUE KEY `ab_location` (`ab_location`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airbase_location`
--

/*!40000 ALTER TABLE `airbase_location` DISABLE KEYS */;
INSERT INTO `airbase_location` (`ab_id`,`ab_state`,`ab_location`,`Capacity`) VALUES 
 (101,'Punjab','Adampur AFS',30),
 (102,'Haryana','Ambala AFS',20),
 (103,'Jammu & Kashmir','Awantipur AFS',26),
 (104,'Chandigarh','Chandigarh AFS',40),
 (105,'Uttar Pradesh','Hindon AFS',50),
 (106,'Delhi','Palam AFS',50),
 (107,'Punjab','Pathankot AFS',30),
 (108,'West Bengal','Barrackpore AFS',35),
 (109,'Assam','Tezpur AFS',15),
 (110,'Arunachal Pradesh','Tawang AFS',5),
 (111,'Uttar Pradesh','Agra AFS',35),
 (112,'Tamil Nadu','Madurai AFS',45),
 (113,'Karnataka','Bidar AFS',40),
 (114,'Karnataka','Yelahanka AFS',43),
 (115,'Maharashtra','Nagpur AFS',30),
 (116,'Andaman & Nicobar ','Car Nicobar AFS',12),
 (117,'Andaman & Nicobar ','Port Blair AFS',20),
 (118,'Gujarat','Jamnagar AFS',35),
 (119,'Rajasthan','Jaisalmer AFS',30),
 (120,'Meghalaya ','Barapani AFS Shillong',25);
/*!40000 ALTER TABLE `airbase_location` ENABLE KEYS */;


--
-- Definition of table `aircraft_info`
--

DROP TABLE IF EXISTS `aircraft_info`;
CREATE TABLE `aircraft_info` (
  `ac_id` int(11) NOT NULL DEFAULT '0',
  `ac_no` int(11) NOT NULL DEFAULT '0',
  `type` varchar(40) NOT NULL,
  `origin` char(30) NOT NULL,
  `mfd_on` date NOT NULL,
  `roles` varchar(60) NOT NULL,
  PRIMARY KEY (`ac_id`,`ac_no`),
  KEY `ix_some_id` (`ac_id`),
  KEY `id_some_iw` (`ac_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aircraft_info`
--

/*!40000 ALTER TABLE `aircraft_info` DISABLE KEYS */;
INSERT INTO `aircraft_info` (`ac_id`,`ac_no`,`type`,`origin`,`mfd_on`,`roles`) VALUES 
 (1,242,'Sukhoi Su-30MKI','Russia','1997-07-01','Multirole air superiority fighter'),
 (2,21,'HAL Tejas','India-HAL','2001-01-04','Multirole fighter'),
 (3,519,'Mikoyal MIG-29','USSR','1997-09-06','Multirole fighter, air superiority fighter'),
 (4,3992,'Dassault Mirage 2000','France','1978-03-10','Multirole fighter'),
 (5,245,'Mikoyan-Gurevich MIG-21','USSR-India','1956-02-14','Fighter'),
 (6,145,'SEPECAT Jaguar ','UK-India','1968-08-08','Attack aircraft'),
 (7,120,'Mikoyan MIG-27ML Bahadur','USSR','1970-08-20','Attack aircraft, fighter bomber'),
 (8,10,'Boeing C-17 Globemaster III','USA','1991-09-15','Strategic and tactical airlifter'),
 (9,5,'Lockheed C-130 J Super Hercules','USA','1996-04-05','Military transport, aerial refuelling'),
 (10,59,'Hawker Siddeley HS 748','UK-India','1960-06-25','Airliner'),
 (11,23,'HAL Cheetah','India','1971-03-17','Utility'),
 (12,4,'HAL Cheetal','India','1971-04-17','Utility'),
 (13,12,'HAL Lancer','India','1969-03-17','Attack'),
 (14,78,'HAL Druv','India','1992-08-20','Utility'),
 (15,38,'Hal Do228','India Germany','1992-09-20','Surveillance'),
 (16,40,'Pipistrel Virus','Slovenia','1992-09-20','Trainer'),
 (17,14,'Kamov Ka-31','Russia','1987-10-13','Airborne early warning'),
 (18,15,'Illyushin II-38','Russia','1971-07-15','Patrol'),
 (19,39,'Mikoyan MIG-29K','Russia','1988-07-23','Multirole fighter'),
 (20,8,'Boeing P-8 Poseidon','USA','2009-04-25','Patrol');
/*!40000 ALTER TABLE `aircraft_info` ENABLE KEYS */;


--
-- Definition of table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
CREATE TABLE `maintenance` (
  `aid` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `ldos` date DEFAULT NULL,
  `due` date DEFAULT NULL,
  `comments` varchar(60) DEFAULT NULL,
  KEY `aid` (`aid`),
  CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `aircraft_info` (`ac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maintenance`
--

/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
INSERT INTO `maintenance` (`aid`,`age`,`status`,`ldos`,`due`,`comments`) VALUES 
 (1,19,'Active','2016-11-10','2017-03-10','NIL'),
 (2,15,'Active','2016-11-10','2017-06-10','NIL'),
 (3,19,'Active','2016-11-10','2017-03-10','NIL'),
 (4,38,'Active','2016-11-10','2017-01-10','NIL'),
 (5,60,'Active','2016-11-10','2016-12-10','NIL'),
 (6,48,'Active','2016-11-10','2016-12-10','NIL'),
 (7,46,'Active','2016-11-10','2016-12-10','NIL'),
 (8,25,'Active','2016-11-10','2017-03-10','NIL'),
 (9,20,'Active','2016-11-10','2017-03-10','NIL'),
 (10,56,'Active','2016-11-10','2016-12-10','NIL'),
 (11,45,'Active','2016-11-10','2017-01-10','NIL'),
 (12,45,'Active','2016-11-10','2017-01-10','NIL'),
 (13,47,'Active','2016-11-10','2016-12-10','NIL'),
 (14,24,'Active','2016-11-10','2017-03-10','NIL'),
 (15,24,'Active','2016-11-10','2017-03-10','NIL'),
 (16,24,'Active','2016-11-10','2017-03-10','NIL'),
 (17,29,'Active','2016-11-10','2017-03-10','NIL'),
 (18,45,'Active','2016-11-10','2017-01-10','NIL'),
 (19,28,'Active','2016-11-10','2017-03-10','NIL'),
 (20,7,'Active','2016-11-10','2017-06-10','NIL');
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;


--
-- Definition of table `route`
--

DROP TABLE IF EXISTS `route`;
CREATE TABLE `route` (
  `Rt_id` int(11) NOT NULL,
  `airport` varchar(50) NOT NULL,
  `source` varchar(30) NOT NULL,
  `destination` varchar(30) NOT NULL,
  `route_code` float NOT NULL,
  PRIMARY KEY (`route_code`),
  KEY `id_some_jk` (`route_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route`
--

/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` (`Rt_id`,`airport`,`source`,`destination`,`route_code`) VALUES 
 (1,'AAFS','Ambala','Adampur',1.1),
 (1,'AAFS','Ambala','Pathankot',1.2),
 (1,'AAFS','Ambala','Avantipur',1.3),
 (1,'AAFS','Ambala','Palam',1.4),
 (2,'TAFS','Tawang','Agra',2.1),
 (2,'TAFS','Tawang','Nagpur',2.2),
 (2,'TAFS','Tawang','Palam',2.3),
 (3,'BAFS','Bidar','Agra',3.1),
 (3,'BAFS','Bidar','Palam',3.2),
 (4,'CAFS','Chandigarh','Hindon',4.1),
 (4,'CAFS','Chandigarh','Ambala',4.2),
 (4,'CAFS','Chandigarh','Palam',4.3),
 (5,'JAFS','Jaisalmer','Tezpur',5.1),
 (5,'JAFS','Jaisalmer','Car Nicobar',5.2),
 (5,'JAFS','Jaisalmer','Palam',5.3),
 (6,'PAFS','Palam','Tezpur',6.1),
 (6,'PAFS','Palam','Nagpur',6.11),
 (6,'PAFS','Palam','Barapani Shillong',6.12),
 (6,'PAFS','Palam','Madurai',6.2),
 (6,'PAFS','Palam','Hindon',6.3),
 (6,'PAFS','Palam','Ambala',6.4),
 (6,'PAFS','Palam','Car Nicobar',6.5),
 (6,'PAFS','Palam','Adampur',6.6),
 (6,'PAFS','Palam','Pathankot',6.7),
 (6,'PAFS','Palam','Avantipur',6.8),
 (6,'PAFS','Palam','Agra',6.9),
 (7,'HAFS','Hindon','Agra',7.1),
 (7,'HAFS','Hindon','Bidar',7.2),
 (7,'HAFS','Hindon','Palam',7.3),
 (8,'BAFSS','Barapani Shillong','Tezpur',8.1),
 (8,'BAFSS','Barapani Shillong','Palam',8.2),
 (9,'PTAFS','Pathankot','Barrrackpore',9.1),
 (9,'PTAFS','Pathankot','Palam',9.2);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;


--
-- Definition of table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `aid` int(11) NOT NULL,
  `flight_date` date DEFAULT NULL,
  `departure` time DEFAULT NULL,
  `arrival` time DEFAULT NULL,
  `acno` int(11) NOT NULL,
  `rcode` float NOT NULL,
  KEY `schedule_ibfk_1` (`aid`),
  KEY `schedule_ibfk_2` (`acno`),
  KEY `schedule_ibfk_3` (`rcode`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `aircraft_info` (`ac_id`),
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`acno`) REFERENCES `aircraft_info` (`ac_no`),
  CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`rcode`) REFERENCES `route` (`route_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` (`aid`,`flight_date`,`departure`,`arrival`,`acno`,`rcode`) VALUES 
 (1,'2016-07-17','00:30:00','01:15:00',242,1.4),
 (2,'2016-08-15','01:45:00','02:15:00',21,6.1),
 (3,'2016-10-05','03:00:00','04:00:00',519,6.11),
 (4,'2016-11-05','03:00:00','04:00:00',3992,6.12),
 (5,'2016-12-05','03:00:00','06:00:00',245,6.2),
 (6,'2016-12-05','03:00:00','06:00:00',145,2.3),
 (7,'2016-12-06','11:00:00','13:00:00',120,3.2),
 (8,'2016-12-06','11:00:00','11:30:00',10,4.3),
 (9,'2016-12-06','12:00:00','12:30:00',5,5.3),
 (10,'2016-12-06','14:00:00','14:45:00',59,7.3);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
