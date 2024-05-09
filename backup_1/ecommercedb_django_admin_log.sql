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
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_commerce_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_commerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `commerce_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-04-16 15:47:05.483351','7','Thời trang nam',1,'[{\"added\": {}}]',7,1),(2,'2024-04-16 15:47:39.500214','8','Thời trang nữ',1,'[{\"added\": {}}]',7,1),(3,'2024-04-16 15:47:55.999151','9','Thời trang mẹ và bé',1,'[{\"added\": {}}]',7,1),(4,'2024-04-16 15:48:34.974405','10','Trang sức nam',1,'[{\"added\": {}}]',7,1),(5,'2024-04-16 15:48:58.658209','11','Trang sức nữ',1,'[{\"added\": {}}]',7,1),(6,'2024-04-16 15:50:01.208728','12','Chăm sóc da',1,'[{\"added\": {}}]',7,1),(7,'2024-04-16 15:50:12.068614','13','Trang điểm',1,'[{\"added\": {}}]',7,1),(8,'2024-04-16 15:50:34.044388','14','Thể thao',1,'[{\"added\": {}}]',7,1),(9,'2024-04-16 15:50:41.871628','15','Du lịch',1,'[{\"added\": {}}]',7,1),(10,'2024-04-16 15:51:25.380443','16','Điện thoại',1,'[{\"added\": {}}]',7,1),(11,'2024-04-16 15:51:45.556278','17','Máy tính/Laptop',1,'[{\"added\": {}}]',7,1),(12,'2024-04-16 15:51:58.191556','18','Phụ kiện',1,'[{\"added\": {}}]',7,1),(13,'2024-04-16 16:00:28.675090','1','Store object (1)',1,'[{\"added\": {}}]',13,1),(14,'2024-04-16 16:01:02.184086','1','Store object (1)',2,'[]',13,1),(15,'2024-04-16 16:01:26.193797','1','Store object (1)',2,'[]',13,1),(16,'2024-04-16 16:05:52.867672','1','Plave\'s Goods',2,'[]',13,1),(17,'2024-04-16 16:45:17.248981','1','Doll Plave',1,'[{\"added\": {}}]',10,1),(18,'2024-04-16 17:05:15.151144','2','Doll Plave',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"ProductImage object (1)\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"ProductImage object (2)\"}}]',10,1),(19,'2024-04-16 17:06:03.045850','2','Doll Plave',2,'[]',10,1),(20,'2024-04-16 17:06:28.613741','2','Doll Plave S',2,'[{\"changed\": {\"fields\": [\"Product name\"]}}]',10,1),(21,'2024-04-16 17:41:38.049337','2','Doll Plave S',2,'[{\"deleted\": {\"name\": \"product image\", \"object\": \"ProductImage object (None)\"}}, {\"deleted\": {\"name\": \"product image\", \"object\": \"ProductImage object (None)\"}}]',10,1),(22,'2024-04-16 18:11:04.446659','3','Card nhóm',1,'[{\"added\": {}}, {\"added\": {\"name\": \"product image\", \"object\": \"ProductImage object (3)\"}}, {\"added\": {\"name\": \"product image\", \"object\": \"ProductImage object (4)\"}}]',10,1),(23,'2024-04-16 18:22:59.062101','3','Card nhóm',2,'[]',10,1),(24,'2024-04-17 11:29:49.130783','3','Card nhóm',3,'',10,1),(25,'2024-04-17 12:54:48.554671','2','Doll Plave S',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"ProductImage object (5)\"}}]',10,1),(26,'2024-04-17 12:55:04.175698','2','Doll Plave S',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"ProductImage object (6)\"}}]',10,1),(27,'2024-04-17 12:59:55.959231','2','Doll Plave S',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"ProductImage object (7)\"}}]',10,1),(28,'2024-04-17 13:40:21.346655','1','Doll Plave',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',10,1),(29,'2024-04-17 13:40:37.834637','1','Doll Plave',2,'[{\"added\": {\"name\": \"product image\", \"object\": \"ProductImage object (8)\"}}]',10,1),(30,'2024-04-19 00:01:52.903346','1','Plave\'s Goods',2,'[{\"changed\": {\"fields\": [\"Average rating\"]}}]',13,1),(31,'2024-04-19 04:26:22.994057','1','Staffs',1,'[{\"added\": {}}]',3,1),(32,'2024-04-19 04:26:40.646125','1','Staffs',2,'[]',3,1),(33,'2024-04-19 05:22:39.583924','2','staff1',1,'[{\"added\": {}}]',6,1),(34,'2024-04-19 05:24:06.114711','2','staff1',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',6,1),(35,'2024-04-22 04:38:17.031249','2','staff1',2,'[]',6,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
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
