/*
SQLyog Community v12.3.3 (32 bit)
MySQL - 10.1.37-MariaDB : Database - demowebdesignser_pizzahut
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `adminiy` */

DROP TABLE IF EXISTS `adminiy`;

CREATE TABLE `adminiy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` text,
  `name` varchar(100) DEFAULT NULL,
  `remember_token` text,
  `is_active` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `adminiy` */

insert  into `adminiy`(`id`,`email`,`password`,`name`,`remember_token`,`is_active`,`created_at`,`updated_at`,`is_deleted`) values 
(1,'admin@project.com','$2y$10$fJwkT72wGNXCIBSqq.5JveP/rSFoSRfrSvotM2BJYPO6xgJFgSWVm','Admin','o2JZSUfWev6IQiF8r1uhtvvYriBDmXpXl4Kv3Fc77NJ5BWHks5vwjc0G3Knj',1,'2019-03-28 16:43:17','2019-04-20 15:25:01',0);

/*Table structure for table `banner_management` */

DROP TABLE IF EXISTS `banner_management`;

CREATE TABLE `banner_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT '1',
  `is_deleted` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `banner_management` */

insert  into `banner_management`(`id`,`user_id`,`is_active`,`is_deleted`,`created_at`,`updated_at`) values 
(3,NULL,1,0,'2019-04-13 14:10:43','2019-04-18 16:57:57'),
(4,NULL,1,0,'2019-04-18 16:58:16','2019-04-18 16:58:16');

/*Table structure for table `career` */

DROP TABLE IF EXISTS `career`;

CREATE TABLE `career` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `is_active` int(11) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` int(11) DEFAULT '0',
  `career_full_name` varchar(255) DEFAULT NULL,
  `career_email` varchar(255) DEFAULT NULL,
  `career_position` int(11) DEFAULT '0',
  `career_degree` int(11) DEFAULT '0',
  `career_experience` int(11) DEFAULT '0',
  `career_vacancy` int(11) DEFAULT '0',
  `career_city` int(11) DEFAULT '0',
  `career_coverletter` text,
  `career_resume` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `career` */

/*Table structure for table `faqs` */

DROP TABLE IF EXISTS `faqs`;

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` int(11) DEFAULT '1',
  `is_deleted` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `faq_question` varchar(255) DEFAULT NULL,
  `faq_question_detail` text,
  `faq_question_type` enum('Most Asked','Online Ordering','Our Restaurents') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `faqs` */

insert  into `faqs`(`id`,`is_active`,`is_deleted`,`user_id`,`updated_at`,`created_at`,`faq_question`,`faq_question_detail`,`faq_question_type`) values 
(1,1,0,0,'2019-04-18 17:10:05','2019-04-18 17:10:05','Q. Will hail damage these panels?','No, when the grid goes down you will be without power as well. The reason for this is a safeguard on behalf of your service provider. If a lineman is working on a down power system and you are back feeding the grid with solar energy this could present possible safety concerns for the workers. (Backup batteries will solve this issue in the future).','Most Asked'),
(3,1,0,0,'2019-04-18 17:10:40','2019-04-18 17:10:40','Q. Will I have power when the sun is out and the grid is down?','No, when the grid goes down you will be without power as well. The reason for this is a safeguard on behalf of your service provider. If a lineman is working on a down power system and you are back feeding the grid with solar energy this could present possible safety concerns for the workers. (Backup batteries will solve this issue in the future).','Most Asked'),
(4,1,0,0,'2019-04-18 17:11:25','2019-04-18 17:11:25','How long do the panels last?','No, when the grid goes down you will be without power as well. The reason for this is a safeguard on behalf of your service provider. If a lineman is working on a down power system and you are back feeding the grid with solar energy this could present possible safety concerns for the workers. (Backup batteries will solve this issue in the future).','Most Asked'),
(5,1,0,0,'2019-04-18 17:11:42','2019-04-18 17:11:42','Q. What happens when I need to get my roof replaced?','No, when the grid goes down you will be without power as well. The reason for this is a safeguard on behalf of your service provider. If a lineman is working on a down power system and you are back feeding the grid with solar energy this could present possible safety concerns for the workers. (Backup batteries will solve this issue in the future).','Most Asked'),
(6,1,0,0,'2019-04-18 17:12:13','2019-04-18 17:12:13','Q.  If so, who will pay for it?','No, when the grid goes down you will be without power as well. The reason for this is a safeguard on behalf of your service provider. If a lineman is working on a down power system and you are back feeding the grid with solar energy this could present possible safety concerns for the workers. (Backup batteries will solve this issue in the future).','Most Asked'),
(7,1,0,0,'2019-04-18 17:12:30','2019-04-18 17:12:30','If my panels are undamaged and the roof needs to be replaced, who covers the cost of uninstallation and reinstallation of the panels?','No, when the grid goes down you will be without power as well. The reason for this is a safeguard on behalf of your service provider. If a lineman is working on a down power system and you are back feeding the grid with solar energy this could present possible safety concerns for the workers. (Backup batteries will solve this issue in the future).','Most Asked'),
(8,1,0,0,'2019-04-18 17:12:52','2019-04-18 17:12:52','Q.  How much does a panel cost?','No, when the grid goes down you will be without power as well. The reason for this is a safeguard on behalf of your service provider. If a lineman is working on a down power system and you are back feeding the grid with solar energy this could present possible safety concerns for the workers. (Backup batteries will solve this issue in the future).','Most Asked'),
(9,1,0,0,'2019-04-18 17:13:09','2019-04-18 17:13:09','Q.  Why does the finance agreement say my payment increases after 16-17 months?','No, when the grid goes down you will be without power as well. The reason for this is a safeguard on behalf of your service provider. If a lineman is working on a down power system and you are back feeding the grid with solar energy this could present possible safety concerns for the workers. (Backup batteries will solve this issue in the future).','Most Asked');

/*Table structure for table `flag_data` */

DROP TABLE IF EXISTS `flag_data`;

CREATE TABLE `flag_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag_color` varchar(255) DEFAULT NULL,
  `flag_name` varchar(255) DEFAULT NULL,
  `flag_reminder` text,
  `table_name` varchar(100) DEFAULT NULL,
  `ref_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `flag_data` */

insert  into `flag_data`(`id`,`flag_color`,`flag_name`,`flag_reminder`,`table_name`,`ref_id`,`created_at`,`updated_at`) values 
(1,'#12321','sad','asdasd','adminiy',1,'2019-04-02 21:16:47','0000-00-00 00:00:00');

/*Table structure for table `imagetable` */

DROP TABLE IF EXISTS `imagetable`;

