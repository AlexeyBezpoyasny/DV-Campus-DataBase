-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: cherkasy_elektro_trans
-- ------------------------------------------------------
-- Server version	5.7.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employee_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Employee ID',
  `position_id` int(10) unsigned DEFAULT NULL COMMENT 'Position ID',
  `employee_first_name` varchar(127) NOT NULL COMMENT 'Employee First Name',
  `employee_last_name` varchar(127) NOT NULL COMMENT 'Employee Last Name',
  `dob` date DEFAULT NULL COMMENT 'Date Of Birth',
  `date_of_employment` date DEFAULT NULL COMMENT 'Date Of Employment',
  PRIMARY KEY (`employee_id`),
  KEY `EMPLOYEE_POSITION_ID_POSITION_POSITION_ID` (`position_id`),
  CONSTRAINT `EMPLOYEE_POSITION_ID_POSITION_POSITION_ID` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='Employees';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,1,'Miroslav','Golosov','1986-05-17','2000-05-17'),(2,2,'Bogdan','Gordeev','1963-04-29','2001-05-17'),(3,3,'Mstislav','Veselov','1968-01-23','2002-05-17'),(4,4,'Vyacheslav','Tulupov','1971-03-10','2003-12-31'),(5,4,'Boris','Minkov','1976-10-04','2004-05-12'),(6,4,'Vladimir','Novikov','1988-11-20','2015-05-29'),(7,4,'Bogdan','Vakulin','1979-05-08','2018-07-31'),(8,4,'Ilya','Solomin','1982-07-25','2006-01-21'),(9,4,'Semyon','Shpakovskiy','1986-05-17','2009-01-12'),(10,4,'Pyotr','Musorgskiy','1971-12-07','2016-04-15'),(11,4,'Artyom','Vorotynskiy','1989-05-02','2017-08-29'),(12,4,'Gennadiy','Miklashevskiy','1985-08-24','2003-12-31'),(13,4,'Ilya','Borisyuk','1966-02-27','2003-12-31'),(14,4,'Semyon','Petryak','1977-06-25','2008-05-21'),(15,5,'Pyotr','Mihaylyuk','2011-09-12','2012-10-14'),(16,6,'Artyom','Gerasimchuk','1982-11-04','2018-03-14'),(17,7,'Gennadiy','Pilipchuk','1969-05-15','2019-08-19');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income`
--

DROP TABLE IF EXISTS `income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income` (
  `employee_id` int(10) unsigned NOT NULL COMMENT 'Employee ID',
  `transport_id` int(10) unsigned NOT NULL COMMENT 'Transport ID',
  `date_of_work` date DEFAULT NULL COMMENT 'Date of work',
  `daily_profit` decimal(15,2) DEFAULT NULL COMMENT 'Income for a day',
  KEY `INCOME_EMPLOYEE_ID_EMPLOYEE_EMPLOYEE_ID` (`employee_id`),
  KEY `INCOME_TRANSPORT_ID_TRANSPORT_TRANSPORT_ID` (`transport_id`),
  CONSTRAINT `INCOME_EMPLOYEE_ID_EMPLOYEE_EMPLOYEE_ID` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE,
  CONSTRAINT `INCOME_TRANSPORT_ID_TRANSPORT_TRANSPORT_ID` FOREIGN KEY (`transport_id`) REFERENCES `transport` (`transport_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Income';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income`
--

