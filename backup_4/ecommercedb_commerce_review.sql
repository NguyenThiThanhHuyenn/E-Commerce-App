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
-- Table structure for table `commerce_review`
--

DROP TABLE IF EXISTS `commerce_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rating` int NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `store_id` bigint DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commerce_review_user_id_4461d886_fk_commerce_user_id` (`user_id`),
  KEY `commerce_review_store_id_06b7ae46_fk_commerce_store_id` (`store_id`),
  KEY `commerce_review_product_id_94c12bd0_fk_commerce_product_id` (`product_id`),
  CONSTRAINT `commerce_review_product_id_94c12bd0_fk_commerce_product_id` FOREIGN KEY (`product_id`) REFERENCES `commerce_product` (`id`),
  CONSTRAINT `commerce_review_store_id_06b7ae46_fk_commerce_store_id` FOREIGN KEY (`store_id`) REFERENCES `commerce_store` (`id`),
  CONSTRAINT `commerce_review_user_id_4461d886_fk_commerce_user_id` FOREIGN KEY (`user_id`) REFERENCES `commerce_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_review`
--

LOCK TABLES `commerce_review` WRITE;
/*!40000 ALTER TABLE `commerce_review` DISABLE KEYS */;
INSERT INTO `commerce_review` VALUES (4,5,'Good','2024-04-29 02:38:00.184078','2024-04-29 02:38:00.184078',10,10,NULL,1),(6,4,'Đồ giá rẻ chất lượng','2024-04-29 02:40:39.782294','2024-04-29 02:45:18.708690',5,8,NULL,1),(7,3,'Shop tư vấn nhiệt tình','2024-04-29 02:45:51.999232','2024-05-02 14:41:12.182873',NULL,11,4,1),(8,4,'Sẽ tiếp tục mua','2024-05-01 15:38:19.678650','2024-05-01 15:38:19.678650',10,10,NULL,1),(9,4,'Giao hàng nhanh','2024-05-01 15:44:58.975686','2024-05-01 15:44:58.975686',10,6,NULL,1),(13,3,'Tạm ổn','2024-05-01 17:00:03.317866','2024-05-01 17:00:03.317866',2,11,NULL,1),(14,4,'Ổn áp','2024-05-02 14:15:31.801522','2024-05-02 14:15:31.801522',NULL,6,4,1),(15,2,'Shop rep chậm','2024-05-02 14:16:18.500676','2024-05-02 14:16:18.500676',NULL,11,4,1),(16,2,'Giao chậm','2024-05-02 14:19:28.837030','2024-05-02 14:40:48.886894',4,11,NULL,1),(17,5,'Dùng tốt','2024-05-02 14:30:47.214661','2024-05-02 14:30:47.214661',2,8,NULL,1),(18,5,'Giao nhanh','2024-05-06 08:54:12.133707','2024-05-06 08:54:12.133707',1,17,NULL,1),(19,4,'Tuyệt vời :)))','2024-05-06 08:55:14.287818','2024-05-06 08:55:14.287818',1,17,NULL,1),(20,4,'Rất thích','2024-05-06 08:57:33.174796','2024-05-06 08:57:33.174796',1,16,NULL,1),(21,5,'我是唯一参与这个项目的人 :)))','2024-05-06 09:03:27.541854','2024-05-06 09:03:27.541854',1,16,NULL,1),(22,5,'我是唯一参与这个项目的人 :(((','2024-05-06 09:08:48.837003','2024-05-06 09:08:48.837003',1,16,NULL,1),(23,5,'我是唯一参与这个项目的人','2024-05-06 09:20:18.574611','2024-05-06 09:20:18.574611',1,16,NULL,1),(24,5,'我是唯一参与这个项目的人','2024-05-06 09:21:30.023485','2024-05-06 09:21:30.023485',1,16,NULL,1),(25,4,'我是唯一参与这个项目的人','2024-05-06 09:23:49.773299','2024-05-06 09:23:49.773299',1,16,NULL,1),(26,4,'很好啊(⁠≧⁠▽⁠≦⁠)','2024-05-06 09:25:37.892917','2024-05-06 09:25:37.892917',1,16,NULL,1),(27,4,'(⁠ʘ⁠ᴗ⁠ʘ⁠✿⁠)<⁠(⁠￣⁠︶⁠￣⁠)⁠>','2024-05-06 09:27:32.198797','2024-05-06 09:27:32.198797',1,16,NULL,1),(28,4,'Okkk','2024-05-06 09:29:06.805812','2024-05-06 09:29:06.805812',NULL,16,1,1),(29,5,'Great <⁠(⁠￣⁠︶⁠￣⁠)⁠>','2024-05-06 09:29:26.448216','2024-05-06 09:29:26.448216',NULL,16,1,1),(31,5,'我是唯一参与这个项目的人 ₍⁠₍⁠◞⁠(⁠ ⁠•⁠௰⁠•⁠ ⁠)⁠◟⁠₎⁠₎⁽⁠⁽⁠◝⁠(⁠ ⁠•⁠௰⁠•⁠ ⁠)⁠◜⁠⁾⁠⁾','2024-05-07 08:26:59.139710','2024-05-07 08:26:59.139710',53,17,NULL,1),(32,4,'Okkk','2024-05-08 14:17:49.918043','2024-05-08 14:17:49.918043',53,16,NULL,1);
/*!40000 ALTER TABLE `commerce_review` ENABLE KEYS */;
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