CREATE TABLE `imagetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(50) NOT NULL,
  `img_path` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ref_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT '1',
  `is_active_img` varchar(1) DEFAULT '1',
  `additional_attributes` text,
  `img_href` text,
  PRIMARY KEY (`id`),
  KEY `table_name` (`table_name`,`ref_id`,`type`),
  FULLTEXT KEY `imgp` (`img_path`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

/*Data for the table `imagetable` */

insert  into `imagetable`(`id`,`table_name`,`img_path`,`created_at`,`updated_at`,`ref_id`,`type`,`is_active_img`,`additional_attributes`,`img_href`) values 
(1,'logo','Uploads/imagetable/896bfb1fdee9cbc5e4fbec5478698791/qtcNsBRaXDHkCmYyu2divsvKqIQcnfgCSlJXpGnb.png','2019-04-18 21:48:16','2019-04-18 16:48:16',0,1,'1',NULL,NULL),
(2,'favicon','Uploads/imagetable/13c0c92892833baaf750729782ab6104/WZvCOV9PH81W151eRfGCcexCG8T2oBOwF7dv2u53.png','2019-04-18 21:49:42','2019-04-18 16:49:42',0,1,'1',NULL,NULL),
(3,'banner_management','Uploads/banner_management/ba3a04aa647fd3cf0fec590ab714cb77/EQf2ZZXQAt7KUexh4nLQooMFQ2F7lniVycLT2I6C.png','2019-04-18 16:57:57','2019-04-18 16:57:57',3,1,'1',NULL,NULL),
(4,'banner_management_thumb','Uploads/banner_management/db3926a4d5cc759d69d330e9aa45b3d1/4wpEj1X62ssdo5KJS7p92laYqYitUGO7N4AQqpIE.png','2019-04-18 16:57:57','2019-04-18 16:57:57',3,1,'1',NULL,NULL),
(5,'banner_management','Uploads/banner_management/8db3119d0ca363f7db16a86e23e613fa/ZnrrxtllW38KbexkXoI4SIVLqfqyXSYNtDtr6rEO.png','2019-04-18 16:58:16','2019-04-18 16:58:16',4,1,'1',NULL,NULL),
(6,'banner_management_thumb','Uploads/banner_management/4fd4eca7f2137890a72a83827af96881/mqpabzCgroKxqJ4wTlEAj44VIPMqrHrm7pJkFl3Y.png','2019-04-18 16:58:16','2019-04-18 16:58:16',4,1,'1',NULL,NULL),
(7,'career','Uploads/imagetable/088056751860131537c556249c469c2e/piQI6AsExxMbkM1NCoAWfLWF0xrlTJDJf4gbDFNF.png','2019-04-20 11:44:03','2019-04-20 15:44:03',0,1,'1',NULL,NULL),
(8,'products','Uploads/products/2211cae2705bd388e4881d6ef3f0d30e/he3WVyqtizZXEU49VmLSPpSpdPQQxUJIREuI6RKm.png','2019-04-23 09:10:13','2019-04-23 04:10:13',1,1,'1',NULL,NULL),
(9,'products','Uploads/products/36ffb6d79448859b7466642fe51ea7d3/ncyaMG3TZ2ig23VIGUEJQGlNswZHjieegJpGWTLs.png','2019-04-23 04:10:48','2019-04-23 04:10:48',2,1,'1',NULL,NULL),
(10,'products','Uploads/products/1908955309d81fd7a635995b8e6b9a02/8kZ1UP1s086dFuHSSJZnuFZ4xw02hnuHWGuTvLPu.png','2019-04-23 04:11:14','2019-04-23 04:11:14',3,1,'1',NULL,NULL),
(11,'products','Uploads/products/ae2599f5b114640b272ccb4803ffa696/uq2oY5RuDzsUK92Q9JT8lNqhL4XFAslwRf0PcoP7.png','2019-04-23 04:11:43','2019-04-23 04:11:43',4,1,'1',NULL,NULL),
(12,'products','Uploads/products/82099782f688ba930aec910905bbc590/4mo7eKHavy5MVOTiXI22Q6f1zsNobgLGD3LoFqh9.png','2019-04-23 04:12:16','2019-04-23 04:12:16',5,1,'1',NULL,NULL),
(13,'products','Uploads/products/3569723904960bcb9981a8dbae0c229b/JyC8Mm8uMxOMHMBSub7QX11bbritsJqrPEZHGdCP.png','2019-04-23 04:12:38','2019-04-23 04:12:38',6,1,'1',NULL,NULL),
(14,'products','Uploads/products/01c8fe8675fd6468cd7ac3bac6368af0/1ufUDR0PSljTTqekuYqbmWjIGLCaxd5gSiBAfYUk.png','2019-04-23 04:13:01','2019-04-23 04:13:01',7,1,'1',NULL,NULL),
(15,'products','Uploads/products/59141833818ca9e0904605f6ccf4371f/SzYZvR3EA8MS6uBJezZwUG48fyYeGPIyrMtwqz1R.png','2019-04-23 04:13:23','2019-04-23 04:13:23',8,1,'1',NULL,NULL),
(16,'products','Uploads/products/ddc64a8c9108aa979ba3e391f4eed397/95rcdJ9zWaCqp1xt67s8pDECrcPheV2XJiC7shGG.png','2019-04-23 04:13:43','2019-04-23 04:13:43',9,1,'1',NULL,NULL),
(17,'products','Uploads/products/de2634fb5f35b47ee021fff4799170df/qiz7LyE6mR1hCQdlh7mO9ycVfEfTR2Bb1xHGJIvU.png','2019-04-23 04:14:06','2019-04-23 04:14:06',10,1,'1',NULL,NULL),
(18,'products','Uploads/products/e7d03cfdbbb88f19779bed752824611a/5xg5BcjHeLjim29bA9KBbAX0xKFKNQWuoqB7iIKt.png','2019-04-23 04:14:27','2019-04-23 04:14:27',11,1,'1',NULL,NULL),
(19,'products','Uploads/products/2d80f596bc28a8e1ceca357db32d5a08/dcUpS4PRx7ItVYBeaMnQE9SAoMBdwLKtdnKRo69L.png','2019-04-23 04:14:52','2019-04-23 04:14:52',12,1,'1',NULL,NULL),
(20,'products','Uploads/products/45b0466da8b635091db9462a5377ea57/VXgPrbJnfFi8XBe5YhU8SfmTLVfGnb9PAPH93IwY.png','2019-04-23 04:15:12','2019-04-23 04:15:12',13,1,'1',NULL,NULL),
(21,'products','Uploads/products/01c90e7a173c95a434a6ee3168bf03e7/Z80MoB08db2L6rXrz83cDLTON1eOwAdNSlwpOBwv.png','2019-04-23 04:15:44','2019-04-23 04:15:44',14,1,'1',NULL,NULL),
(22,'products','Uploads/products/62674c1d0df9c99fa46136c00fb93fdc/AeCHup7LQxE8O5driJVKJuFQNKoMVrfptpQ8a43x.png','2019-04-23 04:16:03','2019-04-23 04:16:03',15,1,'1',NULL,NULL),
(23,'products','Uploads/products/e8145657c10ac8b2b2cf868e4d2dc587/6LMhmO4uUIXFmuNAkfbX1T02nkf2XjS4Ml1U8pIj.png','2019-04-23 04:56:40','2019-04-23 04:56:40',16,1,'1',NULL,NULL),
(24,'products','Uploads/products/b1c3eec608ca6fe3478d9988831bcd77/nsLsxXt52oO3okT6HGlKO70OBl7KTMvYfakKKAfp.png','2019-04-23 05:21:33','2019-04-23 05:21:33',17,1,'1',NULL,NULL),
(25,'products','Uploads/products/9f40121258d8753a49fd5081c1801af5/3M2b5FtLzrERlWoGv2fliuIAqlbloNJ8C2xKY2Mg.png','2019-04-23 05:22:03','2019-04-23 05:22:03',18,1,'1',NULL,NULL),
(26,'products','Uploads/products/8a789b638f80f82fb2d9968c87b9b83a/VLhELrlIbd7n8VDiwctmBqz5VomPMZBj24PPLfDg.png','2019-04-23 05:22:22','2019-04-23 05:22:22',19,1,'1',NULL,NULL),
(27,'products','Uploads/products/79e5a0a540e59339769248f95e1d685a/4bkICA1bAjlwcRIGhWMCuHPWjsBYdjRe1u4F8Xa9.png','2019-04-23 05:29:59','2019-04-23 05:29:59',20,1,'1',NULL,NULL),
(28,'products','Uploads/products/261541d5d094c0a68b242dddfdacd37b/POBlO8nPHff5CiV8UOlMRblPiEwkdj1baUjyE790.png','2019-04-23 05:30:17','2019-04-23 05:30:17',21,1,'1',NULL,NULL),
(29,'products','Uploads/products/3522df2dc925f1e682222d57560f979d/OBLjRQo8MWIX7BZdlppYcW21NVXXctDSdEGKI8lF.png','2019-04-23 06:17:02','2019-04-23 06:17:02',22,1,'1',NULL,NULL),
(30,'products','Uploads/products/2ab05aab255afa99f28b8365e59dd492/DpvkuGucJ9iZgRy1EdWhqJUNrDLVS5agUa3AkW8I.png','2019-04-23 06:17:20','2019-04-23 06:17:20',23,1,'1',NULL,NULL),
(31,'products','Uploads/products/76306b8a0650e9857da531f9c5194bee/47ggajwQaR4tVPt1wZfIhBWJjwQZW5UWFKEOeWQc.png','2019-04-23 06:17:32','2019-04-23 06:17:32',24,1,'1',NULL,NULL),
(32,'products','Uploads/products/b8885298a3aa5e33754c67ae3e2ce4a1/XzGUYN85BYxz7N9mO6MgYhD7IYyX7xbKGBrsCa0J.png','2019-04-23 06:18:04','2019-04-23 06:18:04',25,1,'1',NULL,NULL),
(33,'products','Uploads/products/88f324e0f782a81ad3604dd124df9bd6/DMcbvUtoQTboAodCTB9ubQ323JnPF0j1Bt1NYwaP.png','2019-04-23 06:18:29','2019-04-23 06:18:29',26,1,'1',NULL,NULL),
(34,'products','Uploads/products/5949268eb424fdda2b1747ae58d10829/MqcLTcaLl8d7O1k3uX3OSjEEcskXvFz35lBZ3GHo.png','2019-04-23 06:18:47','2019-04-23 06:18:47',27,1,'1',NULL,NULL),
(35,'products','Uploads/products/d0eb8f05a4ad33c49e9ce43b10ea43ca/QkmQiPJZRYE4t9JnVWvNViyCZAYMHThhIQt0Q2qY.png','2019-04-23 06:19:23','2019-04-23 06:19:23',28,1,'1',NULL,NULL),
(36,'products','Uploads/products/ebb3b91eff5a12db715764b768a93459/zLvDMPpIlXDgOiosnNUEqHKVJjmMRgvZMPIlBkyE.png','2019-04-23 06:25:07','2019-04-23 06:25:07',29,1,'1',NULL,NULL),
(37,'products','Uploads/products/919df6223b563764c17f6413d82fae36/p8gPcIzPcTzFPTa3xXqFdajOB452wKTdhO20Gppe.png','2019-04-23 06:25:31','2019-04-23 06:25:31',30,1,'1',NULL,NULL),
(38,'products','Uploads/products/fd934c5b67e0447ea9fcc52429c37292/aLMGUZrjvMCRde9sdRBCrvDAgkegaOsuvpjie4EX.png','2019-04-23 06:25:47','2019-04-23 06:25:47',31,1,'1',NULL,NULL),
(39,'products','Uploads/products/fcaf2852d63e50f4a438ebb724e812bb/UoBbBefhfFQNuT6wRHeajgR45YRMqUyXwwEIdPtO.png','2019-04-23 06:26:16','2019-04-23 06:26:16',32,1,'1',NULL,NULL),
(40,'products','Uploads/products/14a1b8e1a2d39c10452623378e5abe5c/6fLBJdfzG37SLHPNjLVAzWb71o05CX5INTqVkB6K.png','2019-04-23 06:27:17','2019-04-23 06:27:17',33,1,'1',NULL,NULL),
(41,'products','Uploads/products/6bd31df60941cb70ac99a94e6915f1e9/erRwBm16yRCPMaNQHdhIbFbXnaLebNURjn7po66Z.png','2019-04-23 06:27:37','2019-04-23 06:27:37',34,1,'1',NULL,NULL),
(42,'products','Uploads/products/f047a7e81700f883218f26468260de1c/YKB18oyjgUkmdWkhtnHmt1KeQ166GRMoCRAnsjsN.png','2019-04-23 06:39:33','2019-04-23 06:39:33',35,1,'1',NULL,NULL),
(43,'products','Uploads/products/e61c86634f9960ff51c97243e5e741be/YUhRDRxrgS6gMPWHAqfX0OwpfV3MJcE4b0nmtdvh.png','2019-04-23 06:39:48','2019-04-23 06:39:48',36,1,'1',NULL,NULL),
(44,'products','Uploads/products/2a34b179232acc15bfcf42f81d2fbaeb/NIfG1DW55goI0iyZV22RTEMHz930oz7d4pAC4hDN.png','2019-04-23 06:40:01','2019-04-23 06:40:01',37,1,'1',NULL,NULL),
(45,'products','Uploads/products/0a82e6172bb5c48a1dc692a7514fac7b/9WUKacNf06qEUOpYg0PTnepWaHwHhHD7aENvFtJw.png','2019-04-23 06:40:13','2019-04-23 06:40:13',38,1,'1',NULL,NULL),
(46,'products','Uploads/products/aab45379b13b96eccb63ef54a1f1edab/R2P5J7wsKp03GWYLW6TGkTPDyBhhQfPXl7mok1Xk.png','2019-04-23 06:40:25','2019-04-23 06:40:25',39,1,'1',NULL,NULL),
(47,'ptypepizza','Uploads/imagetable/e41a0bf7630ec6dc7081ee79c2973ff1/8hDnExP2VjqRW8UKyJxNJ0hI3t5s5La7AvgYlB7c.png','2019-04-24 03:53:21','2019-04-23 22:53:21',0,1,'1',NULL,NULL),
(48,'ptypesides','Uploads/imagetable/e2a9a9eaf060efe2a5f1a9620166c327/kJI2UIwvddGPy0h1CuKorrCkxDu6MP7lONxmDrXo.png','2019-04-24 03:53:42','2019-04-23 22:53:42',0,1,'1',NULL,NULL),
(49,'ptypedessert','Uploads/imagetable/386d5ef945f58d77058e3bc164d26494/oGQUu61ITq803HwfYLKKduEY5wT146AOfYZWYgDP.png','2019-04-24 03:54:06','2019-04-23 22:54:06',0,1,'1',NULL,NULL),
(50,'ptypedrinks','Uploads/imagetable/fa27a11334137623bd45dd714c82a314/GG9uMtT3OAbZATXCq42d99OPM6mYUrc6cz8RXt3g.png','2019-04-24 03:54:31','2019-04-23 22:54:31',0,1,'1',NULL,NULL),
(51,'ptypeourstory','Uploads/imagetable/a3e7aea91eec24b77d87abf5f46f9b87/Aovane2mUemciuAQMeCElFXmGXOlbbMTujzsVWd8.png','2019-04-24 04:17:45','2019-04-23 23:17:45',0,1,'1',NULL,NULL);

/*Table structure for table `inquiry` */

DROP TABLE IF EXISTS `inquiry`;

CREATE TABLE `inquiry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inquiries_name` varchar(255) NOT NULL,
  `inquiries_email` text NOT NULL,
  `inquiries_phone` varchar(255) NOT NULL,
  `extra_content` text NOT NULL,
  `is_read` char(1) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `is_deleted` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `inquiries_lname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `inquiry` */

