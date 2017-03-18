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
  PRIMARY KEY (`cpu_model_id`),
  KEY `cpu_model_fk1_idx` (`cpu_brand_id`),
  CONSTRAINT `cpu_model_fk1` FOREIGN KEY (`cpu_brand_id`) REFERENCES `cpu_brand` (`cpu_brand_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpu_model`
--

LOCK TABLES `cpu_model` WRITE;
/*!40000 ALTER TABLE `cpu_model` DISABLE KEYS */;
INSERT INTO `cpu_model` VALUES (1,1,'Core i7'),(2,1,'Core i5'),(3,1,'Core i3'),(4,2,'TEST FX'),(5,1,'Core M');
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
  `battery_life_hr` decimal(10,2) NOT NULL,
  `base_cpu_clock_ghz` decimal(10,2) NOT NULL,
  `ram_size_gb` decimal(10,2) NOT NULL,
  `storage_size_gb` decimal(10,2) NOT NULL,
  `is_touch_screen` bit(1) NOT NULL DEFAULT b'0',
  `is_ips_screen` bit(1) DEFAULT NULL,
  `is_tab_convert` bit(1) NOT NULL DEFAULT b'0' COMMENT 'can be converted into a tablet',
  `has_discrete_gpu` bit(1) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `photo_url` varchar(500) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `buy_link` varchar(500) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptop`
--

LOCK TABLES `laptop` WRITE;
/*!40000 ALTER TABLE `laptop` DISABLE KEYS */;
INSERT INTO `laptop` VALUES (1,4,3,2,1,17,'gram 14Z970 i5',14.00,2.10,-1.00,2.50,8.00,256.00,'','','\0',NULL,'2017-01-01',NULL,1199.99,'https://www.amazon.com/LG-gram-14Z970-Touchscreen-Laptop/dp/B01MS79LGW/ref=s9u_simh_gw_i1?_encoding=UTF8&fpl=fresh&pf_rd_m=ATVPDKIKX0DER&pf_rd_s=&pf_rd_r=2QF14JK0B7BGV0BTZQGA&pf_rd_t=36701&pf_rd_p=2a864ace-95b0-4160-8611-8c68f18bad61&pf_rd_i=desktop','fix battery life and url'),(2,4,3,2,1,17,'gram 13Z970 i5',13.00,2.10,-1.00,2.50,8.00,256.00,'\0','','\0',NULL,'2017-01-01',NULL,999.99,'https://www.amazon.com/LG-gram-13Z970-Laptop-White/dp/B01N7RQ46Q/ref=s9u_simh_gw_i6?_encoding=UTF8&fpl=fresh&pf_rd_m=ATVPDKIKX0DER&pf_rd_s=&pf_rd_r=BRD1E3FGS71MC9D5JP8Q&pf_rd_t=36701&pf_rd_p=1ccffb31-5ce0-4735-922f-7d3de52f6b31&pf_rd_i=desktop','fix battery life and url'),(3,4,3,2,1,17,'gram 15Z960 i5',15.60,2.16,-1.00,2.80,8.00,256.00,'\0','','\0',NULL,'2017-01-01',NULL,999.99,'https://www.amazon.com/LG-gram-15Z960-Laptop-Gold/dp/B019O7V4EU/ref=pd_day0_147_3?_encoding=UTF8&pd_rd_i=B019O7V4EU&pd_rd_r=T6NXKMQV4HQNM1V086C9&pd_rd_w=BiauP&pd_rd_wg=BbTjs&refRID=T6NXKMQV4HQNM1V086C9&th=1','fix battery life and url'),(4,5,3,5,1,17,'UX360CA-AH51T',13.30,2.90,-1.00,0.90,8.00,512.00,'','','','\0',NULL,'https://images-na.ssl-images-amazon.com/images/I/61dI-uY03uL._SL1200_.jpg',749.99,'https://www.amazon.com/dp/B01GHQOD8U?th=1',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfr`
--

LOCK TABLES `mfr` WRITE;
/*!40000 ALTER TABLE `mfr` DISABLE KEYS */;
INSERT INTO `mfr` VALUES (1,'Apple'),(2,'Dell'),(3,'Lenovo'),(4,'LG'),(5,'ASUS');
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

-- Dump completed on 2017-02-23  7:05:13

-- attnl tables

CREATE TABLE `laptop`.`header_type` (
  `header_type_id` INT NOT NULL AUTO_INCREMENT,
  `header_type_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`header_type_id`));
ALTER TABLE `laptop`.`header_type` 
ADD UNIQUE INDEX `header_type_unique` (`header_type_code` ASC);

CREATE TABLE `laptop`.`header` (
  `header_id` INT NOT NULL AUTO_INCREMENT,
  `header_type_id` INT NOT NULL,
  `header_text` VARCHAR(255) NOT NULL,
  `header_code` VARCHAR(45) NOT NULL,
  `default` BIT(1) NOT NULL DEFAULT false,
  `seq` INT NOT NULL,
  PRIMARY KEY (`header_id`),
  UNIQUE INDEX `header_code_UNIQUE` (`header_code` ASC),
  INDEX `header_fk1_idx` (`header_type_id` ASC),
  CONSTRAINT `header_fk1`
    FOREIGN KEY (`header_type_id`)
    REFERENCES `laptop`.`header_type` (`header_type_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

INSERT INTO `laptop`.`header_type` (`header_type_code`) VALUES ('TEXT');
INSERT INTO `laptop`.`header_type` (`header_type_code`) VALUES ('OTHER_TEST');
INSERT INTO `laptop`.`header_type` (`header_type_id`, `header_type_code`) VALUES ('3', 'NUMBER');

INSERT INTO `laptop`.`header` (`header_type_id`, `header_text`, `header_code`, `default`, `seq`) VALUES ('2', 'Photo', 'PHOTO', 1, '1');
INSERT INTO `laptop`.`header` (`header_type_id`, `header_text`, `header_code`, `default`, `seq`) VALUES ('1', 'Brand', 'BRAND', 1, '2');
INSERT INTO `laptop`.`header` (`header_type_id`, `header_text`, `header_code`, `default`, `seq`) VALUES ('1', 'Model', 'MODEL', 1, '3');
INSERT INTO `laptop`.`header` (`header_type_id`, `header_text`, `header_code`, `default`, `seq`) VALUES ('1', 'Screen Size', 'SCREEN_SIZE', 1, '4');
INSERT INTO `laptop`.`header` (`header_type_id`, `header_text`, `header_code`, `default`, `seq`) VALUES ('1', 'OS', 'OS_VERSION', 1, '5');
INSERT INTO `laptop`.`header` (`header_type_id`, `header_text`, `header_code`, `default`, `seq`) VALUES ('1', 'Processor Model', 'CPU_MODEL', 1, '6');
INSERT INTO `laptop`.`header` (`header_type_id`, `header_text`, `header_code`, `default`, `seq`) VALUES ('3', 'Processor Speed', 'CPU_SPEED', 1, '7');
INSERT INTO `laptop`.`header` (`header_type_id`, `header_text`, `header_code`, `default`, `seq`) VALUES ('3', 'Battery Life (Hour)', 'BATTERY_LIFE_HR', 1, '8');
INSERT INTO `laptop`.`header` (`header_type_id`, `header_text`, `header_code`, `default`, `seq`) VALUES ('2', 'Price', 'BUY_PRICE', 1, '9');

ALTER TABLE `laptop`.`storage_type` 
ADD COLUMN `storage_type_code` VARCHAR(45) NULL AFTER `storage_type`;

UPDATE `laptop`.`storage_type` SET `storage_type_code`='SSD' WHERE `storage_type_id`='1';
UPDATE `laptop`.`storage_type` SET `storage_type_code`='HDD' WHERE `storage_type_id`='2';

ALTER TABLE `laptop`.`storage_type` 
CHANGE COLUMN `storage_type_code` `storage_type_code` VARCHAR(45) NOT NULL ,
ADD UNIQUE INDEX `storage_type_code_UNIQUE` (`storage_type_code` ASC);

