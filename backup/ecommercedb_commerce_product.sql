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
-- Table structure for table `commerce_product`
--

DROP TABLE IF EXISTS `commerce_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `store_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commerce_product_store_id_347b7d16_fk_commerce_store_id` (`store_id`),
  KEY `commerce_product_category_id_f0d15f8b_fk_commerce_category_id` (`category_id`),
  CONSTRAINT `commerce_product_category_id_f0d15f8b_fk_commerce_category_id` FOREIGN KEY (`category_id`) REFERENCES `commerce_category` (`id`),
  CONSTRAINT `commerce_product_store_id_347b7d16_fk_commerce_store_id` FOREIGN KEY (`store_id`) REFERENCES `commerce_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerce_product`
--

LOCK TABLES `commerce_product` WRITE;
/*!40000 ALTER TABLE `commerce_product` DISABLE KEYS */;
INSERT INTO `commerce_product` VALUES (1,'Doll Plave',380000,'<h2><em><strong>B&uacute;p b&ecirc; Plave, ch&iacute;nh h&atilde;ng K&iacute;ch thước: 10cm</strong></em></h2>\r\n\r\n<p><img alt=\"\" src=\"/static/product/2024/04/17/images.jpg\" style=\"height:225px; width:225px\" /></p>',50,'2024-04-16 16:45:17.242973','2024-05-05 13:35:24.308918',1,19,1),(2,'Doll Plave S',250000,'<p>Sale off</p>',22,'2024-04-16 17:05:15.143142','2024-05-05 13:35:02.591252',1,19,1),(4,'Khăn sữa Kiba',14000,'<p>Khăn sữa cho b&eacute; Kiba si&ecirc;u mềm si&ecirc;u thấm 2 lớp, 3 lớp, 4 lớp k&iacute;ch thước 25x25cm &ndash; Set 10 khăn tiện lợi, kh&ocirc;ng thể thiếu cho b&eacute; y&ecirc;u</p>',500,'2024-04-21 10:49:24.544096','2024-05-05 13:34:01.019144',1,9,2),(5,'Đầm bầu suông voan bi 2 lớp',300000,'<h3>Đầm bầu c&ocirc;ng sở TK80 Hồng b&egrave;o</h3>\r\n\r\n<p><em>Bầu Đẹp Design mang đến c&aacute;c sản phẩm Đầm bầu &ndash; V&aacute;y bầu thiết kế Đẹp &amp; Trẻ trung. H&agrave;ng thiết kế đủ size cho mẹ bầu từ 40-75kg</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Bảng size đầm bầu:</strong><br />\r\nS: 40-53kg, M:53-65kg, L: 63-75kg</p>\r\n\r\n<p>Chất liệu Vải Đẹp &ndash; Gi&aacute; phải chăng &ndash; Nhận h&agrave;ng chắc chắn sẽ Ưng &yacute;</p>',500,'2024-04-27 13:42:22.948089','2024-05-05 13:33:37.354601',1,9,2),(6,'Thanh Lý Quạt Điện Senko Cũ Giá Rẻ',150000,'<p><em>- Kho đồ nội thất cũ lớn nhất S&agrave;i G&ograve;n.</em><br />\r\n<em>- Sản phẩm chất lượng lu&ocirc;n được đảm bảo.</em><br />\r\n<em>- T&acirc;n trang - vệ sinh - quấn PE khi giao h&agrave;ng.</em><br />\r\n<em>- Vận chuyển v&agrave; lắp đặt tận nơi.</em><br />\r\n<em>- Cam kết gi&aacute; rẻ nhất thị trường.</em><br />\r\n<em>- Chế độ bảo h&agrave;nh - bảo tr&igrave; d&agrave;i hạn</em></p>',1,'2024-04-27 13:48:19.388599','2024-05-05 13:33:17.881250',1,6,3),(7,'Laptop Giá Rẻ Cho Sinh Viên HP Pavilion X360-Pentum-N3540-16GB-512GB/ Cảm Ứng/ Văn Phòng/ Laptop Ram 8GB Cũ',900000,'<h1>Laptop HP Pavilion x360</h1>\r\n\r\n<ul>\r\n	<li>Th&ocirc;ng số kỹ thuật: HP Pavilion x360</li>\r\n	<li>Độ lớn m&agrave;n h&igrave;nh:&nbsp;11.6 inch</li>\r\n	<li>CPU/ Bộ xử l&yacute;: Intel Pentium N3540</li>\r\n	<li>Ram/ Memory: 4GB hoặc 8GB</li>\r\n	<li>Ổ cứng: SSD 128GB hoặc 256GB</li>\r\n	<li>Card đồ họa GPU: Intel&reg; Iris&reg; Xe Graphics</li>\r\n	<li>Battery: Nguy&ecirc;n zin theo m&aacute;y</li>\r\n	<li>Trọng lượng:&nbsp;1.58kg<br />\r\n	<img alt=\"\" src=\"/static/product/2024/04/27/hp-pavilion-x360-pentum-n3540-cam-ung-sieu-mong-laptop-8gb-cu-7-768x513.jpg\" style=\"height:513px; width:768px\" /></li>\r\n</ul>',5,'2024-04-27 15:15:39.926264','2024-05-05 13:33:03.293681',1,17,3),(8,'Áo Thun Cổ Tròn Tay Ngắn Sợi Nhân Tạo Mặc Thoải Mái Biểu Tượng Dáng Rộng Giá Tốt Seventy Seven 10',125000,'<h1><strong>M&ocirc; tả sản phẩm</strong></h1>\r\n\r\n<p>Chất liệu : Vải Waffle<br />\r\nTh&agrave;nh phần : 100% Polyester<br />\r\nCấu tr&uacute;c dệt WAFFLE đặc biệt<br />\r\n- Bền m&agrave;u<br />\r\n- Chống nhăn<br />\r\n- Co gi&atilde;n tốt<br />\r\n+ Họa tiết th&ecirc;u 2D<br />\r\n<img alt=\"\" src=\"/static/product/2024/04/27/628cada7-f209-2900-f31e-001b3edd6b6b.jpg\" style=\"height:756px; width:540px\" /><br />\r\n<img alt=\"\" src=\"/static/product/2024/04/27/2534643d-0c7b-5400-7dd5-001b3b2df863.jpg\" style=\"height:1200px; width:800px\" /></p>',400,'2024-04-27 15:29:40.985442','2024-05-05 13:32:39.862739',1,8,4),(9,'ĐẦM HOA DÁNG A',759000,'<p>N&agrave;ng nhẹ nh&agrave;ng, mềm mại trong thiết kế đầm hoa y&ecirc;u kiều. Đầm cổ thuyền, c&oacute; độ d&agrave;i qua gối c&ugrave;ng kiểu d&aacute;ng chữ A quen thuộc, kh&eacute;o l&eacute;o t&ocirc;n l&ecirc;n n&eacute;t đẹp dịu d&agrave;ng của người mặc. Thiết kế tạo điểm nhấn thắt đai ngang eo, gi&uacute;p che khuyết điểm&nbsp;tốt.&nbsp;</p>\r\n\r\n<p>Chất liệu tơ voan mềm mại tạo cảm gi&aacute;c dễ chịu khi tiếp x&uacute;c với da cũng như gi&uacute;p bạn lu&ocirc;n cảm thấy thoải m&aacute;i v&agrave; m&aacute;t mẻ trong suốt cả ng&agrave;y d&agrave;i.</p>\r\n\r\n<p>Đầm c&oacute; họa tiết hoa bắt mắt, c&oacute; thể đi k&egrave;m với c&aacute;c phụ kiện như khuy&ecirc;n tai&nbsp;v&agrave; một đ&ocirc;i gi&agrave;y cao g&oacute;t, hoặc c&oacute; thể được kết hợp với một chiếc mũ v&agrave;nh rộng c&ugrave;ng đ&ocirc;i&nbsp;sandal để tạo ra một vẻ ngo&agrave;i năng lượng v&agrave; phong c&aacute;ch.&nbsp;</p>\r\n\r\n<p><strong>Th&ocirc;ng tin mẫu:</strong></p>\r\n\r\n<p><strong>Chiều cao:&nbsp;</strong>167 cm</p>\r\n\r\n<p><strong>C&acirc;n nặng:&nbsp;</strong>50 kg</p>\r\n\r\n<p><strong>Số đo 3 v&ograve;ng:&nbsp;</strong>83-65-93 cm</p>\r\n\r\n<p>Mẫu mặc size M</p>\r\n\r\n<p>Lưu &yacute;: M&agrave;u sắc sản phẩm thực tế sẽ c&oacute; sự ch&ecirc;nh lệch nhỏ so với ảnh do điều kiện &aacute;nh s&aacute;ng khi chụp v&agrave; m&agrave;u sắc hiển thị qua m&agrave;n h&igrave;nh m&aacute;y t&iacute;nh/ điện thoại.<br />\r\n<br />\r\n&nbsp;</p>\r\n\r\n<table style=\"width:70%\">\r\n	<tbody>\r\n		<tr>\r\n			<td><strong>D&ograve;ng sản phẩm</strong></td>\r\n			<td>Ladies</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>Nh&oacute;m sản phẩm</strong></td>\r\n			<td>Đầm</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>Cổ &aacute;o</strong></td>\r\n			<td>C&ocirc;̉ thuy&ecirc;̀n</td>\r\n		</tr>\r\n	</tbody>\r\n</table>',366,'2024-04-27 15:35:32.585097','2024-05-05 13:31:26.284708',1,8,4),(10,'OFFICIAL LIGHT STICK',988000,'<h2>[Sales announcement]</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>- This product will be delivered sequentially from MAY 31, 2024 (Fri).</p>\r\n\r\n<p>- Product specifications and release dates may be changed for future production reasons.</p>\r\n\r\n<p>- If you order another product along with the reserved product, it will be shipped according to the pre-order date.</p>\r\n\r\n<p>- All products may have different specifications depending on the measurement method.</p>\r\n\r\n<p>- This image is an example to help you understand the product and may differ from the actual product.</p>\r\n\r\n<p>Official PLAVE products are sold only at Vlast Shop. Please be careful not to be damaged by illegal product transactions and purchases.</p>\r\n\r\n<p>- Guidelines for the Protection of Minors&#39; Rights: Contracts concluded by minors under the Consumer Protection Act in e-commerce, etc. may be canceled by themselves or their legal representatives if their legal representatives do not agree.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>[Exchange/refund]</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>- Packages may be damaged (dented, torn, scratched, small scratches, imprinted, etc.) and contaminated during packaging and delivery, which is not applicable to exchange/return reasons.</p>\r\n\r\n<p>- Please note that you are solely responsible for the loss or omission of delivery due to incorrect delivery information.</p>\r\n\r\n<p>You are also responsible for the return or not received due to change of contact, absence, and non-correction.</p>\r\n\r\n<p>- Please shoot the opening video for the exact confirmation of defects and omissions.(From the opening of the delivery box packaging)</p>\r\n\r\n<p>- The seller may request an opening video to check for defects and omissions.</p>\r\n\r\n<p>If there is a product defect such as delivery error, damage, or defect, please contact the customer service center, and it is difficult to resend it in case of out of stock.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>[Additional Information]</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>- This product is for people over the age of 14 and is not for children.</p>\r\n\r\n<p>- This product is subject to exchange or compensation in accordance with the Consumer Dispute Resolution Standards notified by the Fair Trade Commission.</p>\r\n\r\n<p>&nbsp;</p>',100,'2024-04-27 15:39:49.981115','2024-05-05 13:31:07.022726',1,5,1),(11,'PHOTOCARD PACK_MARCH',142000,'<p>[Sales announcement]</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>- This product will be delivered sequentially from MAY 31, 2024 (Fri).</p>\r\n\r\n<p>- Product specifications and release dates may be changed for future production reasons.</p>\r\n\r\n<p>- If you order another product along with the reserved product, it will be shipped according to the pre-order date.</p>\r\n\r\n<p>- All products may have different specifications depending on the measurement method.</p>\r\n\r\n<p>- This image is an example to help you understand the product and may differ from the actual product.</p>\r\n\r\n<p>Official PLAVE products are sold only at Vlast Shop. Please be careful not to be damaged by illegal product transactions and purchases.</p>\r\n\r\n<p>- Guidelines for the Protection of Minors&#39; Rights: Contracts concluded by minors under the Consumer Protection Act in e-commerce, etc. may be canceled by themselves or their legal representatives if their legal representatives do not agree.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>[Exchange/refund]</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>- Packages may be damaged (dented, torn, scratched, small scratches, imprinted, etc.) and contaminated during packaging and delivery, which is not applicable to exchange/return reasons.</p>\r\n\r\n<p>- Please note that you are solely responsible for the loss or omission of delivery due to incorrect delivery information.</p>\r\n\r\n<p>You are also responsible for the return or not received due to change of contact, absence, and non-correction.</p>\r\n\r\n<p>- Please shoot the opening video for the exact confirmation of defects and omissions.(From the opening of the delivery box packaging)</p>\r\n\r\n<p>- The seller may request an opening video to check for defects and omissions.</p>\r\n\r\n<p>If there is a product defect such as delivery error, damage, or defect, please contact the customer service center, and it is difficult to resend it in case of out of stock.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>[Additional Information]</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>- This product is for people over the age of 14 and is not for children.</p>\r\n\r\n<p>- This product is subject to exchange or compensation in accordance with the Consumer Dispute Resolution Standards notified by the Fair Trade Commission.</p>\r\n\r\n<p>&nbsp;</p>',256,'2024-04-27 15:42:30.351700','2024-05-05 13:30:45.548107',1,5,1),(12,'[Limited quantity] 1ST FANCONT-SHIRT BLUE',912000,'<h3>[ Shipping Guide ]</h3>\r\n\r\n<p>- In the case of international shipping, it differs depending on the type of product, weight (including box weight), and quantity.<br />\r\n- Please note that the delivery date of this product may take 5~10 business days after your order and it may take more time due to the nature of international shipping.<br />\r\n- Since it proceeds to delivery immediately after payment, if you want to exchange or cancel before delivery, please contact the seller.<br />\r\n- Duties and taxes are the responsibility of the recipient and the company is not responsible.<br />\r\nIn this regard, costs such as shipping fees will be deducted from the refund amount.</p>\r\n\r\n<h3>[ Exchange &amp; Return Guide ]</h3>\r\n\r\n<p>Please proceed after contacting our customer center email for cancellation, exchange, or return made after your payment.<br />\r\n<br />\r\n- If you receive a defective item, please be sure to apply for a replacement within seven days of receiving the item.<br />\r\nIf it exceeds seven days, you cannot apply for a return or exchange.<br />\r\n- For exchange, and return due to customer&rsquo;s change of mind, the customer must pay shipping. (Except for defect of product and delivery error)<br />\r\n- However, please note that in the following cases, it will not be returned or exchanged even within 7 days after receipt of the item.<br />\r\n* If the value of the product is damaged due to removal of product tag, opening and loss or damage of goods box.<br />\r\n* In the case of shoes, if they were worn outdoors or have signs of use.<br />\r\n* Handmade shoes of individual order made items (hell height, foot width, size change)<br />\r\n* Some of the special offer products cannot be exchanged or returned, so please refer to the product details of each product.<br />\r\n<br />\r\n- Goods withdrawal period is within 7 days from the date of receipt of the goods.</p>',100,'2024-04-27 15:45:39.713474','2024-05-05 13:30:07.235431',1,1,1),(13,'Mens Ethnic Smile Print Color Block Patchwork Kangaroo Pocket Hoodies',470000,'<ul>\r\n	<li>Color:Khaki, Black, White</li>\r\n	<li>Occasion:Ethnic</li>\r\n	<li>Size:S, M, L, XL, 2XL</li>\r\n	<li>Pattern:Ethnic Pattern, Color Block</li>\r\n	<li>Collar:Hooded</li>\r\n	<li>Material:Polyester</li>\r\n	<li>Sleeves Length:Long Sleeve</li>\r\n	<li>Brand:ChArmkpR</li>\r\n	<li>Thickness:Moderate</li>\r\n	<li>Season:Autumn</li>\r\n	<li>Design Element:Patchwork, Print, Drawstring, Pocket</li>\r\n	<li>Fit Type:Loose</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Package included:</p>\r\n\r\n<p>1*Hoodie</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Please Note:</p>\r\n\r\n<p>Please see the Size Reference to find the correct size.</p>',546,'2024-04-27 15:51:43.583201','2024-05-05 13:29:44.461815',1,1,5),(14,'1ST FANCONT-SHIRT BLUE PLAVE',457000,'<p>&Aacute;o Plave</p>',52,'2024-04-27 16:11:10.001966','2024-05-05 13:29:19.314965',1,1,5),(15,'Khăn sữa Kiba loại 2',4000,'<p>Khăn sữa Kiba loại 2 cho trẻ sơ sinh<br />\r\n4k/c&aacute;i 1 t&aacute; 40k<br />\r\n&nbsp;</p>',863,'2024-04-27 16:13:59.661059','2024-05-05 13:28:23.538550',1,9,2),(16,'Đầm bầu suông voan bi 2 lớp cao cấp',896000,'<p>Đầm bầu cao cấp&nbsp;</p>',182,'2024-04-27 16:17:07.479676','2024-05-05 13:27:38.886161',1,8,4),(17,'Áo Thun Cổ Tròn Tay Ngắn Sợi Nhân Tạo Mặc Thoải Mái Biểu Tượng Dáng Rộng Giá Tốt Seventy Seven 10',378000,'<p>&Aacute;o thun</p>',757,'2024-04-27 16:21:26.147184','2024-05-05 13:29:12.858197',1,7,5),(18,'ĐẦM HOA DÁNG A freesize cho mom',222000,'<p>Đầm hoa cho mom</p>',423,'2024-04-27 16:22:14.812392','2024-05-05 13:32:21.774283',1,8,2),(19,'Hoodie nam',163000,'<p>Hoodie nam Bigsize</p>',324,'2024-04-27 16:23:55.276705','2024-05-05 13:26:15.165651',1,7,4),(20,'iPhone 15 Pro Max 1TB xanh',30999000,'<p>Thanh l&yacute;&nbsp;iPhone 15 Pro Max 1TB</p>',2,'2024-04-27 16:27:18.706170','2024-05-05 13:26:00.524980',1,16,3),(21,'Hoodie nữ cao cấp',778000,'<p>Hoodie nữ cao cấp</p>',243,'2024-04-27 16:30:33.732824','2024-05-05 13:25:40.915658',1,8,5),(22,'Bình Sữa PPSU Ty Siêu Mềm Tự Nhiên Tommee Tippee Natural Start 150ml, Núm Ty Của Bình 0-3 Tháng',345000,'<p><strong>Đặc điểm b&igrave;nh sữa PPSU ty si&ecirc;u mềm tự nhi&ecirc;n Tommee Tippee Natural Start:</strong></p>\r\n\r\n<p><strong><em>Th&acirc;n b&igrave;nh sữa</em></strong></p>\r\n\r\n<ul>\r\n	<li>Th&acirc;n b&igrave;nh sữa bằng chất liệu PPSU d&ugrave;ng trong lĩnh vực y tế v&agrave; thực phẩm, chống b&aacute;m m&ugrave;i, b&aacute;m bẩn, dễ cọ rửa l&agrave;m sạch v&agrave; kh&ocirc;ng chứa BPA, phthalate v&agrave; c&aacute;c h&oacute;a chất độc hại.</li>\r\n	<li>Chất liệu PPSU cao cấp, khả năng chống trầy xước cao, chịu được nhiệt độ l&ecirc;n đến 180oC, độ bền v&agrave; an to&agrave;n rất cao.</li>\r\n	<li>Chất liệu PPSU m&agrave;u c&aacute;nh gi&aacute;n trong suốt dễ d&agrave;ng nh&igrave;n thấy lượng sữa b&ecirc;n trong.</li>\r\n	<li>Mực in vạch định lượng v&agrave; c&aacute;c họa tiết tr&ecirc;n b&igrave;nh c&oacute; nguồn gốc chiết xuất thực vật d&ugrave;ng trong lĩnh vực thực phẩm, kh&ocirc;ng g&acirc;y độc hại cho b&eacute;. Vạch định lượng được in rất ch&iacute;nh x&aacute;c v&agrave; bền l&acirc;u.</li>\r\n	<li>B&igrave;nh sữa c&oacute; cổ rộng, dễ d&agrave;ng vệ sinh v&agrave; tiệt tr&ugrave;ng.</li>\r\n</ul>\r\n\r\n<p><strong><em>N&uacute;m ty b&igrave;nh sữa:</em></strong></p>\r\n\r\n<ul>\r\n	<li>N&uacute;m ty silicon mềm mịn tự nhi&ecirc;n m&ocirc; phỏng ty mẹ, tạo cảm gi&aacute;c như l&agrave;n da ty mẹ, cho b&eacute; dễ d&agrave;ng ngậm, m&uacute;t tự nhi&ecirc;n.&nbsp;</li>\r\n	<li>N&uacute;m ty silicon cao cấp, c&oacute; thể thể chịu được nhiệt độ l&ecirc;n đến 220oC, bạn thoải m&aacute;i tiệt tr&ugrave;ng n&uacute;m ty từ c&aacute;ch đơn giản nhất như luộc bằng nước s&ocirc;i cho đến sử dụng c&aacute;c m&aacute;y tiệt tr&ugrave;ng chuy&ecirc;n biệt như m&aacute;y tiệt tr&ugrave;ng hơi nước, m&aacute;y tiệt tr&ugrave;ng bằng tia UV m&agrave; kh&ocirc;ng sợ ảnh hưởng đến chất lượng của n&uacute;m ty.</li>\r\n	<li>Bầu n&uacute;m ty m&ocirc; phỏng bầu ngực mẹ được thiết kế với c&aacute;c đưởng r&atilde;nh s&oacute;ng b&ecirc;n trong c&oacute; khả năng co gi&atilde;n, đ&agrave;n hồi theo nhịp b&uacute; của b&eacute; một c&aacute;ch tự nhi&ecirc;n nhất, gi&uacute;p b&eacute; dễ d&agrave;ng l&agrave;m quen với việc b&uacute; b&igrave;nh.</li>\r\n	<li>Van Easi-Vent nằm tr&ecirc;n n&uacute;m ty c&oacute; chức năng th&ocirc;ng kh&iacute; chống sặc, chống đầy hơi cực kỳ hiệu quả đ&atilde; được kiểm chứng. Van hoạt động nhạy b&eacute;n, ngăn chặn bọt kh&iacute; h&ograve;a trong sữa, gi&uacute;p b&eacute; tr&aacute;nh bị đầy hơi, sặc sữa.</li>\r\n</ul>\r\n\r\n<p><strong><em>Bộ phận kh&aacute;c:</em></strong></p>\r\n\r\n<p>Nắp b&igrave;nh sữa v&agrave; khoen lắp cổ b&igrave;nh sữa được l&agrave;m từ nhựa PP cao cấp, kh&ocirc;ng chứa BPA chịu được nhiệt độ l&ecirc;n đến 120oC.</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Trọng lượng</th>\r\n			<td>0.2 kg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>K&iacute;ch thước</th>\r\n			<td>10 &times; 10 &times; 15 cm</td>\r\n		</tr>\r\n	</tbody>\r\n</table>',1435,'2024-04-27 16:32:45.846049','2024-05-05 13:25:22.206424',1,5,2),(23,'Quần jean ống suông rộng màu xanh đen rách cơ bản cạp lưng cao nâng mồng xịn sò - Dubai Fashion',85000,'<h2>M&Ocirc; TẢ SẢN PHẨM</h2>\r\n\r\n<p>M&Ocirc; TẢ SẢN PHẨM 1/TH&Ocirc;NG TIN SẢN PHẨM - Quần jean nữ xuất xứ: Việt Nam. - Quần b&ograve; chất liệu: Chất liệu cao cấp, mềm mại v&agrave; thấm h&uacute;t mồ h&ocirc;i tốt. -Form baggy &ocirc;m nhẹ, co gi&atilde;n nhẹ,nhưng vẫn tạo cảm gi&aacute;c thoải m&aacute;i khi mặc, cực tho&aacute;ng m&aacute;t - Quần jean nữ loe đường chỉ may tinh tế v&agrave; tỉ mỉ Size 26: &lt; 30kg Size 27; 35kg đến 46kg Size 28: 47kg đến 50kg Size 29: 51kg đến 53kg Size 30: 54kg đến 56kg Size 31: 56kg đến 59kg Size 32: 59kg đến 63kg 2/ HƯỚNG DẪN SỬ DỤNG/BẢO QUẢN - Ưu ti&ecirc;n giặt tay kh&ocirc;ng n&ecirc;n giặt m&aacute;y thường xuy&ecirc;n - Kh&ocirc;ng sử dụng h&oacute;a chất tẩy c&oacute; chứa clo - N&ecirc;n phơi ở nơi c&oacute; &aacute;nh nắng nhẹ hoặc trong b&oacute;ng m&aacute;t Quần Jean ống loe lưng cao n&acirc;ng m&ocirc;ng- DUBAI FASHION rất dễ phối đồ với: &aacute;o ph&ocirc;ng, &aacute;o sơ mi, &aacute;o ba lỗ. &aacute;o croptop... Đi k&egrave;m với gi&agrave;y cao g&oacute;t, gi&agrave;y thể thao, sandal để tạo n&ecirc;n c&aacute; t&iacute;nh của ri&ecirc;ng bạn 3/ DUBAI CAM KẾT Sản phẩm quần jean DUBAI form chuần 100% giống m&ocirc; tả. H&igrave;nh ảnh sản phẩm l&agrave; ảnh thật do shop tự chụp v&agrave; giữ bản quyền h&igrave;nh ảnh Đảm bảo vải chất lượng 100% &Aacute;o được kiểm tra kĩ c&agrave;ng, cẩn thận v&agrave; tư vấn nhiệt t&igrave;nh trước khi g&oacute;i h&agrave;ng giao cho Qu&yacute; Kh&aacute;ch H&agrave;ng c&oacute; sẵn, giao h&agrave;ng ngay khi nhận được đơn Ho&agrave;n tiền nếu sản phẩm kh&ocirc;ng giống với m&ocirc; tả Chấp nhận đổi h&agrave;ng khi size kh&ocirc;ng vừa Giao h&agrave;ng tr&ecirc;n to&agrave;n quốc, nhận h&agrave;ng trả tiền Hỗ trợ đổi trả theo quy định của Shopee. 4/ CH&Iacute;NH S&Aacute;CH B&Aacute;N H&Agrave;NG 1. Điều kiện &aacute;p dụng (trong v&ograve;ng 07 ng&agrave;y kể từ khi nhận sản phẩm) - H&agrave;ng ho&aacute; vẫn c&ograve;n mới, chưa qua sử dụng - H&agrave;ng ho&aacute; bị lỗi hoặc hư hỏng do vận chuyển hoặc do nh&agrave; sản xuất 2. Trường hợp được chấp nhận: - H&agrave;ng kh&ocirc;ng đ&uacute;ng size, kiểu d&aacute;ng như qu&yacute; kh&aacute;ch đặt h&agrave;ng - Kh&ocirc;ng đủ số lượng, kh&ocirc;ng đủ bộ như trong đơn h&agrave;ng 3. Trường hợp kh&ocirc;ng đủ điều kiện &aacute;p dụng ch&iacute;nh s&aacute;ch: - Qu&aacute; 07 ng&agrave;y kể từ khi Qu&yacute; kh&aacute;ch nhận h&agrave;ng - Gửi lại h&agrave;ng kh&ocirc;ng đ&uacute;ng mẫu m&atilde;, kh&ocirc;ng phải sản phẩm của DUBAI - Kh&ocirc;ng th&iacute;ch, kh&ocirc;ng hợp, đặt nhầm m&atilde;, nhầm m&agrave;u,... Do m&agrave;n h&igrave;nh v&agrave; điều kiện &aacute;nh s&aacute;ng kh&aacute;c nhau, m&agrave;u sắc thực tế của sản phẩm c&oacute; thể ch&ecirc;nh lệch khoảng 3-5%</p>',2536,'2024-04-27 16:34:50.804496','2024-05-07 03:16:53.486059',1,8,4),(46,'Mặt nạ ngủ Innisfree',230000,'Mặt nạ ngủ',6485,'2024-05-07 06:33:47.296749','2024-05-07 06:33:47.296749',1,12,6),(53,'Mặt nạ ngủ Innisfree cao cấp',399000,'Mặt nạ ngủ Innisfree lành mạnh phù hợp với mọi loại da.',6446,'2024-05-07 08:25:02.177991','2024-05-07 08:25:02.177991',1,12,6);
/*!40000 ALTER TABLE `commerce_product` ENABLE KEYS */;
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