insert  into `inquiry`(`id`,`inquiries_name`,`inquiries_email`,`inquiries_phone`,`extra_content`,`is_read`,`type`,`created_at`,`updated_at`,`is_active`,`is_deleted`,`user_id`,`inquiries_lname`) values 
(4,'123123','123123@gmail.com','123123','asdasdasd','0',1,'2019-04-20 11:25:53','2019-04-20 11:25:53',1,0,0,'123123'),
(5,'asd','asd@as.com','asd','asd','0',1,'2019-04-20 12:50:15','2019-04-20 12:50:15',1,0,0,'asd'),
(6,'asd','asd@as.comasd','sad','asd','0',1,'2019-04-20 16:09:24','2019-04-20 16:09:24',1,0,0,'asd');

/*Table structure for table `location` */

DROP TABLE IF EXISTS `location`;

CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) DEFAULT NULL,
  `location_url` text,
  `is_active` int(11) DEFAULT '1',
  `is_deleted` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `locaiton_email` varchar(255) NOT NULL,
  `location_phone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

/*Data for the table `location` */

insert  into `location`(`id`,`location_name`,`location_url`,`is_active`,`is_deleted`,`user_id`,`created_at`,`updated_at`,`locaiton_email`,`location_phone`) values 
(1,'Atrium Mall','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 15:14:13','2019-04-19 15:14:13','',''),
(2,'Bahria Town','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 15:14:13','2019-04-19 15:14:13','',''),
(3,'Clifton 1','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 15:14:13','2019-04-19 15:14:13','',''),
(4,'Clifton 2','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 15:14:13','2019-04-19 15:14:13','',''),
(5,'Dilkusha','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:27','2019-04-19 21:03:43','',''),
(6,'Dolmen Mall Clifton','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:27','2019-04-19 21:03:43','',''),
(7,'Dolmen Mall Tariq Road','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:27','2019-04-19 21:03:43','',''),
(8,'F.B AREA','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:27','2019-04-19 21:03:43','',''),
(9,'Gulshan Disco','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:27','2019-04-19 21:03:43','',''),
(10,'Gulshan e Maymar','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:27','2019-04-19 21:03:43','',''),
(11,'Gulshan-e-Hadeed','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:27','2019-04-19 21:03:43','',''),
(12,'Gulshan-e-Iqbal','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:27','2019-04-19 21:03:43','',''),
(13,'Johar Delco','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:27','2019-04-19 21:03:43','',''),
(14,'Karachi Cantt Railway Station','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:27','2019-04-19 21:03:43','',''),
(15,'Atrium Mall','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:27','2019-04-19 21:03:43','',''),
(16,'Bahria Town','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:27','2019-04-19 21:03:43','',''),
(17,'Clifton 1','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:27','2019-04-19 21:03:43','',''),
(18,'Clifton 2','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:28','2019-04-19 21:03:43','',''),
(19,'Dilkusha','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:28','2019-04-19 21:03:43','',''),
(20,'Dolmen Mall Clifton','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:28','2019-04-19 21:03:43','',''),
(21,'Dolmen Mall Tariq Road','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:28','2019-04-19 21:03:43','',''),
(22,'F.B AREA','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:28','2019-04-19 21:03:43','',''),
(23,'Gulshan Disco','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:28','2019-04-19 21:03:43','',''),
(24,'Gulshan e Maymar','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:28','2019-04-19 21:03:43','',''),
(25,'Gulshan-e-Hadeed','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:28','2019-04-19 21:03:43','',''),
(26,'Gulshan-e-Iqbal','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:28','2019-04-19 21:03:43','',''),
(27,'Johar Delco','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:28','2019-04-19 21:03:43','',''),
(28,'Karachi Cantt Railway Station','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96771.87096640076!2d-74.13877096971696!3d40.71535345066336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c250d225bfafdd%3A0x249f013a2cd25d9!2sJersey+City%2C+NJ%2C+USA!5e0!3m2!1sen!2s!4v1554431408327!5m2!1sen!2s',1,0,0,'2019-04-19 21:03:28','2019-04-19 21:03:43','','');

/*Table structure for table `m_flag` */

DROP TABLE IF EXISTS `m_flag`;

CREATE TABLE `m_flag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag_type` varchar(100) NOT NULL,
  `flag_value` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flag_additionalText` text,
  `has_image` varchar(1) DEFAULT '0',
  `is_active` varchar(1) DEFAULT '1',
  `is_config` varchar(1) DEFAULT '0',
  `flag_show_text` text,
  `is_featured` int(11) DEFAULT '0',
  `is_deleted` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2021 DEFAULT CHARSET=utf8;

/*Data for the table `m_flag` */

