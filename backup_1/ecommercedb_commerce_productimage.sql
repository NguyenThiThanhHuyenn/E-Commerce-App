-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ecommercedb
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `commerce_productimage`
--

DROP TABLE IF EXISTS `commerce_productimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_productimage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commerce_productimage_product_id_99719dcd_fk_commerce_product_id` (`product_id`),
  CONSTRAINT `commerce_productimage_product_id_99719dcd_fk_commerce_product_id` FOREIGN KEY (`product_id`) REFERENCES `commerce_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_productimage`
--

LOCK TABLES `commerce_productimage` WRITE;
/*!40000 ALTER TABLE `commerce_productimage` DISABLE KEYS */;
INSERT INTO `commerce_productimage` VALUES (5,'product/2024/04/5-2200.jpg','2024-04-17 12:54:48.549631','2024-04-17 12:54:48.549631',2),(6,'product/2024/04/images_eW1EHkq.jpg','2024-04-17 12:55:04.174685','2024-04-17 12:55:04.174685',2),(7,'product/2024/04/5-2200_kAM9fyC.jpg','2024-04-17 12:59:55.958238','2024-04-17 12:59:55.958238',2),(8,'product/2024/04/420014890_2142697089443275_9106759717044729339_n.jpg','2024-04-17 13:40:37.834637','2024-04-17 13:40:37.834637',1),(9,'product/2024/04/vn-11134207-7r98o-lnup17e24cmlb4.jpg','2024-04-21 12:36:52.896503','2024-04-21 12:36:52.896503',4),(10,'product/2024/04/vn-11134207-7r98o-lo4vtwsire2f48.jpg','2024-04-21 12:37:15.111145','2024-04-21 12:37:15.111145',4);
/*!40000 ALTER TABLE `commerce_productimage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-24 17:52:50
