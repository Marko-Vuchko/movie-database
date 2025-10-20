-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: movie
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'United States of America'),(2,'Japan'),(3,'UK'),(4,'France'),(5,'Denmark'),(6,'Sweden'),(7,'South Korea'),(8,'Ireland'),(9,'Australia'),(10,'Italy'),(11,'Germany'),(12,'Brazil'),(13,'Argentina'),(14,'Spain'),(15,'Serbia');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `director_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  PRIMARY KEY (`director_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'James','Cameron'),(2,'Haruo','Sotozaki'),(3,'Matthew','Vaughn'),(4,'Jean-Pierre','Jeunet'),(5,'Thomas','Vinterberg'),(6,'Ruben','Östlund'),(7,'Park','Chan-wook'),(8,'Martin','McDonagh'),(9,'George','Miller'),(10,'Roberto','Benigni'),(11,'Tom','Tykwer'),(12,'Fernando','Meirelles'),(13,'Juan José','Campanella'),(14,'J.A.','Bayona'),(15,'Emir','Kusturica');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `genre_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Action'),(2,'Adventure'),(3,'Sci-Fi'),(4,'Animation'),(5,'Comedy'),(6,'Romance'),(7,'Drama'),(8,'Crime'),(9,'Mistery'),(10,'Comedy-Drama'),(11,'Thriller'),(12,'Krimi'),(13,'Horor'),(14,'Fantasy'),(15,'History');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `language_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'English'),(2,'Japanese'),(3,'French'),(4,'Danish'),(5,'Korean'),(6,'Italian'),(7,'German'),(8,'Portuguese'),(9,'Spanish'),(10,'Serbian'),(11,'Polish'),(12,'Hungarian'),(13,'Bosnian'),(14,'Sweden'),(15,'Russian');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `movie_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `release_year` int NOT NULL,
  `duration` int NOT NULL,
  `budget` decimal(15,2) NOT NULL,
  `box_office` decimal(15,2) NOT NULL,
  `language_id` int NOT NULL,
  `country_id` int NOT NULL,
  `director_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`movie_id`),
  KEY `fk_languageid_idx` (`language_id`),
  KEY `fkcountryid_idx` (`country_id`),
  KEY `fk_directorid_idx` (`director_id`),
  KEY `fk_genreid_idx` (`genre_id`),
  CONSTRAINT `fk_countryid` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_directorid` FOREIGN KEY (`director_id`) REFERENCES `director` (`director_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_genreid` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_languageid` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Avatar: The Way of Water',2022,192,460000000.00,2320000000.00,1,1,1,2),(2,'Demon Slayer: Kimetsu no Yaiba - The Movie: Mugen Train',2020,117,15000000.00,507000000.00,2,2,2,4),(3,'King\'s Man: The Secret Service',2021,131,100000000.00,126000000.00,1,1,3,1),(4,'Amélie',2001,122,10000000.00,174200000.00,3,4,4,5),(5,'Another Round',2020,117,5000000.00,4400000.00,4,5,5,7),(6,'Triangle of USAness',2022,147,15600000.00,24000000.00,1,6,6,5),(7,'Decision to Leave',2022,138,10000000.00,19000000.00,5,7,7,9),(8,'The Banshees of Inisherin',2022,114,20000000.00,49000000.00,1,8,8,7),(9,'Mad Max: Fury Road',2015,120,150000000.00,375200000.00,1,9,9,1),(10,'Life Is Beautiful',1997,116,20000000.00,230000000.00,6,10,10,10),(11,'Run Lola Run',1998,80,1750000.00,22900000.00,7,11,11,11),(12,'Cidade de Deus (City of God)',2002,130,3300000.00,30600000.00,8,12,12,12),(13,'The Secret in Their Eyes',2009,129,2000000.00,34200000.00,9,13,13,7),(14,'The Orphanage',2007,105,4000000.00,78638987.00,9,14,14,13),(15,'Underground',1995,170,12000000.00,17200000.00,10,15,15,10);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-28 17:20:23
