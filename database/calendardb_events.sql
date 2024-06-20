-- MySQL dump 10.13  Distrib 8.4.0, for Win64 (x86_64)
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
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (114,'네트워크보안 중간고사','11시','2024-04-26','2024-04-26','네트워크보안'),(115,'시스템보안 중간고사','14시','2024-04-25','2024-04-25','시스템보안'),(116,'웹프로그래밍 중간고사','15시','2024-05-08','2024-05-08','웹프로그래밍'),(117,'네트워크보안 기말고사','10시','2024-06-19','2024-06-19','네트워크보안'),(118,'시스템보안 기말고사','14시','2024-06-13','2024-06-13','시스템보안'),(119,'웹프로그래밍 발표','9시~','2024-06-21','2024-06-21','웹프로그래밍'),(120,'기말고사 권장기간',NULL,'2024-06-03','2024-06-21','common'),(121,'성적입력기간',NULL,'2024-06-04','2024-06-24','common'),(122,'성적예고 및 정정기간',NULL,'2024-06-22','2024-06-26','common'),(123,'하계방학',NULL,'2024-06-22','2024-06-22','common'),(124,'어린이날',NULL,'2024-05-05','2024-05-05','공휴일'),(125,'부처님오신날',NULL,'2024-05-15','2024-05-15','공휴일'),(126,'현충일',NULL,'2024-06-06','2024-06-06','공휴일'),(127,'광복절',NULL,'2024-08-15','2024-08-15','공휴일'),(128,'추석 연휴',NULL,'2024-09-16','2024-09-18','공휴일'),(129,'개천절',NULL,'2024-10-03','2024-10-03','공휴일'),(130,'한글날',NULL,'2024-10-09','2024-10-09','공휴일'),(131,'크리스마스',NULL,'2024-12-25','2024-12-25','공휴일'),(132,'신정',NULL,'2025-01-01','2025-01-01','공휴일');
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

-- Dump completed on 2024-06-20 13:36:11
