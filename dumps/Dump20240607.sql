-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: calendar
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `grouplist`
--

DROP TABLE IF EXISTS `grouplist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grouplist` (
  `GroupName` varchar(20) NOT NULL,
  `AdminID` varchar(45) DEFAULT NULL,
  `GroupType` int DEFAULT NULL,
  PRIMARY KEY (`GroupName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouplist`
--

LOCK TABLES `grouplist` WRITE;
/*!40000 ALTER TABLE `grouplist` DISABLE KEYS */;
INSERT INTO `grouplist` VALUES ('NaN','minn0701',1),('Webprogramming','sangjoon1',2);
/*!40000 ALTER TABLE `grouplist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `id`
--

DROP TABLE IF EXISTS `id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `id` (
  `ID` varchar(20) NOT NULL,
  `StudentID` varchar(11) DEFAULT NULL,
  `author` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `id`
--

LOCK TABLES `id` WRITE;
/*!40000 ALTER TABLE `id` DISABLE KEYS */;
INSERT INTO `id` VALUES ('gyeonjin1','2021321654',2),('minn0701','2020011898',1),('myeonghyoen','2022321478',0),('sangjoon1','2019543178',1);
/*!40000 ALTER TABLE `id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personschedule`
--

DROP TABLE IF EXISTS `personschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personschedule` (
  `StudentID` varchar(45) NOT NULL,
  `Date` date NOT NULL,
  `ScheduleName` varchar(45) DEFAULT NULL,
  `Time` varchar(45) DEFAULT NULL,
  `Location` varchar(45) DEFAULT NULL,
  `ScheduleDescription` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`StudentID`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personschedule`
--

LOCK TABLES `personschedule` WRITE;
/*!40000 ALTER TABLE `personschedule` DISABLE KEYS */;
INSERT INTO `personschedule` VALUES ('minn0701','2024-03-21','동아리모임','12:30','강의실','NaN동아리 모임'),('sangjoon1','2024-06-21','과제제출','24:00','온라인','팀플과제제출');
/*!40000 ALTER TABLE `personschedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-07 13:40:11
