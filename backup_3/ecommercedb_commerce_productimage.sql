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
-- Table structure for table `commerce_productimage`
--

DROP TABLE IF EXISTS `commerce_productimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_productimage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commerce_productimage_product_id_99719dcd_fk_commerce_product_id` (`product_id`),
  CONSTRAINT `commerce_productimage_product_id_99719dcd_fk_commerce_product_id` FOREIGN KEY (`product_id`) REFERENCES `commerce_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_productimage`
--

LOCK TABLES `commerce_productimage` WRITE;
/*!40000 ALTER TABLE `commerce_productimage` DISABLE KEYS */;
INSERT INTO `commerce_productimage` VALUES (5,'image/upload/v1714916095/gpo45b4krqxkhwmras7c.jpg','2024-04-17 12:54:48.549631','2024-05-05 13:34:56.243715',2),(6,'image/upload/v1714916096/t6ti9zqu5zvutxmxsdtk.jpg','2024-04-17 12:55:04.174685','2024-05-05 13:34:56.877433',2),(7,'image/upload/v1714916097/y5q27ttrwhovkhckgoqn.jpg','2024-04-17 12:59:55.958238','2024-05-05 13:34:57.453283',2),(8,'image/upload/v1714916124/d0dgbapwexhrtoatgmu9.jpg','2024-04-17 13:40:37.834637','2024-05-05 13:35:24.909964',1),(9,'image/upload/v1714916041/ptr37argjnc5ac0hgaj6.jpg','2024-04-21 12:36:52.896503','2024-05-05 13:34:02.272627',4),(10,'image/upload/v1714916044/dzvdp647gm68jzew2igm.jpg','2024-04-21 12:37:15.111145','2024-05-05 13:34:04.521379',4),(11,'image/upload/v1714916017/h8k17p2jwoazk8tcczuj.jpg','2024-04-27 13:42:22.972339','2024-05-05 13:33:38.020027',5),(12,'image/upload/v1714916018/uni0xdumwevef5fkjc9f.jpg','2024-04-27 13:42:22.976349','2024-05-05 13:33:38.726021',5),(13,'image/upload/v1714915998/qqiwv4eoynusukmcedrf.jpg','2024-04-27 13:48:19.393592','2024-05-05 13:33:19.348128',6),(14,'image/upload/v1714915983/mvmxmzn7aolryy95cuxl.jpg','2024-04-27 15:15:39.934807','2024-05-05 13:33:03.919540',7),(15,'image/upload/v1714915984/ezi2iq8jbvbqixnr6qxd.jpg','2024-04-27 15:15:39.936823','2024-05-05 13:33:04.704874',7),(16,'image/upload/v1714915960/zgzr1trifnvnb1zkjmb3.jpg','2024-04-27 15:29:40.989880','2024-05-05 13:32:41.340702',8),(17,'image/upload/v1714915961/e92ie8howil5aacaz6k8.jpg','2024-04-27 15:29:40.992122','2024-05-05 13:32:42.021786',8),(18,'image/upload/v1714915888/k4hknwcmskdrvmpqsyh8.jpg','2024-04-27 15:35:32.591178','2024-05-05 13:31:29.347213',9),(19,'image/upload/v1714915890/ogpmkoiqkf3cvvkf5zwz.jpg','2024-04-27 15:35:32.593211','2024-05-05 13:31:31.165148',9),(20,'image/upload/v1714915867/xwzgz6v9kn1ueagngfyo.jpg','2024-04-27 15:39:49.986116','2024-05-05 13:31:07.755540',10),(21,'image/upload/v1714915868/hwtsotdageorqorqycxg.jpg','2024-04-27 15:39:49.990389','2024-05-05 13:31:09.140738',10),(22,'image/upload/v1714915832/mnwp4uwvs4qbrxfmmxng.jpg','2024-04-27 15:42:52.087098','2024-05-05 13:30:32.527280',11),(23,'image/upload/v1714915808/me3ky07ha1r7cvzstxpo.jpg','2024-04-27 15:45:39.716476','2024-05-05 13:30:09.042776',12),(24,'image/upload/v1714915784/tmengcbkpytbixwisdfk.jpg','2024-04-27 15:51:43.588365','2024-05-05 13:29:45.160485',13),(25,'image/upload/v1714915736/polclwxebukciqycpnqn.jpg','2024-04-27 16:11:10.008490','2024-05-05 13:28:57.273280',14),(26,'image/upload/v1714915698/um2imm5pid4zf8a6prkc.jpg','2024-04-27 16:13:59.667051','2024-05-05 13:28:18.709346',15),(27,'image/upload/v1714915699/fvixz0kioqsyfwrjjfml.jpg','2024-04-27 16:13:59.669326','2024-05-05 13:28:19.876438',15),(28,'image/upload/v1714915659/rqx5hzsogfhaxm3pp3pk.jpg','2024-04-27 16:17:07.483666','2024-05-05 13:27:39.811580',16),(29,'image/upload/v1714915632/trp6a1fz2rx6v0mza2cw.jpg','2024-04-27 16:21:26.153191','2024-05-05 13:27:12.871891',17),(30,'image/upload/v1714915603/qxqcdl7hhcmnpowsqvar.jpg','2024-04-27 16:22:14.817393','2024-05-05 13:26:44.280764',18),(31,'image/upload/v1714915576/ti7k3uwgqwmg7xnklcz0.jpg','2024-04-27 16:23:55.281715','2024-05-05 13:26:17.101312',19),(32,'image/upload/v1714915556/iuqowf9gb0u48nuovr9x.jpg','2024-04-27 16:27:18.711173','2024-05-05 13:25:56.556554',20),(33,'image/upload/v1714915537/h8lxwk4u0rg99esgbzms.jpg','2024-04-27 16:30:33.737831','2024-05-05 13:25:38.107946',21),(34,'image/upload/v1714915516/m9eyxuoqty10ss2wbrvm.png','2024-04-27 16:32:45.853369','2024-05-05 13:25:16.862975',22),(36,'image/upload/v1714915481/yq3vxounyoqpvhv2oiu0.jpg','2024-05-05 13:24:41.975403','2024-05-05 13:24:41.975403',23),(37,'image/upload/v1714915605/cnugpwk2bhozzpylhe1q.jpg','2024-05-05 13:26:46.292860','2024-05-05 13:26:46.293857',18),(38,'image/upload/v1714915660/qucutpsrwm1fwmf9pwvf.jpg','2024-05-05 13:27:40.602469','2024-05-05 13:27:40.602469',16),(39,'image/upload/v1714915746/aefbxcic8mjede4ppal7.jpg','2024-05-05 13:29:06.806638','2024-05-05 13:29:06.806638',17),(40,'image/upload/v1714915834/pcchfziuahelhqgjztww.jpg','2024-05-05 13:30:34.694180','2024-05-05 13:30:34.694180',11),(47,'image/upload/v1715063634/qbhntnbtdxcvbwjlsweo.jpg','2024-05-07 06:33:55.150790','2024-05-07 06:33:55.150790',46),(48,'image/upload/v1715063637/ywnetcrpra6yhdwhqrjn.jpg','2024-05-07 06:33:57.774851','2024-05-07 06:33:57.774851',46),(60,'image/upload/v1715070305/ugrvfwpjrvvqmohs58h8.png','2024-05-07 08:25:06.439236','2024-05-07 08:25:06.439236',53),(61,'image/upload/v1715070307/lnj3ot8p1vgdjkb0hbzu.jpg','2024-05-07 08:25:07.703165','2024-05-07 08:25:07.703165',53),(62,'image/upload/v1715070308/vgge9ffwsdpgstpctd30.jpg','2024-05-07 08:25:09.045059','2024-05-07 08:25:09.045059',53);
/*!40000 ALTER TABLE `commerce_productimage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-07 18:51:24