insert  into `m_flag`(`id`,`flag_type`,`flag_value`,`created_at`,`updated_at`,`flag_additionalText`,`has_image`,`is_active`,`is_config`,`flag_show_text`,`is_featured`,`is_deleted`,`user_id`) values 
(59,'COMPANYPHONE','000-000-0000','2019-04-19 11:33:45','0000-00-00 00:00:00','000-000-0000','0','1','1','Company Phone',0,0,0),
(123,'COMPANY','Pizza Hut','2019-04-19 11:33:45','0000-00-00 00:00:00','Pizza Hut','0','1','1','Company',0,0,0),
(218,'COMPANYEMAIL','info@demo.com','2019-04-19 11:33:45','0000-00-00 00:00:00','info@demo.com','0','1','1','Company Email',0,0,0),
(499,'CURRENTHEME','red','2019-04-23 03:16:09','0000-00-00 00:00:00','red','0','1','1','Theme Option',0,0,0),
(519,'ADDRESS','107 Silver Circle','2019-04-19 11:33:45','0000-00-00 00:00:00','107 Silver Circle','0','1','1','Address',0,0,0),
(682,'FACEBOOK','https://facebook.com/sdd','2019-04-23 23:56:03','0000-00-00 00:00:00','https://facebook.com/sdd','0','1','1','Facebook',0,0,0),
(1960,'TWITTER','https://twitter.com/','2019-04-19 11:34:21','0000-00-00 00:00:00','https://twitter.com/','0','1','1','Twitter',0,0,0),
(1961,'INSTAGRAM','https://instagram.com/','2019-04-19 11:34:53','0000-00-00 00:00:00','https://instagram.com/','0','1','1','Instagram',0,0,0),
(1962,'GOOGLEPLUS','https://googleplus.com/','2019-04-19 11:35:03','0000-00-00 00:00:00','https://googleplus.com/','0','1','1','Google+',0,0,0),
(1964,'POSITIONAPPLIED','Position 1','2019-04-19 07:14:52','2019-04-19 07:14:52',NULL,'0','1','0',NULL,0,0,0),
(1965,'POSITIONAPPLIED','Position 2','2019-04-19 07:14:55','2019-04-19 07:14:55',NULL,'0','1','0',NULL,0,0,0),
(1966,'POSITIONAPPLIED','Position 3','2019-04-19 07:14:58','2019-04-19 07:14:58',NULL,'0','1','0',NULL,0,0,0),
(1967,'HIGHESTDEGREE','Degree 1','2019-04-19 07:17:46','2019-04-19 07:17:46',NULL,'0','1','0',NULL,0,0,0),
(1968,'HIGHESTDEGREE','Degree 2','2019-04-19 07:17:49','2019-04-19 07:17:49',NULL,'0','1','0',NULL,0,0,0),
(1969,'HIGHESTDEGREE','Degree 3','2019-04-19 07:17:53','2019-04-19 07:17:53',NULL,'0','1','0',NULL,0,0,0),
(1970,'WORKEXPERIENCE','1 Year','2019-04-19 07:19:31','2019-04-19 07:19:31',NULL,'0','1','0',NULL,0,0,0),
(1971,'WORKEXPERIENCE','2 Year','2019-04-19 07:19:34','2019-04-19 07:19:34',NULL,'0','1','0',NULL,0,0,0),
(1972,'WORKEXPERIENCE','3 Year','2019-04-19 07:19:40','2019-04-19 07:19:40',NULL,'0','1','0',NULL,0,0,0),
(1974,'CAREER26','CAREER26','2019-04-19 12:46:10','0000-00-00 00:00:00','Submit Your Applicattion','0','1','0','',1,0,0),
(1991,'OURSTORY55','OURSTORY55','2019-04-20 11:44:57','0000-00-00 00:00:00','&lt;p&gt;Pizza Hut is in 1958 opgericht door twee studenten “Dan en Frank Carney” in Wichita&amp;nbsp;&lt;u&gt;(&lt;/u&gt;Kansas&lt;u&gt;)&lt;/u&gt;. Het bedrijf werd in 1977 overgenomen door PepsiCo&lt;/p&gt;\n\n&lt;p&gt;Pizza Hut is sinds 1958 uitgegroeid tot ’s werelds grootste pizzaketen en heeft inmiddels meer dan 15.000 vestigingen in 100 landen. Wereldwijd werken er meer dan 300.000 mensen voor Pizza Hut.&lt;/p&gt;\n\n&lt;p&gt;Pizza Hut heeft een aantal verschijningsvormen, de bekende Dine-In Restaurants, Delivery Units maar ook de Fast Casual Delco (FCD).&lt;/p&gt;\n\n&lt;p&gt;De FCD’s hebben een divers en aantrekkelijk menu en zijn te vinden in woonwijken maar ook in stadscentra. Bij de FCD kun je terecht voor een bijvoorbeeld een personal pizza, maar ook friet. Afhalen kan ook evenals het laten bezorgen. Elke FCD heeft 10 – 40 zitplaatsen zodat je ook ter plekke lekker van je Pizza kunt genieten In Nederland wordt de komende jaren hier vooral de aandacht op gevestigd.&lt;/p&gt;\n\n&lt;p&gt;Bij Pizza Hut is onze missie eten serveren waar wij trots op zijn! Wij gebruiken alleen de beste ingrediënten en bereiden elke pizza met veel liefde. Wij van Pizza Hut willen niet meegaan in de massa, wij willen uniek zijn! Daarom is ons team ook continue bezig om onze heerlijke favorieten nog specialer te maken. Denk bijvoorbeeld aan onze “cheesy crust” of de wereldberoemde Pan Pizza.&lt;/p&gt;\n\n&lt;p&gt;Met meer dan 55 jaar ervaring, weten wij hoe wij onze klanten moeten bedienen. In plaats van de trends te volgen, maken wij de trend. Wij maken eten waar we trots op zijn en serveren dit snel en met een lach.&lt;/p&gt;\n\n&lt;p&gt;Wil je zien wat er nog meer is gebeurd over de jaren heen? Bekijk onze geschiedenis afbeelding hieronder&lt;/p&gt;\n&lt;img src=&quot;http://demowebdesignservices.com/yrux/pizza/public/Uploads/imagetable/088056751860131537c556249c469c2e/piQI6AsExxMbkM1NCoAWfLWF0xrlTJDJf4gbDFNF.png&quot;&gt;\n','0','1','0','',1,0,0),
(1992,'OURSTORY61','OURSTORY61','2019-04-20 12:09:22','0000-00-00 00:00:00','Sometimes you just need to speak to a real person. Give us a call.&lt;br&gt;','0','1','0','',1,0,0),
(1993,'PRODUCTCATEGORY','Vegetable Pizza','2019-04-23 04:09:07','2019-04-23 04:09:07',NULL,'0','1','0',NULL,0,0,0),
(1994,'PRODUCTCATEGORY','Chicken Pizza','2019-04-23 04:09:16','2019-04-23 04:09:16',NULL,'0','1','0',NULL,0,0,0),
(1995,'PRODUCTCATEGORY','Beef Pizza','2019-04-23 04:09:26','2019-04-23 04:09:26',NULL,'0','1','0',NULL,0,0,0),
(2000,'OURSTORY54','OURSTORY54','2019-04-24 02:42:52','0000-00-00 00:00:00','&lt;p&gt;The Pizza Hut story begins in May 1958. Dan and Frank Carney opened their 550-squarefoot pizza restaurant in Wichita, Kansas. Dan and Frank, with friends Richard Beemer and John Bender, made the pizza themselves. Frank rolled the dough with a rolling pin. Richard tossed the dough in the air from the pie tin. Dan filled the unbaked crust with sauce. John flipped the pie from the tin during the baking process. Dan Carney recalled, &amp;quot;The people were enchanted with the product, watching us tossing the dough over our heads. They were really enjoying themselves&amp;hellip;.&amp;quot;&lt;/p&gt;\n\n&lt;p&gt;The Carneys created an innovative, high quality, engaging, informal eating experience in a friendly neighborhood restaurant. Pizza Hut became a popular place with the teenage and college crowd. Pizza Hut attracted families that enjoyed a night out eating a meal that they would not be having at home. After the families left, Pizza Hut transformed itself into a hangout for college-age kids. Having a good time was an essential part of Pizza Hut. The idea caught on. A second Pizza Hut opened in December 1958 in downtown Wichita. By 1963, there were forty-two Pizza Hut restaurants.&lt;/p&gt;\n\n&lt;p&gt;The first Pizza Hut Restaurant in Pakistan was opened in December 1993 and took the culinary scene by surprise. From that time onwards, the brand has contributed heavily towards the development of the society as a whole. It is responsible for creating job opportunities for the youth of the country both directly as well as indirectly. Furthermore, Pizza Hut during the core of its existence has gradually aided in the development of various local suppliers who as a requirement have to supply food staff equivalent in quality to the international food standards. In this regard, our restaurant chain has proved to be a major contributor towards the progress of the Pakistani food industry as a whole by bringing it to a point where they can now look forward to supplying their items to other chains as well as the international market.&lt;/p&gt;\n\n&lt;p&gt;Pizza Hut, being the first International franchise to enter the Pakistani market has set new standards of dine-in restaurants and quick delivery of oven hot pizzas and has since then enjoyed tremendous brand loyalty from its customers.&lt;/p&gt;\n&lt;img src=&quot;http://demowebdesignservices.com/yrux/pizza/public/Uploads/imagetable/088056751860131537c556249c469c2e/piQI6AsExxMbkM1NCoAWfLWF0xrlTJDJf4gbDFNF.png&quot; /&gt;\n','0','1','0','',1,0,0),
(2004,'FOOTER7','FOOTER7','2019-04-24 02:46:48','0000-00-00 00:00:00','ABOUT US','0','1','0','',1,0,0),
(2006,'ORDERONLINE12','ORDERONLINE12','2019-04-24 02:49:59','0000-00-00 00:00:00','Delivery Hero&amp;nbsp;&lt;br data-cke-eol=&quot;1&quot;&gt;&lt;strong&gt;APP Order Online&lt;/strong&gt;','0','1','0','',1,0,0),
(2007,'PIZZAPAGE20','PIZZAPAGE20','2019-04-24 02:54:09','0000-00-00 00:00:00','Pizza','0','1','0','',1,0,0),
(2012,'PRIVACYPOLICY48','PRIVACYPOLICY48','2019-04-24 02:57:21','0000-00-00 00:00:00','PRIVACY &lt;span style=&quot;color:#c8102e;&quot;&gt;POLICY&lt;/span&gt;','0','1','0','',1,0,0),
(2013,'PRIVACYPOLICY81','PRIVACYPOLICY81','2019-04-24 02:57:32','0000-00-00 00:00:00','OTH&lt;span style=&quot;color:#c8102e;&quot;&gt;​​​​​​​&lt;/span&gt;ER WAYS TO CONTACT US','0','1','0','',1,0,0),
(2014,'FAQPAGE17','FAQPAGE17','2019-04-24 02:58:36','0000-00-00 00:00:00','FREQUENTLY ASKED &lt;span style=&quot;color:#c8102e;&quot;&gt;QUESTIONS&lt;/span&gt;','0','1','0','',1,0,0),
(2015,'CONTACTPAGE15','CONTACTPAGE15','2019-04-24 03:03:45','0000-00-00 00:00:00','Contact &lt;span style=&quot;color:#c8102e;&quot;&gt;US&lt;/span&gt;','0','1','0','',1,0,0),
(2016,'FOOTER55','FOOTER55','2019-04-24 03:04:37','0000-00-00 00:00:00','&lt;span style=&quot;color:#ffffff;&quot;&gt;Subscribe&lt;/span&gt; Now !','0','1','0','',1,0,0),
(2017,'DEALPAGE16','DEALPAGE16','2019-04-24 03:05:38','0000-00-00 00:00:00','Deal Of The Day','0','1','0','',1,0,0),
(2018,'WELCOME80','WELCOME80','2019-04-24 03:06:52','0000-00-00 00:00:00','Deal Of The Day','0','1','0','',1,0,0),
(2019,'LOCATIONPAGE19','LOCATIONPAGE19','2019-04-24 03:09:27','0000-00-00 00:00:00','FIND &lt;span style=&quot;color:#c8102e;&quot;&gt;PIZZA HUT&lt;/span&gt;','0','1','0','',1,0,0),
(2020,'CAREER17','CAREER17','2019-04-24 03:27:57','0000-00-00 00:00:00','CAREERS @ &lt;span style=&quot;color:#c0392b&quot;&gt;MCR&lt;/span&gt;','0','1','0','',1,0,0);

/*Table structure for table `privacy_policy` */

DROP TABLE IF EXISTS `privacy_policy`;

CREATE TABLE `privacy_policy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `is_active` int(11) DEFAULT '1',
  `is_deleted` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `policy_heading` varchar(255) DEFAULT NULL,
  `policy_text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `privacy_policy` */

