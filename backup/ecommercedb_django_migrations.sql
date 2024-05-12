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
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-04-16 15:27:58.664380'),(2,'contenttypes','0002_remove_content_type_name','2024-04-16 15:27:58.721996'),(3,'auth','0001_initial','2024-04-16 15:27:58.914732'),(4,'auth','0002_alter_permission_name_max_length','2024-04-16 15:27:58.973457'),(5,'auth','0003_alter_user_email_max_length','2024-04-16 15:27:58.978453'),(6,'auth','0004_alter_user_username_opts','2024-04-16 15:27:58.982457'),(7,'auth','0005_alter_user_last_login_null','2024-04-16 15:27:58.988584'),(8,'auth','0006_require_contenttypes_0002','2024-04-16 15:27:58.991593'),(9,'auth','0007_alter_validators_add_error_messages','2024-04-16 15:27:58.996583'),(10,'auth','0008_alter_user_username_max_length','2024-04-16 15:27:59.001584'),(11,'auth','0009_alter_user_last_name_max_length','2024-04-16 15:27:59.005583'),(12,'auth','0010_alter_group_name_max_length','2024-04-16 15:27:59.022583'),(13,'auth','0011_update_proxy_permissions','2024-04-16 15:27:59.027583'),(14,'auth','0012_alter_user_first_name_max_length','2024-04-16 15:27:59.032583'),(15,'commerce','0001_initial','2024-04-16 15:27:59.876414'),(16,'admin','0001_initial','2024-04-16 15:27:59.979646'),(17,'admin','0002_logentry_remove_auto_add','2024-04-16 15:27:59.988647'),(18,'admin','0003_logentry_add_action_flag_choices','2024-04-16 15:27:59.996128'),(19,'commerce','0002_product_average_rating_product_reviews_review_store_and_more','2024-04-16 15:28:00.493630'),(20,'commerce','0003_alter_product_reviews_alter_store_reviews','2024-04-16 15:28:00.509635'),(21,'commerce','0004_alter_category_parent','2024-04-16 15:28:00.625796'),(22,'commerce','0005_alter_product_image_alter_user_avatar','2024-04-16 15:28:00.638787'),(23,'commerce','0006_store_wallpaper_alter_product_image_and_more','2024-04-16 15:28:00.708735'),(24,'commerce','0007_remove_user_avatars_user_avatar_alter_product_image_and_more','2024-04-16 15:28:00.848206'),(25,'commerce','0008_auto_20240416_2213','2024-04-16 15:28:00.852199'),(26,'commerce','0009_remove_store_wallpaper','2024-04-16 15:28:00.874198'),(27,'commerce','0010_store_wallpaper','2024-04-16 15:28:00.896208'),(28,'commerce','0011_remove_store_wallpaper','2024-04-16 15:28:00.917197'),(29,'commerce','0012_store_wallpaper','2024-04-16 15:28:00.937937'),(30,'sessions','0001_initial','2024-04-16 15:28:00.963554'),(31,'commerce','0013_remove_product_image_productimage_product_images','2024-04-16 16:44:28.108793'),(32,'commerce','0014_category_active_review_active_store_active','2024-04-16 17:01:19.646782'),(33,'commerce','0015_remove_product_images','2024-04-16 18:25:56.680000'),(34,'commerce','0016_alter_store_description','2024-04-17 13:21:01.423435'),(35,'commerce','0017_alter_product_description_alter_store_description','2024-04-17 13:33:03.597862'),(36,'commerce','0018_remove_user_role','2024-04-19 02:02:13.528372'),(37,'commerce','0019_user_role','2024-04-19 02:18:33.288202'),(38,'oauth2_provider','0001_initial','2024-04-22 03:43:36.552131'),(39,'oauth2_provider','0002_auto_20190406_1805','2024-04-22 03:43:36.634721'),(40,'oauth2_provider','0003_auto_20201211_1314','2024-04-22 03:43:36.687077'),(41,'oauth2_provider','0004_auto_20200902_2022','2024-04-22 03:43:37.036101'),(42,'oauth2_provider','0005_auto_20211222_2352','2024-04-22 03:43:37.114055'),(43,'oauth2_provider','0006_alter_application_client_secret','2024-04-22 03:43:37.137603'),(44,'oauth2_provider','0007_application_post_logout_redirect_uris','2024-04-22 03:43:37.187011'),(45,'commerce','0020_category_image','2024-04-25 14:07:48.904166'),(46,'commerce','0021_alter_product_price','2024-04-29 16:40:31.383932'),(47,'commerce','0022_remove_product_reviews_remove_store_reviews','2024-05-01 17:19:51.030684'),(48,'commerce','0023_remove_product_average_rating_and_more','2024-05-01 17:42:14.324983'),(49,'commerce','0024_alter_category_image','2024-05-05 12:52:28.797391'),(50,'commerce','0025_alter_category_image','2024-05-05 12:58:08.767813'),(51,'commerce','0026_alter_productimage_image_alter_store_wallpaper_and_more','2024-05-05 13:08:35.766510'),(52,'commerce','0027_productvariant','2024-05-07 02:54:11.310771'),(53,'commerce','0028_alter_productvariant_color_alter_productvariant_size','2024-05-07 03:12:55.208051'),(54,'commerce','0029_orderdetail_note','2024-05-07 03:12:55.246951');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
