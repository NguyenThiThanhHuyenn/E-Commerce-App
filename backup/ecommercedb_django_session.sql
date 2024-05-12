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
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('805ymr6upvd85y4vwajujm7jq0nlw9v1','.eJxVjMsOwiAQRf-FtSEMw4C4dN9vIDylaiAp7cr479qkC93ec859Mee3tbpt5MXNiV0YsNPvFnx85LaDdPft1nnsbV3mwHeFH3Twqaf8vB7u30H1o37rCMpkIwmIIqDKIiKBkRqVBBQqBatAgySlUVpbchE-SE8FSZxFiJa9P5r1Njk:1s34tS:Nbqgrgmy5QcFF2qEsbpXmfleLNER8C3plZZMQekb460','2024-05-18 02:12:54.992805'),('at5tfcc8abucikeps8zzm1lrprnxxpnn','.eJxVjMsOwiAQRf-FtSEMw4C4dN9vIDylaiAp7cr479qkC93ec859Mee3tbpt5MXNiV0YsNPvFnx85LaDdPft1nnsbV3mwHeFH3Twqaf8vB7u30H1o37rCMpkIwmIIqDKIiKBkRqVBBQqBatAgySlUVpbchE-SE8FSZxFiJa9P5r1Njk:1s2Bfz:SWZhiMb0WigDTi6Hkf6gis5ucV7Zw6dtNrObAA8_4dA','2024-05-15 15:15:19.268439'),('bop5yxw7drsnhiesgvdql4xj9okgn9dr','.eJxVjMsOwiAQRf-FtSEMw4C4dN9vIDylaiAp7cr479qkC93ec859Mee3tbpt5MXNiV0YsNPvFnx85LaDdPft1nnsbV3mwHeFH3Twqaf8vB7u30H1o37rCMpkIwmIIqDKIiKBkRqVBBQqBatAgySlUVpbchE-SE8FSZxFiJa9P5r1Njk:1s0XTd:15nE9vktfhuVKy_bVohvUD_GGHnWhakTLWz0I7PtdWw','2024-05-11 02:07:45.161839'),('j8uwnl2y5mf89qv25lpfv3kxsi67ebqi','.eJxVjMsOwiAQRf-FtSEMw4C4dN9vIDylaiAp7cr479qkC93ec859Mee3tbpt5MXNiV0YsNPvFnx85LaDdPft1nnsbV3mwHeFH3Twqaf8vB7u30H1o37rCMpkIwmIIqDKIiKBkRqVBBQqBatAgySlUVpbchE-SE8FSZxFiJa9P5r1Njk:1s00LQ:KhsL8QEdSGN1T_eFH3m85EtP_5cij_9a_W1rpqjUdjE','2024-05-09 14:45:04.490523'),('mzsk6vwd2sj8edblksxc2alkv9708dag','.eJxVjMsOwiAQRf-FtSEMw4C4dN9vIDylaiAp7cr479qkC93ec859Mee3tbpt5MXNiV0YsNPvFnx85LaDdPft1nnsbV3mwHeFH3Twqaf8vB7u30H1o37rCMpkIwmIIqDKIiKBkRqVBBQqBatAgySlUVpbchE-SE8FSZxFiJa9P5r1Njk:1s4Ix4:AEjdXhl1ytLxTugbGco4mCEEZNb9zGLpq6MODoRL9sM','2024-05-21 11:25:42.542602'),('vd71qp5vip68yj2jnngczgs3b9sqnaua','.eJxVjMsOwiAQRf-FtSEMw4C4dN9vIDylaiAp7cr479qkC93ec859Mee3tbpt5MXNiV0YsNPvFnx85LaDdPft1nnsbV3mwHeFH3Twqaf8vB7u30H1o37rCMpkIwmIIqDKIiKBkRqVBBQqBatAgySlUVpbchE-SE8FSZxFiJa9P5r1Njk:1s0gv0:OIKWF_aEBlMnWwKFozCvUhEIkgK3fgn5uCQG3BnGKsA','2024-05-11 12:12:38.848829');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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