insert  into `privacy_policy`(`id`,`user_id`,`is_active`,`is_deleted`,`created_at`,`updated_at`,`policy_heading`,`policy_text`) values 
(1,0,1,0,'2019-04-23 20:46:46','2019-04-23 20:46:46','ABOUT THIS POLICY','<p>This policy describes our privacy practices for the websites where it is posted. It also applies to our practices for our mobile phone and text programs.</p>'),
(2,0,1,0,'2019-04-23 20:47:10','2019-04-23 20:47:10','INFORMATION WE COLLECT','<p>Contact Information: For example, we might collect your name and street address. We might also collect your phone number or email address.<br />\r\nPayment Information: For example, we might collect your credit card information when you make a purchase.<br />\r\nDemographic Information: We might, for example, collect your age. We might also collect information about the food you like.&nbsp;<br />\r\nOther Information: For example, we collect IP addresses and user browsing behavior. We collect this and other information using the tracking tools described in this policy.</p>'),
(3,0,1,0,'2019-04-23 20:47:20','2019-04-23 20:47:20','HOW WE COLLECT INFORMATION','<p>We collect information directly from you. For example, when you register on a website, for a sweepstakes or for one of our programs. We also collect information if you leave comments or make contact requests.</p>\r\n\r\n<p>We collect information from you passively. If you are on a mobile device and use a location based service, for example, then we will collect your location. We use common tracking tools like browser cookies to collect information passively. We may also use web beacons.</p>\r\n\r\n<p>We collect information from third parties. For example, we might get information about you from one of our franchisees. This information might be combined with information we already have.</p>'),
(4,0,1,0,'2019-04-23 20:47:31','2019-04-23 20:47:31','HOW WE USE INFORMATION','<p>We use your information as is disclosed at the time we collect the information and in the following ways</p>\r\n\r\n<ul>\r\n	<li>(1) To respond to your requests or inquiries. For example, we use your information to fulfill orders or prizes. We might also use your information to register you for a promotions or our website. From time to time, we may also use your information to process your employment application.</li>\r\n	<li>(2) To improve our products and services and for related business purposes. For example, we use information to understand our visitors and customers. This includes looking at website usage trends. We also use your information to make website and product improvements. We might also use your information to customize your experience with us. We may do these activities using the tracking tools described in this policy.</li>\r\n	<li>(3) For security purposes. For example, we might use information to protect our website or our company. We might also use information to protect our customers or our business partners.</li>\r\n	<li>(4) To promote Pizza Hut and our related companies. For example, unless we tell you otherwise, we might send you notices of special promotions, offers or solicitations. We might also notify you about new website features or product offerings. To manage your communications, follow the instructions in Your Choices, below.</li>\r\n	<li>(5) To communicate with you about your account or our relationship. For example, to notify you about changes to this Policy or our website Terms, to let you know about issues relating to your order or your relationship with us.</li>\r\n</ul>'),
(5,0,1,0,'2019-04-23 20:47:40','2019-04-23 20:47:40','INFORMATION SHARING','<p>We may share your information as follows:</p>\r\n\r\n<p>If we think we have to in order to comply with the law. For example, we will disclose information to respond to a court order or subpoena. We may also disclose if a government agency or investigatory body requests.</p>\r\n\r\n<p>In the event all or part of Pizza Hut transfers ownership. For example, if there is a merger, acquisition or similar event, we will share information with the new owner. We may also sell off all or part of our customer lists as part of an asset sale.</p>'),
(6,0,1,0,'2019-04-23 20:47:51','2019-04-23 20:47:51','YOUR CHOICES','<p>To stop receiving our promotional emails, you can follow the instructions in any individual promotional email you receive. When logged in, registered users can also change their options at the My Account page.</p>\r\n\r\n<p>To opt out of having us share your information with third parties for their promotional purposes, you can follow the instructions in any individual promotional email you receive or when logged in, registered users can also change their options at the My Account page.</p>\r\n\r\n<p>To manage how we -and our third party vendors- use cookies and other tracking tools, please click here. You can choose whether or not to disclose personal information. Some parts of our sites and some services may be more difficult or impossible to use, though, if you choose not to share. If you turn of cookies or tracking tools parts of our site and services may also not function properly.</p>'),
(7,0,1,0,'2019-04-23 20:48:03','2019-04-23 20:48:03','MORE QUESTIONS?','<p>Visit our&nbsp;<a href=\"http://localhost:8000/privacy-policy\">Contact Us</a>&nbsp;page,&nbsp;<a href=\"http://localhost:8000/privacy-policy\">email us</a>, call us at&nbsp;<a href=\"tel:34914000\">34914000</a>, or write to us at the following address:</p>\r\n\r\n<p>MCR (Pvt) Ltd.&nbsp;<br />\r\nFranchisee of Pizza Hut&nbsp;<br />\r\n7th floor, Shahnaz arcade,&nbsp;<br />\r\nShaheed-e-Millat Road,&nbsp;<br />\r\nKarachi</p>'),
(8,0,1,0,'2019-04-23 20:48:18','2019-04-23 20:48:18','SECURITY','<p>We use industry standard measures to protect personal information. We cannot guarantee that you will be completely secure, however. We recommend that you use caution when using the Internet or mobile devices.</p>\r\n\r\n<p>Further, Our Site may use technologies such as cookies to provide visitors with tailored information upon each visit. Cookies are a common part of many commercial Websites that allow small text files to be sent by a Website, accepted by a Web browser and then placed on your hard drive as recognition for repeat visits to the Site. Every time you visit Our Site, Our servers, through cookies, pixels and/or GIF files, collect basic technical information such as your domain name, the address of the last URL visited prior to clicking through to the Site, and your browser and operating system. You do not need to enable cookies to visit Our Site; however, some parts of the Site and some services may be more difficult or impossible to use if cookies are disabled. To emphasize, cookies are not linked to any Personal Information while on this Site. It does not contain your name, address, telephone number, or email address.</p>'),
(9,0,1,0,'2019-04-23 20:48:28','2019-04-23 20:48:28','LINKS','<p>This Site may contain links to other websites that Pizza Hut may not own or operate. We cannot control and we are not responsible for the privacy practices or content of such other websites. We encourage you to read the privacy statements of each and every website that collects personal information. This Policy only applies to the personal information collected on this Site.</p>'),
(10,0,1,0,'2019-04-23 20:48:37','2019-04-23 20:48:37','UPDATING PERSONAL INFORMATION','<p>If you are a registered user on our Site, you can review, correct, update or delete/deactivate your personal information. Log on to our Site and click on &quot;<a href=\"http://localhost:8000/privacy-policy\">My Account</a>&quot; to make changes.</p>'),
(11,0,1,0,'2019-04-23 20:49:22','2019-04-23 20:49:22','POLICY UPDATES','<p>We will post any changes on the Site&#39;s homepage. Check here for the most recent version of our policy. Where permitted by law, changes to our policy will be applied to information we already maintain.</p>');

/*Table structure for table `product_prices` */

DROP TABLE IF EXISTS `product_prices`;

CREATE TABLE `product_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `price_shortname` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `is_active` int(11) DEFAULT '1',
  `is_deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

/*Data for the table `product_prices` */

