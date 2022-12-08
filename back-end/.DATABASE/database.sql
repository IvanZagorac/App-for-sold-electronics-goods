/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 8.0.28 : Database - web_app
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`web_app` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_croatian_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `web_app`;

/*Table structure for table `administrator` */

DROP TABLE IF EXISTS `administrator`;

CREATE TABLE `administrator` (
  `administrator_id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_croatian_ci NOT NULL,
  `password_hash` varchar(128) COLLATE utf8_croatian_ci NOT NULL,
  PRIMARY KEY (`administrator_id`),
  UNIQUE KEY `uq_administrator_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `administrator` */

insert  into `administrator`(`administrator_id`,`username`,`password_hash`) values 
(1,'Ivek','6371DB9368799EF775690C87BF388AA8F58524C75BAA6E6FDA3E8998EEA7DE828C17845217E35A17E8319AEE33700393EFF18D8F45CCD80E76441755B56DEA16'),
(2,'Jovek','213124213232131231231'),
(3,'pperic','0DCC617B3BEF102B2B55B9C4275C7A8924E825DBC4AEF3B69D40550D865CF67DCF5399A5FFAB74CF4D9C737DF73C3D2BEC03E21AB5B62B1DBB200ADF40AD5C88'),
(5,'admin','C7AD44CBAD762A5DA0A452F9E854FDC1E0E7A52A38015F23F3EAB1D80B931DD472634DFAC71CD34EBC35D16AB7FB8A90C81F975113D6C7538DC69DD8DE9077EC'),
(6,'admin1','58B5444CF1B6253A4317FE12DAFF411A78BDA0A95279B1D5768EBF5CA60829E78DA944E8A9160A0B6D428CB213E813525A72650DAC67B88879394FF624DA482F');

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `article_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_croatian_ci NOT NULL,
  `category_id` int unsigned NOT NULL,
  `excerpt` varchar(128) COLLATE utf8_croatian_ci NOT NULL,
  `description` tinytext COLLATE utf8_croatian_ci NOT NULL,
  `status` enum('available','visible','hidden') COLLATE utf8_croatian_ci NOT NULL DEFAULT 'available',
  `is_promoted` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_id`),
  KEY `fk_article_category_id` (`category_id`),
  CONSTRAINT `fk_article_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `article` */

insert  into `article`(`article_id`,`name`,`category_id`,`excerpt`,`description`,`status`,`is_promoted`,`created_at`) values 
(1,'Acme HD1 1024GB',1,'Kratak opis','Detaljan opis\r\n','available',1,'2022-11-07 23:44:39'),
(3,'Acme TB512',3,'string','Duzi tekst i tak','available',0,'2022-11-08 20:15:51'),
(4,'Acme Laptop 3344',2,'Dobar laptop za male novce','grgrgrgrgrgr','available',0,'2022-11-21 11:15:04');

/*Table structure for table `article_feature` */

DROP TABLE IF EXISTS `article_feature`;

CREATE TABLE `article_feature` (
  `article_feature_id` int unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int unsigned NOT NULL,
  `feature_id` int unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  PRIMARY KEY (`article_feature_id`),
  UNIQUE KEY `uq_article_feature_article_id_feature_id` (`article_id`,`feature_id`),
  KEY `fk_article_feature_feature_id` (`feature_id`),
  CONSTRAINT `fk_article_feature_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_article_feature_feature_id` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`feature_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `article_feature` */

insert  into `article_feature`(`article_feature_id`,`article_id`,`feature_id`,`value`) values 
(3,3,1,'TB'),
(4,1,1,'1024GB'),
(5,1,2,'SATA 3.0'),
(6,4,4,'HP'),
(7,4,5,'16 inch'),
(8,4,8,'Windows');

/*Table structure for table `article_price` */

DROP TABLE IF EXISTS `article_price`;

