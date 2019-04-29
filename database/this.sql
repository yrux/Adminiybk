/*
SQLyog Community v12.3.3 (32 bit)
MySQL - 10.1.37-MariaDB : Database - adminiy
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
(15,'admin/listings/imagetable-listing.js','Imagetable','','adminiy/crud/imagetable',0,'2019-04-17 19:28:31','2019-04-17 19:28:31','',1,'','imagetable'),
(16,'admin/listings/inquiry-listing.js','Inquiry','','adminiy/crud/inquiry',0,'2019-04-18 17:49:24','2019-04-19 19:42:01','',1,'','inquiry'),
(17,'admin/listings/m_flag-listing.js','Flag','','adminiy/crud/m_flag',0,'2019-04-19 06:51:33','2019-04-19 11:58:07','',1,'','m_flag');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
