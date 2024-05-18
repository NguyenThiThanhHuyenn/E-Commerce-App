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
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` bigint DEFAULT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refr_user_id_da837fce_fk_commerce_` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refr_user_id_da837fce_fk_commerce_` FOREIGN KEY (`user_id`) REFERENCES `commerce_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'HwY9fMZrDJ1bbslUJ19VlVk1Fw5bWh',1,4,3,'2024-04-22 05:25:28.050744','2024-04-22 05:25:28.050744',NULL),(2,'SC04QXeGhsf78QWIcKD7jzn4WEIRXX',2,4,6,'2024-04-22 06:19:04.057826','2024-04-22 06:19:04.057826',NULL),(3,'86B0WA2mTtVZRBWfcMzaQAhtPz96KW',3,4,6,'2024-04-28 12:22:20.876175','2024-04-28 12:22:20.876175',NULL),(4,'kAhPtJ9GakHoTx2dtTuA9wlP7kzGqd',4,4,6,'2024-04-29 03:42:55.191826','2024-04-29 03:42:55.191826',NULL),(5,'AOXUJyJqjfr6aC4Y42s0su3kEQU4H0',5,4,6,'2024-05-02 04:48:24.665649','2024-05-02 04:48:24.665649',NULL),(6,'eAFdSPW6kwfTWekAlR7s7I70ZrID8b',6,4,6,'2024-05-04 02:00:17.796318','2024-05-04 02:00:17.796318',NULL),(7,'zTuC57mRQTXehLRqyR9x2gwDqAhjWT',7,4,6,'2024-05-04 02:50:11.417817','2024-05-04 02:50:11.417817',NULL),(8,'J1f0VIOjpbNSGqywN5WS46lxq7CgFZ',8,4,6,'2024-05-04 03:35:56.054952','2024-05-04 03:35:56.054952',NULL),(9,'pFkl7psWixdKDUAqDary0oJzRUXvCB',9,4,6,'2024-05-04 03:41:23.108600','2024-05-04 03:41:23.108600',NULL),(10,'1UEwJyTJ7hplWwnmfw3YB80hq3F2W1',10,4,1,'2024-05-04 03:43:05.391122','2024-05-04 03:43:05.391122',NULL),(11,'rSvA2uahh1UB5wvmKWiwAhQ5ql7etj',11,4,6,'2024-05-04 03:52:44.436753','2024-05-04 03:52:44.436753',NULL),(12,'LlGE7hnd5qL4ZEGePC7EXO8Y9fRpRu',12,4,6,'2024-05-04 10:08:42.649120','2024-05-04 10:08:42.649120',NULL),(13,'ZpByfQmPtlPcwiP84UhhUtqKTGbX0z',13,4,6,'2024-05-04 10:23:57.288967','2024-05-04 10:23:57.288967',NULL),(14,'59tmZktx5t6XxDeO5HY8pnqW5I3tha',14,4,6,'2024-05-04 10:25:08.725156','2024-05-04 10:25:08.725156',NULL),(15,'CX3tq3Gi7wVgbfHKzgeKgPc2wBj2jU',15,4,6,'2024-05-04 10:26:03.066121','2024-05-04 10:26:03.066121',NULL),(16,'b4UmGIZD63jLYZ3HrzizU6As9TOXtr',16,4,6,'2024-05-04 10:35:03.697566','2024-05-04 10:35:03.697566',NULL),(17,'4LnAwlobSxdnZWPoAqqA9SPcmgsDO7',17,4,6,'2024-05-04 10:36:24.186995','2024-05-04 10:36:24.186995',NULL),(18,'QtUV907YYKgJaTINHdqKCqZ6yhmsLp',18,4,6,'2024-05-04 10:51:57.743730','2024-05-04 10:51:57.743730',NULL),(19,'kdB4MyBoGoykEBzhLUDL8RJOHAL7Ft',19,4,6,'2024-05-04 11:52:08.702268','2024-05-04 11:52:08.702268',NULL),(20,'b2XmxFU59RSor6XR2Nyn6tj33ypZyc',20,4,6,'2024-05-04 11:56:49.062955','2024-05-04 11:56:49.062955',NULL),(21,'rvySFSITXr9yVbbY09nctd7LdHCc35',21,4,6,'2024-05-04 11:58:36.868681','2024-05-04 11:58:36.868681',NULL),(22,'jbJfhiWd5Y2LwhktTqIL9mdWi2X2QU',22,4,6,'2024-05-04 12:20:47.971287','2024-05-04 12:20:47.971287',NULL),(23,'rvHhTqdnnds9DNldFMsNUmXdGInqwx',23,4,6,'2024-05-04 12:31:48.259124','2024-05-04 12:31:48.259124',NULL),(24,'AbR76609EdEnUodWYrb8Iyk1iGyv40',24,4,6,'2024-05-04 12:36:48.884027','2024-05-04 12:36:48.884027',NULL),(25,'Fr3cIxt9IDuqnPpoM1ldgUokV37Wy9',25,4,6,'2024-05-04 12:37:47.374832','2024-05-04 12:37:47.374832',NULL),(26,'P2Kinss09bnxEQPcNAuCbQyVpZobcB',26,4,1,'2024-05-04 12:43:06.983056','2024-05-04 12:43:06.983056',NULL),(27,'m3Zrtwk9JBXqAJIuyJmr4NrN2Qdtcz',27,4,6,'2024-05-04 12:54:26.371934','2024-05-04 12:54:26.371934',NULL),(28,'VNjnMkH5HPQkCmwx1XgooJVrTpSGwj',28,4,6,'2024-05-04 12:54:41.935156','2024-05-04 12:54:41.935156',NULL),(29,'g8aGCbrZmoMDEq94nVZoVqSRQFW49x',29,4,6,'2024-05-04 13:00:15.274793','2024-05-04 13:00:15.274793',NULL),(30,'pJNPZEd18A1S1BKzTKL3tZOW62capS',30,4,6,'2024-05-04 13:01:47.345067','2024-05-04 13:01:47.345067',NULL),(31,'az8NbkWUqMQ1wreEsCw2jZolwCkvOn',31,4,6,'2024-05-04 13:02:56.325665','2024-05-04 13:02:56.325665',NULL),(32,'qtVl1UQF4bTGYRkXTnwDSYj0I7bIfn',32,4,16,'2024-05-05 02:23:33.452848','2024-05-05 02:23:33.452848',NULL),(33,'VH6640RWNGkZgDeq48BiuvN7DvviLq',33,4,16,'2024-05-05 02:34:08.893565','2024-05-05 02:34:08.893565',NULL),(34,'CeYD7mcxtPj9rSSQyrtVlVj7kjvg7v',34,4,16,'2024-05-05 02:35:10.935561','2024-05-05 02:35:10.935561',NULL),(35,'Nkdh7Zk8PbsOm4dqxdIHZHzWclRXvr',35,4,16,'2024-05-05 02:41:00.955088','2024-05-05 02:41:00.955088',NULL),(36,'KazVqgTScGfYeNRNG1oUNNlv0mQhWL',36,4,1,'2024-05-05 03:33:17.033136','2024-05-05 03:33:17.033136',NULL),(37,'Lf37ePCKYa2YoLXpvbVUsWa0suZsUJ',37,4,9,'2024-05-05 03:34:02.124020','2024-05-05 03:34:02.124020',NULL),(38,'Kv94PZUAYH3Gim7GmcMbpS2NfKbcN7',38,4,1,'2024-05-05 04:22:58.074376','2024-05-05 04:22:58.074376',NULL),(39,'fgYLDgDJltryo6uz2VO46f6WCoghay',39,4,9,'2024-05-05 04:24:42.476738','2024-05-05 04:24:42.476738',NULL),(40,'bAS9ggDkazMMOgfYlneQTD4AAg2RD5',40,4,9,'2024-05-05 08:53:09.188389','2024-05-05 08:53:09.188389',NULL),(41,'1mW1oOaDSpUpjr5vb6xK1Vsho43Fli',41,4,17,'2024-05-05 09:06:08.799371','2024-05-05 09:06:08.799371',NULL),(42,'WNRAnrwjK3at38B3jiG7Z6ng2hfDdo',42,4,17,'2024-05-05 09:16:38.204130','2024-05-05 09:16:38.204130',NULL),(43,'NBmOwLuWC0iBejhEP6gDmqNLZudUYw',43,4,17,'2024-05-05 09:24:39.034317','2024-05-05 09:24:39.034317',NULL),(44,'JHA9Oe9szHGZ5FWcxnl4L7WJRtzPUH',44,4,17,'2024-05-05 09:37:41.719124','2024-05-05 09:37:41.719124',NULL),(45,'1pzPkNOqm5eJQt8manL5FtCnlv0sbu',45,4,17,'2024-05-05 09:48:24.909458','2024-05-05 09:48:24.909458',NULL),(46,'I3ZrMBQ42oj0W6SykXPsEOfav5F4FH',46,4,17,'2024-05-05 10:13:41.268525','2024-05-05 10:13:41.268525',NULL),(47,'ydCDnCXlW7ZhozYIVomQnwJXafcXdN',47,4,17,'2024-05-05 11:29:41.466648','2024-05-05 11:29:41.466648',NULL),(48,'QNOSRl2JXXdKIHWGLJIQ8mvMC6oUGb',48,4,17,'2024-05-05 11:30:23.013291','2024-05-05 11:30:23.013291',NULL),(49,'VIcQURICfPQRZcJJllWyvYzl71MoCx',49,4,17,'2024-05-05 11:31:58.195790','2024-05-05 11:31:58.195790',NULL),(50,'bWOUklMIpzzx8klvyFiPUjgxHuvjtf',50,4,17,'2024-05-05 11:36:34.731344','2024-05-05 11:36:34.731344',NULL),(51,'mI3nT1JQxg3JQbGYgIEuJMonBZnNFw',51,4,17,'2024-05-05 11:40:00.699035','2024-05-05 11:40:00.699035',NULL),(52,'h4hVPzHdIw54kzZmKpef8q3X1c56y3',52,4,17,'2024-05-05 11:41:23.259983','2024-05-05 11:41:23.259983',NULL),(53,'r3zxdwOG6esgTBiLekKeIT19drqjKK',53,4,17,'2024-05-05 11:43:07.192218','2024-05-05 11:43:07.192218',NULL),(54,'bf52vvaIXOOJEpWUmablYAVPNBcje3',54,4,17,'2024-05-05 11:47:22.634820','2024-05-05 11:47:22.634820',NULL),(55,'AUx5BmrpzEBjzKQpofOTE2AR87z0EZ',55,4,17,'2024-05-05 11:54:24.820128','2024-05-05 11:54:24.820128',NULL),(56,'yKISW2edfUtrTPxv4sVuyazVOY94AR',56,4,17,'2024-05-05 11:59:12.172323','2024-05-05 11:59:12.172323',NULL),(57,'H9lE7uO2FsLnJ5HHgzcoQiimaoiXcA',57,4,17,'2024-05-05 12:12:44.941673','2024-05-05 12:12:44.941673',NULL),(58,'I5hHjwUuU63kjdMtFc9YbzumRzbIGl',58,4,17,'2024-05-05 14:31:20.148634','2024-05-05 14:31:20.148634',NULL),(59,'DGlZEBKotB95QagvrHntA0kgPJljrl',59,4,17,'2024-05-05 14:55:43.136554','2024-05-05 14:55:43.136554',NULL),(60,'FjqNCulyyB9w1hhBkgncbGnH5ltlwj',60,4,17,'2024-05-05 14:56:18.704087','2024-05-05 14:56:18.704087',NULL),(61,'AMHnvVkc9DhRj9fbmu363LAqHx9XGj',61,4,17,'2024-05-05 15:00:42.092295','2024-05-05 15:00:42.092295',NULL),(62,'90ue49SuQrwr9HkQCOP066s2RmEgrT',62,4,17,'2024-05-05 15:02:52.125692','2024-05-05 15:02:52.125692',NULL),(63,'20doq2o4Ak1EwTbBHPInjmo3nk07Nt',63,4,17,'2024-05-05 15:04:35.174566','2024-05-05 15:04:35.174566',NULL),(64,'gdIfbTlz2eYNo48LgtOCpHZTuTqhIQ',64,4,17,'2024-05-05 15:06:20.284757','2024-05-05 15:06:20.284757',NULL),(65,'MBQmZwXr3WTWvDbEY93pDSwKNHthAX',65,4,17,'2024-05-05 15:09:39.551822','2024-05-05 15:09:39.551822',NULL),(66,'DMfm8AXJSeAJi26ahebSrwrUMI1WBH',66,4,17,'2024-05-05 15:39:24.365636','2024-05-05 15:39:24.365636',NULL),(67,'4OkkE2dX46aEKJr85encQmsdMMxRt6',67,4,17,'2024-05-05 15:46:03.784635','2024-05-05 15:46:03.784635',NULL),(68,'hzBo0JMMMMJ1PwCPSPo6E2VFD62Mu6',68,4,17,'2024-05-05 15:46:34.184003','2024-05-05 15:46:34.184003',NULL),(69,'OlexUSGqo0UnIjFdwN1E6PzLyAXoA0',69,4,17,'2024-05-05 15:47:06.889067','2024-05-05 15:47:06.889067',NULL),(70,'xGztufHBBL7d4Wc36EQ4PNik5sFwmS',70,4,17,'2024-05-05 15:49:12.574782','2024-05-05 15:49:12.574782',NULL),(71,'9aaEDHGiFrLitiozFVovRNLUemRp2C',71,4,17,'2024-05-05 15:59:49.169802','2024-05-05 15:59:49.169802',NULL),(72,'Xtn5zCjD2YjtYJkL2nhy11l0Du8yoW',72,4,1,'2024-05-06 00:39:45.021157','2024-05-06 00:39:45.021157',NULL),(73,'wOcTe00x56kV3Qkqw4zAxXdJSol8GC',73,4,17,'2024-05-06 02:02:55.960386','2024-05-06 02:02:55.960386',NULL),(74,'BznQDq4kG1JLpi9xPk29bxQmT1W6gu',74,4,19,'2024-05-06 02:11:30.356591','2024-05-06 02:11:30.356591',NULL),(75,'A5kS2EF6xrawuILt33jiqpq7WSQm64',75,4,1,'2024-05-06 02:21:27.005497','2024-05-06 02:21:27.005497',NULL),(76,'RayUJnkhTLWwRAPp1Wpg6TqIX0GbsH',76,4,1,'2024-05-06 02:21:46.388143','2024-05-06 02:21:46.388143',NULL),(77,'fXDZkalROh1Nf6tPwRSFSmcAFZYHZT',77,4,1,'2024-05-06 02:24:21.321854','2024-05-06 02:24:21.321854',NULL),(78,'eRKPAssxPECbfIH5SJLx21bt1HEzuZ',78,4,1,'2024-05-06 02:28:28.935824','2024-05-06 02:28:28.935824',NULL),(79,'XGWgT8XQY6qzrj0eJkoef6iwTAkNT7',79,4,17,'2024-05-06 02:34:49.909790','2024-05-06 02:34:49.909790',NULL),(80,'wviiQnYsEjTv4cJ04ixE57cbZzGOTO',80,4,17,'2024-05-06 02:35:03.691060','2024-05-06 02:35:03.691060',NULL),(81,'hqKNn8DffwAGqnyvsQDaUN2DfPZuCq',81,4,1,'2024-05-06 02:35:29.049066','2024-05-06 02:35:29.049066',NULL),(82,'UtXUdtm2AkcC7mHIzwJ5kKxQIlVxD5',82,4,1,'2024-05-06 02:35:51.653477','2024-05-06 02:35:51.653477',NULL),(83,'Kygj7BRkdKzc1azYHzuoVns7qC6cFI',83,4,17,'2024-05-06 02:38:12.005189','2024-05-06 02:38:12.005189',NULL),(84,'xzSQ1QfBO0NCvAGtewE61kzcC4iXrC',84,4,17,'2024-05-06 02:40:50.638321','2024-05-06 02:40:50.638321',NULL),(85,'JNhjRIOIhYuq6ZuAlxRtI5LHkyCCHl',85,4,17,'2024-05-06 02:41:09.800114','2024-05-06 02:41:09.800114',NULL),(86,'ulTvOGDYRlMWkoPrWtjPLmbvzGGza6',86,4,17,'2024-05-06 02:41:45.418088','2024-05-06 02:41:45.418088',NULL),(87,'sBVzgqhvnR5bc53ltSrivP8q4kVRX3',87,4,17,'2024-05-06 03:11:55.109071','2024-05-06 03:11:55.109071',NULL),(88,'3mAQev37zaAI4z2DNn3FVLh5QBzrRE',88,4,17,'2024-05-06 03:45:44.413645','2024-05-06 03:45:44.413645',NULL),(89,'QchAKI9I5tIVC2yDXsuEaEJE9T73jm',89,4,17,'2024-05-06 03:48:11.974295','2024-05-06 03:48:11.974295',NULL),(90,'TnCaHLLridwvtYIU5z59FnOUyPZXd1',90,4,17,'2024-05-06 03:49:01.955125','2024-05-06 03:49:01.955125',NULL),(91,'cCVADVAe4Ov4UxqMmbUilRuPDfifmY',91,4,17,'2024-05-06 04:02:05.165464','2024-05-06 04:02:05.165464',NULL),(92,'7piyv5dBrXt84UUV9irGm2gNeA7rWv',92,4,17,'2024-05-06 04:03:08.770370','2024-05-06 04:03:08.770370',NULL),(93,'mERkU9sKpQ9UzZ05CneUUiaudxY4Z6',93,4,17,'2024-05-06 04:05:54.396262','2024-05-06 04:05:54.396262',NULL),(94,'Uf7AwPif6rpEquwcHBu0p4LrJhOns9',94,4,17,'2024-05-06 04:17:25.219645','2024-05-06 04:17:25.219645',NULL),(95,'cGnnAI6GCVUNkf7TqLrdHpZ0m2nnpy',95,4,17,'2024-05-06 05:01:16.511371','2024-05-06 05:01:16.511371',NULL),(96,'ypcCJpe7OdHbfS8VbD2MWATVABDJfU',96,4,1,'2024-05-06 05:19:55.062401','2024-05-06 05:19:55.062401',NULL),(97,'hgkTDDd9XI2watnlBMgV7U7oSc7dho',97,4,1,'2024-05-06 05:36:26.081413','2024-05-06 05:36:26.081413',NULL),(98,'hUzpYIAhpLGuob7lz9X2PotwSCoZ5L',98,4,1,'2024-05-06 05:37:22.796227','2024-05-06 05:37:22.796227',NULL),(99,'2I16tDqUQ51iZ9fYlkYu9F9QbhsU9P',99,4,1,'2024-05-06 05:41:26.552947','2024-05-06 05:41:26.552947',NULL),(100,'6zykZCLZIk1AHzxZfC0yIF8EEZSoAC',100,4,17,'2024-05-06 05:44:32.534436','2024-05-06 05:44:32.534436',NULL),(101,'xzJumJ6HmfY4E0X4mmXHg776lNrtRq',101,4,1,'2024-05-06 05:45:13.521751','2024-05-06 05:45:13.521751',NULL),(102,'bHiFZEqvNsdprLLLSiAVrWNaR52Agg',102,4,17,'2024-05-06 07:02:44.136303','2024-05-06 07:02:44.136303',NULL),(103,'HsR7JhJBxhxicEjLlxiDYdnmLlPVCQ',103,4,17,'2024-05-06 07:05:57.948380','2024-05-06 07:05:57.948380',NULL),(104,'n9QQjVaoVfzVqq0zDvpIdCccdUpzfu',104,4,17,'2024-05-06 07:09:12.458812','2024-05-06 07:09:12.458812',NULL),(105,'Oi31GJToHaTGX9FSrZbtT8bp61nAik',105,4,17,'2024-05-06 08:01:11.339781','2024-05-06 08:01:11.339781',NULL),(106,'9JklbJ8OF3Do0qGy3221TNTxJ9vnZY',106,4,17,'2024-05-06 08:22:24.801464','2024-05-06 08:22:24.801464',NULL),(107,'cScYFOwTWfExoO5t5mindN5aoSBpzK',107,4,17,'2024-05-06 08:45:29.115370','2024-05-06 08:45:29.116373',NULL),(108,'2UbOiH48i89OOQFpuhbt1g9BUeSEK1',108,4,16,'2024-05-06 08:57:18.909810','2024-05-06 08:57:18.909810',NULL),(109,'CvzHeECJF7oL8HLXJj9lPdow0lJdA7',109,4,16,'2024-05-06 09:19:58.513019','2024-05-06 09:19:58.513019',NULL),(110,'AKajfa1D9tWL4KEnPt5urZvvwKMnra',110,4,16,'2024-05-06 09:36:47.422477','2024-05-06 09:36:47.422477',NULL),(111,'0ykRPKJDSVTCkJfKdKdC1SRfajK2Tc',111,4,17,'2024-05-06 10:32:29.903013','2024-05-06 10:32:29.903013',NULL),(112,'GHF8LR6o0XXUcqsNX1z5srNvjP5mKb',112,4,17,'2024-05-06 11:10:18.068226','2024-05-06 11:10:18.068226',NULL),(113,'zfUiHfDR8eHHkbcjs3Qled7UhPqeKL',113,4,17,'2024-05-06 13:14:10.130042','2024-05-06 13:14:10.130042',NULL),(114,'LZM59dLuLyjfDAn7xKfzofKHFi9X0t',114,4,17,'2024-05-06 13:31:34.725998','2024-05-06 13:31:34.725998',NULL),(115,'PJdmYLKiQuJlMT50ODHjhRvz7UbiZu',115,4,17,'2024-05-06 13:58:55.038064','2024-05-06 13:58:55.038064',NULL),(116,'GitgJDSwKb5ykD7x1s9BgQgUZB32XG',116,4,17,'2024-05-06 14:01:29.368098','2024-05-06 14:01:29.368098',NULL),(117,'rxPG7SbGWrbLTsfQ4dk0oYzZ6dLF2I',117,4,17,'2024-05-06 14:05:51.965007','2024-05-06 14:05:51.965007',NULL),(118,'HUV1dGnLe18alNqmT9eiRlTwv5VjC7',118,4,17,'2024-05-06 14:22:54.951195','2024-05-06 14:22:54.951195',NULL),(119,'pWGeOJ7wKUaIhfQHjj6kaAOjZFS9gk',119,4,17,'2024-05-06 14:30:54.612275','2024-05-06 14:30:54.612275',NULL),(120,'azUnHtRY5EA0aidYRjdoqNfwwF4fSM',120,4,17,'2024-05-06 14:57:10.308243','2024-05-06 14:57:10.308243',NULL),(121,'oO8pykx0X0WkyPWFc06CMKakpEosN2',121,4,17,'2024-05-06 15:04:34.405113','2024-05-06 15:04:34.405113',NULL),(122,'MwuAY1BM6q0PzeKt61kPLf94FaSYrT',122,4,17,'2024-05-06 15:19:29.651742','2024-05-06 15:19:29.651742',NULL),(123,'YlMi1sejiOYHSR7QumQ8TZ0sYf2wAg',123,4,17,'2024-05-06 15:28:14.609519','2024-05-06 15:28:14.609519',NULL),(124,'ZzSO5VG4VHs5anwjyBJLvQGDA8Nzo4',124,4,17,'2024-05-06 15:54:03.405719','2024-05-06 15:54:03.405719',NULL),(125,'MkGcr4gi7i6GsmRm92TzrGYfeiNJz2',125,4,17,'2024-05-06 16:24:12.379139','2024-05-06 16:24:12.379139',NULL),(126,'paLiq02zeCFiCS1B49mSQvGDTr7bFS',126,4,17,'2024-05-06 16:30:02.732069','2024-05-06 16:30:02.732069',NULL),(127,'GAlesGnWyqekE4FxT55XZlezVTcdsP',127,4,17,'2024-05-06 16:31:02.645540','2024-05-06 16:31:02.645540',NULL),(128,'lvlwmXJ8vc9lPH6T9lLSyBXxqqDAmZ',128,4,17,'2024-05-06 16:32:37.017864','2024-05-06 16:32:37.017864',NULL),(129,'j0lojXyJfVg6jz0EqzDrGcc2RIMVhr',129,4,17,'2024-05-06 16:36:57.082865','2024-05-06 16:36:57.082865',NULL),(130,'Mvoovr2SCv3veafoggzgKS7FZGIuY3',130,4,17,'2024-05-06 17:47:38.420262','2024-05-06 17:47:38.420262',NULL),(131,'VZ3meZd3a5L1FZorNaY8MxRIYtIv70',131,4,17,'2024-05-06 18:31:56.196222','2024-05-06 18:31:56.196222',NULL),(132,'boeLRskuYIxiughj8ozLDAU657zNR5',132,4,17,'2024-05-06 18:52:28.916536','2024-05-06 18:52:28.916536',NULL),(133,'B7GU55gYFsMU3p8KKnQ8pQqbLWjWtY',133,4,17,'2024-05-06 18:54:47.860217','2024-05-06 18:54:47.860217',NULL),(134,'u9ewzfkMYvJueyPiYUX1wUTp8d2gNl',134,4,17,'2024-05-06 18:58:42.144133','2024-05-06 18:58:42.144133',NULL),(135,'eYWjSa1QrjPmHem5OtsLgCBRBEeI88',135,4,17,'2024-05-06 19:01:14.838606','2024-05-06 19:01:14.838606',NULL),(136,'Y3mTlphR2ix0mhhfmhTS1LgzlTVFp0',136,4,17,'2024-05-06 19:04:51.086207','2024-05-06 19:04:51.086207',NULL),(137,'ZHJmYBrqfJT3gYAPOQ5XGwfsJHupIF',137,4,17,'2024-05-07 05:29:19.493362','2024-05-07 05:29:19.493362',NULL),(138,'edJXBIn2YxeQDGvrzq075uuJc26cvK',138,4,17,'2024-05-07 05:52:45.440884','2024-05-07 05:52:45.440884',NULL),(139,'2eCIxwFmJ0NmIT8fJn8LPVnonvU4w0',139,4,17,'2024-05-07 05:55:50.245433','2024-05-07 05:55:50.245433',NULL),(140,'7BL0olqrkM2vAoJGxWiikp2JjPOfup',140,4,17,'2024-05-07 06:02:26.292000','2024-05-07 06:02:26.292000',NULL),(141,'fNXUkfCsGcR1OWyh0LgJFSHBtxtzVe',141,4,17,'2024-05-07 06:29:53.377975','2024-05-07 06:29:53.377975',NULL),(142,'Xeh2bwSk5d20SPJlN1mFohSVNrXwDo',142,4,17,'2024-05-07 06:32:30.550240','2024-05-07 06:32:30.550240',NULL),(143,'qeHjRJmlmKLR6tTECfcyyvuskqqsT6',143,4,17,'2024-05-07 07:08:03.997202','2024-05-07 07:08:03.998204',NULL),(144,'65CucyE0gsKmuRpsPKL05Ilc1O3tJA',144,4,17,'2024-05-07 07:37:26.601009','2024-05-07 07:37:26.601009',NULL),(145,'oVPzr1HZ89BEzuykbe0xWu8fkGh8jv',145,4,17,'2024-05-07 07:40:02.703083','2024-05-07 07:40:02.703083',NULL),(146,'TcZBJA9AentzizqHpt51ESz5jxS4fk',146,4,17,'2024-05-07 07:43:55.718982','2024-05-07 07:43:55.718982',NULL),(147,'mNTCPVAo4ttRxAGD3dXJw9PySX3NOg',147,4,17,'2024-05-07 07:49:26.287223','2024-05-07 07:49:26.287223',NULL),(148,'MmLQRzWtV4LGNUotzhdabFQw7kXp3q',148,4,17,'2024-05-07 10:44:41.570531','2024-05-07 10:44:41.570531',NULL),(149,'bXhXvFiPunvjqnDdBTUkTJBlpjJEjR',149,4,17,'2024-05-07 10:52:10.192351','2024-05-07 10:52:10.192351',NULL),(150,'ZtvNviJsUEoY61wfuQ07eoS0nfqhs8',150,4,16,'2024-05-08 12:01:51.216397','2024-05-08 12:01:51.216397',NULL),(151,'untEmhi1GWTde1AD98TbQJgSlvCqsW',151,4,17,'2024-05-08 12:07:36.105644','2024-05-08 12:07:36.105644',NULL),(152,'Rcl2XwXBRBFuLBn34MY412N8MnHcrj',152,4,16,'2024-05-08 12:17:27.131554','2024-05-08 12:17:27.132552',NULL),(153,'FDU9blPg3UrjM1BPbRwQd3D6fMvEdE',153,4,16,'2024-05-08 12:24:30.426934','2024-05-08 12:24:30.426934',NULL),(154,'2uuMykdu0YCaY5XdKGfLq8LFrI8bwG',154,4,16,'2024-05-08 12:49:04.513282','2024-05-08 12:49:04.513282',NULL),(155,'ztriwg0y5zwZkrKNqmbdNLMFnXLbM0',155,4,16,'2024-05-08 13:28:15.218867','2024-05-08 13:28:15.218867',NULL),(156,'qsDVuifCk74Ha2Id8jEa7rsyrNKVMx',156,4,16,'2024-05-08 13:45:15.857996','2024-05-08 13:45:15.857996',NULL),(157,'QX1Xom4clcDGEYP2ETu1qx0uJwTPqi',157,4,16,'2024-05-08 14:16:58.008361','2024-05-08 14:16:58.008361',NULL),(158,'jQOSKaz5Drq1b7jePNuet47fZLlQ7E',158,4,16,'2024-05-08 14:36:57.841696','2024-05-08 14:36:57.841696',NULL),(159,'aakqbjJ9zou5RC4l8nuXo4wXkhZZNb',159,4,17,'2024-05-08 14:38:52.502747','2024-05-08 14:38:52.502747',NULL),(160,'JZsfEpaf0cqANU1d0ib7cZqKnJPvNU',160,4,16,'2024-05-08 14:41:59.902584','2024-05-08 14:41:59.902584',NULL),(161,'kYAu4TfPIfzBvNqZC6hm3y5aveOrm8',161,4,16,'2024-05-08 15:05:35.841136','2024-05-08 15:05:35.841136',NULL),(162,'W0pUvYYavTcREL0HGhjdDtjRyz5Ujj',162,4,16,'2024-05-08 15:45:25.230642','2024-05-08 15:45:25.230642',NULL),(163,'3Bp5LUEQaNiaLXn5iDj1zqgNtg8tIo',163,4,17,'2024-05-08 15:53:04.648552','2024-05-08 15:53:04.648552',NULL),(164,'vQpekmQXtdxO5WOB7eajjLxMoBv9n0',164,4,19,'2024-05-08 16:06:00.368626','2024-05-08 16:06:00.368626',NULL),(165,'mZ0n4eFhPXJiyx5IbYID0rno7duu7I',165,4,17,'2024-05-08 16:27:45.440722','2024-05-08 16:27:45.440722',NULL),(166,'OxoBF2TdjTEaQC806h3PIHc61KLCdb',166,4,17,'2024-05-08 16:58:01.867111','2024-05-08 16:58:01.867111',NULL),(167,'JxVaE0JwFdLmRAEvtw4GPQ9Gdp5AK3',167,4,17,'2024-05-08 17:05:09.895191','2024-05-08 17:05:09.895191',NULL),(168,'lxnbPTp1HVu1dvo8m0PBvnxArImb2z',168,4,17,'2024-05-08 17:06:00.815732','2024-05-08 17:06:00.815732',NULL),(169,'5bdUBW9Rpbt4pXq9xgx94OWIdGpwxN',169,4,17,'2024-05-08 17:11:24.975875','2024-05-08 17:11:24.975875',NULL),(170,'7dH0BeeKJ4490THMpxRuBmg0GYhiIq',170,4,17,'2024-05-08 17:16:20.868770','2024-05-08 17:16:20.868770',NULL),(171,'gX5AA6BrzbLnkzJkMsfxDRxMahg23J',171,4,17,'2024-05-08 17:20:23.147461','2024-05-08 17:20:23.147461',NULL),(172,'AmOqqEYCe9B8q4nOHKRwjSR1VYHpaM',172,4,17,'2024-05-08 17:25:15.877408','2024-05-08 17:25:15.877408',NULL),(173,'jVjH80csnShNvWK2YobGfjZMbtaMgz',173,4,17,'2024-05-09 01:59:52.294780','2024-05-09 01:59:52.294780',NULL),(174,'HZ2jMKnZ7mjD7Tks99HiUk73IaJgwH',174,4,16,'2024-05-09 04:40:01.364042','2024-05-09 04:40:01.364042',NULL),(175,'O28PxlHUDg0Vp3WVLwSoYFKoreFoKl',175,4,16,'2024-05-09 05:26:33.414333','2024-05-09 05:26:33.414333',NULL),(176,'iEpMzib6AiAfs0fjdhPgB4mG5mp0zE',176,4,17,'2024-05-09 05:31:12.600280','2024-05-09 05:31:12.600280',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
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