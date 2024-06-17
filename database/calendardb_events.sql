-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: calendardb
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
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `category` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (8,'124','3142123','2024-06-25','2024-06-29','NAN'),(9,'123','12314','2024-06-24','2024-06-27','2020011898'),(10,'124','3123','2024-06-27','2024-06-29','NAN'),(12,'1243','124123','2024-06-26','2024-06-26','JSP'),(14,'1423','1243','2024-06-26','2024-06-28','2020011898'),(15,'1235124','3145234','2024-06-13','2024-06-15','JSP'),(16,'12344','12345234','2024-06-11','2024-06-13','NAN'),(17,'ㅁㄶㅇㄹ','ㅁㄴㅇㄹ','2024-06-05','2024-06-05','personal'),(18,'123','assdf','2024-06-05','2024-06-05','2020011898'),(19,'ㅁㄴㅇㄹ','sdfasgsadf','2024-06-10','2024-06-10','JSP'),(20,'sadfasfd','sgdfasdf','2024-06-11','2024-06-11',''),(21,'asgdaf','asdf','2024-06-20','2024-06-20','JSP'),(22,'asgdf','agsdf','2024-06-12','2024-06-12','2020011898'),(23,'ㅁㄴㅇㄻㄴㅇ','ㄻㄴㅇㄻㄴㅇ','2024-06-04','2024-06-04',''),(24,'ㅁㄴㅇㄹㄴㅁㅇㄹ','ㅁㄴㅇㄻㄴㅇㄹ','2024-06-11','2024-06-11','');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-18  7:14:29
