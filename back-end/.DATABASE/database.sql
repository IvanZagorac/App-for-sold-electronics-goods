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

/*Table structure for table `administrator_token` */

DROP TABLE IF EXISTS `administrator_token`;

CREATE TABLE `administrator_token` (
  `administrator_token_id` int unsigned NOT NULL AUTO_INCREMENT,
  `administrator_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` text COLLATE utf8_croatian_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `is_valid` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`administrator_token_id`),
  KEY `fk_administrator_token_administrator_id` (`administrator_id`),
  CONSTRAINT `fk_administrator_token_administrator_id` FOREIGN KEY (`administrator_id`) REFERENCES `administrator` (`administrator_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `administrator_token` */

insert  into `administrator_token`(`administrator_token_id`,`administrator_id`,`created_at`,`token`,`expires_at`,`is_valid`) values 
(1,6,'2023-01-20 13:24:40','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2NzY4OTU4ODAuMTU3LCJpcCI6Ijo6MSIsInVhIjoiUG9zdG1hblJ1bnRpbWUvNy4zMC4wIiwiaWF0IjoxNjc0MjE3NDgwfQ.wz41dgil9O0WA0UNbP6DaGWh0VCPMU36HNUaPItcApM','2023-02-20 12:24:40',1),
(2,6,'2023-01-20 13:38:46','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2NzY4OTY3MjYuODEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA5LjAuMC4wIFNhZmFyaS81MzcuMzYgRWRnLzEwOS4wLjE1MTguNTIiLCJpYXQiOjE2NzQyMTgzMjZ9.piDAf1ydKPDPChq91ahETdRqa__VRMx6CRZdE9KziEw','2023-02-20 12:38:46',1),
(3,6,'2023-01-20 13:56:01','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2NzY4OTc3NjEuNjUzLCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjAuMCBTYWZhcmkvNTM3LjM2IEVkZy8xMDkuMC4xNTE4LjUyIiwiaWF0IjoxNjc0MjE5MzYxfQ.JirKWW6ANltaLbzP3Uve7zlGm587zWjmeaGCa6hJT3k','2023-02-20 12:56:01',1),
(4,6,'2023-01-20 13:57:12','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2NzY4OTc4MzIuNDExLCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjAuMCBTYWZhcmkvNTM3LjM2IEVkZy8xMDkuMC4xNTE4LjUyIiwiaWF0IjoxNjc0MjE5NDMyfQ.HfJKu-UKflYXFM4NmMCAPd1rEWeij_RMXgZ3n7uuHj4','2023-02-20 12:57:12',1),
(5,6,'2023-01-20 13:58:25','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2NzY4OTc5MDUuODExLCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjAuMCBTYWZhcmkvNTM3LjM2IEVkZy8xMDkuMC4xNTE4LjUyIiwiaWF0IjoxNjc0MjE5NTA1fQ.1p9BzcpioU7cr5DmxZVh8NG7WjN-b10_KTIPo3q5BiU','2023-02-20 12:58:25',1),
(6,6,'2023-02-26 11:58:44','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODAwODc1MjQuODY1LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKExpbnV4OyBBbmRyb2lkIDYuMDsgTmV4dXMgNSBCdWlsZC9NUkE1OE4pIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBNb2JpbGUgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY3NzQwOTEyNH0.SE3zrSwYXMlDUW3SjfbHn_i68-ob_x2BBtV_pL0Cn1Y','2023-03-29 10:58:44',1),
(7,6,'2023-02-26 12:45:16','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODAwOTAzMTYuMTI1LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2Nzc0MTE5MTZ9.MLjXuVEA-boVbwe5C1j87FhmLOWxk5AnqY_7WnNiEvw','2023-03-29 11:45:16',1),
(8,6,'2023-02-27 23:07:01','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODAyMTQwMjEuMzg1LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2Nzc1MzU2MjF9.P4LhbWIsolOykg93verTu66Ken3PXv_aE6HM1IivFrg','2023-03-30 22:07:01',1),
(9,6,'2023-02-28 10:15:58','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODAyNTQxNTguMTM5LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzExMC4wLjAuMCBTYWZhcmkvNTM3LjM2IEVkZy8xMTAuMC4xNTg3LjU3IiwiaWF0IjoxNjc3NTc1NzU4fQ.7hFBZC28YZWeKK1y_5mOobvTZMZUpgaPTuUHDEhl06o','2023-03-31 09:15:58',1),
(10,6,'2023-03-01 13:08:42','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODAzNTA5MjIuNDEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA5LjAuNTQxNC4xMjAgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY3NzY3MjUyMn0.3JH5Jehiy1tipkUQbgvoG3aah6cZckyNWwGy1I6trBg','2023-04-01 12:08:42',1),
(11,6,'2023-03-01 13:59:31','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODAzNTM5NzEuOTMsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTGludXg7IEFuZHJvaWQgNi4wOyBOZXh1cyA1IEJ1aWxkL01SQTU4TikgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIE1vYmlsZSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjc3Njc1NTcxfQ.BuvbAfJrMlhjJZVEG_IHJZSaLDqAMZVG6KNm0cNvMUs','2023-04-01 12:59:31',1),
(12,6,'2023-03-01 14:02:44','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODAzNTQxNjQuNDUyLCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKExpbnV4OyBBbmRyb2lkIDYuMDsgTmV4dXMgNSBCdWlsZC9NUkE1OE4pIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBNb2JpbGUgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY3NzY3NTc2NH0.ymP1dEhyg2nFg2O2KjrysnScq0QDDw-oXtAkxFJx7Dc','2023-04-01 13:02:44',1),
(13,6,'2023-03-01 14:05:25','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODAzNTQzMjUuNDM2LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2Nzc2NzU5MjV9.nVF8J1hKfS1QJ47gt1MT0HFxxNQa4r9q1dpFZOGe0qg','2023-04-01 13:05:25',1),
(14,6,'2023-03-01 14:06:03','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODAzNTQzNjMuNDc1LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2Nzc2NzU5NjN9.L3iXTxJGXQgxtRLeCAoxcFpaspdD68s0pHJlRSsekGU','2023-04-01 13:06:03',1),
(15,6,'2023-03-01 14:34:25','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODAzNTYwNjUuNTU5LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKExpbnV4OyBBbmRyb2lkIDYuMDsgTmV4dXMgNSBCdWlsZC9NUkE1OE4pIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBNb2JpbGUgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY3NzY3NzY2NX0.YcPqUh0yPUoymb0rs54CxPk0NyAdBSMZhG7qP-G7vGc','2023-04-01 13:34:25',1),
(16,6,'2023-03-01 14:51:43','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODAzNTcxMDMuOTI5LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2Nzc2Nzg3MDN9.j1xHvNNb7_oDKnhn9lqIwhWkcCuMKR-uTiko0JqJ6eM','2023-04-01 13:51:43',1),
(17,6,'2023-03-01 14:53:47','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODAzNTcyMjcuMDcyLCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKExpbnV4OyBBbmRyb2lkIDYuMDsgTmV4dXMgNSBCdWlsZC9NUkE1OE4pIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBNb2JpbGUgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY3NzY3ODgyN30._HYVQtu6fDLwqFsLsxOA85m1EQllhpSRQ33yQmBfkIM','2023-04-01 13:53:47',1),
(18,6,'2023-03-01 14:57:27','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODAzNTc0NDcuMzA3LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKExpbnV4OyBBbmRyb2lkIDYuMDsgTmV4dXMgNSBCdWlsZC9NUkE1OE4pIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBNb2JpbGUgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY3NzY3OTA0N30.lRCYbAwy9UgSVq4tXLI89tQ3RJ3gOjY5oRAm98s3VPM','2023-04-01 13:57:27',1),
(19,6,'2023-03-01 15:18:28','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODAzNTg3MDguNDU4LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKExpbnV4OyBBbmRyb2lkIDYuMDsgTmV4dXMgNSBCdWlsZC9NUkE1OE4pIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBNb2JpbGUgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY3NzY4MDMwOH0._GHh6T_Xxh18dplsYKJ2o8lNUYf5gWo1RvFixQvW2BM','2023-04-01 14:18:28',1),
(20,6,'2023-03-01 15:20:50','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODAzNTg4NTAuNzE2LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKExpbnV4OyBBbmRyb2lkIDYuMDsgTmV4dXMgNSBCdWlsZC9NUkE1OE4pIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBNb2JpbGUgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY3NzY4MDQ1MH0.oS3PNvJaOXvYTS4QjU0f6uBd8IzrXc0b-WL3QYWeTZk','2023-04-01 14:20:50',1),
(21,6,'2023-03-01 15:47:15','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODAzNjA0MzUuNDEzLCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2Nzc2ODIwMzV9.XY38c39ylTYrScrremOXLSsUmGEV6io-VCcHHb8oPyk','2023-04-01 14:47:15',1),
(22,6,'2023-03-01 15:50:18','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODAzNjA2MTguNzM2LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKExpbnV4OyBBbmRyb2lkIDYuMDsgTmV4dXMgNSBCdWlsZC9NUkE1OE4pIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBNb2JpbGUgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY3NzY4MjIxOH0.4gRsE9hOpfSaASzeZoOp7u3eibLTKJ4nTzOjeQPkTT8','2023-04-01 14:50:18',1),
(23,6,'2023-03-01 17:04:16','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODAzNjUwNTUuOTgsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA5LjAuNTQxNC4xMjAgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY3NzY4NjY1NX0.ZDoPSQ-5AbLJ6TuCTQtEmR5nZ-Z-BDJvFer-IwK7Byc','2023-04-01 16:04:15',1),
(24,6,'2023-03-01 17:41:40','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODAzNjczMDAuMzY4LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKExpbnV4OyBBbmRyb2lkIDYuMDsgTmV4dXMgNSBCdWlsZC9NUkE1OE4pIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBNb2JpbGUgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY3NzY4ODkwMH0.0LMZiBS_Scsdud1rbPrRrWpPWxKqgIMjrG9xae9QwQ8','2023-04-01 16:41:40',1),
(25,6,'2023-03-01 23:28:00','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODAzODgwODAuNTg1LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2Nzc3MDk2ODB9.Ybc5CyB3OuswENvi-oQuCghRvm_FkelVOCswfPQL0O8','2023-04-01 22:28:00',1),
(26,6,'2023-03-01 23:35:09','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODAzODg1MDkuNzMsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTGludXg7IEFuZHJvaWQgNi4wOyBOZXh1cyA1IEJ1aWxkL01SQTU4TikgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIE1vYmlsZSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjc3NzEwMTA5fQ.-CKx6DpOkYQxtYUujF7ZLxjR2BfHHY8EkwUEOcpB9aI','2023-04-01 22:35:09',1),
(27,6,'2023-03-02 11:16:00','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODA0MzA1NjAuNDQzLCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2Nzc3NTIxNjB9.uck2oi47M_g5iZE_Qid3tIZvRyHJbOiaKqQ7ETbDJOI','2023-04-02 10:16:00',1),
(28,6,'2023-03-02 22:25:53','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODA0NzA3NTMuNDU0LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2Nzc3OTIzNTN9.lxPgGwTjldbZTSPBchWlLW2zXRhlvPVj4qmw_QYWEzo','2023-04-02 21:25:53',1),
(29,6,'2023-03-03 00:11:19','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODA0NzcwNzkuNTYsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTGludXg7IEFuZHJvaWQgNi4wOyBOZXh1cyA1IEJ1aWxkL01SQTU4TikgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIE1vYmlsZSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjc3Nzk4Njc5fQ.a3rRQqzGSKvpSmVg-9sq7-ZgLIIhC4ewx4FNxl-aFs8','2023-04-02 23:11:19',1),
(30,6,'2023-03-03 10:07:04','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODA1MTI4MjQuNDE4LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2Nzc4MzQ0MjR9.b7FCplojhQhGpLwKmTnFxD2gbdHRmQllRAYLulPgU1s','2023-04-03 09:07:04',1),
(31,6,'2023-03-03 12:55:51','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODA1MjI5NTEuMTE1LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKExpbnV4OyBBbmRyb2lkIDYuMDsgTmV4dXMgNSBCdWlsZC9NUkE1OE4pIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBNb2JpbGUgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY3Nzg0NDU1MX0.fi1way49EH1pdU-wwPPHBU7nckge01yykhFOStf1G2c','2023-04-03 11:55:51',1),
(32,6,'2023-03-03 12:57:05','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODA1MjMwMjUuMzM4LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKExpbnV4OyBBbmRyb2lkIDYuMDsgTmV4dXMgNSBCdWlsZC9NUkE1OE4pIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBNb2JpbGUgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY3Nzg0NDYyNX0.TtntSkMQbqkQux_ri02lOjX3uyIcBcZ5L9J-g_6IQYs','2023-04-03 11:57:05',1),
(33,6,'2023-03-03 13:25:08','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODA1MjQ3MDguMTAzLCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2Nzc4NDYzMDh9.EN4dMM6xHIIESfC0pslkzY2XjsTTxmxvT24R2qgnVtc','2023-04-03 12:25:08',1),
(34,6,'2023-03-03 13:57:22','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODA1MjY2NDIuODczLCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKExpbnV4OyBBbmRyb2lkIDYuMDsgTmV4dXMgNSBCdWlsZC9NUkE1OE4pIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBNb2JpbGUgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY3Nzg0ODI0Mn0.fCdYb-J_qRo2EF7UuXDBRPFBVCyEuEGhiCZmwd78F7g','2023-04-03 12:57:22',1),
(35,6,'2023-03-03 13:59:17','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODA1MjY3NTcuNDQ3LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2Nzc4NDgzNTd9.WRr1b5Ec12Gidcq5K5kywfZw3JbN0fz3OM51RYSG3KU','2023-04-03 12:59:17',1),
(36,6,'2023-03-03 14:00:54','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODA1MjY4NTQuOTkyLCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKExpbnV4OyBBbmRyb2lkIDYuMDsgTmV4dXMgNSBCdWlsZC9NUkE1OE4pIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBNb2JpbGUgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY3Nzg0ODQ1NH0.IEXngNNJ36ZckeDaTimGYHEZsYcqx_365ZudyhNDKiY','2023-04-03 13:00:54',1),
(37,6,'2023-03-03 14:02:10','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODA1MjY5MzAuNDI2LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKExpbnV4OyBBbmRyb2lkIDYuMDsgTmV4dXMgNSBCdWlsZC9NUkE1OE4pIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBNb2JpbGUgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY3Nzg0ODUzMH0.s0YdpoOhRSwZd_AJfW2OrlwFSG5VQ37ROf9kcXF71B4','2023-04-03 13:02:10',1),
(38,6,'2023-03-03 14:03:47','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODA1MjcwMjcuODczLCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKExpbnV4OyBBbmRyb2lkIDYuMDsgTmV4dXMgNSBCdWlsZC9NUkE1OE4pIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBNb2JpbGUgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY3Nzg0ODYyN30.8GBXzTHFNrS_IabvLqTKw69FF6iLn6h1hLyEMwwEiZY','2023-04-03 13:03:47',1),
(39,6,'2023-03-03 14:15:26','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImFkbWluaXN0cmF0b3JJZCI6NiwiaWRlbnRpdHkiOiJhZG1pbjEiLCJleHQiOjE2ODA1Mjc3MjYuNTUxLCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2Nzc4NDkzMjZ9.j0m6KRkgIUvESRu4hvJj8mekho_nZnGaONsqh8_Lm3E','2023-04-03 13:15:26',1);

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
  KEY `fk_article_category_id cat id` (`category_id`),
  CONSTRAINT `fk_article_category_id cat id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `article` */

insert  into `article`(`article_id`,`name`,`category_id`,`excerpt`,`description`,`status`,`is_promoted`,`created_at`) values 
(1,'Pc HARD gaming',1,'Gaming racunalo','Ima malo ovako dobrih gaming racunala sa ovakvom konfiguracijom stvarno za malo novaca puno se moze dobiti poput 64 gb rama  i tako dalje\n','visible',1,'2022-11-07 23:44:39'),
(3,'Acme TB512',3,'string','Duzi tekst i tak','available',1,'2022-11-08 20:15:51'),
(4,'Acme Laptop 3344',2,'Dobar laptop za male novce','grgrgrgrgrgr','available',1,'2022-11-21 11:15:04'),
(5,'Ram memorija',4,'Sluzi za brzi laptop','Duzi vijek trajanja ','available',1,'2023-01-09 18:39:28'),
(6,'Acme HDD 1020GB',1,'Nesto slabiji','Manje novaca solidan laptop','available',0,'2023-01-10 10:42:33'),
(7,'Asus Nosus',3,'Kratki opis s vise od 12 ','Duzi opis duzi od 64 luposti o opisu luposti o opisu  luposti o opisu luposti o opisu luposti o opisu luposti o opisu luposti o opisu luposti o opisu luposti o opisu','available',0,'2023-03-03 00:13:39');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `article_feature` */

insert  into `article_feature`(`article_feature_id`,`article_id`,`feature_id`,`value`) values 
(3,3,1,'TB'),
(6,4,4,'HP'),
(7,4,5,'16 inch'),
(8,4,8,'Windows'),
(9,6,3,'Nesto'),
(11,6,9,'1020'),
(12,7,2,'Jeftin'),
(13,1,9,'1024'),
(14,1,10,'Da ispravan je ');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `article_price` */

insert  into `article_price`(`article_price_id`,`article_id`,`price`,`created_at`) values 
(1,1,45.00,'2022-11-08 11:49:00'),
(2,3,512.00,'2022-11-08 20:15:51'),
(3,4,2450.00,'2022-11-21 11:16:27'),
(4,5,2200.00,'2023-01-09 18:40:00'),
(5,6,1500.00,'2023-01-10 10:42:56'),
(6,7,670.01,'2023-03-03 00:13:39'),
(7,1,2000.00,'2023-03-03 11:03:02');

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `cart_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  KEY `fk_cart_user_id` (`user_id`),
  CONSTRAINT `fk_cart_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `cart` */

insert  into `cart`(`cart_id`,`user_id`,`created_at`) values 
(1,1,'2022-11-17 11:44:55'),
(2,1,'2022-11-17 17:16:39'),
(3,4,'2022-11-21 23:06:41'),
(4,13,'2022-11-22 23:42:18'),
(5,17,'2023-01-17 18:29:16'),
(6,17,'2023-01-17 18:56:03'),
(7,15,'2023-01-18 15:09:14'),
(8,17,'2023-01-18 15:31:00'),
(9,17,'2023-01-19 11:44:15'),
(11,17,'2023-01-19 12:26:03'),
(63,17,'2023-01-19 13:35:14'),
(64,17,'2023-01-19 13:40:24'),
(65,17,'2023-01-19 14:00:18'),
(66,17,'2023-03-06 15:03:30');

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `cart_article` */

insert  into `cart_article`(`cart_article_id`,`cart_id`,`article_id`,`quantity`) values 
(1,1,1,2),
(2,2,1,8),
(3,2,3,3),
(4,3,1,5),
(5,4,1,4),
(7,5,6,1),
(8,5,5,2),
(9,5,3,1),
(19,6,6,1),
(21,8,6,1),
(22,8,1,2),
(39,11,1,1),
(40,63,1,1),
(41,64,1,1),
(42,65,1,1),
(43,66,6,2),
(44,66,1,1);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_croatian_ci NOT NULL,
  `image_path` varchar(128) COLLATE utf8_croatian_ci NOT NULL,
  `parent__category_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uq_categoty_name` (`name`),
  UNIQUE KEY `uq_category_path` (`image_path`),
  KEY `parent__category_id` (`parent__category_id`),
  CONSTRAINT `fk_category_parent__category_id` FOREIGN KEY (`parent__category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `category` */

insert  into `category`(`category_id`,`name`,`image_path`,`parent__category_id`) values 
(1,'PC','nuzno/slika.jpg',NULL),
(2,'Bijela tehnika','nuzno/bteh.jpg',NULL),
(3,'Laptopi','nuzno/laptop.jpg',1),
(4,'RAM','nuzno/ram.jpg',1),
(5,'Perilica rublja','nuzno/prublja.jpg',2),
(21,'Ves masina','masina.jpg',2);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `feature` */

insert  into `feature`(`feature_id`,`name`,`category_id`) values 
(5,'Dijagonala ekrana',2),
(10,'Ispravan',1),
(9,'Kapacitet',1),
(1,'NekiVecid',3),
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
  `user_id` int unsigned NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `uq_order_cart_id` (`cart_id`),
  CONSTRAINT `fk_order_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `order` */

insert  into `order`(`order_id`,`created_at`,`cart_id`,`status`,`user_id`) values 
(1,'2022-11-17 11:52:16',1,'accepted',0),
(2,'2022-11-17 17:16:39',2,'pending',0),
(3,'2022-11-21 23:06:40',3,'accepted',0),
(15,'2022-11-22 23:42:18',4,'pending',0),
(16,'2023-01-17 18:29:15',5,'pending',0),
(17,'2023-01-17 18:56:03',6,'pending',0),
(18,'2023-01-18 15:30:59',8,'pending',0),
(23,'2023-01-19 12:26:03',11,'pending',0),
(24,'2023-01-19 13:35:13',63,'pending',0),
(25,'2023-01-19 13:40:23',64,'pending',0),
(26,'2023-01-19 14:00:18',65,'pending',0),
(28,'2023-03-06 15:03:29',66,'pending',17);

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `photo` */

insert  into `photo`(`photo_id`,`article_id`,`image_path`) values 
(1,1,'laptop.jpg'),
(6,5,'ram.jpg'),
(8,6,'laptop1.jpg'),
(9,3,'acme512tb.jpg'),
(10,4,'acme3344.jpg'),
(11,7,'202333-0280612181-jeftin.jpg'),
(14,5,'202333-3740184504-ram2.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

/*Data for the table `user` */

insert  into `user`(`user_id`,`email`,`password_hash`,`name`,`surname`,`phone_number`,`postal_adress`) values 
(1,'test@gmail.com','5B722B307FCE6C944905D132691D5E4A2214B7FE92B738920EB3FCE3A90420A19511C3010A0E7712B054DAEF5B57BAD59ECBD93B3280F210578F547F4AED4D25','Ivo','Ivic','+385996673196','Nepoznata adresa123'),
(4,'test23@gmail.com','FD37CA5CA8763AE077A5E9740212319591603C42A08A60DCC91D12E7E457B024F6BDFDC10CDC1383E1602FF2092B4BC1BB8CAC9306A9965EB352435F5DFE8BB0','Roki','Roic','+385996673197','Nepoznata adresa123'),
(13,'jovek1@gmail.com','B66DD5A7A689F88E302AB2AE4A9567F9C7572C18E520B3BF712BB2630B3931A503D647BAEDF48DF470006312D07984216578B60526E5EE6137EF1FD215190A0C','Roki123','Roic123','+35996673197','Nepoznataadresa12314'),
(15,'ivek1@gmail.com','3E2F332DBF3E5C6CDD70352982DD77B575E43B524CCC1A75EF54AF7513CA2040A6F7D0EA7166AD475C8491B29533341161E3F0FA3873F0267E56A042AA1240E1','Rokgrei123','Roiegrec123','+35996673153','Postanskaadresa'),
(16,'ivek2@gmail.com','2586091BD6A98ED60266EE3AB0A72217B09CCDE8E47245A3BD1088A37070A3C160E1FE75AF27C3B2E3C302F1E8E746791D57B7AAFD9E448DA0806DABD37F7679','Rokgrei1233','Roiegrec1233','+35996673150','Postanskaadre32sa'),
(17,'ivek3@gmail.com','2A78029FF0FD4E2D39157D71FD91493570992447B105DE6A5FFE02EDFEA4C5E1D835DA5FD91776EE20694FB0263A8495D371067EECED2EC917066C44939AA596','Rokgrei14233','Roiegrec134233','+35996673112','Kompaniabh'),
(20,'nesto1@gmail.com','BA3253876AED6BC22D4A6FF53D8406C6AD864195ED144AB5C87621B6C233B548BAEAE6956DF346EC8C17F5EA10F35EE3CBC514797ED7DDD3145464E2A0BAB413','21rwfeffwe','wfewfw','+385996673249','wfewefwefwf');

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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_croatian_ci;

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
(26,13,'2022-12-08 11:28:55','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTMsImlkZW50aXR5Ijoiam92ZWsxQGdtYWlsLmNvbSIsImV4dCI6MTY3MzE3MzczNS41NjcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTGludXg7IEFuZHJvaWQgNi4wOyBOZXh1cyA1IEJ1aWxkL01SQTU4TikgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwNy4wLjUzMDQuMTIyIE1vYmlsZSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjcwNDk1MzM1fQ.AHXuLQ1OUtcewEHSdt9Z-Tio9GvXI-QCwhrEZC7obHU','2023-01-08 10:28:55',1),
(27,17,'2023-01-03 11:40:07','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc1NDIwODA3LjcwMSwiaXAiOiI6OjEiLCJ1YSI6IlBvc3RtYW5SdW50aW1lLzcuMjkuMiIsImlhdCI6MTY3Mjc0MjQwN30.mw2EsVuKGGOGj-JG446X5PZ0n_-XCSGDyBZsrT-hpX8','2023-02-03 10:40:07',1),
(28,17,'2023-01-03 11:40:28','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc1NDIwODI4LjkzOSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDguMC4wLjAgU2FmYXJpLzUzNy4zNiBFZGcvMTA4LjAuMTQ2Mi41NCIsImlhdCI6MTY3Mjc0MjQyOH0.Ew_pyhArEcltt2v-S07vYkZiG1f7UHKLR12TdIzeYcg','2023-02-03 10:40:28',1),
(29,17,'2023-01-04 14:41:28','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc1NTE4MDg4LjgxOSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDguMC4wLjAgU2FmYXJpLzUzNy4zNiBFZGcvMTA4LjAuMTQ2Mi41NCIsImlhdCI6MTY3MjgzOTY4OH0.Z9k2NQhEWTeTHf_9StNqFVsJ86k9-xLXyQfRFdQrvLU','2023-02-04 13:41:28',1),
(30,17,'2023-01-04 21:29:08','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc1NTQyNTQ4LjY2OCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDguMC4wLjAgU2FmYXJpLzUzNy4zNiBFZGcvMTA4LjAuMTQ2Mi41NCIsImlhdCI6MTY3Mjg2NDE0OH0.NoJFLJkr3tm6QVDET7IrqCv1m8ZArFuKt1J-OqHL8zg','2023-02-04 20:29:08',1),
(31,17,'2023-01-06 00:49:47','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc1NjQwOTg3LjEzOCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDguMC4wLjAgU2FmYXJpLzUzNy4zNiBFZGcvMTA4LjAuMTQ2Mi41NCIsImlhdCI6MTY3Mjk2MjU4N30.y9D8pwXxfvZ8-xZ1YdUJCAUp-a5dGX-jjlOARp-BaqU','2023-02-05 23:49:47',1),
(32,17,'2023-01-06 12:22:05','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc1NjgyNTI0Ljk1OCwiaXAiOiI6OjEiLCJ1YSI6IlBvc3RtYW5SdW50aW1lLzcuMjkuMiIsImlhdCI6MTY3MzAwNDEyNH0.hzsEFTR-tMgke2VhQFlnKA_RSpl3CB49Y8Grk_GNUis','2023-02-06 11:22:04',1),
(33,17,'2023-01-09 18:26:36','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc1OTYzNTk2Ljg3NSwiaXAiOiI6OjEiLCJ1YSI6IlBvc3RtYW5SdW50aW1lLzcuMjkuMiIsImlhdCI6MTY3MzI4NTE5Nn0.mIkw3eWHbQp_IWdNI8NipSa-MAj4m7WlIL3gxpXko6M','2023-02-09 17:26:36',1),
(34,17,'2023-01-10 10:46:09','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc2MDIyMzY5LjYyNiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDguMC4wLjAgU2FmYXJpLzUzNy4zNiBFZGcvMTA4LjAuMTQ2Mi43NiIsImlhdCI6MTY3MzM0Mzk2OX0.cMvP6NdyUaKrH_TAAL6bqsrZw1uDkb7QfLb7ZNUwakA','2023-02-10 09:46:09',1),
(35,17,'2023-01-10 11:19:32','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc2MDI0MzcyLjQ0MSwiaXAiOiI6OjEiLCJ1YSI6IlBvc3RtYW5SdW50aW1lLzcuMzAuMCIsImlhdCI6MTY3MzM0NTk3Mn0.VgwX6qzhcNpdFDv43DdCQ9povvtZbu4LDJ255fi-9io','2023-02-10 10:19:32',1),
(36,17,'2023-01-10 13:15:22','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc2MDMxMzIyLjQyOCwiaXAiOiI6OjEiLCJ1YSI6IlBvc3RtYW5SdW50aW1lLzcuMzAuMCIsImlhdCI6MTY3MzM1MjkyMn0.B78ndolarXmM_i9BQnT0WJOAgi2FVHy0oDKVmScQhLM','2023-02-10 12:15:22',1),
(37,17,'2023-01-11 11:18:48','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc2MTEwNzI4LjUxLCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOC4wLjAuMCBTYWZhcmkvNTM3LjM2IEVkZy8xMDguMC4xNDYyLjc2IiwiaWF0IjoxNjczNDMyMzI4fQ.7AZWTimrfQEZkBoO1M2G7IZ7Z-_i9sZ1UbXE9wikyYs','2023-02-11 10:18:48',1),
(38,17,'2023-01-12 12:59:19','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc2MjAzMTU5LjYwNSwiaXAiOiI6OjEiLCJ1YSI6IlBvc3RtYW5SdW50aW1lLzcuMzAuMCIsImlhdCI6MTY3MzUyNDc1OX0.CSPT01QDm2b_rffWTJEesrGEk3OICRgdf1HlyufKeyU','2023-02-12 11:59:19',1),
(39,17,'2023-01-16 12:58:21','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc2NTQ4NzAxLjY4NywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC4wLjAgU2FmYXJpLzUzNy4zNiBFZGcvMTA5LjAuMTUxOC41MiIsImlhdCI6MTY3Mzg3MDMwMX0.GKSe2ZHBHsZp8hWUiJ2xtFoUpZGLAxE0aICAYV-59FI','2023-02-16 11:58:21',1),
(40,17,'2023-01-16 19:38:16','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc2NTcyNjk2Ljg1NCwiaXAiOiI6OjEiLCJ1YSI6IlBvc3RtYW5SdW50aW1lLzcuMzAuMCIsImlhdCI6MTY3Mzg5NDI5Nn0.dtvUHtuVSvDGGxs8xxCjrMtuJkBEHG8SREHuwSwaYa0','2023-02-16 18:38:16',1),
(41,17,'2023-01-16 20:07:18','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc2NTc0NDM4LjMzMSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC4wLjAgU2FmYXJpLzUzNy4zNiBFZGcvMTA5LjAuMTUxOC41MiIsImlhdCI6MTY3Mzg5NjAzOH0.I-sjCi_QtY07mz-XjMjQjKmPLgaSLWdt_5CMiUQqnZs','2023-02-16 19:07:18',1),
(42,17,'2023-01-17 10:36:02','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc2NjI2NTYyLjE5OSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDguMC41MzU5LjEyNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjczOTQ4MTYyfQ.h2MFx37SzmtcFMASd-KNoM3sFoEYs3ETfcQIU8C6irA','2023-02-17 09:36:02',1),
(43,17,'2023-01-17 10:37:11','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc2NjI2NjMxLjcwNiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChMaW51eDsgQW5kcm9pZCA2LjA7IE5leHVzIDUgQnVpbGQvTVJBNThOKSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA4LjAuNTM1OS4xMjUgTW9iaWxlIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NzM5NDgyMzF9.Oa6HHU99kJjNTqivd2jGautFEOi7ESH4DA8tt23rHzQ','2023-02-17 09:37:11',1),
(44,17,'2023-01-17 10:50:50','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc2NjI3NDUwLjc2MSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDguMC41MzU5LjEyNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjczOTQ5MDUwfQ.S8Vl6AqUy38fgQhfj6NbjHsIxv5hMTxLeqEwT2h8g1A','2023-02-17 09:50:50',1),
(45,17,'2023-01-18 15:01:51','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc2NzI4OTExLjgyOSwiaXAiOiI6OjEiLCJ1YSI6IlBvc3RtYW5SdW50aW1lLzcuMzAuMCIsImlhdCI6MTY3NDA1MDUxMX0.qwp-fdNisCNY7TICAtfIlq2YR85619wupljaSjBjqBE','2023-02-18 14:01:51',1),
(46,17,'2023-01-18 15:46:08','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc2NzMxNTY4LjAwNiwiaXAiOiI6OjEiLCJ1YSI6IlBvc3RtYW5SdW50aW1lLzcuMzAuMCIsImlhdCI6MTY3NDA1MzE2OH0.HonfOaTVS8fnZHkmx9EJ3WoKlt97iMjbK0AnvNZpmkU','2023-02-18 14:46:08',1),
(47,17,'2023-01-19 11:48:44','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc2ODAzNzI0Ljk0NSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC4wLjAgU2FmYXJpLzUzNy4zNiBFZGcvMTA5LjAuMTUxOC41MiIsImlhdCI6MTY3NDEyNTMyNH0.8DCDVH93aQybUqkpc2KEtUbACSY1kqNJJKqb604RUlo','2023-02-19 10:48:44',1),
(48,17,'2023-01-21 00:07:23','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc2OTM0NDQyLjQyMSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC4wLjAgU2FmYXJpLzUzNy4zNiBFZGcvMTA5LjAuMTUxOC41NSIsImlhdCI6MTY3NDI1NjA0Mn0.3NiTT3kdg0FQh4RshtBOn1gnVY6f1qk4TCkC5Pho1fM','2023-02-20 23:07:22',1),
(49,17,'2023-02-02 23:37:10','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjc4MDU1ODMwLjEwNywiaXAiOiI6OjEiLCJ1YSI6IlBvc3RtYW5SdW50aW1lLzcuMzAuMCIsImlhdCI6MTY3NTM3NzQzMH0.hCTkyrE_EnKHK7AxmHVx2ApaGNoPbw2gNgSr-TOoRvg','2023-03-05 22:37:10',1),
(50,17,'2023-02-26 11:50:40','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwMDg3MDQwLjczMSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChMaW51eDsgQW5kcm9pZCA2LjA7IE5leHVzIDUgQnVpbGQvTVJBNThOKSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA5LjAuNTQxNC4xMjAgTW9iaWxlIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2Nzc0MDg2NDB9.csTRSNckUvGJ26Bqg8mCuNSFNfh5GApznBvWINbG8B0','2023-03-29 10:50:40',1),
(51,17,'2023-03-01 14:01:44','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwMzU0MTA0LjE1MSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChMaW51eDsgQW5kcm9pZCA2LjA7IE5leHVzIDUgQnVpbGQvTVJBNThOKSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA5LjAuNTQxNC4xMjAgTW9iaWxlIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2Nzc2NzU3MDR9.xZkMIMxA2sMH_dnkA-9wz3hZ-z-x_-VhqtAlgoZTDcw','2023-04-01 13:01:44',1),
(52,17,'2023-03-01 14:05:42','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwMzU0MzQyLjgxMywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChMaW51eDsgQW5kcm9pZCA2LjA7IE5leHVzIDUgQnVpbGQvTVJBNThOKSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA5LjAuNTQxNC4xMjAgTW9iaWxlIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2Nzc2NzU5NDJ9.yNgB5TD9j3eyNAIhEM6WC-IhHFTZ_NkgndHigcB7cIo','2023-04-01 13:05:42',1),
(53,17,'2023-03-03 14:59:21','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNTMwMzYxLjc3NCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjc3ODUxOTYxfQ.crmvtnejTNjsv9xqyDIonlg-i2bPSD66MhoB1BNP5jQ','2023-04-03 13:59:21',1),
(54,17,'2023-03-03 15:01:05','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNTMwNDY1LjM1OCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChMaW51eDsgQW5kcm9pZCA2LjA7IE5leHVzIDUgQnVpbGQvTVJBNThOKSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA5LjAuNTQxNC4xMjAgTW9iaWxlIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2Nzc4NTIwNjV9.FUHY985PCjxIyTP_yH6FZgDkdw2Ey2o7DPusfv-hWPM','2023-04-03 14:01:05',1),
(55,17,'2023-03-03 15:05:40','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNTMwNzQwLjQ1NiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChMaW51eDsgQW5kcm9pZCA2LjA7IE5leHVzIDUgQnVpbGQvTVJBNThOKSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA5LjAuNTQxNC4xMjAgTW9iaWxlIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2Nzc4NTIzNDB9.1zhsFVjSldLBjczhH5NJan2-P3R8INRz3nB6TxFEgiw','2023-04-03 14:05:40',1),
(56,17,'2023-03-03 15:15:53','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNTMxMzUzLjEyMywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChMaW51eDsgQW5kcm9pZCA2LjA7IE5leHVzIDUgQnVpbGQvTVJBNThOKSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA5LjAuNTQxNC4xMjAgTW9iaWxlIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2Nzc4NTI5NTN9.hilkUuLc2cqYf6FXWjLzN_bFGq5bvAOiephvbuimTIc','2023-04-03 14:15:53',1),
(57,17,'2023-03-03 15:16:06','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNTMxMzY2LjcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoTGludXg7IEFuZHJvaWQgNi4wOyBOZXh1cyA1IEJ1aWxkL01SQTU4TikgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIE1vYmlsZSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjc3ODUyOTY2fQ.B-GsHzLa50B00hdY3fzVjfVcesuRS8KL5CygcGoByyU','2023-04-03 14:16:06',1),
(58,17,'2023-03-03 15:32:33','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNTMyMzUzLjI5MSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjc3ODUzOTUzfQ.nyyAQwLqWqvPgKJSk594MFVdaicSr3Ek7NrCx_IiozA','2023-04-03 14:32:33',1),
(59,17,'2023-03-06 10:32:29','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNzczNTQ5LjI2MiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjc4MDk1MTQ5fQ.6YvWu1dbzijbSwLbMiXWjlKeUa99p_Sj2Z6MFcYYSpc','2023-04-06 09:32:29',1),
(60,17,'2023-03-06 11:56:04','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNzc4NTY0LjY0NCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjc4MTAwMTY0fQ.2-Uhgl_1kHALftcT0FOutn84gGRImBFj8nJdGTCaNQU','2023-04-06 10:56:04',1),
(61,17,'2023-03-06 12:09:08','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNzc5MzQ4LjMwNywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjc4MTAwOTQ4fQ.q3oRjdmPMoTtERvKmY2hGEiwKIEEr44qMwDKsmXu9Zc','2023-04-06 11:09:08',1),
(62,17,'2023-03-06 12:33:27','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNzgwODA3LjU1NywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjc4MTAyNDA3fQ.KBe5dnpfH8rOy_MUy5qR3B_1eR2z-e9hVB3df67s290','2023-04-06 11:33:27',1),
(63,17,'2023-03-06 12:39:09','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNzgxMTQ5LjQ1MSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjc4MTAyNzQ5fQ.z1iX5ilcGX7ror6HjIPS5jq9nS6NIBsgxTwDVp79HyA','2023-04-06 11:39:09',1),
(64,17,'2023-03-06 12:55:33','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNzgyMTMzLjgyOSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChMaW51eDsgQW5kcm9pZCA2LjA7IE5leHVzIDUgQnVpbGQvTVJBNThOKSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA5LjAuNTQxNC4xMjAgTW9iaWxlIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NzgxMDM3MzN9.OJ4i5rBGGiXkaB0vd4uuFrexnTPAsg5EllqwMcBUjFQ','2023-04-06 11:55:33',1),
(65,17,'2023-03-06 13:09:09','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNzgyOTQ5LjMzNywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChMaW51eDsgQW5kcm9pZCA2LjA7IE5leHVzIDUgQnVpbGQvTVJBNThOKSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA5LjAuNTQxNC4xMjAgTW9iaWxlIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NzgxMDQ1NDl9.qOJz00fudEbP3shmY7jdZnQjMOD3cJmRWZizJ2C0hxg','2023-04-06 12:09:09',1),
(66,17,'2023-03-06 13:12:14','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNzgzMTM0LjU5MywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChMaW51eDsgQW5kcm9pZCA2LjA7IE5leHVzIDUgQnVpbGQvTVJBNThOKSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA5LjAuNTQxNC4xMjAgTW9iaWxlIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NzgxMDQ3MzR9.OQj3nmQRCJuXr2nNizJtEyTlHxm4bbDV-2ysGaRU850','2023-04-06 12:12:14',1),
(67,17,'2023-03-06 13:34:02','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNzg0NDQyLjAzMiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChMaW51eDsgQW5kcm9pZCA2LjA7IE5leHVzIDUgQnVpbGQvTVJBNThOKSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA5LjAuNTQxNC4xMjAgTW9iaWxlIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NzgxMDYwNDJ9.mzoEZEHZJpIT7LfqOyCAYyw3CfDF4gf0rAmqfKgNZIk','2023-04-06 12:34:02',1),
(68,17,'2023-03-06 13:50:46','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNzg1NDQ2LjI2OSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChMaW51eDsgQW5kcm9pZCA2LjA7IE5leHVzIDUgQnVpbGQvTVJBNThOKSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA5LjAuNTQxNC4xMjAgTW9iaWxlIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NzgxMDcwNDZ9.Spa8pmrsf1igxDlfjt5RNxlp8u_nZUQiJySgRRjBnaI','2023-04-06 12:50:46',1),
(69,17,'2023-03-06 14:41:44','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNzg4NTAzLjk5MiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChMaW51eDsgQW5kcm9pZCA2LjA7IE5leHVzIDUgQnVpbGQvTVJBNThOKSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA5LjAuNTQxNC4xMjAgTW9iaWxlIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NzgxMTAxMDN9.4mrR22XBZJwrLAPkvOXJS8qO5682hev5BLMtRwN44nk','2023-04-06 13:41:43',1),
(70,17,'2023-03-06 14:47:41','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNzg4ODYxLjY5NywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChMaW51eDsgQW5kcm9pZCA2LjA7IE5leHVzIDUgQnVpbGQvTVJBNThOKSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA5LjAuNTQxNC4xMjAgTW9iaWxlIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NzgxMTA0NjF9.gnrG2ewJxWLYPH9W_A0ArQ5mDzMrV9gxtSrBfFnEaMI','2023-04-06 13:47:41',1),
(71,17,'2023-03-06 14:50:34','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNzg5MDM0LjcxNCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChMaW51eDsgQW5kcm9pZCA2LjA7IE5leHVzIDUgQnVpbGQvTVJBNThOKSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA5LjAuNTQxNC4xMjAgTW9iaWxlIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NzgxMTA2MzR9.omvdFtgVu7yqMahtAw-8wNMFiGUPwOIeiGT_zCfNAck','2023-04-06 13:50:34',1),
(72,17,'2023-03-06 15:02:49','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNzg5NzY4Ljk4NiwiaXAiOiI6OmZmZmY6MTI3LjAuMC4xIiwidWEiOiJNb3ppbGxhLzUuMCAoTGludXg7IEFuZHJvaWQgNi4wOyBOZXh1cyA1IEJ1aWxkL01SQTU4TikgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIE1vYmlsZSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjc4MTExMzY4fQ.S0ezZf8R_Wxnkdo9exITXaKnIH1QtrT9cVE8M98F3MU','2023-04-06 14:02:48',1),
(73,17,'2023-03-06 15:03:20','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNzg5ODAwLjA5NywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChMaW51eDsgQW5kcm9pZCA2LjA7IE5leHVzIDUgQnVpbGQvTVJBNThOKSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA5LjAuNTQxNC4xMjAgTW9iaWxlIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NzgxMTE0MDB9.yZha4_Q2VucI2RW0RR48vrWLucaXUnSMVbKa2D8wBuE','2023-04-06 14:03:20',1),
(74,17,'2023-03-06 15:11:27','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNzkwMjg3LjM1LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKExpbnV4OyBBbmRyb2lkIDYuMDsgTmV4dXMgNSBCdWlsZC9NUkE1OE4pIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBNb2JpbGUgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY3ODExMTg4N30.z3TXhf3dEiielFPhcWjKpVTeIDEqitZK__b1uYoL-zs','2023-04-06 14:11:27',1),
(75,17,'2023-03-06 15:18:43','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNzkwNzIzLjI0MywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChMaW51eDsgQW5kcm9pZCA2LjA7IE5leHVzIDUgQnVpbGQvTVJBNThOKSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA5LjAuNTQxNC4xMjAgTW9iaWxlIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NzgxMTIzMjN9.U4sWSnwQOvkPuvp5ayERiiCGqbmj-fmyCKDbUlJTF-g','2023-04-06 14:18:43',1),
(76,17,'2023-03-06 15:21:34','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxNywiaWRlbnRpdHkiOiJpdmVrM0BnbWFpbC5jb20iLCJleHQiOjE2ODA3OTA4OTQuMDI0LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKExpbnV4OyBBbmRyb2lkIDYuMDsgTmV4dXMgNSBCdWlsZC9NUkE1OE4pIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBNb2JpbGUgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY3ODExMjQ5NH0.KkkoKfd8VXPmDgqyWfYjwTfiL0VBX9CCDcm8g_LC5LI','2023-04-06 14:21:34',1),
(77,17,'2023-03-06 15:22:39','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxNywiaWRlbnRpdHkiOiJpdmVrM0BnbWFpbC5jb20iLCJleHQiOjE2ODA3OTA5NTkuOTQzLCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKExpbnV4OyBBbmRyb2lkIDYuMDsgTmV4dXMgNSBCdWlsZC9NUkE1OE4pIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBNb2JpbGUgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTY3ODExMjU1OX0.yLOzvOZ2clgvGFt2vjxL-vScgmHibquYNgoJ7PmWjsU','2023-04-06 14:22:39',1),
(78,17,'2023-03-06 15:23:02','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNzkwOTgyLjE5NCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChMaW51eDsgQW5kcm9pZCA2LjA7IE5leHVzIDUgQnVpbGQvTVJBNThOKSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA5LjAuNTQxNC4xMjAgTW9iaWxlIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NzgxMTI1ODJ9.b_S4tvhWoBJqef-VQsc56p3-RR3-7Pp9kZN4NfO0V-c','2023-04-06 14:23:02',1),
(79,17,'2023-03-06 15:23:27','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNzkxMDA3LjY4MywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChMaW51eDsgQW5kcm9pZCA2LjA7IE5leHVzIDUgQnVpbGQvTVJBNThOKSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTA5LjAuNTQxNC4xMjAgTW9iaWxlIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2NzgxMTI2MDd9.gxTWsMQd7O8D_uvp5Zb4THCzF-QbfU57ELA5FnJXCec','2023-04-06 14:23:27',1),
(80,17,'2023-03-06 15:34:03','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImFkbWluaXN0cmF0b3JJZCI6MTcsImlkZW50aXR5IjoiaXZlazNAZ21haWwuY29tIiwiZXh0IjoxNjgwNzkxNjQzLjY5OSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMDkuMC41NDE0LjEyMCBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjc4MTEzMjQzfQ.lTnPazuljcAhX-2RVp1_riugYJ8FzHtWDPMxIVeDHh4','2023-04-06 14:34:03',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
