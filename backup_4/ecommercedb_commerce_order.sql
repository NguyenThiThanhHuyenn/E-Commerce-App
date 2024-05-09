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
-- Table structure for table `commerce_order`
--

DROP TABLE IF EXISTS `commerce_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_date` datetime(6) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `store_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commerce_order_user_id_3f7ff6c0_fk_commerce_user_id` (`user_id`),
  KEY `commerce_order_store_id_f48d4b4e_fk_commerce_store_id` (`store_id`),
  CONSTRAINT `commerce_order_store_id_f48d4b4e_fk_commerce_store_id` FOREIGN KEY (`store_id`) REFERENCES `commerce_store` (`id`),
  CONSTRAINT `commerce_order_user_id_3f7ff6c0_fk_commerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `commerce_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_order`
--

LOCK TABLES `commerce_order` WRITE;
/*!40000 ALTER TABLE `commerce_order` DISABLE KEYS */;
INSERT INTO `commerce_order` VALUES (1,'2024-05-08 12:21:04.429503',798000.00,'cash_on_delivery','completed',16,6),(2,'2024-05-08 12:31:46.680754',988000.00,'cash_on_delivery','completed',16,1),(3,'2024-05-08 12:49:40.452345',85000.00,'cash_on_delivery','pending',16,4),(4,'2024-05-08 12:55:51.131519',345000.00,'cash_on_delivery','completed',16,2),(5,'2024-05-08 14:39:09.542643',399000.00,'cash_on_delivery','completed',17,6),(6,'2024-05-08 15:46:59.287210',300000.00,'cash_on_delivery','completed',16,2),(7,'2024-05-08 15:54:53.604962',150000.00,'cash_on_delivery','completed',17,3),(8,'2024-05-08 15:54:54.714369',150000.00,'cash_on_delivery','pending',17,3),(9,'2024-05-08 15:55:13.279732',250000.00,'cash_on_delivery','completed',17,4),(10,'2024-05-08 15:57:27.512194',2736000.00,'cash_on_delivery','completed',17,1),(11,'2024-05-08 15:57:38.465376',470000.00,'cash_on_delivery','completed',17,5),(12,'2024-05-08 16:02:52.441345',756000.00,'cash_on_delivery','completed',17,5),(13,'2024-05-08 16:03:14.145175',988000.00,'cash_on_delivery','completed',17,1),(14,'2024-05-08 16:06:19.178890',250000.00,'cash_on_delivery','completed',19,4),(15,'2024-05-08 16:13:09.367004',666000.00,'cash_on_delivery','completed',19,2),(16,'2024-05-08 16:13:22.858443',6300000.00,'cash_on_delivery','completed',19,3);
/*!40000 ALTER TABLE `commerce_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-09 14:26:38