insert  into `product_prices`(`id`,`product_id`,`created_at`,`updated_at`,`price_shortname`,`price`,`user_id`,`is_active`,`is_deleted`) values 
(1,15,'2019-04-23 04:31:45','2019-04-23 04:31:45',NULL,8,0,1,0),
(2,14,'2019-04-23 04:31:45','2019-04-23 04:31:45',NULL,8,0,1,0),
(3,13,'2019-04-23 04:31:45','2019-04-23 04:31:45',NULL,8,0,1,0),
(4,12,'2019-04-23 04:31:45','2019-04-23 04:31:45',NULL,8,0,1,0),
(5,11,'2019-04-23 04:31:45','2019-04-23 04:31:45',NULL,8,0,1,0),
(6,10,'2019-04-23 04:31:45','2019-04-23 04:31:45',NULL,8,0,1,0),
(7,9,'2019-04-23 04:31:45','2019-04-23 04:31:45',NULL,8,0,1,0),
(8,8,'2019-04-23 04:31:45','2019-04-23 04:31:45',NULL,8,0,1,0),
(9,7,'2019-04-23 04:31:45','2019-04-23 04:31:45',NULL,8,0,1,0),
(10,6,'2019-04-23 04:31:45','2019-04-23 04:31:45',NULL,8,0,1,0),
(11,5,'2019-04-23 04:31:45','2019-04-23 04:31:45',NULL,8,0,1,0),
(12,4,'2019-04-23 04:31:45','2019-04-23 04:31:45',NULL,8,0,1,0),
(13,3,'2019-04-23 04:31:45','2019-04-23 04:31:45',NULL,8,0,1,0),
(14,2,'2019-04-23 04:31:45','2019-04-23 04:31:45',NULL,8,0,1,0),
(15,1,'2019-04-23 04:31:45','2019-04-23 04:31:45',NULL,8,0,1,0),
(16,16,'2019-04-23 04:31:45','2019-04-23 04:31:45',NULL,2.2,0,1,0),
(17,17,'2019-04-23 04:31:45','2019-04-23 04:31:45',NULL,2.5,0,1,0),
(18,18,'2019-04-23 04:31:45','2019-04-23 10:31:30',NULL,2.95,0,1,0),
(19,19,'2019-04-23 04:31:45','2019-04-23 04:31:45','4 stuks',2.95,0,1,0),
(20,19,'2019-04-23 04:31:45','2019-04-23 04:31:45','6 stuks',2.95,0,1,0),
(21,20,'2019-04-23 04:31:45','2019-04-23 10:32:30','4 stuks',2.95,0,1,0),
(22,20,'2019-04-23 04:31:45','2019-04-23 10:32:28','6 stuks',2.95,0,1,0),
(24,21,'2019-04-23 04:31:45','2019-04-23 04:31:45','4 stuks',2.95,0,1,0),
(25,21,'2019-04-23 04:31:45','2019-04-23 04:31:45','6 stuks',2.95,0,1,0),
(26,22,'2019-04-23 04:31:45','2019-04-23 04:31:45','',4.5,0,1,0),
(27,23,'2019-04-23 04:31:45','2019-04-23 04:31:45','',2,0,1,0),
(28,24,'2019-04-23 04:31:45','2019-04-23 04:31:45','',2.95,0,1,0),
(29,25,'2019-04-23 04:31:45','2019-04-23 04:31:45','',2,0,1,0),
(30,26,'2019-04-23 04:31:45','2019-04-23 04:31:45','',2,0,1,0),
(31,27,'2019-04-23 04:31:45','2019-04-23 04:31:45','',2,0,1,0),
(32,28,'2019-04-23 04:31:45','2019-04-23 04:31:45','',2.5,0,1,0),
(33,29,'2019-04-23 04:31:45','2019-04-23 04:31:45','',2.25,0,1,0),
(34,30,'2019-04-23 04:31:45','2019-04-23 04:31:45','',2,0,1,0),
(35,31,'2019-04-23 04:31:45','2019-04-23 04:31:45','',2.95,0,1,0),
(36,32,'2019-04-23 04:31:45','2019-04-23 04:31:45','',2,0,1,0),
(37,33,'2019-04-23 04:31:45','2019-04-23 04:31:45','',2,0,1,0),
(38,34,'2019-04-23 04:31:45','2019-04-23 04:31:45','',2,0,1,0);

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL,
  `product_shortname` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `is_active` int(11) DEFAULT '1',
  `is_featured` int(11) DEFAULT '0',
  `product_type` enum('pizza','sides','desserts','drinks','deals') DEFAULT NULL,
  `product_category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

/*Data for the table `products` */

insert  into `products`(`id`,`product_name`,`product_shortname`,`created_at`,`updated_at`,`is_deleted`,`user_id`,`is_active`,`is_featured`,`product_type`,`product_category`) values 
(1,'Margharita','Tomatensaus en mozzarella','2019-04-23 04:08:12','2019-04-23 04:10:13',0,0,1,0,'pizza',1994),
(2,'Veggie Supreme','Tomatensaus, mozzarella, roma tomaten, champignons, paprika en rode uien','2019-04-23 04:10:48','2019-04-23 04:10:48',0,0,1,0,'pizza',1994),
(3,'Pepperoni Lovers','Pepperoni, tomatensaus en mozzarella','2019-04-23 04:11:14','2019-04-23 04:11:14',0,0,1,0,'pizza',1995),
(4,'Veggie Lover','Tomatensaus, mozzarella, champignons, pepers, rode uien, tomaat en parmezaanse kaas','2019-04-23 04:11:43','2019-04-23 04:11:43',0,0,1,0,'pizza',1993),
(5,'Hawaiian','Ham, ananas, tomatensaus en mozzarella','2019-04-23 04:12:16','2019-04-23 04:12:16',0,0,1,0,'pizza',1994),
(6,'Cheesam','Ham, tomatensaus en extra mozarella','2019-04-23 04:12:38','2019-04-23 04:12:38',0,0,1,0,'pizza',1995),
(7,'FarmHouse','Ham, champignons, tomatensaus en mozzarella','2019-04-23 04:13:01','2019-04-23 04:13:01',0,0,1,0,'pizza',1993),
(8,'Diablo','Ham, jalapeño, rode uien, tomatensaus en mozarella','2019-04-23 04:13:23','2019-04-23 04:13:23',0,0,1,0,'pizza',1994),
(9,'Backyard Chicken','Bacon, kip, rode uien, tomatensaus en mozzarella','2019-04-23 04:13:43','2019-04-23 04:13:43',0,0,1,0,'pizza',1995),
(10,'Chicken Supreme','Kip, rode uien, champignons, paprika, tomatensaus en mozzarella','2019-04-23 04:14:06','2019-04-23 04:14:06',0,0,1,0,'pizza',1993),
(11,'Chicken Shoarma','Kip shoarma, rode uien, tomatensaus en mozzarella','2019-04-23 04:14:27','2019-04-23 04:14:27',0,0,1,0,'pizza',1994),
(12,'Hawaiian Chicken','Kip, rode uien, champignons, paprika, tomatensaus en mozzarella','2019-04-23 04:14:51','2019-04-23 04:14:51',0,0,1,0,'pizza',1995),
(13,'Spicy Chicken','Kip shoarma, rode uien, tomatensaus en mozzarella','2019-04-23 04:15:12','2019-04-23 04:15:12',0,0,1,0,'pizza',1993),
(14,'Tuna Melt','Tonijn, rode ui, mais, tomatensaus en mozzarella','2019-04-23 04:15:44','2019-04-23 04:15:44',0,0,1,0,'pizza',1994),
(15,'Meat Lovers','Kip cajun, pepperoni, ham, tomatensaus en mozzarella','2019-04-23 04:16:03','2019-04-23 04:16:03',0,0,1,0,'pizza',1995),
(16,'Friet','Large','2019-04-23 04:56:40','2019-04-23 04:56:40',0,0,1,0,'sides',NULL),
(17,'Potatoes Wedges','inclusief 1x saus','2019-04-23 05:21:33','2019-04-23 05:21:33',0,0,1,0,'sides',NULL),
(18,'Garlic Bread','4 st.','2019-04-23 05:22:03','2019-04-23 05:22:03',0,0,1,0,'sides',NULL),
(19,'Croqs','Inclusief 1x Squs','2019-04-23 05:22:22','2019-04-23 05:22:22',0,0,1,0,'sides',NULL),
(20,'Chicken. Wing','Inclusief 1x Squs','2019-04-23 05:29:59','2019-04-23 05:29:59',0,0,1,0,'sides',NULL),
(21,'Heinz Saus','tomaat / mayonaise / sweet chili / bbq / kno?ook','2019-04-23 05:30:17','2019-04-23 05:30:17',0,0,1,0,'sides',NULL),
(22,'Nutella Breadsticks','6 st.','2019-04-23 06:17:02','2019-04-23 06:17:02',0,0,1,0,'desserts',NULL),
(23,'Macarons','2 st.','2019-04-23 06:17:20','2019-04-23 06:17:20',0,0,1,0,'desserts',NULL),
(24,'Brownie Chunkie',NULL,'2019-04-23 06:17:32','2019-04-23 06:17:32',0,0,1,0,'desserts',NULL),
(25,'American Cookie',NULL,'2019-04-23 06:18:04','2019-04-23 06:18:04',0,0,1,0,'desserts',NULL),
(26,'Chicken. Wing','Inclusief 1x Squs','2019-04-23 06:18:29','2019-04-23 06:18:29',0,0,1,0,'desserts',NULL),
(27,'Donut','Naturel / Chocolade','2019-04-23 06:18:47','2019-04-23 06:18:47',0,0,1,0,'desserts',NULL),
(28,'Häagen Dazs','Strawberry Cheesecake / Belgische Chocolade','2019-04-23 06:19:23','2019-04-23 06:19:23',0,0,1,0,'desserts',NULL),
(29,'Coca Cola','Regular / Zero / Cherry','2019-04-23 06:25:07','2019-04-23 06:25:07',0,0,1,0,'drinks',NULL),
(30,'Fanta','Regular / Cassis','2019-04-23 06:25:31','2019-04-23 06:25:31',0,0,1,0,'drinks',NULL),
(31,'Sprite',NULL,'2019-04-23 06:25:47','2019-04-23 06:35:38',0,0,1,0,'drinks',NULL),
(32,'Fernandes',NULL,'2019-04-23 06:26:16','2019-04-23 06:26:16',0,0,1,0,'drinks',NULL),
(33,'Fuze Tea','Green / Black Tea / Peach / Mango','2019-04-23 06:27:17','2019-04-23 06:27:17',0,0,1,0,'drinks',NULL),
(34,'Red Bull',NULL,'2019-04-23 06:27:37','2019-04-23 06:27:37',0,0,1,0,'drinks',NULL),
(35,NULL,NULL,'2019-04-23 06:39:33','2019-04-23 06:39:33',0,0,1,1,'deals',NULL),
(36,NULL,NULL,'2019-04-23 06:39:48','2019-04-23 06:39:48',0,0,1,1,'deals',NULL),
(37,NULL,NULL,'2019-04-23 06:40:01','2019-04-23 06:40:01',0,0,1,1,'deals',NULL),
(38,NULL,NULL,'2019-04-23 06:40:13','2019-04-23 06:40:13',0,0,1,1,'deals',NULL),
(39,NULL,'null','2019-04-23 06:40:25','2019-04-23 07:48:23',0,0,1,1,'deals',NULL);

/*Table structure for table `table_notes` */

DROP TABLE IF EXISTS `table_notes`;

CREATE TABLE `table_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(250) DEFAULT NULL,
  `ref_id` int(11) DEFAULT NULL,
  `note_value` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT '0',
  `is_active` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `table_notes` */

/*Table structure for table `terms_of_user` */

DROP TABLE IF EXISTS `terms_of_user`;

