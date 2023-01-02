-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: elearningmanagement
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `studentsmarks`
--

DROP TABLE IF EXISTS `studentsmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentsmarks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `studentID` varchar(45) NOT NULL,
  `mark` varchar(45) NOT NULL,
  `subject` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentsmarks`
--

LOCK TABLES `studentsmarks` WRITE;
/*!40000 ALTER TABLE `studentsmarks` DISABLE KEYS */;
INSERT INTO `studentsmarks` VALUES (21,'98643','10','AOB'),(22,'23 578 641','13','AOB'),(23,'65435678','11','Mathematiques'),(25,'65435678','10','AOB'),(26,'98643','12','AOB'),(27,'65435678','12','Physique'),(28,'23 578 641','10','Physique'),(29,'23 578 641     ','11','POO'),(30,'98643','10','Compilation'),(31,'54678','12','AOA'),(34,'98643','12','ZEBRA'),(35,'078','12','bBig data/b'),(36,'987654345','10','big bdata/b'),(37,'23','12','bbig/b data'),(38,'98643','10','bbig/bdata'),(39,'5678','13','Tag bsouris/b'),(40,'786','78','Tag bsouris/b'),(41,'987','89','vgv knjo'),(42,'768','78','drtf bhvghf'),(43,'987','897','Mathematiques  patarin '),(45,'98643','19','Sport'),(46,'98643','12','SVT'),(47,'87654','10','SVT'),(48,'98643','10,5','THERMO');
/*!40000 ALTER TABLE `studentsmarks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-02 17:10:09