CREATE TABLE `article_price` (
  `article_price_id` int unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int unsigned NOT NULL,
  `price` decimal(10,2) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_price_id`),
  KEY `fk_article_price` (`article_id`),
  CONSTRAINT `fk_article_price` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `article_price` */

insert  into `article_price`(`article_price_id`,`article_id`,`price`,`created_at`) values 
(1,1,45.00,'2022-11-08 11:49:00'),
(2,3,512.00,'2022-11-08 20:15:51'),
(3,4,2450.00,'2022-11-21 11:16:27');

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `cart_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  KEY `fk_cart_user_id` (`user_id`),
  CONSTRAINT `fk_cart_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `cart` */

insert  into `cart`(`cart_id`,`user_id`,`created_at`) values 
(1,1,'2022-11-17 11:44:55'),
(2,1,'2022-11-17 17:16:39'),
(3,4,'2022-11-21 23:06:41'),
(4,13,'2022-11-22 23:42:18');

/*Table structure for table `cart_article` */

DROP TABLE IF EXISTS `cart_article`;

CREATE TABLE `cart_article` (
  `cart_article_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` int unsigned NOT NULL,
  `article_id` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
  PRIMARY KEY (`cart_article_id`),
  UNIQUE KEY `uq_cart_article_cart_id_article_id` (`cart_id`,`article_id`),
  KEY `fk_cart_article_article_id` (`article_id`),
  CONSTRAINT `fk_cart_article_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cart_article_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `cart_article` */

insert  into `cart_article`(`cart_article_id`,`cart_id`,`article_id`,`quantity`) values 
(1,1,1,2),
(2,2,1,8),
(3,2,3,3),
(4,3,1,5),
(5,4,1,4);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int unsigned NOT NULL,
  `name` varchar(32) COLLATE utf8_croatian_ci NOT NULL,
  `image_path` varchar(128) COLLATE utf8_croatian_ci NOT NULL,
  `parent__category_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uq_categoty_name` (`name`),
  UNIQUE KEY `uq_category_path` (`image_path`),
  KEY `parent__category_id` (`parent__category_id`),
  CONSTRAINT `fk_category_parent__category_id` FOREIGN KEY (`parent__category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `category` */

insert  into `category`(`category_id`,`name`,`image_path`,`parent__category_id`) values 
(1,'PC','nuzno/slika.jpg',NULL),
(2,'Bijela tehnika','nuzno/bteh.jpg',NULL),
(3,'Laptopi','nuzno/laptop.jpg',1);

/*Table structure for table `feature` */

DROP TABLE IF EXISTS `feature`;

CREATE TABLE `feature` (
  `feature_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `category_id` int unsigned NOT NULL,
  PRIMARY KEY (`feature_id`),
  UNIQUE KEY `uq_feature_category_id_name` (`name`,`category_id`),
  KEY `fk_feature_category_id` (`category_id`),
  CONSTRAINT `fk_feature_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `feature` */

insert  into `feature`(`feature_id`,`name`,`category_id`) values 
(5,'Dijagonala ekrana',2),
(1,'Kapacitet',3),
(8,'Operacijski sustac',2),
(4,'Proizvođač',2),
(3,'Radni napon',2),
(2,'Tip',3);

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cart_id` int unsigned NOT NULL,
  `status` enum('rejected','accepted','send','pending') COLLATE utf8_croatian_ci NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `uq_order_cart_id` (`cart_id`),
  CONSTRAINT `fk_order_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `order` */

insert  into `order`(`order_id`,`created_at`,`cart_id`,`status`) values 
(1,'2022-11-17 11:52:16',1,'accepted'),
(2,'2022-11-17 17:16:39',2,'pending'),
(3,'2022-11-21 23:06:40',3,'accepted'),
(15,'2022-11-22 23:42:18',4,'pending');

/*Table structure for table `photo` */

DROP TABLE IF EXISTS `photo`;

CREATE TABLE `photo` (
  `photo_id` int unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int unsigned NOT NULL,
  `image_path` varchar(128) COLLATE utf8_croatian_ci NOT NULL,
  PRIMARY KEY (`photo_id`),
  UNIQUE KEY `uq_photo_path` (`image_path`),
  KEY `fk_photo_article_id` (`article_id`),
  CONSTRAINT `fk_photo_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `photo` */

insert  into `photo`(`photo_id`,`article_id`,`image_path`) values 
(1,1,'images/1/front.jpg'),
(2,1,'images/1/label.jpg'),
(4,1,'2022119-3165407725-IMG_2526-210x210.jpg'),
(5,1,'20221112-0846992661-Belgrade-Night-Panorama.jpg');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `password_hash` varchar(128) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `surname` varchar(64) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `phone_number` varchar(24) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `postal_adress` tinytext CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `Unique` (`email`),
  UNIQUE KEY `phone-un` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `user` */

insert  into `user`(`user_id`,`email`,`password_hash`,`name`,`surname`,`phone_number`,`postal_adress`) values 
(1,'test@gmail.com','5B722B307FCE6C944905D132691D5E4A2214B7FE92B738920EB3FCE3A90420A19511C3010A0E7712B054DAEF5B57BAD59ECBD93B3280F210578F547F4AED4D25','Ivo','Ivic','+385996673196','Nepoznata adresa123'),
(4,'test23@gmail.com','FD37CA5CA8763AE077A5E9740212319591603C42A08A60DCC91D12E7E457B024F6BDFDC10CDC1383E1602FF2092B4BC1BB8CAC9306A9965EB352435F5DFE8BB0','Roki','Roic','+385996673197','Nepoznata adresa123'),
(13,'jovek1@gmail.com','B66DD5A7A689F88E302AB2AE4A9567F9C7572C18E520B3BF712BB2630B3931A503D647BAEDF48DF470006312D07984216578B60526E5EE6137EF1FD215190A0C','Roki123','Roic123','+35996673197','Nepoznataadresa12314'),
(15,'ivek1@gmail.com','3E2F332DBF3E5C6CDD70352982DD77B575E43B524CCC1A75EF54AF7513CA2040A6F7D0EA7166AD475C8491B29533341161E3F0FA3873F0267E56A042AA1240E1','Rokgrei123','Roiegrec123','+35996673153','Postanskaadresa'),
(16,'ivek2@gmail.com','2586091BD6A98ED60266EE3AB0A72217B09CCDE8E47245A3BD1088A37070A3C160E1FE75AF27C3B2E3C302F1E8E746791D57B7AAFD9E448DA0806DABD37F7679','Rokgrei1233','Roiegrec1233','+35996673150','Postanskaadre32sa'),
(17,'ivek3@gmail.com','2A78029FF0FD4E2D39157D71FD91493570992447B105DE6A5FFE02EDFEA4C5E1D835DA5FD91776EE20694FB0263A8495D371067EECED2EC917066C44939AA596','Rokgrei14233','Roiegrec134233','+35996673112','Kompaniabh');

/*Table structure for table `user_token` */

DROP TABLE IF EXISTS `user_token`;

CREATE TABLE `user_token` (
  `user_token_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` text COLLATE utf8_croatian_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `is_valid` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_token_id`),
  KEY `fk_user_token` (`user_id`),
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `user_token` */

insert  into `user_token`(`user_token_id`,`user_id`,`created_at`,`token`,`expires_at`,`is_valid`) values 
(1,13,'2022-11-23 15:20:45','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MTg5MTY0NS4yMDYsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI5LjIiLCJpYXQiOjE2NjkyMTMyNDV9.Qag39aj1L14n52QD0OBthDjwchJFa3Q-YsZhWLtqu0Y','2022-12-24 14:20:45',1),
(2,13,'2022-12-05 13:51:23','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MjkyMzA4My4wMTcsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI5LjIiLCJpYXQiOjE2NzAyNDQ2ODN9.1B_ZkWgDdnlu-jzABRntAL3aighgZCcEyqcnn1paQ1Y','2023-01-05 12:51:23',1),
(3,13,'2022-12-05 13:52:12','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MjkyMzEzMi40NTYsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTGludXg7IEFuZHJvaWQgNi4wOyBOZXh1cyA1IEJ1aWxkL01SQTU4TikgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwNy4wLjUzMDQuMTA3IE1vYmlsZSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjcwMjQ0NzMyfQ.6axTCUGw-nwDwEg76bVbb6BoW7GsJUxiqrcKWlXP1Vo','2023-01-05 12:52:12',1),
(4,13,'2022-12-05 14:40:49','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MjkyNjA0OS41NzgsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTGludXg7IEFuZHJvaWQgNi4wOyBOZXh1cyA1IEJ1aWxkL01SQTU4TikgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwNy4wLjUzMDQuMTA3IE1vYmlsZSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjcwMjQ3NjQ5fQ.rsEM2hTxzkttuXbetJV9SakGm_5cpW_-9-HfDVvHeGE','2023-01-05 13:40:49',1),
(5,13,'2022-12-05 14:43:27','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MjkyNjIwNy40MDcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTGludXg7IEFuZHJvaWQgNi4wOyBOZXh1cyA1IEJ1aWxkL01SQTU4TikgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwNy4wLjUzMDQuMTA3IE1vYmlsZSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjcwMjQ3ODA3fQ.RiTSmg2zj0qbY0NQL0bUbq_gcqNjasBnZhnFWjNZd_M','2023-01-05 13:43:27',1),
(6,13,'2022-12-05 14:43:47','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MjkyNjIyNy45NiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChMaW51eDsgQW5kcm9pZCA2LjA7IE5leHVzIDUgQnVpbGQvTVJBNThOKSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA3LjAuNTMwNC4xMDcgTW9iaWxlIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NzAyNDc4Mjd9.PZB1rqSZJjuiZJf3qlqjdTydoX-QYiUbBxnvWQOXjqk','2023-01-05 13:43:47',1),
(7,13,'2022-12-05 14:45:35','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MjkyNjMzNS43NjIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTGludXg7IEFuZHJvaWQgNi4wOyBOZXh1cyA1IEJ1aWxkL01SQTU4TikgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwNy4wLjUzMDQuMTA3IE1vYmlsZSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjcwMjQ3OTM1fQ.PX5hua5dwukDlDw0gJk-5ViEAhP4dkN8rxcSHTNkplI','2023-01-05 13:45:35',1),
(8,13,'2022-12-05 14:56:17','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MjkyNjk3Ny4wNSwiaXAiOiI6OjEiLCJ1YSI6IlBvc3RtYW5SdW50aW1lLzcuMjkuMiIsImlhdCI6MTY3MDI0ODU3N30.Y48H4RsbIo277qxwSU2486Cne5dTd1RqhWUSVWOhvnU','2023-01-05 13:56:17',1),
(9,13,'2022-12-05 14:58:01','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MjkyNzA4MS45MTIsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI5LjIiLCJpYXQiOjE2NzAyNDg2ODF9.Ru0lFB31-M14J7sI62NpgCUj-BA1RuoRvJ-LOgHkf9Y','2023-01-05 13:58:01',1),
(10,13,'2022-12-07 17:53:38','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MzExMDQxOC4yMDEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA3LjAuMC4wIFNhZmFyaS81MzcuMzYgRWRnLzEwNy4wLjE0MTguNjIiLCJpYXQiOjE2NzA0MzIwMTh9.lrBlIq03uI6eJleW6WMm8C5bybyp5wf3oOOTh17UV8w','2023-01-07 16:53:38',1),
(11,13,'2022-12-07 17:53:54','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MzExMDQzNC41NzcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA3LjAuMC4wIFNhZmFyaS81MzcuMzYgRWRnLzEwNy4wLjE0MTguNjIiLCJpYXQiOjE2NzA0MzIwMzR9.ZYLo21NbK20brfxA8b6FiY5oYLGmECRrTbKd-tBv5EY','2023-01-07 16:53:54',1),
(12,13,'2022-12-07 17:55:53','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MzExMDU1My4yNDcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA3LjAuMC4wIFNhZmFyaS81MzcuMzYgRWRnLzEwNy4wLjE0MTguNjIiLCJpYXQiOjE2NzA0MzIxNTN9.9phAu_hB6JoheCBYiVRXJ0FK2W_YDgpyhEdhfA6fpQY','2023-01-07 16:55:53',1),
(13,13,'2022-12-07 18:00:08','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MzExMDgwOC43MTUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA3LjAuMC4wIFNhZmFyaS81MzcuMzYgRWRnLzEwNy4wLjE0MTguNjIiLCJpYXQiOjE2NzA0MzI0MDh9.FWjIaeWJkdriTYbyslSsT8kifCuZCfkVTvqHqZJr4dc','2023-01-07 17:00:08',1),
(14,13,'2022-12-07 18:01:21','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MzExMDg4MS4wNDMsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA3LjAuMC4wIFNhZmFyaS81MzcuMzYgRWRnLzEwNy4wLjE0MTguNjIiLCJpYXQiOjE2NzA0MzI0ODF9.525Huk49VaJS34LH84BmpVa9D5RgsAoCBV7dNTztUaQ','2023-01-07 17:01:21',1),
(15,13,'2022-12-07 18:04:56','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MzExMTA5Ni4yNCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDcuMC4wLjAgU2FmYXJpLzUzNy4zNiBFZGcvMTA3LjAuMTQxOC42MiIsImlhdCI6MTY3MDQzMjY5Nn0.rWgNNC7dQ2rQm90PV7pCNOUD7lGsuiKoI8IqzBttFy8','2023-01-07 17:04:56',1),
(16,13,'2022-12-07 18:05:32','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MzExMTEzMi45ODUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA3LjAuMC4wIFNhZmFyaS81MzcuMzYgRWRnLzEwNy4wLjE0MTguNjIiLCJpYXQiOjE2NzA0MzI3MzJ9.O6etnDWOdhBOfi2pdatG-cQPqF3itG6qTA1nVVVdzPM','2023-01-07 17:05:32',1),
(17,13,'2022-12-07 18:07:58','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MzExMTI3OC43MjUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA3LjAuMC4wIFNhZmFyaS81MzcuMzYgRWRnLzEwNy4wLjE0MTguNjIiLCJpYXQiOjE2NzA0MzI4Nzh9.PH3pJEb573sAQCIf6pOFVYub8WaQ_Xjx6O0eA7xbc9o','2023-01-07 17:07:58',1),
(18,13,'2022-12-07 18:08:22','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MzExMTMwMi4yNywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDcuMC4wLjAgU2FmYXJpLzUzNy4zNiBFZGcvMTA3LjAuMTQxOC42MiIsImlhdCI6MTY3MDQzMjkwMn0.Gu0ijhkGVsKZrEN919ux1pCA3gkii25Xn-WpBxqBDsw','2023-01-07 17:08:22',1),
(19,13,'2022-12-07 18:09:33','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MzExMTM3My4zMTIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTGludXg7IEFuZHJvaWQgNi4wOyBOZXh1cyA1IEJ1aWxkL01SQTU4TikgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwNy4wLjUzMDQuMTIyIE1vYmlsZSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjcwNDMyOTczfQ.X-jTzmN_SPFELdYXv6eQa0wMoOnqw2HYV7s18_BbHkE','2023-01-07 17:09:33',1),
(20,13,'2022-12-07 18:33:57','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MzExMjgzNy4xNzIsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI5LjIiLCJpYXQiOjE2NzA0MzQ0Mzd9.22eZc8AXe1S5Sc99LMYp6McHs57bogHJiWf_DxFVL0w','2023-01-07 17:33:57',1),
(21,13,'2022-12-07 18:37:44','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MzExMzA2NC42MzIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTGludXg7IEFuZHJvaWQgNi4wOyBOZXh1cyA1IEJ1aWxkL01SQTU4TikgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwNy4wLjUzMDQuMTIyIE1vYmlsZSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjcwNDM0NjY0fQ.rT2f0S7pD5FW_E7zPr-eUO9GbO4oLLTaF-_x6mrpn0A','2023-01-07 17:37:44',1),
(22,13,'2022-12-07 19:04:18','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MzExNDY1OC42NjcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTGludXg7IEFuZHJvaWQgNi4wOyBOZXh1cyA1IEJ1aWxkL01SQTU4TikgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwNy4wLjUzMDQuMTIyIE1vYmlsZSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjcwNDM2MjU4fQ.lmkLgzWZkYZjfJhb2dLhOY-O9p_vAdU63ohq7QArezY','2023-01-07 18:04:18',1),
(23,13,'2022-12-07 19:04:48','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MzExNDY4OC4xMzcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTGludXg7IEFuZHJvaWQgNi4wOyBOZXh1cyA1IEJ1aWxkL01SQTU4TikgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwNy4wLjUzMDQuMTIyIE1vYmlsZSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjcwNDM2Mjg4fQ.Npswg5mqKChZ9kgT5iZGvbY3rDgGcnuddr63gJjd_co','2023-01-07 18:04:48',1),
(24,13,'2022-12-07 19:06:10','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MzExNDc3MC40ODIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTGludXg7IEFuZHJvaWQgNi4wOyBOZXh1cyA1IEJ1aWxkL01SQTU4TikgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwNy4wLjUzMDQuMTIyIE1vYmlsZSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjcwNDM2MzcwfQ.CGPszuLI90iruQVB_kYHTWOgcRRQrA6YWXX3-mX9Ro0','2023-01-07 18:06:10',1),
(25,13,'2022-12-07 19:08:19','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MzExNDg5OS45NjgsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTGludXg7IEFuZHJvaWQgNi4wOyBOZXh1cyA1IEJ1aWxkL01SQTU4TikgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwNy4wLjUzMDQuMTIyIE1vYmlsZSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjcwNDM2NDk5fQ.wrjfUPcmfg6UetwBFCaabkPxvJbK8mS6amuuhiIAW70','2023-01-07 18:08:19',1),
(26,13,'2022-12-08 11:28:55','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MzE3MzczNS41NjcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTGludXg7IEFuZHJvaWQgNi4wOyBOZXh1cyA1IEJ1aWxkL01SQTU4TikgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwNy4wLjUzMDQuMTIyIE1vYmlsZSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjcwNDk1MzM1fQ.AHXuLQ1OUtcewEHSdt9Z-Tio9GvXI-QCwhrEZC7obHU','2023-01-08 10:28:55',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
