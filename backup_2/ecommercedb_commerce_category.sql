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
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `commerce_category` VALUES (1,'Thời trang','2024-04-16 15:36:35.504287','2024-04-25 18:23:25.858406',1,1,'categoryImage/2024/04/wp9780737-fashion-women-clothes-wallpapers.jpg'),(2,'Mỹ phẩm','2024-04-16 15:37:38.991804','2024-04-25 18:23:46.589951',2,1,'categoryImage/2024/04/uwp3936183.jpeg'),(3,'Thể thao & Du lịch','2024-04-16 15:38:21.636661','2024-04-25 18:24:14.034727',3,1,'categoryImage/2024/04/wp13868186-4k-climbing-wallpapers.jpg'),(4,'Sức khỏe','2024-04-16 15:38:35.235191','2024-04-25 18:24:41.864149',4,1,'categoryImage/2024/04/wp11119744-plate-of-healthy-food-wallpapers.jpg'),(5,'Nhà cửa & Đời sống','2024-04-16 15:39:04.019035','2024-04-25 18:25:21.917510',5,1,'categoryImage/2024/04/wp6337505-beautiful-house-inside-and-outside-wallpapers.jpg'),(6,'Thiết bị điện tử','2024-04-16 15:39:24.352499','2024-04-25 18:25:36.280708',6,1,'categoryImage/2024/04/wp12180848-electronic-devices-wallpapers.jpg'),(7,'Thời trang nam','2024-04-16 15:47:05.482353','2024-04-25 18:25:47.284162',1,1,'categoryImage/2024/04/wp11587646-men-dress-wallpapers.jpg'),(8,'Thời trang nữ','2024-04-16 15:47:39.499214','2024-04-25 18:25:56.522555',1,1,'categoryImage/2024/04/wp4021578-dress-wallpapers.jpg'),(9,'Thời trang mẹ và bé','2024-04-16 15:47:55.998153','2024-04-25 18:45:36.675491',1,1,'categoryImage/2024/04/wp5191563-baby-and-mom-wallpapers_ftoiciW.jpg'),(10,'Trang sức nam','2024-04-16 15:48:34.973391','2024-04-25 18:46:01.186713',1,1,'categoryImage/2024/04/wp12288952-skeleton-watch-wallpapers.jpg'),(11,'Trang sức nữ','2024-04-16 15:48:58.657207','2024-04-25 18:46:15.398372',1,1,'categoryImage/2024/04/wp12799602-jewelry-4k-wallpapers.jpg'),(12,'Chăm sóc da','2024-04-16 15:50:01.207728','2024-04-25 18:47:17.950560',2,1,'categoryImage/2024/04/wp6835941-skin-care-wallpapers.jpg'),(13,'Trang điểm','2024-04-16 15:50:12.067620','2024-04-25 18:46:49.759350',2,1,'categoryImage/2024/04/uwp4187718_wVeYJta.jpeg'),(14,'Thể thao','2024-04-16 15:50:34.043389','2024-04-25 18:46:53.722723',3,1,'categoryImage/2024/04/wp11984248-all-the-sports-wallpapers.jpg'),(15,'Du lịch','2024-04-16 15:50:41.871628','2024-04-25 18:46:59.876274',3,1,'categoryImage/2024/04/wp12214633-camping-tents-wallpapers_yJ0Iurj.jpg'),(16,'Điện thoại','2024-04-16 15:51:25.379445','2024-04-25 18:26:44.116429',6,1,'categoryImage/2024/04/smartphone-tgdd-33312313-2-060823-210136-800-resize.jpg'),(17,'Máy tính/Laptop','2024-04-16 15:51:45.555286','2024-04-25 18:26:54.749762',6,1,'categoryImage/2024/04/wp13489736-office-laptop-wallpapers.jpg'),(18,'Phụ kiện','2024-04-16 15:51:58.190562','2024-04-25 18:27:03.946477',6,1,'categoryImage/2024/04/wp10843401-computer-accessories-wallpapers.jpg'),(19,'Vouchers','2024-04-16 16:21:28.271778','2024-04-25 18:27:07.611084',19,1,'categoryImage/2024/04/wp10555944-voucher-wallpapers.jpg');
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

-- Dump completed on 2024-04-26  1:48:45
