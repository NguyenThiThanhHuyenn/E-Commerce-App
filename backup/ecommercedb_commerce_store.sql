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
-- Table structure for table `commerce_store`
--

DROP TABLE IF EXISTS `commerce_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_store` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `store_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  `wallpaper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `commerce_store_user_id_1b544215_fk_commerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `commerce_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_store`
--

LOCK TABLES `commerce_store` WRITE;
/*!40000 ALTER TABLE `commerce_store` DISABLE KEYS */;
INSERT INTO `commerce_store` VALUES (1,'Plave\'s Goods','Chuyên bán goods Plave, gom orders','2024-04-16 16:00:28.665077','2024-05-06 06:55:30.216637',1,'image/upload/v1714978530/rxmjixehaq2pwugmqgoq.jpg',1),(2,'BuBu shop','Chuyên thời trang và sản phẩm chăm sóc dành cho mẹ và bé','2024-04-21 09:08:35.639837','2024-05-05 13:46:43.061202',2,'image/upload/v1714916802/qtzi6ggijrdrv6aborz7.jpg',1),(3,'Cửa hàng điện tử','Cửa hàng chuyên buôn bán đồ điện tử giá học sinh sinh viên','2024-04-27 13:45:23.448663','2024-05-05 13:46:31.699654',7,'image/upload/v1714916791/ea1iiodyt0b9qz5zowfw.jpg',1),(4,'Yana','Thời trang nam nữ','2024-04-27 15:25:05.258615','2024-05-05 13:46:04.238694',9,'image/upload/v1714916754/p8br6lptzihufpwll6ht.png',1),(5,'Yobuta','Thời trang unisex','2024-04-27 15:50:01.276148','2024-05-05 13:46:00.031010',4,'image/upload/v1714916740/ehrne1eh6wxmiyv9eneh.jpg',1),(6,'MOKA Cosmetics','Chuyên mỹ phẩm, skincare.','2024-05-05 10:23:25.254378','2024-05-06 07:09:26.818679',17,'image/upload/v1714979366/bq6ltacissfxfw67w3fe.jpg',1);
/*!40000 ALTER TABLE `commerce_store` ENABLE KEYS */;
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
