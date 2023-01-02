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
-- Table structure for table `uploadedfilesname`
--

DROP TABLE IF EXISTS `uploadedfilesname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uploadedfilesname` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fileName` varchar(100) DEFAULT NULL,
  `section` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploadedfilesname`
--

LOCK TABLES `uploadedfilesname` WRITE;
/*!40000 ALTER TABLE `uploadedfilesname` DISABLE KEYS */;
INSERT INTO `uploadedfilesname` VALUES (1,'4_negociation_J_d.xls','iatic 3'),(2,'Capture d’écran du 2022-12-10 13-33-37.png','iatic 5'),(3,'health_effects.csv','iatic 5'),(4,'TD2.pdf','iatic 5'),(5,'6g-timeline.pdf','iatic 3'),(6,'Documentation_de_projet_groupe_client.docx','iatic 3'),(7,'Documentation_de_projet_groupe_client.pdf','iatic 5'),(8,'Travail demandé.pptx','iatic 3'),(9,'TD1 (3).pdf','iatic 5'),(10,'TD1 (3).pdf','iatic 5'),(11,'Fact Sheet 22-23.pdf','iatic 3'),(12,'MATHS_IATIC-4_users.xlsx','iatic 5'),(13,'PHYSIQUE_IMG_20221128_163452667_MFNR.jpg','iatic 3'),(14,'PHYSIQUE_RIO_Learning _Agreement_EnglishVersion 1.pdf','iatic 3'),(15,'COMPILATION_Mémento départ 22 23.pdf','iatic 4'),(16,'test test_isty_iut.jpg','iatic 3'),(17,'SVT_2. Client Service Web helloWorld.ipynb','iatic 5'),(18,'Maths_Document 14.pdf','iatic 3'),(19,'Maths_6g-timeline (1).pdf','iatic 4'),(20,'98643_2023-01-02_isty_iut.jpg','justif'),(21,'98643_2023-01-02_Notes-ISTY-dec-20228900.pdf','justif'),(22,'Afifia dALILA_Notes-ISTY-dec-20228900.pdf','iatic 3'),(23,'Fathalah Amrino_test (1).jpg','iatic 3'),(24,'98643_2023-01-02_DELVAL_Aurelien_TP4 (1).pdf','justif');
/*!40000 ALTER TABLE `uploadedfilesname` ENABLE KEYS */;
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
