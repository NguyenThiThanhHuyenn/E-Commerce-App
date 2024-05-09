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
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_user`
--

LOCK TABLES `commerce_user` WRITE;
/*!40000 ALTER TABLE `commerce_user` DISABLE KEYS */;
INSERT INTO `commerce_user` VALUES (1,'pbkdf2_sha256$720000$aEOmYlWxtOOUe1RXgReqTX$vZu1Slke0NhR1jTDXQ2VeJtSA5dITR2Jii9GmTAR5dg=','2024-05-07 11:25:42.523347',1,'hyadmin','','','thithanhhuyennguyen002@gmail.com',1,1,'2024-04-16 15:29:36.000000','0706742000','256 Nguyễn Văn Linh','image/upload/v1714916667/avy3pohlxrbckrabqt79.jpg','seller'),(2,'pbkdf2_sha256$720000$DubTmnlLCCYdOcDQjLasGv$iaiYDvnR06ZvC3ebYV4UW0tXYIdUiczc1X3c5LmLk4o=',NULL,0,'staff1','Hy','Nguyễn Thanh','2051012038huyen@ou.edu.vn',1,1,'2024-04-19 05:20:15.000000','0866164126','Hồ Chí Minh','image/upload/v1714916628/qi7tjhlswesc5391tetl.jpg','seller'),(3,'pbkdf2_sha256$720000$12RcDn13aMhDlrDoknHyWy$nXnygtBVHaU2qUtii6ko7EUI5ug7iB3ZQXpuKeIlUwk=',NULL,0,'newuser','','','newuser@example.com',0,1,'2024-04-22 05:23:00.000000','0706742985','256 Nguyễn Văn Trỗi','image/upload/v1714916606/svfgct5iw0umukbhscux.webp','customer'),(4,'pbkdf2_sha256$720000$lih1zjAwx5w7glUK1uS9pP$M8bv/s9wBBsQWK+mxCGfv/LarjmU/2/3tnmW8bcOMjs=',NULL,0,'hythanh','Huyen','Nguyen','hyy@gmail.com',0,1,'2024-04-22 06:02:02.000000','0866164127','Hồ Chí Minh','image/upload/v1714916531/rsmas04bc24sd7zx05gk.png','seller'),(6,'pbkdf2_sha256$720000$Po4CSbgKv1iXQfZrUhabaz$EfwKobdLcCZF/4b8xYfsn+fpvNfN9nFI0mNpwkQhDcs=',NULL,0,'huyenthanh','Hy','Nguyen','huyen@gmail.com',0,1,'2024-04-22 06:13:24.000000','0966164125','Hà Nội','image/upload/v1714916511/mqj4e2edgmi7jtakcnrh.jpg','customer'),(7,'pbkdf2_sha256$720000$8AxAXNfJu7LmXIQh8s8YV0$1E6GySlSWauknnwGPPo1hLo0di2jDZbKg2kudrDu/nk=',NULL,0,'hautran','Trần','Phước Hậu','',0,1,'2024-04-27 12:12:57.000000','0706742982','256 Nguyễn Văn Linh','image/upload/v1714916500/xyztccnd6dqui8gvwwpj.jpg','seller'),(8,'pbkdf2_sha256$720000$xYDwqkt5uu2DgiDo1zbrLF$xswmJTMQmJy7OhPXirOf3HlAn7cDcPe5QyVgLlQCk2w=',NULL,0,'loann','Loan','Nguyễn','',0,1,'2024-04-27 12:37:23.000000','0973877183','Hà Nội','image/upload/v1714916482/wyxxdaplv3lxggds77sy.jpg','customer'),(9,'pbkdf2_sha256$720000$0HAAe0r8N0cshTCZp2DUaM$SOwQ2hg+ahc2Md7sE56TcKnixkOLmEy8UaQ7Qj2qq7g=',NULL,0,'huongnguyen','Hương','Nguyen','huong@gmail.com',0,1,'2024-04-27 13:09:40.000000','0966164120','Hà Nội','image/upload/v1714916465/zywm9tsconhaxweeevyv.jpg','seller'),(10,'123456',NULL,0,'haipham','Thanh Hải','Phạm','tiepnhandev@gmail.com',0,1,'2024-04-27 13:12:25.000000','0706742900','256 Nguyễn Văn Trỗi','image/upload/v1714916441/xvbgn5jlo7pmp2opm0fb.jpg','customer'),(11,'pbkdf2_sha256$720000$lGf7rw0ntJgfEGcg4i0z4m$+aFyTIljdUkiecSDNDnlNYMoqiJ77xU6twGgDdI5Lqg=',NULL,0,'hanguyen','Hà','Nguyen','ha@gmail.com',0,1,'2024-04-27 13:37:27.000000','0966164120','Hà Nội','image/upload/v1714916419/o55gvrzbs6vjjjmmwdlh.jpg','customer'),(12,'pbkdf2_sha256$720000$y6bgs8E3pQ9RXBju6VnouC$sb5WauE/zuzMgsLisgpTTQXE3KQIv+nPuT9/qJJzn8w=',NULL,0,'hyuneej','J.','Hyunee','hyunee@gmail.com',0,1,'2024-05-05 01:38:15.000000','0383737389','Hồ Chí Minh','image/upload/v1714916388/xxtrualjurpv3tozsuwy.png','customer'),(13,'pbkdf2_sha256$720000$J2Rh16ItwIxw3CVOWJcsAM$aOoewIHbbQEuVqqduXV2SIK8o0nDiDJ9+ZLNKmfRR0Y=',NULL,0,'hanacabella','Hana','Cabella','cabella@gmail.com',0,1,'2024-05-05 02:02:56.000000','0987612345','Hải Phòng','image/upload/v1714916361/raof20nbewl7ndujsfy9.jpg','customer'),(14,'pbkdf2_sha256$720000$Qd0OPYGI0ujHSGNbpJN80D$W0OxGonpMNSD9M5fAm1jdIOceKpWAt+5oR2R7LsD3Ek=',NULL,0,'annab','Anna','Brownie','ann@gmail.com',0,1,'2024-05-05 02:12:46.000000','0283748498','HCM','image/upload/v1714916343/al7wu1juh9g9khjijsmz.jpg','customer'),(15,'pbkdf2_sha256$720000$mktcptBKCMElo7H44EAWFW$SkSyT7j6qU9BkPYYXyNrjuv8Kf0gaksvm9KnHUqYnfQ=',NULL,0,'meimei','Mei','Mei','mei@gmail.com',0,1,'2024-05-05 02:17:35.000000','0283789936','Hcm','image/upload/v1714916325/mghfem7rsmlolq7llj4p.jpg','customer'),(16,'pbkdf2_sha256$720000$j1yPYcnpDQooZASrFXW4gt$3IEv/AX05IWM4BHKphc70Yy0NJHjjYvUYE6TpFMyljQ=',NULL,0,'eunhodo','Eunho','Do','eunhoplave@gmail.com',0,1,'2024-05-05 02:23:19.000000','0283739852','Hcm','image/upload/v1714916311/c2nsv23qu7ghuurl9bht.jpg','customer'),(17,'pbkdf2_sha256$720000$VBAGGOY0kmMYGTBohVuCUM$KZXEBOcxspqCUWMi6TxAAhTs6b/HwNhenTGKdZLTbhU=',NULL,0,'yejunn','Yejun','Nam','yejun@gmail.com',0,1,'2024-05-05 09:05:47.000000','0126383799','Korea','image/upload/v1714916205/vjmzxux0960aedxm6awq.jpg','seller'),(18,'pbkdf2_sha256$720000$H2fpKMRZHlFe8KXMLBcx7r$6Z5GV3MDIvVrtplsHi3h38ErA11WcfYf2UQDUPQWahI=',NULL,0,'arimoon','Ari','Moonie','arimoo@gmail.com',0,1,'2024-05-06 01:29:39.254932','0928366723','HCM','image/upload/v1714958995/kuybwff2ngygnkdr1cgu.png','seller'),(19,'pbkdf2_sha256$720000$TBlIAIxWG57JJBoAn47jgV$BOLyVQzekwSv5xXIyDAPR2PgheIfTcJlZ/QGKYIP4So=',NULL,0,'malynagre09','Malyna','Greene','malynag@gmail.com',0,1,'2024-05-06 01:45:49.000000','0866165127','HCM','image/upload/v1714959957/jzybssdguqxuzrnlydyb.jpg','seller');
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

-- Dump completed on 2024-05-09 14:26:38
