-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstore_db
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'3299 Stephanie Trail','Lake Amyfort','Maryland','26778',2),(2,'5611 Michael Forest','West Bryanville','Michigan','34264',1),(3,'9159 Lopez Mission','South Michaelmouth','Nevada','82967',3),(4,'79019 Stone Way','Matthewland','Illinois','27559',4),(5,'930 David Bridge','Port Johnburgh','Georgia','88318',2),(6,'21726 Smith Drive','New Davidport','Minnesota','14488',3),(7,'9306 Roberts Gateway','Taylorport','Hawaii','66277',1),(8,'58465 Michelle Lights','Lake Anthonyberg','Nebraska','31515',4),(9,'43531 Vincent Street','Port Emilyfurt','New Hampshire','72718',5),(10,'41392 Joshua Tunnel','Lake Erica','Arkansas','60273',2),(11,'3299 Stephanie Trail','Lake Amyfort','Maryland','26778',2),(12,'5611 Michael Forest','West Bryanville','Michigan','34264',1),(13,'9159 Lopez Mission','South Michaelmouth','Nevada','82967',3),(14,'79019 Stone Way','Matthewland','Illinois','27559',4),(15,'930 David Bridge','Port Johnburgh','Georgia','88318',2),(16,'21726 Smith Drive','New Davidport','Minnesota','14488',3),(17,'9306 Roberts Gateway','Taylorport','Hawaii','66277',1),(18,'58465 Michelle Lights','Lake Anthonyberg','Nebraska','31515',4),(19,'43531 Vincent Street','Port Emilyfurt','New Hampshire','72718',5),(20,'41392 Joshua Tunnel','Lake Erica','Arkansas','60273',2);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-13 17:22:27