CREATE TABLE `terms_of_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` int(11) DEFAULT '1',
  `is_deleted` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `tou_heading` varchar(255) DEFAULT NULL,
  `tou_text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `terms_of_user` */

insert  into `terms_of_user`(`id`,`created_at`,`updated_at`,`is_active`,`is_deleted`,`user_id`,`tou_heading`,`tou_text`) values 
(1,'2019-04-23 21:17:54','2019-04-23 21:17:54',1,0,0,'PIZZA HUT TERMS OF USE','<p>Pizza Hut, Inc. (&quot;Pizza Hut&quot;) is committed to protecting the privacy of the personal information you provide us on our Web site (&quot;Site&quot;). We believe it is important for you to know how we treat the information you share with us. These Terms of Use (&quot;Terms&quot;) govern your use of our Site and its features.</p>\r\n\r\n<p>Pizza Hut may revise the information, services and the resources contained in this Site from time to time, and we reserve the right to make such changes without obligation to notify past, current or prospective visitors. Your continued use of this Site after changes have been made constitutes your acceptance of any new or amended terms. In no event shall Pizza Hut be liable for any indirect, special, incidental or consequential damages arising out of any use of the information contained herein</p>'),
(2,'2019-04-23 21:18:06','2019-04-23 21:18:06',1,0,0,'NO WARRANTY / LIMITATION ON LIABILITY','<p>Pizza Hut strives to ensure that the information contained in this Site is accurate and reliable. However, Pizza Hut and the World Wide Web (or Web Site Host) are not infallible, and errors may sometimes occur. Therefore, to the fullest extent permissible pursuant to applicable law, Pizza Hut makes no representations about the reliability of the features of this Site, the Pizza Hut Content (defined below), Submitted Content (defined below) or any other Site feature. You acknowledge that any reliance on such material and/or systems will be at your own risk. Pizza Hut is not responsible for the information, data, text or other materials that may appear in Submitted Content or may otherwise be submitted by users. Opinions expressed in Submitted Content do not necessarily reflect the opinions of Pizza Hut, and Pizza Hut does not endorse and has no control over Submitted Content. Submitted Content is not necessarily reviewed by Pizza Hut prior to posting and Pizza Hut makes no warranties, express or implied, as to the Submitted Content or to the accuracy and reliability of the Submitted Content. Pizza Hut makes no representations regarding the amount of time that any Pizza Hut Content or Submitted Content will be preserved.</p>\r\n\r\n<p>Pizza Hut disclaims any warranty of any kind, whether express or implied, as to any matter whatsoever relating to this Site, including without limitation the merchantability or fitness for any particular purpose. Pizza Hut is not liable or responsible for any damages or injuries caused by use of this Site (such as viruses, omissions or misstatements). THIS SITE IS PROVIDED ON AN &quot;AS IS, AS AVAILABLE&quot; BASIS. NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THOSE OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, ARE MADE WITH RESPECT TO THIS SITE OR ANY INFORMATION OR SOFTWARE THEREIN. UNDER NO CIRCUMSTANCES, INCLUDING NEGLIGENCE, SHALL PIZZA HUT BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, PUNITIVE OR CONSEQUENTIAL DAMAGES THAT RESULT FROM THE USE OF OR INABILITY TO USE THIS SITE, NOR SHALL PIZZA HUT BE RESPONSIBLE FOR ANY DAMAGES WHATSOEVER THAT RESULT FROM MISTAKES, OMISSIONS, INTERRUPTIONS, DELETION OF FILES, ERRORS, DEFECTS, DELAYS IN OPERATION OR TRANSMISSION, OR ANY FAILURE OF PERFORMANCE WHETHER OR NOT CAUSED BY EVENTS BEYOND PIZZA HUT&#39;S REASONABLE CONTROL, INCLUDING BUT NOT LIMITED TO ACTS OF GOD, COMMUNICATIONS LINE FAILURE, THEFT, DESTRUCTION OR UNAUTHORIZED ACCESS TO THIS SITE&#39;S RECORDS, PROGRAMS OR SERVICES. Some jurisdictions do not allow the limitation or exclusion of liability for incidental or consequential damages; as a result, the above limitation or exclusion may not apply to you.</p>'),
(3,'2019-04-23 21:18:17','2019-04-23 21:18:17',1,0,0,'COMMUNICATING WITH PIZZA HUT','<p>On certain areas of our Site, you may be given the ability to contact us by electronic mail, for example, to sign up for services such as e-mail notifications and newsletters about our products, to register for a particular sweepstakes or contest, or to participate in our interactive forums, like chat rooms and message boards. The information that you provide to us through this Site is governed by our Privacy Policy.</p>\r\n\r\n<p>These areas are designed to give our users the ability to contact us with questions or concerns. They are not intended for, and should not be used to, submit unsolicited ideas. It is company policy not to accept such unsolicited ideas, concepts, techniques, procedures, methods, systems, designs, plans, charts or similar materials from outside parties. By entering the Site you acknowledge and agree that any materials, ideas or other communications you transmit to us in any manner and for any reason will not be treated as confidential or proprietary. It is Pizza Hut&#39;s policy not to accept, and to return, any unsolicited ideas, concepts, techniques, procedures, methods, systems, designs, plans, charts or other similar materials. Nevertheless, should you submit such materials, you understand that you have no ownership rights in any ideas you may submit, and you expressly disclaim any rights or causes of action you may have with respect to any materials you may submit.</p>'),
(4,'2019-04-23 21:18:27','2019-04-23 21:18:27',1,0,0,'PIZZA HUT PROPERTY.','<p>This Site contains many valuable trademarks owned and used by Pizza Hut, Inc., and its subsidiaries and affiliates throughout the world. These trademarks are used to distinguish Pizza Hut&#39;s quality products and services. &quot;Pizza Hut Trademarks&quot; means all names, marks, brands, logos, designs, trade dress, slogans and other designations Pizza Hut uses in connection with its products and services. You may not remove or alter any Pizza Hut Trademarks, or co-brand your own products or material with Pizza Hut Trademarks without Pizza Hut&#39;s prior written consent. You acknowledge Pizza Hut&#39;s rights in Pizza Hut Trademarks and agree that any use of Pizza Hut Trademarks by you shall inure to Pizza Hut&#39;s sole benefit. You agree not to incorporate any Pizza Hut Trademarks into your marks, company names, internet addresses, domain names, or any other similar designations. The text, graphics and html code contained in this Site are the exclusive property of Pizza Hut (&quot;Pizza Hut Content&quot;). Pizza Hut Content is protected from reproduction and simulation under national and international laws and except where otherwise noted, is not to be copied, distributed, displayed, reproduced or transmitted in any form, by any means, without the prior express written permission of Pizza Hut.</p>'),
(5,'2019-04-23 21:18:38','2019-04-23 21:18:38',1,0,0,'USER-SUBMITTED CONTENT','<p>On certain areas of our Site you may be able to submit texts, files, images, photos, videos, sounds, musical works, works of authorship, text postings, and other materials and content (&quot;Submitted Content&quot;). You have no ownership rights in your account or other access to the Site or features therein, and Pizza Hut may delete all Submitted Content at any time, with or without notice, if Pizza Hut deems that you have violated these Terms, the law, or for any other reason. Pizza Hut assumes no liability for any information removed from our Site, and reserves the right to permanently restrict access to the Site or a user account.</p>\r\n\r\n<p>By posting, displaying, publishing or otherwise submitting Submitted Content on or through this Site, you understand and acknowledge that any materials or other communications you transmit in any manner and for any reason will not be treated as confidential or proprietary. Furthermore, you acknowledge and agree that any concepts, techniques, procedures, methods, systems, video, scripts, music, photographs, designs, plans, charts or other materials you transmit to Pizza Hut may be used by Pizza Hut anywhere, anytime and for any reason whatsoever subject to the following terms:&nbsp;<br />\r\nYou hereby grant to Pizza Hut a limited, nonexclusive, sublicensable, worldwide, fully paid, royalty-free license to use, modify, publicly perform, publicly display, reproduce and distribute Submitted Content. This license includes the right to host, index, cache, distribute and tag any Submitted Content, as well as the right to sublicense Submitted Content to third parties, including other users, for use on other platforms, such as for use on mobile phones, in video or music software computer programs.</p>\r\n\r\n<p>You represent and warrant that you own the Submitted Content displayed, published or posted by you on the Site and otherwise have the right to grant the license set forth herein, and the displaying, publishing or posting of your Submitted Content, and our use thereof, does not and will not violate the privacy rights, publicity rights, copyrights, trademark rights, contract rights or any other intellectual property rights or other rights of any person or entity. You agree to pay for all royalties, fees and any other monies owing any person by reason of any Submitted Content displayed, published or posted by you to the Site.</p>\r\n\r\n<p>You may not post any content that, as determined in Pizza Hut&#39;s sole discretion, is unlawful, harmful, tortious, defamatory, libelous, obscene, invasive of the privacy of another person, threatening, harassing, abusive, hateful, racist, infringing, pornographic, violent or otherwise objectionable or inappropriate.&nbsp;<br />\r\nYou may not post any content that contains personal information about any individual, violates the privacy of any other individual or entity, or anything that you are under a contractual obligation to keep private or confidential. You agree that you will not impersonate any person or organization, including without limitation, the personnel of Pizza Hut. You further agree that you will not misrepresent an affiliation with another person or organization, nor will you post any content that contains slanderous or libelous comments about others, or that infringes any copyright, trademark, patent, trade secret or other intellectual property right of a third party.&nbsp;<br />\r\nYou may not post any content that contains business solicitation of any type, including advertising a product or service, offering a product or service for sale, or directing Site visitors to a location for more information about a product or service.&nbsp;<br />\r\nYou may not post any software, files or links to other sites, and you may not post any content that contains viruses, corrupted files or any other similar software or programs that may adversely affect the operation of the Site or features of the Site. You may not modify in any way any specifications, technology or application codes provided to you by Pizza Hut or as embedded in the Submitted Content unless expressly authorized in writing by Pizza Hut.&nbsp;<br />\r\nYou may not share or transfer password or other access information with any other party, temporarily or permanently. You shall bear sole responsibility for all use of any account you have been permitted to create on this Site and for the confidentiality of your password.&nbsp;<br />\r\nPizza Hut does not necessarily monitor any materials posted, transmitted or communicated to or within the Site.</p>'),
(6,'2019-04-23 21:18:51','2019-04-23 21:18:51',1,0,0,'WEB SITE ACCESS','<p>On certain areas of our Site you may be able to submit texts, files, images, photos, videos, sounds, musical works, works of authorship, text postings, and other materials and content (&quot;Submitted Content&quot;). You have no ownership rights in your account or other access to the Site or features therein, and Pizza Hut may delete all Submitted Content at any time, with or without notice, if Pizza Hut deems that you have violated these Terms, the law, or for any other reason. Pizza Hut assumes no liability for any information removed from our Site, and reserves the right to permanently restrict access to the Site or a user account.</p>\r\n\r\n<p>By posting, displaying, publishing or otherwise submitting Submitted Content on or through this Site, you understand and acknowledge that any materials or other communications you transmit in any manner and for any reason will not be treated as confidential or proprietary. Furthermore, you acknowledge and agree that any concepts, techniques, procedures, methods, systems, video, scripts, music, photographs, designs, plans, charts or other materials you transmit to Pizza Hut may be used by Pizza Hut anywhere, anytime and for any reason whatsoever subject to the following terms:&nbsp;<br />\r\nYou hereby grant to Pizza Hut a limited, nonexclusive, sublicensable, worldwide, fully paid, royalty-free license to use, modify, publicly perform, publicly display, reproduce and distribute Submitted Content. This license includes the right to host, index, cache, distribute and tag any Submitted Content, as well as the right to sublicense Submitted Content to third parties, including other users, for use on other platforms, such as for use on mobile phones, in video or music software computer programs.</p>\r\n\r\n<p>You represent and warrant that you own the Submitted Content displayed, published or posted by you on the Site and otherwise have the right to grant the license set forth herein, and the displaying, publishing or posting of your Submitted Content, and our use thereof, does not and will not violate the privacy rights, publicity rights, copyrights, trademark rights, contract rights or any other intellectual property rights or other rights of any person or entity. You agree to pay for all royalties, fees and any other monies owing any person by reason of any Submitted Content displayed, published or posted by you to the Site.</p>\r\n\r\n<p>Your posting of Submitted Content is further subject to the following posting rules:<br />\r\nYou may not post any content that, as determined in Pizza Hut&#39;s sole discretion, is unlawful, harmful, tortious, defamatory, libelous, obscene, invasive of the privacy of another person, threatening, harassing, abusive, hateful, racist, infringing, pornographic, violent or otherwise objectionable or inappropriate.&nbsp;<br />\r\nYou may not post any content that contains personal information about any individual, violates the privacy of any other individual or entity, or anything that you are under a contractual obligation to keep private or confidential. You agree that you will not impersonate any person or organization, including without limitation, the personnel of Pizza Hut. You further agree that you will not misrepresent an affiliation with another person or organization, nor will you post any content that contains slanderous or libelous comments about others, or that infringes any copyright, trademark, patent, trade secret or other intellectual property right of a third party.&nbsp;<br />\r\nYou may not post any content that contains business solicitation of any type, including advertising a product or service, offering a product or service for sale, or directing Site visitors to a location for more information about a product or service.&nbsp;<br />\r\nYou may not post any software, files or links to other sites, and you may not post any content that contains viruses, corrupted files or any other similar software or programs that may adversely affect the operation of the Site or features of the Site. You may not modify in any way any specifications, technology or application codes provided to you by Pizza Hut or as embedded in the Submitted Content unless expressly authorized in writing by Pizza Hut.&nbsp;<br />\r\nYou may not share or transfer password or other access information with any other party, temporarily or permanently. You shall bear sole responsibility for all use of any account you have been permitted to create on this Site and for the confidentiality of your password.&nbsp;<br />\r\nPizza Hut does not necessarily monitor any materials posted, transmitted or communicated to or within the Site.</p>'),
(7,'2019-04-23 21:19:00','2019-04-23 21:19:00',1,0,0,'INDEMNIFICATION','<p>You agree to indemnify and hold Pizza Hut, its parents, subsidiaries, officers, employees and Site contractors and each of their officers, employees and agents harmless from any claims, damages and expenses, including reasonable attorneys&#39; fees, related to your violation of these Terms, or any violations thereof by your dependents or which arises from the use of Submitted Content.</p>'),
(8,'2019-04-23 21:19:09','2019-04-23 21:19:09',1,0,0,'HYPERLINKS','<p>This Pizza Hut Site may link to sites not maintained by or related to Pizza Hut. Hypertext links are provided as a service to users and are not sponsored by or affiliated with this Site or Pizza Hut. Pizza Hut has not reviewed the sites hyperlinked to or from this Site and is not responsible for the content of any other site. These links are to be accessed at the user&#39;s own risk. Pizza Hut makes no representations or warranties about the content, completeness or accuracy of these links or the sites hyperlinked to or from this Site. Furthermore, Pizza Hut does not implicitly endorse third-party sites hyperlinked to or from this Site.</p>'),
(9,'2019-04-23 21:19:17','2019-04-23 21:19:17',1,0,0,'TEXT MESSAGING NOTICE','<p>If you choose to participate in any Pizza Hut promotion that may involve the use of text messaging (either sending or receiving), Pizza Hut will not charge you for the text messaging; however, standard text messaging rates will apply to each text message sent or received as provided in your wireless rate plan (contact your carrier for pricing plans and details).</p>'),
(10,'2019-04-23 21:19:26','2019-04-23 21:19:26',1,0,0,'MISCELLANEOUS','<p>These terms constitute the entire agreement between you and Pizza Hut and govern your use of the Pizza Hut Site and supersede all prior or contemporaneous communications and proposals, whether electronic, oral or written, between you and Pizza Hut with respect to the Pizza Hut Site and services. Both you and Pizza Hut acknowledge and agree that no partnership is formed, and neither you nor Pizza Hut has the power or the authority to obligate or bind the other.</p>\r\n\r\n<p>The failure of Pizza Hut to exercise or enforce any right or provision of this Agreement shall not constitute a waiver of such right or provision. If any provision of this Agreement is found by a court of competent jurisdiction to be invalid or unenforceable, the parties nevertheless agree that the court should endeavor to give effect to the parties&#39; original intentions as reflected in the provision, and the other provisions of this Agreement shall remain in full force and effect.</p>'),
(11,'2019-04-23 21:19:41','2019-04-23 21:19:41',1,0,0,'DOWNLOADING OR USING THE SOFTWARE IS AT YOUR SOLE RISK','<p>The failure of Pizza Hut to comply with this Agreement because of an act of God, war, fire, riot, terrorism, earthquake, actions of federal, state or local governmental authorities or for any other reason beyond the reasonable control of Pizza Hut, shall not be deemed a breach of this Agreement. If Pizza Hut fails to act with respect to your breach or anyone else&#39;s breach on any occasion, Pizza Hut is not waiving its right to act with respect to future or similar breaches.</p>\r\n\r\n<p>The headings in this Agreement are for your convenience and reference. These headings do not limit or affect this Agreement.</p>\r\n\r\n<p>This Agreement constitutes a binding agreement between you and Pizza Hut, and is accepted by you upon your use of the Site. This Agreement constitutes the entire agreement between you and Pizza Hut regarding the use of the Site and the features therein.</p>');

/*Table structure for table `tracking_users` */

DROP TABLE IF EXISTS `tracking_users`;

CREATE TABLE `tracking_users` (
  `request_uri` varchar(500) DEFAULT NULL,
  `request_data_exist` char(1) DEFAULT NULL,
  `request_data` text,
  `user_id` int(11) DEFAULT '0',
  `user_logged_in` char(1) DEFAULT NULL,
  `session_id` text,
  `request_lasturi` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id` int(11) NOT NULL,
  `time_to` timestamp NULL DEFAULT NULL,
  `time_start` timestamp NULL DEFAULT NULL,
  `user_ip` varchar(255) DEFAULT NULL,
  `user_country` varchar(100) DEFAULT NULL,
  `user_countrycode` varchar(10) DEFAULT NULL,
  `user_city` varchar(100) DEFAULT NULL,
  `user_state` varchar(100) DEFAULT NULL,
  `user_continent` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tracking_users` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` text NOT NULL,
  `remember_token` text,
  `is_active` int(11) DEFAULT '0',
  `email_verified_at` datetime DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users` */

/*Table structure for table `ytables` */

DROP TABLE IF EXISTS `ytables`;

CREATE TABLE `ytables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `js_file` text,
  `page_heading` varchar(500) DEFAULT NULL,
  `page_message` text,
  `new_url` varchar(500) DEFAULT NULL COMMENT 'write urls after base',
  `is_deleted` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `page_limit` enum('10','25','50','100') DEFAULT '10',
  `fast_crud` int(11) DEFAULT '1',
  `model_name` varchar(255) DEFAULT NULL COMMENT 'laravel model name, Fill this when you have different model name and different table name',
  `table_name` varchar(255) DEFAULT NULL COMMENT 'database table name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `ytables` */

