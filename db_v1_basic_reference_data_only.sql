CREATE DATABASE  IF NOT EXISTS `laptop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `laptop`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: laptop
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `cpu_brand`
--

DROP TABLE IF EXISTS `cpu_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpu_brand` (
  `cpu_brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `cpu_brand` varchar(45) NOT NULL,
  PRIMARY KEY (`cpu_brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpu_brand`
--

LOCK TABLES `cpu_brand` WRITE;
/*!40000 ALTER TABLE `cpu_brand` DISABLE KEYS */;
INSERT INTO `cpu_brand` VALUES (1,'Intel'),(2,'AMD');
/*!40000 ALTER TABLE `cpu_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpu_model`
--

DROP TABLE IF EXISTS `cpu_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpu_model` (
  `cpu_model_id` int(11) NOT NULL AUTO_INCREMENT,
  `cpu_brand_id` int(11) NOT NULL,
  `cpu_model` varchar(255) NOT NULL,
  `base_clock_ghz` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`cpu_model_id`),
  KEY `cpu_model_fk1_idx` (`cpu_brand_id`),
  CONSTRAINT `cpu_model_fk1` FOREIGN KEY (`cpu_brand_id`) REFERENCES `cpu_brand` (`cpu_brand_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpu_model`
--

LOCK TABLES `cpu_model` WRITE;
/*!40000 ALTER TABLE `cpu_model` DISABLE KEYS */;
INSERT INTO `cpu_model` VALUES (1,1,'TEST i7',3.40),(2,1,'TEST i5',3.20),(3,1,'TEST i3',3.10),(4,2,'TEST FX',2.80);
/*!40000 ALTER TABLE `cpu_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `display_res`
--

DROP TABLE IF EXISTS `display_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `display_res` (
  `display_res_id` int(11) NOT NULL AUTO_INCREMENT,
  `standard` varchar(45) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  PRIMARY KEY (`display_res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `display_res`
--

LOCK TABLES `display_res` WRITE;
/*!40000 ALTER TABLE `display_res` DISABLE KEYS */;
INSERT INTO `display_res` VALUES (1,'CGA',320,240),(2,'VGA',640,480),(3,'SVGA',800,600),(4,'WSVGA',1024,600),(5,'XGA',1024,768),(6,'XGA+',1152,865),(7,'WXGA',1280,720),(8,'WXGA',1280,768),(9,'WXGA',1280,800),(10,'SXGA',1280,1024),(11,'HD',1360,768),(12,'HD',1366,768),(13,'WXGA+',1440,900),(14,'HD+',1600,900),(15,'UXGA',1600,1200),(16,'WSXGA+',1680,1050),(17,'FHD',1920,1080),(18,'WUXGA',1920,1200),(19,'WQHD',2560,1440),(20,'WQXGA',2560,1600),(21,'4K UHD',3840,2160),(22,'8K UHD',7680,4320);
/*!40000 ALTER TABLE `display_res` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laptop`
--

DROP TABLE IF EXISTS `laptop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laptop` (
  `laptop_id` int(11) NOT NULL AUTO_INCREMENT,
  `mfr_id` int(11) NOT NULL,
  `os_version_id` int(11) NOT NULL,
  `cpu_model_id` int(11) NOT NULL,
  `storage_type_id` int(11) NOT NULL,
  `display_res_id` int(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `screen_size` decimal(10,2) NOT NULL COMMENT 'in inches',
  `weight` decimal(10,2) NOT NULL COMMENT 'in lb',
  `ram_size_gb` decimal(10,2) NOT NULL,
  `storage_size_gb` decimal(10,2) NOT NULL,
  `release_date` date DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `buy_link` varchar(500) DEFAULT NULL,
  `internal_notes` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`laptop_id`),
  KEY `laptop_fk1_idx` (`mfr_id`),
  KEY `laptop_fk2_idx` (`os_version_id`),
  KEY `laptop_fk3_idx` (`cpu_model_id`),
  KEY `laptop_fk4_idx` (`storage_type_id`),
  KEY `laptop_fk5_idx` (`display_res_id`),
  CONSTRAINT `laptop_fk1` FOREIGN KEY (`mfr_id`) REFERENCES `mfr` (`mfr_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `laptop_fk2` FOREIGN KEY (`os_version_id`) REFERENCES `os_version` (`os_version_id`) ON UPDATE CASCADE,
  CONSTRAINT `laptop_fk3` FOREIGN KEY (`cpu_model_id`) REFERENCES `cpu_model` (`cpu_model_id`) ON UPDATE CASCADE,
  CONSTRAINT `laptop_fk4` FOREIGN KEY (`storage_type_id`) REFERENCES `storage_type` (`storage_type_id`) ON UPDATE CASCADE,
  CONSTRAINT `laptop_fk5` FOREIGN KEY (`display_res_id`) REFERENCES `display_res` (`display_res_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptop`
--

LOCK TABLES `laptop` WRITE;
/*!40000 ALTER TABLE `laptop` DISABLE KEYS */;
/*!40000 ALTER TABLE `laptop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfr`
--

DROP TABLE IF EXISTS `mfr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mfr` (
  `mfr_id` int(11) NOT NULL AUTO_INCREMENT,
  `mfr_name` varchar(255) NOT NULL,
  PRIMARY KEY (`mfr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr`
--

LOCK TABLES `mfr` WRITE;
/*!40000 ALTER TABLE `mfr` DISABLE KEYS */;
INSERT INTO `mfr` VALUES (1,'Apple'),(2,'Dell'),(3,'Lenovo');
/*!40000 ALTER TABLE `mfr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os_type`
--

DROP TABLE IF EXISTS `os_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `os_type` (
  `os_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `os_type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`os_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_type`
--

LOCK TABLES `os_type` WRITE;
/*!40000 ALTER TABLE `os_type` DISABLE KEYS */;
INSERT INTO `os_type` VALUES (1,'Windows'),(2,'Mac OS'),(3,'Linux');
/*!40000 ALTER TABLE `os_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os_version`
--

DROP TABLE IF EXISTS `os_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `os_version` (
  `os_version_id` int(11) NOT NULL AUTO_INCREMENT,
  `os_type_id` int(11) NOT NULL,
  `os_version_name` varchar(255) NOT NULL,
  PRIMARY KEY (`os_version_id`),
  KEY `os_version_fk1_idx` (`os_type_id`),
  CONSTRAINT `os_version_fk1` FOREIGN KEY (`os_type_id`) REFERENCES `os_type` (`os_type_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_version`
--

LOCK TABLES `os_version` WRITE;
/*!40000 ALTER TABLE `os_version` DISABLE KEYS */;
INSERT INTO `os_version` VALUES (1,1,'Windows 7'),(2,1,'Windows 8'),(3,1,'Windows 10'),(4,2,'OSX'),(5,3,'Ubuntu');
/*!40000 ALTER TABLE `os_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_type`
--

DROP TABLE IF EXISTS `storage_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage_type` (
  `storage_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_type` varchar(255) NOT NULL,
  PRIMARY KEY (`storage_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_type`
--

LOCK TABLES `storage_type` WRITE;
/*!40000 ALTER TABLE `storage_type` DISABLE KEYS */;
INSERT INTO `storage_type` VALUES (1,'Solid State Drive'),(2,'Hard Disk Drive');
/*!40000 ALTER TABLE `storage_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'laptop'
--

--
-- Dumping routines for database 'laptop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-22  9:50:25
