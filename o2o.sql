/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.53 : Database - tp5_o2o
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tp5_o2o` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tp5_o2o`;

/*Table structure for table `o2o_area` */

DROP TABLE IF EXISTS `o2o_area`;

CREATE TABLE `o2o_area` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `city_id` int(11) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `o2o_area` */

/*Table structure for table `o2o_bis` */

DROP TABLE IF EXISTS `o2o_bis`;

CREATE TABLE `o2o_bis` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `licence_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '营业执照',
  `description` text NOT NULL,
  `city_id` int(11) unsigned NOT NULL DEFAULT '0',
  `city_path` varchar(50) NOT NULL DEFAULT '',
  `bank_info` varchar(50) NOT NULL DEFAULT '',
  `money` decimal(20,2) NOT NULL DEFAULT '0.00',
  `bank_name` varchar(50) NOT NULL DEFAULT '' COMMENT '开户行名称',
  `bank_user` varchar(50) NOT NULL DEFAULT '' COMMENT '开户人',
  `faren` varchar(20) NOT NULL DEFAULT '' COMMENT '法人',
  `faren_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '法人联系方式',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `NAME` (`name`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `o2o_bis` */

/*Table structure for table `o2o_bis_account` */

DROP TABLE IF EXISTS `o2o_bis_account`;

CREATE TABLE `o2o_bis_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `code` varchar(10) NOT NULL DEFAULT '',
  `bis_id` int(11) unsigned NOT NULL DEFAULT '0',
  `last_login_ip` varchar(20) NOT NULL DEFAULT '',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0',
  `is_main` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是总点',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `bis_id` (`bis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `o2o_bis_account` */

/*Table structure for table `o2o_bis_location` */

DROP TABLE IF EXISTS `o2o_bis_location`;

CREATE TABLE `o2o_bis_location` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `tel` varchar(20) NOT NULL DEFAULT '',
  `contact` varchar(20) NOT NULL DEFAULT '',
  `xpoint` varchar(20) NOT NULL DEFAULT '' COMMENT '经度',
  `ypoint` varchar(20) NOT NULL DEFAULT '' COMMENT '维度',
  `bis_id` int(11) unsigned NOT NULL DEFAULT '0',
  `open_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '营业时间',
  `content` text NOT NULL COMMENT '门店介绍',
  `is_main` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是总店',
  `api_address` varchar(255) NOT NULL DEFAULT '',
  `city_id` int(11) unsigned NOT NULL DEFAULT '0',
  `city_path` varchar(50) NOT NULL DEFAULT '',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  `category_path` varchar(50) NOT NULL DEFAULT '',
  `bank_info` varchar(50) NOT NULL DEFAULT '',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `NAME` (`name`),
  KEY `city_id` (`city_id`),
  KEY `bis_id` (`bis_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `o2o_bis_location` */

/*Table structure for table `o2o_category` */

DROP TABLE IF EXISTS `o2o_category`;

CREATE TABLE `o2o_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `o2o_category` */

insert  into `o2o_category`(`id`,`name`,`parent_id`,`listorder`,`status`,`create_time`,`update_time`) values (1,'美食',0,1,1,1494554461,1497421703),(2,'娱乐',0,2,1,1494554471,1497419813),(3,'酒店',0,3,0,1494554832,1497421709),(4,'休闲',0,4,1,1494554840,1497416764),(5,'丽人',0,5,1,1494554846,1497419930),(6,'KTV',2,0,1,1494555059,1494555059),(7,'电影',0,6,1,1495441804,1497419966);

/*Table structure for table `o2o_city` */

DROP TABLE IF EXISTS `o2o_city`;

CREATE TABLE `o2o_city` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `uname` varchar(50) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uname` (`uname`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `o2o_city` */

/*Table structure for table `o2o_deal` */

DROP TABLE IF EXISTS `o2o_deal`;

CREATE TABLE `o2o_deal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  `se_category_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '二级栏目',
  `bis_id` int(11) unsigned NOT NULL DEFAULT '0',
  `location_ids` varchar(100) NOT NULL DEFAULT '' COMMENT '所属店面',
  `image` varchar(200) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `start_time` int(11) unsigned NOT NULL DEFAULT '0',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0',
  `origin_price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '原价',
  `current_price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '当前价',
  `city_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品所属城市',
  `buy_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品购买了多少份',
  `total_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品总数',
  `coupons_begin_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '团购券开始时间',
  `coupons_end_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '团购券结束时间',
  `xpoint` varchar(20) NOT NULL DEFAULT '' COMMENT '经度',
  `ypoint` varchar(20) NOT NULL DEFAULT '' COMMENT '维度',
  `bis_account_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商家id',
  `balance_price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '结算价',
  `notice` text NOT NULL COMMENT '商品提示',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `se_category_id` (`se_category_id`),
  KEY `city_id` (`city_id`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `o2o_deal` */

/*Table structure for table `o2o_featured` */

DROP TABLE IF EXISTS `o2o_featured`;

CREATE TABLE `o2o_featured` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(30) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `o2o_featured` */

/*Table structure for table `o2o_user` */

DROP TABLE IF EXISTS `o2o_user`;

CREATE TABLE `o2o_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `code` varchar(10) NOT NULL DEFAULT '',
  `last_login_ip` varchar(20) NOT NULL DEFAULT '',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0',
  `email` varchar(30) NOT NULL DEFAULT '',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `o2o_user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