insert  into `ytables`(`id`,`js_file`,`page_heading`,`page_message`,`new_url`,`is_deleted`,`created_at`,`updated_at`,`page_limit`,`fast_crud`,`model_name`,`table_name`) values 
(6,'admin/listings/adminiy-listing.js','Adminiy Listing','','adminiy/crud/adminiy',0,'2019-04-03 17:21:50','2019-04-05 16:35:04','',1,'Adminiy','adminiy'),
(7,'admin/listings/table_notes-listing.js','Table Notes','','adminiy.tablename.form',0,'2019-04-05 12:17:58','2019-04-07 02:05:38','',1,'table_notes','table_notes'),
(8,'admin/listings/banner_management-listing.js','Banner Management','','adminiy/crud/banner_management',0,'2019-04-13 13:58:21','2019-04-13 23:19:01','',1,'banner_management','banner_management'),
(9,'admin/listings/blogs-listing.js','Blogs','','adminiy/crud/blogs',0,'2019-04-13 16:05:56','2019-04-13 23:19:06','',1,'blogs','blogs'),
(10,'admin/listings/gallery_video-listing.js','Gallery Video','','adminiy/crud/gallery_video',0,'2019-04-13 18:18:10','2019-04-13 23:18:51','',1,'gallery_video','gallery_video'),
(11,'admin/listings/faqs-listing.js','Faqs Listing','','adminiy/crud/faqs',0,'2019-04-13 18:33:39','2019-04-13 18:33:39','',1,'','faqs'),
(12,'admin/listings/project_pictures-listing.js','Project Pictures','','adminiy/crud/project_pictures',0,'2019-04-13 18:47:21','2019-04-13 23:49:12','',1,'','project_pictures'),
(13,'admin/listings/categories-listing.js','Categories','','adminiy/crud/categories',0,'2019-04-13 19:38:28','2019-04-13 19:38:28','',1,'','categories'),
(14,'admin/listings/brands-listing.js','Brands','','adminiy/crud/brands',0,'2019-04-13 19:58:44','2019-04-13 19:58:44','',1,'','brands'),
(15,'admin/listings/imagetable-listing.js','Imagetable','','adminiy/crud/imagetable',0,'2019-04-17 19:28:31','2019-04-17 19:28:31','',1,'','imagetable'),
(16,'admin/listings/inquiry-listing.js','Inquiry','','adminiy/crud/inquiry',0,'2019-04-18 17:49:24','2019-04-19 19:42:01','',1,'','inquiry'),
(17,'admin/listings/m_flag-listing.js','Flag','','adminiy/crud/m_flag',0,'2019-04-19 06:51:33','2019-04-19 11:58:07','',1,'','m_flag'),
(18,'admin/listings/career-listing.js','Career','','adminiy/crud/career',0,'2019-04-19 11:18:38','2019-04-19 11:18:38','',1,'','career'),
(19,'admin/listings/location-listing.js','Location','','adminiy/crud/location',0,'2019-04-19 15:11:15','2019-04-19 15:11:15','',1,'','location'),
(20,'admin/listings/locations-listing.js','Locations','','adminiy/crud/locations',0,'2019-04-20 15:14:54','2019-04-20 15:14:54','',1,'','locations'),
(21,'admin/listings/products-listing.js','Products','','adminiy/crud/products',0,'2019-04-23 03:59:19','2019-04-23 03:59:19','',1,'','products'),
(22,'admin/listings/product_prices-listing.js','Product Prices','','adminiy/crud/product_prices',0,'2019-04-23 04:25:28','2019-04-23 09:25:58','',1,'','product_prices'),
(23,'admin/listings/privacy_policy-listing.js','Privacy Policy','','adminiy/crud/privacy_policy',0,'2019-04-23 20:44:22','2019-04-24 01:44:34','',1,'','privacy_policy'),
(24,'admin/listings/terms_of_user-listing.js','Terms Of Use','','adminiy/crud/terms_of_user',0,'2019-04-23 21:15:24','2019-04-24 02:15:55','',1,'','terms_of_user');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
