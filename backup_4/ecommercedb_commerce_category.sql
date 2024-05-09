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
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `commerce_category` VALUES (1,'Thời trang','2024-04-16 15:36:35.504287','2024-05-05 13:15:47.436414',1,1,'image/upload/v1714914606/yqmcahsipwsegc2gh1tt.jpg'),(2,'Mỹ phẩm','2024-04-16 15:37:38.991804','2024-05-05 13:16:27.102381',2,1,'image/upload/v1714914986/njveq9vucarubsugebph.jpg'),(3,'Thể thao & Du lịch','2024-04-16 15:38:21.636661','2024-05-05 13:17:05.514558',3,1,'image/upload/v1714915025/s3uuc7bahunob5dhlu7q.jpg'),(4,'Sức khỏe','2024-04-16 15:38:35.235191','2024-05-05 13:17:30.235050',4,1,'image/upload/v1714915049/r4jvasgureuyfmi05bq4.jpg'),(5,'Nhà cửa & Đời sống','2024-04-16 15:39:04.019035','2024-05-05 13:18:11.250709',5,1,'image/upload/v1714915090/rgwdb9imueqpjr4w5kfl.jpg'),(6,'Thiết bị điện tử','2024-04-16 15:39:24.352499','2024-05-05 13:18:35.675279',6,1,'image/upload/v1714915115/wi4dqduigrqbq4zvawtw.jpg'),(7,'Thời trang nam','2024-04-16 15:47:05.482353','2024-05-05 13:19:03.042934',1,1,'image/upload/v1714915142/y1fvv52ivkxuzd4o7slu.jpg'),(8,'Thời trang nữ','2024-04-16 15:47:39.499214','2024-05-05 13:19:27.663831',1,1,'image/upload/v1714915167/pvayf4gr9pfgamdrewgt.jpg'),(9,'Thời trang mẹ và bé','2024-04-16 15:47:55.998153','2024-05-05 13:20:00.945165',1,1,'image/upload/v1714915200/aajt5gv5zdi1homlrvcd.jpg'),(10,'Trang sức nam','2024-04-16 15:48:34.973391','2024-05-05 13:20:23.273769',1,1,'image/upload/v1714915222/kuy3gf5ovwihtcm6tdww.jpg'),(11,'Trang sức nữ','2024-04-16 15:48:58.657207','2024-05-05 13:20:57.006074',1,1,'image/upload/v1714915255/vaakx72syj8ddmdytenu.jpg'),(12,'Chăm sóc da','2024-04-16 15:50:01.207728','2024-05-05 13:21:13.360503',2,1,'image/upload/v1714915272/zr6bah3xqkn6tmwflnzh.jpg'),(13,'Trang điểm','2024-04-16 15:50:12.067620','2024-05-05 13:22:00.478969',2,1,'image/upload/v1714915320/umxx3irs45paejzb2q4y.jpg'),(14,'Thể thao','2024-04-16 15:50:34.043389','2024-05-05 13:22:19.930512',3,1,'image/upload/v1714915339/ybpudjfyrcq4rg2zis0s.jpg'),(15,'Du lịch','2024-04-16 15:50:41.871628','2024-05-05 13:22:35.913136',3,1,'image/upload/v1714915355/kptwftwejl5deb5cmfg4.jpg'),(16,'Điện thoại','2024-04-16 15:51:25.379445','2024-05-05 13:22:49.547613',6,1,'image/upload/v1714915369/kv2gjtzlqltfueotk5wy.jpg'),(17,'Máy tính/Laptop','2024-04-16 15:51:45.555286','2024-05-05 13:23:03.910479',6,1,'image/upload/v1714915383/drthijs0mvhtviy5bpxq.jpg'),(18,'Phụ kiện','2024-04-16 15:51:58.190562','2024-05-05 13:23:20.229181',6,1,'image/upload/v1714915399/tmjkc6u4vzofprz7eduq.jpg'),(19,'Vouchers','2024-04-16 16:21:28.271778','2024-05-05 13:23:34.581026',19,1,'image/upload/v1714915414/xmnwt12twto6jkmj3ykl.jpg');
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

-- Dump completed on 2024-05-09 14:26:37
