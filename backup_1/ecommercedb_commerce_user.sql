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
-- Table structure for table `commerce_user`
--

DROP TABLE IF EXISTS `commerce_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_user`
--

LOCK TABLES `commerce_user` WRITE;
/*!40000 ALTER TABLE `commerce_user` DISABLE KEYS */;
INSERT INTO `commerce_user` VALUES (1,'pbkdf2_sha256$720000$aEOmYlWxtOOUe1RXgReqTX$vZu1Slke0NhR1jTDXQ2VeJtSA5dITR2Jii9GmTAR5dg=','2024-04-22 05:06:15.038669',1,'hyadmin','','','thithanhhuyennguyen002@gmail.com',1,1,'2024-04-16 15:29:36.074591','','','','customer'),(2,'pbkdf2_sha256$720000$DubTmnlLCCYdOcDQjLasGv$iaiYDvnR06ZvC3ebYV4UW0tXYIdUiczc1X3c5LmLk4o=',NULL,0,'staff1','Hy','Nguyễn Thanh','2051012038huyen@ou.edu.vn',1,1,'2024-04-19 05:20:15.000000','0866164126','Hồ Chí Minh','avatar/2024/04/uwp3417417.jpeg','seller'),(3,'pbkdf2_sha256$720000$12RcDn13aMhDlrDoknHyWy$nXnygtBVHaU2qUtii6ko7EUI5ug7iB3ZQXpuKeIlUwk=',NULL,0,'newuser','','','newuser@example.com',0,1,'2024-04-22 05:23:00.567268','','','','customer'),(4,'123456',NULL,0,'hythanh','Huyen','Nguyen','hyy@gmail.com',0,1,'2024-04-22 06:02:02.910127','0866164127','Hồ Chí Minh','avatar/2024/04/420014890_2142697089443275_9106759717044729339_n.jpg','seller'),(6,'pbkdf2_sha256$720000$Po4CSbgKv1iXQfZrUhabaz$EfwKobdLcCZF/4b8xYfsn+fpvNfN9nFI0mNpwkQhDcs=',NULL,0,'huyenthanh','Hy','Nguyen','huyen@gmail.com',0,1,'2024-04-22 06:13:24.047685','0966164125','Hà Nội','avatar/2024/04/z4437291781968_2e2fab7b855692dde0be66acf8a439bb.jpg','customer');
/*!40000 ALTER TABLE `commerce_user` ENABLE KEYS */;
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
