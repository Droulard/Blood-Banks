CREATE DATABASE  IF NOT EXISTS `Database Project` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `Database Project`;
-- MySQL dump 10.13  Distrib 8.0.14, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: Database Project
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `BLOOD_BANK`
--

DROP TABLE IF EXISTS `BLOOD_BANK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `BLOOD_BANK` (
  `BANK_ID` int(11) NOT NULL,
  `INV_ID` int(11) NOT NULL,
  `STREET` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CITY` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ZIP` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `AREA_CODE` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PHONE` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`BANK_ID`),
  KEY `INV_ID_idx` (`INV_ID`),
  CONSTRAINT `INV_ID` FOREIGN KEY (`INV_ID`) REFERENCES `inventory` (`inv_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLOOD_BANK`
--

LOCK TABLES `BLOOD_BANK` WRITE;
/*!40000 ALTER TABLE `BLOOD_BANK` DISABLE KEYS */;
INSERT INTO `BLOOD_BANK` VALUES (1000,11000,'3567 Bridge Street','Clarkston','Mi','48346','248','586-024'),(1001,11001,'4613 Locust Street','Troy','Mi','48083','248','178-260'),(1010,11010,'1956 Madison Avenue','South Lyon','Mi','48178','248','391-780'),(1011,11011,'5813 Meadow Lane','Waterford','Mi','48327','248','531-879'),(1100,11100,'7985 Ridge Road','Pontiac','Mi','48340','248','293-467');
/*!40000 ALTER TABLE `BLOOD_BANK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DONATION`
--

DROP TABLE IF EXISTS `DONATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `DONATION` (
  `DATE` date NOT NULL,
  `DONOR_ID` int(11) NOT NULL,
  `BANK_ID` int(11) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`DATE`,`DONOR_ID`),
  KEY `BANK_ID_idx` (`BANK_ID`),
  KEY `DONOR_ID_idx` (`DONOR_ID`),
  CONSTRAINT `DONOR_ID` FOREIGN KEY (`DONOR_ID`) REFERENCES `donor` (`donor_id`),
  CONSTRAINT `donation_ibfk_1` FOREIGN KEY (`BANK_ID`) REFERENCES `blood_bank` (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DONATION`
--

LOCK TABLES `DONATION` WRITE;
/*!40000 ALTER TABLE `DONATION` DISABLE KEYS */;
INSERT INTO `DONATION` VALUES ('2019-01-04',100,1000,500),('2019-01-04',104,1011,500),('2019-01-04',108,1100,500),('2019-01-04',112,1000,500),('2019-01-04',116,1011,500),('2019-01-04',120,1100,500),('2019-01-04',124,1000,500),('2019-01-04',128,1011,500),('2019-01-04',132,1100,500),('2019-01-04',142,1100,500),('2019-02-03',101,1000,500),('2019-02-03',105,1001,500),('2019-02-03',109,1100,500),('2019-02-03',117,1000,500),('2019-02-03',121,1001,500),('2019-02-03',125,1100,500),('2019-02-03',129,1000,500),('2019-02-03',133,1001,500),('2019-02-03',141,1100,500),('2019-02-03',148,1100,500),('2019-03-05',102,1001,500),('2019-03-05',106,1010,500),('2019-03-05',110,1100,500),('2019-03-05',113,1001,500),('2019-03-05',114,1010,500),('2019-03-05',118,1100,500),('2019-03-05',122,1001,500),('2019-03-05',126,1010,500),('2019-03-05',130,1100,500),('2019-03-05',134,1010,500),('2019-04-04',103,1010,500),('2019-04-04',107,1011,500),('2019-04-04',111,1100,500),('2019-04-04',115,1010,500),('2019-04-04',119,1011,500),('2019-04-04',123,1100,500),('2019-04-04',127,1010,500),('2019-04-04',131,1011,500),('2019-04-04',135,1100,500),('2019-04-04',143,1100,500),('2019-05-04',100,1000,500),('2019-05-04',104,1011,500),('2019-05-04',108,1100,500),('2019-05-04',112,1000,500),('2019-05-04',116,1011,500),('2019-05-04',136,1100,500),('2019-05-04',139,1000,500),('2019-05-04',140,1011,500),('2019-05-04',142,1100,500),('2019-05-04',147,1000,500),('2019-06-03',101,1000,500),('2019-06-03',105,1001,500),('2019-06-03',109,1100,500),('2019-06-03',117,1000,500),('2019-06-03',121,1001,500),('2019-06-03',125,1100,500),('2019-06-03',144,1000,500),('2019-06-03',148,1001,500),('2019-06-03',149,1100,500),('2019-06-03',150,1001,500),('2019-07-03',102,1001,500),('2019-07-03',106,1010,500),('2019-07-03',110,1100,500),('2019-07-03',113,1001,500),('2019-07-03',114,1010,500),('2019-07-03',115,1100,500),('2019-07-03',118,1001,500),('2019-07-03',122,1010,500),('2019-07-03',137,1100,500),('2019-07-03',138,1010,500),('2019-08-02',103,1010,500),('2019-08-02',107,1011,500),('2019-08-02',111,1100,500),('2019-08-02',119,1010,500),('2019-08-02',139,1011,500),('2019-08-02',140,1100,500),('2019-08-02',143,1010,500),('2019-08-02',145,1011,500),('2019-08-02',146,1100,500),('2019-08-02',147,1010,500),('2019-09-01',100,1000,500),('2019-09-01',104,1011,500),('2019-09-01',108,1100,500),('2019-09-01',112,1000,500),('2019-09-01',116,1011,500),('2019-09-01',120,1100,500),('2019-09-01',124,1000,500),('2019-09-01',128,1011,500),('2019-09-01',132,1100,500),('2019-09-01',142,1100,500),('2019-10-01',101,1000,500),('2019-10-01',105,1001,500),('2019-10-01',109,1100,500),('2019-10-01',117,1000,500),('2019-10-01',121,1001,500),('2019-10-01',125,1100,500),('2019-10-01',129,1000,500),('2019-10-01',133,1001,500),('2019-10-01',141,1100,500),('2019-10-01',150,1001,500),('2019-11-01',102,1001,500),('2019-11-01',106,1010,500),('2019-11-01',110,1100,500),('2019-11-01',114,1001,500),('2019-11-01',118,1010,500),('2019-11-01',122,1100,500),('2019-11-01',126,1001,500),('2019-11-01',130,1010,500),('2019-11-01',134,1100,500),('2019-11-01',137,1001,500),('2019-12-01',103,1010,500),('2019-12-01',107,1011,500),('2019-12-01',111,1100,500),('2019-12-01',115,1010,500),('2019-12-01',119,1011,500),('2019-12-01',123,1100,500),('2019-12-01',127,1010,500),('2019-12-01',131,1011,500),('2019-12-01',135,1100,500),('2019-12-01',136,1100,500);
/*!40000 ALTER TABLE `DONATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DONOR`
--

DROP TABLE IF EXISTS `DONOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `DONOR` (
  `DONOR_ID` int(11) NOT NULL,
  `FNAME` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LNAME` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `STREET` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CITY` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ZIP` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `AREA_CODE` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PHONE` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `BLOOD_TYPE` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`DONOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DONOR`
--

LOCK TABLES `DONOR` WRITE;
/*!40000 ALTER TABLE `DONOR` DISABLE KEYS */;
INSERT INTO `DONOR` VALUES (100,'Liam','Neeson','4798, Aarons Way','Brandon','MI','48462','947','279-685','O+'),(101,'Stephen','Hawking','5618, 5618 Abes Lane','Rochester Hills','MI','48307','248','319-024','A+'),(102,'Benjamin','Franklin','1672, Alfred Rd','Farmington Hills','MI','48331','248','096-245','O+'),(103,'James','Naismith','2643, Ball St. ','Highland','MI','48356','248','354-610','B+'),(104,'James','Watson','7624, Betsy Lane','Brandon','MI','48462','947','065-847','A-'),(105,'Benjamin','Mia','1367, Main Street','Rochester Hills','MI','48307','248','503-964','O+'),(106,'Jane','Goodall','3765, Church Street','Farmington Hills','MI','48331','248','890-124','A+'),(107,'Thomas','Edison','7684, Main Street North','Highland','MI','48356','248','019-783','O+'),(108,'Oliver','Evelyn','7164, Main Street South','Brandon','MI','48462','947','648-931','AB+'),(109,'Jacob','Abigail','1639, Elm Street','Rochester Hills','MI','48307','248','930-852','O+'),(110,'Lucas','Harper','1598, High Street','Farmington Hills','MI','48331','248','685-472','O-'),(111,'Marie','Curie','1958, Main Street West','Highland ','MI','48356','248','571-460','A-'),(112,'Alexander','Bell','8961, Washington Street','Brandon','MI','48462','947','847-532','A+'),(113,'Ethan','Avery','4268, Main Street East','Birmingham','MI','48009','248','123-460','A+'),(114,'Daniel','Craig','7134, Park Avenue','Farmington Hills','MI','48331','248','327-958','A+'),(115,'Matthew','Maury','2594, Walnut Street','Wixom','MI','48393','248','087-236','O+'),(116,'Aiden','Madison','1549, 2nd Street','Brandon','MI','48462','947','541-862','O-'),(117,'Henry','Scarlett','4592, Chestnut Street','Rochester Hills','MI','48307','248','389-421','A+'),(118,'Joseph','Banks','2987, Maple Avenue','Farmington Hills','MI','48331','248','486-970','AB+'),(119,'Jackson','Aria','8471, Maple Street','Highland ','MI','48356','248','267-481','O+'),(120,'Samuel','Grace','7382, Broad Street','Brandon','MI','48462','947','023-916','O+'),(121,'Sebastian','Thrun','8149, Oak Street','Rochester Hills','MI','48307','248','097-384','O+'),(122,'David','Camila','1752, Center Street','Farmington Hills','MI','48331','248','961-087','A+'),(123,'Carter','Penelope','7234, Pine Street','Highland ','MI','48356','248','015-936','A+'),(124,'Wyatt','Riley','1328, River Road','Brandon','MI','48462','947','831-974','A+'),(125,'Jayden','Layla','3845, Market Street','Rochester Hills','MI','48307','248','047-913','O+'),(126,'John','Tyler','9723, Water Street','Farmington Hills','MI','48331','248','498-536','B+'),(127,'Owen','Nora','3468, South Street','Highland ','MI','48356','248','257-968','O+'),(128,'Bob','Dylan','1524, Union Street','Brandon','MI','48462','947','706-431','A+'),(129,'Luke','Mila','1976, 3rd Street','Rochester Hills','MI','48307','248','017-648','B+'),(130,'Gabriel','Daniel','6859, Park Street','Farmington Hills','MI','48331','248','156-098','O-'),(131,'Anthony','Hannah','9675, Cherry Street','Highland ','MI','48356','248','836-059','O+'),(132,'Mark','Twain','5718, North Street','Brandon','MI','48462','947','630-271','O-'),(133,'Grayson','Anderson','1852, Washington Avenue','Rochester Hills','MI','48307','248','681-705','O+'),(134,'Jack','Eleanor','9487, 4th Street','Farmington Hills','MI','48331','248','892-437','O+'),(135,'Ada ','Lovelace','3581, Court Street','Highland ','MI','48356','248','728-039','A+'),(136,'Charles','Dickens','3529, Highland Avenue','Holly','MI','48442','248','563-471','A+'),(137,'Christopher','Savannah','1746, Mill Street','Birmingham','MI','48009','248','276-819','O+'),(138,'Joshua','Brooklyn','1576, Franklin Street','Birmingham','MI','48009','248','862-057','O-'),(139,'Alan','Turing','2647, Prospect Street','Holly','MI','48442','248','493-508','A+'),(140,'Lincoln','Abraham','4187, School Street','Holly','MI','48442','248','871-342','A+'),(141,'Edgar ','Dijkstra','3478, Spring Street','Rochester Hills','MI','48307','248','536-142','A+'),(142,'Ryan','Hazel','4567, Central Avenue','Holly','MI','48442','248','587-042','A+'),(143,'Jaxon','Ellie','5742, 1st Street','Holly','MI','48442','248','915-360','O-'),(144,'Nathan','Paisley','2875, State Street','Rochester Hills','MI','48307','248','165-043','A-'),(145,'Aaron','Audrey','3641, Front Street','Holly','MI','48442','248','640-725','O+'),(146,'Isaiah','Skylar','1463, West Street','Holly','MI','48442','248','381-295','O+'),(147,'Thomas','Violet','4361, Jefferson Street','Holly','MI','48442','248','953-407','O+'),(148,'Charles','Claire','1852, Cedar Street','Rochester Hills','MI','48307','248','427-851','O+'),(149,'Franklin','Roosevelt','4367, Jackson Street','Rochester Hills','MI','48307','248','183-759','AB+'),(150,'Ivan','Pavlov','6978, Park Place','Rochester Hills','MI','48307','248','412-678','O+');
/*!40000 ALTER TABLE `DONOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HOSPITAL`
--

DROP TABLE IF EXISTS `HOSPITAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `HOSPITAL` (
  `HOSPITAL_ID` int(11) NOT NULL,
  `BANK_ID` int(11) NOT NULL,
  `HOSPITAL_NAME` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `STREET` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CITY` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `STATE` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ZIP` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `AREA_CODE` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PHONE` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`HOSPITAL_ID`),
  KEY `BANK_ID_idx` (`BANK_ID`),
  CONSTRAINT `BANK_ID` FOREIGN KEY (`BANK_ID`) REFERENCES `blood_bank` (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HOSPITAL`
--

LOCK TABLES `HOSPITAL` WRITE;
/*!40000 ALTER TABLE `HOSPITAL` DISABLE KEYS */;
INSERT INTO `HOSPITAL` VALUES (0,1100,'St. Joseph','44405 Woodward Ave.','Pontiac','Mi','48178','248','270-386'),(1,1010,'Providence ','210 N. Lafayette','South Lyon','Mi','48178','248','647-013'),(2,1000,'McLaren ','5701 Bow Pointe Dr.','Clarkston','Mi','48346','248','140-673'),(3,1001,'Beaumont ','44201 Dequindre Rd.','Troy','Mi','48085','248','406-125'),(4,1011,'Henry Ford','6620 Highland Rd','Waterford','Mi','48327','248','105-492');
/*!40000 ALTER TABLE `HOSPITAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INVENTORY`
--

DROP TABLE IF EXISTS `INVENTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `INVENTORY` (
  `INV_ID` int(11) NOT NULL,
  `O+` int(11) NOT NULL,
  `O-` int(11) NOT NULL,
  `A+` int(11) NOT NULL,
  `A-` int(11) NOT NULL,
  `B+` int(11) NOT NULL,
  `B-` int(11) NOT NULL,
  `AB+` int(11) NOT NULL,
  `AB-` int(11) NOT NULL,
  PRIMARY KEY (`INV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVENTORY`
--

LOCK TABLES `INVENTORY` WRITE;
/*!40000 ALTER TABLE `INVENTORY` DISABLE KEYS */;
INSERT INTO `INVENTORY` VALUES (11000,8000,4000,8000,2000,2000,1000,1000,1000),(11001,10000,5000,10000,3000,5000,2000,2000,2000),(11010,8000,4000,8000,2000,2000,1000,1000,1000),(11011,10000,5000,10000,3000,5000,2000,2000,2000),(11100,5000,4000,5000,2000,2000,1000,1000,0);
/*!40000 ALTER TABLE `INVENTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUEST`
--

DROP TABLE IF EXISTS `REQUEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `REQUEST` (
  `REQUEST_ID` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `HOSPITAL_ID` int(11) NOT NULL,
  `BLOOD_TYPE` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `DATE` date NOT NULL,
  PRIMARY KEY (`REQUEST_ID`),
  UNIQUE KEY `REQUEST_ID_UNIQUE` (`REQUEST_ID`),
  KEY `HOSPITAL_ID_idx` (`HOSPITAL_ID`),
  CONSTRAINT `HOSPITAL_ID` FOREIGN KEY (`HOSPITAL_ID`) REFERENCES `hospital` (`hospital_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUEST`
--

LOCK TABLES `REQUEST` WRITE;
/*!40000 ALTER TABLE `REQUEST` DISABLE KEYS */;
INSERT INTO `REQUEST` VALUES ('R1',3,'O+',3000,'2019-01-04'),('R10',1,'O+',2000,'2019-01-23'),('R11',4,'B-',2000,'2019-01-23'),('R12',0,'A+',3000,'2019-01-24'),('R13',1,'B+',950,'2019-02-03'),('R14',4,'O+',900,'2019-02-07'),('R15',4,'A+',2000,'2019-02-20'),('R16',2,'O+',800,'2019-02-25'),('R17',2,'O+',3000,'2019-03-02'),('R18',3,'B+',1000,'2019-03-11'),('R19',2,'A+',2000,'2019-03-12'),('R2',2,'A+',2000,'2019-01-09'),('R20',0,'B+',3000,'2019-03-15'),('R21',4,'A+',800,'2019-03-17'),('R22',3,'A+',3000,'2019-03-18'),('R23',2,'A+',2000,'2019-03-18'),('R24',2,'A+',2000,'2019-03-18'),('R25',4,'O+',2000,'2019-03-21'),('R26',1,'A+',1000,'2019-03-22'),('R27',0,'A+',750,'2019-03-22'),('R28',0,'O+',2000,'2019-03-26'),('R29',0,'A+',950,'2019-04-08'),('R3',2,'A+',1000,'2019-01-10'),('R30',2,'O+',900,'2019-04-12'),('R31',0,'B+',2000,'2019-04-20'),('R32',3,'O+',2000,'2019-04-23'),('R33',0,'O+',2000,'2019-05-02'),('R34',1,'B+',3000,'2019-05-05'),('R35',3,'A-',2000,'2019-05-11'),('R36',3,'A+',3000,'2019-05-16'),('R37',0,'A+',2000,'2019-05-19'),('R38',3,'O+',2000,'2019-05-19'),('R39',0,'O+',3000,'2019-05-22'),('R4',2,'A+',900,'2019-01-10'),('R40',0,'A-',2000,'2019-05-22'),('R41',1,'A+',1000,'2019-05-25'),('R42',3,'O+',2000,'2019-06-01'),('R43',4,'B+',3000,'2019-06-01'),('R44',4,'AB-',2000,'2019-06-03'),('R45',0,'A+',700,'2019-06-04'),('R46',4,'O+',3000,'2019-06-05'),('R47',0,'A+',2000,'2019-06-07'),('R48',1,'O-',650,'2019-06-11'),('R49',4,'A+',700,'2019-06-12'),('R5',3,'A+',3000,'2019-01-13'),('R50',4,'A+',2000,'2019-06-12'),('R51',2,'A+',2000,'2019-06-13'),('R52',2,'O+',550,'2019-06-14'),('R53',2,'A+',1000,'2019-06-16'),('R54',1,'O+',3000,'2019-06-20'),('R55',1,'O+',2000,'2019-06-26'),('R56',4,'A+',1000,'2019-06-26'),('R57',2,'A+',3000,'2019-07-02'),('R58',2,'O+',1000,'2019-07-06'),('R59',2,'O+',850,'2019-07-08'),('R6',2,'A-',2000,'2019-01-15'),('R60',4,'B+',2000,'2019-07-20'),('R61',2,'A+',600,'2019-07-22'),('R62',4,'AB+',700,'2019-07-24'),('R63',0,'A+',750,'2019-07-25'),('R64',3,'B+',2000,'2019-08-05'),('R65',2,'O-',2000,'2019-08-09'),('R66',3,'O+',2000,'2019-08-15'),('R67',0,'O+',2000,'2019-08-15'),('R68',2,'O+',2000,'2019-08-20'),('R69',3,'O+',2000,'2019-08-21'),('R7',1,'A+',800,'2019-01-18'),('R70',4,'O-',3000,'2019-08-27'),('R71',4,'A+',2000,'2019-08-28'),('R72',0,'O+',3000,'2019-09-02'),('R73',2,'A+',2000,'2019-09-11'),('R74',0,'A+',1000,'2019-09-17'),('R75',0,'A-',2000,'2019-09-17'),('R76',0,'A+',850,'2019-09-18'),('R77',4,'A+',3000,'2019-09-18'),('R78',1,'A+',600,'2019-09-21'),('R79',3,'O+',3000,'2019-09-26'),('R8',1,'O+',850,'2019-01-19'),('R80',4,'O-',2000,'2019-10-04'),('R81',4,'O+',800,'2019-10-05'),('R82',4,'O+',2000,'2019-10-09'),('R83',2,'O-',3000,'2019-10-14'),('R84',4,'B+',3000,'2019-10-15'),('R85',4,'O+',2000,'2019-10-16'),('R86',4,'O-',3000,'2019-10-19'),('R87',2,'A+',2000,'2019-10-20'),('R88',1,'O+',2000,'2019-10-28'),('R89',2,'O+',750,'2019-11-07'),('R9',0,'A+',2000,'2019-01-19'),('R90',4,'AB+',2000,'2019-11-09'),('R91',3,'A+',650,'2019-11-11'),('R92',3,'O+',2000,'2019-11-11'),('R93',2,'O+',2000,'2019-11-22'),('R94',1,'B-',1000,'2019-12-01'),('R95',2,'O-',800,'2019-12-07'),('R96',4,'A+',1000,'2019-12-14'),('R97',1,'B+',2000,'2019-12-18'),('R98',4,'A+',2000,'2019-12-24');
/*!40000 ALTER TABLE `REQUEST` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-22 15:16:09