LOCK TABLES `income` WRITE;
/*!40000 ALTER TABLE `income` DISABLE KEYS */;
INSERT INTO `income` VALUES (4,2,'2016-01-02',23454.69),(4,3,'2019-01-04',66345.77),(4,2,'2019-02-02',55667.76),(4,2,'2019-01-10',9669.66),(4,6,'2019-10-02',235654.44),(5,8,'2019-11-20',4555.34),(5,6,'2019-03-21',33333.63),(5,8,'2019-04-29',23565.53),(5,11,'2019-08-14',90900.88),(5,10,'2019-12-02',77588.33),(6,9,'2019-04-09',33467.88),(6,3,'2016-01-12',235554.69),(6,4,'2019-01-22',5555.77),(6,5,'2019-10-02',556467.76),(7,7,'2019-11-10',94449.66),(7,6,'2019-10-08',235654.44),(7,8,'2019-11-25',47775.34),(7,6,'2019-04-21',334333.63),(8,9,'2019-04-11',23645.53),(8,8,'2019-08-16',90900.88),(8,7,'2019-12-30',77488.33),(8,3,'2019-04-12',33467.88),(9,4,'2016-10-02',23514.69),(9,4,'2019-05-04',34465.77),(9,5,'2019-02-12',55667.76),(9,7,'2019-01-11',9964.66),(9,8,'2019-10-22',235654.44),(10,6,'2019-10-20',44445.34),(10,7,'2019-03-16',33333.63),(10,8,'2019-04-24',24365.53),(10,11,'2019-08-04',90900.88),(10,10,'2019-12-22',7788.33),(11,9,'2019-04-23',33467.88);
/*!40000 ALTER TABLE `income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `position_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Position ID',
  `position_name` varchar(127) NOT NULL COMMENT 'Position Name',
  PRIMARY KEY (`position_id`),
  UNIQUE KEY `POSITION_NAME` (`position_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Positions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (3,'Accountant'),(1,'CEO'),(7,'Cleaner'),(2,'Deputy CEO'),(4,'Driver'),(6,'Mechanic'),(5,'System Administrator');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary` (
  `salary_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Salary ID',
  `employee_id` int(10) unsigned NOT NULL COMMENT 'Employee ID',
  `position_id` int(10) unsigned NOT NULL COMMENT 'Position ID',
  `salary_sum` decimal(15,2) DEFAULT NULL COMMENT 'Salary sum',
  PRIMARY KEY (`salary_id`),
  KEY `SALARY_EMPLOYEE_ID_EMPLOYEE_EMPLOYEE_ID` (`employee_id`),
  KEY `SALARY_POSITION_ID_POSITION_POSITION_ID` (`position_id`),
  CONSTRAINT `SALARY_EMPLOYEE_ID_EMPLOYEE_EMPLOYEE_ID` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE,
  CONSTRAINT `SALARY_POSITION_ID_POSITION_POSITION_ID` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='Salary';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,1,2,256645.55),(2,1,2,35565.66),(3,1,1,48556.55),(4,1,1,35565.66),(5,1,1,355212.55),(6,1,1,125545.66),(7,2,1,654445.77),(8,2,2,65566.77),(9,2,2,23322.77),(10,2,2,43342.77),(11,3,3,4555.44),(12,3,3,55445.44),(13,3,3,88522.99),(14,3,3,88852.44),(15,3,3,65222.22),(16,4,4,2312.00),(17,4,4,32212.00),(18,4,4,32123.00),(19,4,4,12233.00),(20,4,4,44433.00),(21,5,4,5445.00),(22,5,4,43444.00),(23,5,4,3444.00),(24,5,4,12345.00),(25,5,4,2332.00),(26,5,4,33233.00),(27,6,4,3223.00),(28,6,4,12121.00),(29,6,4,2211.00),(30,6,4,4444.00),(31,6,4,7676.00),(32,6,4,9988.00),(33,7,4,4343.00),(34,7,4,5554.00),(35,7,4,4566.00),(36,7,4,7776.00),(37,7,4,8998.00),(38,7,4,6655.00),(39,8,4,7677.00),(40,8,4,7767.00),(41,8,4,7766.00),(42,8,4,4343.00),(43,8,4,6556.00),(44,9,5,12211.00),(45,9,5,665667.00),(46,9,5,567765.00),(47,9,5,8525111.00),(48,10,6,43434.00),(49,10,6,5511.00),(50,10,6,2334.00),(51,10,6,55567.00),(52,10,6,5111.00),(53,10,6,98778.00),(54,11,7,1211.00),(55,11,7,2222.00),(56,11,7,1233.00),(57,11,7,3233.00),(58,11,7,2345.00);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport` (
  `transport_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Transport ID',
  `type_of_transport` varchar(127) NOT NULL COMMENT 'Type of transport',
  `license_plate` varchar(10) NOT NULL COMMENT 'Transport license plate',
  PRIMARY KEY (`transport_id`),
  UNIQUE KEY `LICENSE_PLATE` (`license_plate`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Transport';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES (1,'jeep','Director'),(2,'trolleybus','AA4356BT'),(3,'trolleybus','CA2552BE'),(4,'trolleybus','CA4256AT'),(5,'trolleybus','AA9653TA'),(6,'bus','AA8845BT'),(7,'bus','AA4316BT'),(8,'bus','CA4356BT'),(9,'bus','AA4356BA'),(10,'repair trolleybus','CA5567BT'),(11,'repair bus','CA5588BT');
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-05  3:17:29
