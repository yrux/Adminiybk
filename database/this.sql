/*
SQLyog Community v12.3.3 (32 bit)
MySQL - 10.1.30-MariaDB : Database - adminiy
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
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

(1,'logo','Uploads/imagetable/7afbe7dd3c34cc6b9ec8ac3a6e94ae96/sCtTHox8PjNT2hA2v6agIy34lvyyLsiijWzPgP0A.png','2019-07-23 17:51:33','2019-07-23 12:51:33',0,1,'1',NULL,NULL),

(2,'favicon','Uploads/imagetable/13c0c92892833baaf750729782ab6104/WZvCOV9PH81W151eRfGCcexCG8T2oBOwF7dv2u53.png','2019-04-18 21:49:42','2019-04-18 16:49:42',0,1,'1',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=1963 DEFAULT CHARSET=utf8;

/*Data for the table `m_flag` */

insert  into `m_flag`(`id`,`flag_type`,`flag_value`,`created_at`,`updated_at`,`flag_additionalText`,`has_image`,`is_active`,`is_config`,`flag_show_text`,`is_featured`,`is_deleted`,`user_id`) values 

(59,'COMPANYPHONE','000-000-0000','2019-04-19 11:33:45','0000-00-00 00:00:00','000-000-0000','0','1','1','Company Phone',0,0,0),

(123,'COMPANY','DUMMY PROJECT','2019-04-29 23:54:46','0000-00-00 00:00:00','Pizza Hut','0','1','1','Company',0,0,0),

(218,'COMPANYEMAIL','info@demo.com','2019-04-19 11:33:45','0000-00-00 00:00:00','info@demo.com','0','1','1','Company Email',0,0,0),

(499,'CURRENTHEME','red','2019-04-23 03:16:09','0000-00-00 00:00:00','red','0','1','1','Theme Option',0,0,0),

(519,'ADDRESS','Dummy address','2019-04-29 23:54:53','0000-00-00 00:00:00','107 Silver Circle','0','1','1','Address',0,0,0),

(682,'FACEBOOK','https://facebook.com/sdd','2019-04-23 23:56:03','0000-00-00 00:00:00','https://facebook.com/sdd','0','1','1','Facebook',0,0,0),

(1960,'TWITTER','https://twitter.com/','2019-04-19 11:34:21','0000-00-00 00:00:00','https://twitter.com/','0','1','1','Twitter',0,0,0),

(1961,'INSTAGRAM','https://instagram.com/','2019-04-19 11:34:53','0000-00-00 00:00:00','https://instagram.com/','0','1','1','Instagram',0,0,0),

(1962,'GOOGLEPLUS','https://googleplus.com/','2019-04-19 11:35:03','0000-00-00 00:00:00','https://googleplus.com/','0','1','1','Google+',0,0,0);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(500) DEFAULT NULL,
  `token` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `password_resets` */

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

/*Table structure for table `images` */

DROP TABLE IF EXISTS `images`;

CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(555) DEFAULT NULL,
  `imageable_id` int(11) DEFAULT NULL,
  `imageable_type` varchar(255) DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `images` */

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `ytables` */

insert  into `ytables`(`id`,`js_file`,`page_heading`,`page_message`,`new_url`,`is_deleted`,`created_at`,`updated_at`,`page_limit`,`fast_crud`,`model_name`,`table_name`) values 

(6,'admin/listings/adminiy-listing.js','Adminiy Listing','','adminiy/crud/adminiy',0,'2019-04-03 17:21:50','2019-04-05 16:35:04','',1,'Adminiy','adminiy'),

(7,'admin/listings/table_notes-listing.js','Table Notes','','adminiy.tablename.form',0,'2019-04-05 12:17:58','2019-04-07 02:05:38','',1,'table_notes','table_notes'),

(15,'admin/listings/imagetable-listing.js','Imagetable','','adminiy/crud/imagetable',0,'2019-04-17 19:28:31','2019-04-17 19:28:31','',1,'','imagetable'),

(16,'admin/listings/inquiry-listing.js','Inquiry','','adminiy/crud/inquiry',0,'2019-04-18 17:49:24','2019-04-19 19:42:01','',1,'','inquiry'),

(17,'admin/listings/m_flag-listing.js','Flag','','adminiy/crud/m_flag',0,'2019-04-19 06:51:33','2019-04-19 11:58:07','',1,'','m_flag');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
