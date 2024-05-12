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
-- Table structure for table `commerce_payment`
--

DROP TABLE IF EXISTS `commerce_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` datetime(6) NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  CONSTRAINT `commerce_payment_order_id_e1894226_fk_commerce_order_id` FOREIGN KEY (`order_id`) REFERENCES `commerce_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_payment`
--

LOCK TABLES `commerce_payment` WRITE;
/*!40000 ALTER TABLE `commerce_payment` DISABLE KEYS */;
INSERT INTO `commerce_payment` VALUES (4,'cash_on_delivery',798000.00,'2024-05-08 14:42:13.203204','000000',1),(5,'momo',988000.00,'2024-05-08 15:08:25.160461','000000',2),(6,'momo',988000.00,'2024-05-08 15:08:25.441645','000000',4),(7,'cash_on_delivery',300000.00,'2024-05-08 15:51:23.542562','000000',6),(8,'stripe',399000.00,'2024-05-08 15:53:15.602213','000000',5),(9,'cash_on_delivery',150000.00,'2024-05-08 15:55:48.584867','000000',7),(10,'cash_on_delivery',150000.00,'2024-05-08 15:55:48.919801','000000',9),(11,'paypal',2736000.00,'2024-05-08 15:58:26.975064','000000',10),(12,'paypal',2736000.00,'2024-05-08 15:58:27.319314','000000',11),(13,'cash_on_delivery',1744000.00,'2024-05-08 16:03:41.354606','000000',12),(14,'cash_on_delivery',1744000.00,'2024-05-08 16:03:41.660651','000000',13),(15,'cash_on_delivery',1768000.00,'2024-05-08 16:06:43.556159','000000',14),(16,'cash_on_delivery',6966000.00,'2024-05-08 16:13:55.633115','000000',15),(17,'cash_on_delivery',6966000.00,'2024-05-08 16:13:55.976864','000000',16);
/*!40000 ALTER TABLE `commerce_payment` ENABLE KEYS */;
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
