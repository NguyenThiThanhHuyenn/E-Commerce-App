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
-- Table structure for table `commerce_category`
--

DROP TABLE IF EXISTS `commerce_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `commerce_category_parent_id_ba25a94e_fk_commerce_category_id` (`parent_id`),
  CONSTRAINT `commerce_category_parent_id_ba25a94e_fk_commerce_category_id` FOREIGN KEY (`parent_id`) REFERENCES `commerce_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_category`
--

LOCK TABLES `commerce_category` WRITE;
/*!40000 ALTER TABLE `commerce_category` DISABLE KEYS */;
INSERT INTO `commerce_category` VALUES (1,'Thời trang','2024-04-16 15:36:35.504287','2024-04-16 15:36:35.504287',NULL,1),(2,'Mỹ phẩm','2024-04-16 15:37:38.991804','2024-04-16 15:37:38.991804',NULL,1),(3,'Thể thao & Du lịch','2024-04-16 15:38:21.636661','2024-04-16 15:38:21.636661',NULL,1),(4,'Sức khỏe','2024-04-16 15:38:35.235191','2024-04-16 15:38:35.235191',NULL,1),(5,'Nhà cửa & Đời sống','2024-04-16 15:39:04.019035','2024-04-16 15:39:04.020102',NULL,1),(6,'Thiết bị điện tử','2024-04-16 15:39:24.352499','2024-04-16 15:39:24.352499',NULL,1),(7,'Thời trang nam','2024-04-16 15:47:05.482353','2024-04-16 15:47:05.482353',1,1),(8,'Thời trang nữ','2024-04-16 15:47:39.499214','2024-04-16 15:47:39.499214',1,1),(9,'Thời trang mẹ và bé','2024-04-16 15:47:55.998153','2024-04-16 15:47:55.998153',1,1),(10,'Trang sức nam','2024-04-16 15:48:34.973391','2024-04-16 15:48:34.973391',1,1),(11,'Trang sức nữ','2024-04-16 15:48:58.657207','2024-04-16 15:48:58.657207',1,1),(12,'Chăm sóc da','2024-04-16 15:50:01.207728','2024-04-16 15:50:01.207728',2,1),(13,'Trang điểm','2024-04-16 15:50:12.067620','2024-04-16 15:50:12.067620',2,1),(14,'Thể thao','2024-04-16 15:50:34.043389','2024-04-16 15:50:34.043389',3,1),(15,'Du lịch','2024-04-16 15:50:41.871628','2024-04-16 15:50:41.871628',3,1),(16,'Điện thoại','2024-04-16 15:51:25.379445','2024-04-16 15:51:25.379445',6,1),(17,'Máy tính/Laptop','2024-04-16 15:51:45.555286','2024-04-16 15:51:45.555286',6,1),(18,'Phụ kiện','2024-04-16 15:51:58.190562','2024-04-16 15:51:58.190562',6,1),(19,'Giải trí','2024-04-16 16:21:28.271778','2024-04-16 16:21:28.271778',NULL,1);
/*!40000 ALTER TABLE `commerce_category` ENABLE KEYS */;
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
