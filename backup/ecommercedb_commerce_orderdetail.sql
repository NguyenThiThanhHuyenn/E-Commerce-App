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
-- Table structure for table `commerce_orderdetail`
--

DROP TABLE IF EXISTS `commerce_orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_orderdetail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `product_id` bigint NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `order_id` bigint NOT NULL,
  `store_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commerce_orderdetail_product_id_840cbae0_fk_commerce_product_id` (`product_id`),
  KEY `commerce_orderdetail_order_id_74ea5df7_fk_commerce_order_id` (`order_id`),
  KEY `commerce_orderdetail_store_id_8dbc521d_fk_commerce_store_id` (`store_id`),
  CONSTRAINT `commerce_orderdetail_order_id_74ea5df7_fk_commerce_order_id` FOREIGN KEY (`order_id`) REFERENCES `commerce_order` (`id`),
  CONSTRAINT `commerce_orderdetail_product_id_840cbae0_fk_commerce_product_id` FOREIGN KEY (`product_id`) REFERENCES `commerce_product` (`id`),
  CONSTRAINT `commerce_orderdetail_store_id_8dbc521d_fk_commerce_store_id` FOREIGN KEY (`store_id`) REFERENCES `commerce_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_orderdetail`
--

LOCK TABLES `commerce_orderdetail` WRITE;
/*!40000 ALTER TABLE `commerce_orderdetail` DISABLE KEYS */;
INSERT INTO `commerce_orderdetail` VALUES (24,2,399000.00,53,'[\"250ml\", \"Mùi bạc hà\",]',1,6),(25,4,230000.00,46,'',5,6),(26,1,399000.00,53,'[\"350ml\", \"Mùi đào\",]',5,6),(27,1,988000.00,10,'',2,1),(28,1,345000.00,22,'',4,2),(30,1,300000.00,5,'',6,2),(32,1,150000.00,6,'',7,3),(33,2,125000.00,8,'',9,4),(34,3,912000.00,12,'',10,1),(35,1,470000.00,13,'',11,5),(36,2,378000.00,17,'',12,5),(37,1,988000.00,10,'',13,1),(38,2,759000.00,9,'',14,4),(39,2,125000.00,8,'',14,4),(40,3,222000.00,18,'',15,2),(41,7,900000.00,7,'',16,3);
/*!40000 ALTER TABLE `commerce_orderdetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-09 14:26:36
