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
-- Table structure for table `commerce_product`
--

DROP TABLE IF EXISTS `commerce_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `store_id` bigint NOT NULL,
  `average_rating` decimal(3,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commerce_product_store_id_347b7d16_fk_commerce_store_id` (`store_id`),
  KEY `commerce_product_category_id_f0d15f8b_fk_commerce_category_id` (`category_id`),
  CONSTRAINT `commerce_product_category_id_f0d15f8b_fk_commerce_category_id` FOREIGN KEY (`category_id`) REFERENCES `commerce_category` (`id`),
  CONSTRAINT `commerce_product_store_id_347b7d16_fk_commerce_store_id` FOREIGN KEY (`store_id`) REFERENCES `commerce_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_product`
--

LOCK TABLES `commerce_product` WRITE;
/*!40000 ALTER TABLE `commerce_product` DISABLE KEYS */;
INSERT INTO `commerce_product` VALUES (1,'Doll Plave',380000.00,'<h2><em><strong>B&uacute;p b&ecirc; Plave, ch&iacute;nh h&atilde;ng K&iacute;ch thước: 10cm</strong></em></h2>\r\n\r\n<p><img alt=\"\" src=\"/static/product/2024/04/17/images.jpg\" style=\"height:225px; width:225px\" /></p>',50,'2024-04-16 16:45:17.242973','2024-04-21 13:59:13.836615',1,19,1,0.00),(2,'Doll Plave S',250000.00,'Sale off',22,'2024-04-16 17:05:15.143142','2024-04-21 13:59:37.227520',1,19,1,0.00),(4,'Khăn sữa Kiba',14000.00,'Khăn sữa cho bé Kiba siêu mềm siêu thấm 2 lớp, 3 lớp, 4 lớp kích thước 25x25cm – Set 10 khăn tiện lợi, không thể thiếu cho bé yêu',500,'2024-04-21 10:49:24.544096','2024-04-21 10:49:24.544096',1,9,2,0.00);
/*!40000 ALTER TABLE `commerce_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-24 17:52:49
