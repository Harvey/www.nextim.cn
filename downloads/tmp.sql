-- MySQL dump 10.11
--
-- Host: localhost    Database: nextim_site
-- ------------------------------------------------------
-- Server version	5.0.45-Debian_1ubuntu3.4-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `login` varchar(100) NOT NULL default '',
  `hashed_password` varchar(255) NOT NULL default '',
  `status` int(11) NOT NULL default '0',
  `role` varchar(40) NOT NULL default 'user',
  `nicename` varchar(50) NOT NULL default '',
  `created` datetime default NULL,
  `updated` datetime default NULL,
  `display_name` varchar(250) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_login` (`login`)
) ENGINE=MyISAM AUTO_INCREMENT=2456 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (2441,'jinyu.bjut@gmail.com','66c17629b2d8df29cf8ef1e3163cf44dd4412a49',0,'user','','2010-01-27 14:10:08','2010-01-27 14:10:08','jinyu'),(2442,'freefis@gmail.com','35e8bd62b5b8d7111d22c21c60118a4f08260ac9',0,'user','','2010-01-27 14:12:00','2010-01-27 14:12:00','free.wang'),(2443,'test@163.com','57348d4f8bda5187f7cda40b2b3968107b0be00a',0,'user','','2010-01-27 14:16:04','2010-01-27 14:16:04','harvey'),(2444,'nkd_admin@163.com','408f840a0a506978a0c580a9386355c0e4bc4151',0,'user','','2010-01-27 16:19:57','2010-01-27 16:19:57','admin'),(2445,'ljhynlp@126.com','35aa97450d1a485f4f0cea71841a850d2d8f1c45',0,'user','','2010-01-27 17:57:04','2010-01-27 17:57:04','houhou'),(2446,'waixiew22@waixiew.net','d55f23df96c12ec616bfa08b9aedda30177504aa',0,'user','','2010-01-27 20:10:40','2010-01-27 20:10:40','waixiew'),(2447,'thq@live.cn','16a82330efb078ddeef505ea7b8f041602690204',0,'user','','2010-01-27 21:31:44','2010-01-27 21:31:44','å”å®å¼º'),(2448,'admin@oin.cc','bd2bdfb9fbe379849a74f67e35514812887465e4',0,'user','','2010-01-27 22:02:25','2010-01-27 22:02:25','é™ˆèŽ¹'),(2449,'wangpoliang@yahoo.cn','0223627204e4ac322dbd0d5d49d5fac560e14813',0,'user','','2010-01-27 22:38:09','2010-01-27 22:38:09','wangpoliang@yahoo.cn'),(2450,'philicks@sina.com','4361ea58c2a06ad9e5cd81cc0ba7b0ee2b86eb90',0,'user','','2010-01-28 00:18:53','2010-01-28 00:18:53','philicks'),(2451,'a12345.a67840@msa.hinet.net','6eecb488c40768a36a4a71b2a171eb5d2afb007a',0,'user','','2010-01-28 11:05:08','2010-01-28 11:05:08','ehappyog'),(2452,'wilurn@gmail.com','3c585652468da80da6caa32e58ba240bb2bf3417',0,'user','','2010-01-28 18:43:56','2010-01-28 18:43:56','wilurn'),(2453,'markhomanho@hotmail.com','702721168b29ed3624173fe66893146be13725f7',0,'user','','2010-01-28 18:52:24','2010-01-28 18:52:24','Markho'),(2454,'longyitong@yahoo.com.cn','dc2d899f2387a531811dfcba15e6c720f4b2fa6a',0,'user','','2010-01-29 00:49:51','2010-01-29 00:49:51','longyitong'),(2455,'hievan@126.com','60a884e379a11950576d05dbc7f96a368174ca9d',0,'user','','2010-01-29 13:51:46','2010-01-29 13:51:46','å®‰é“æ°‘');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acos`
--

DROP TABLE IF EXISTS `acos`;
CREATE TABLE `acos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) default NULL,
  `model` varchar(255) default '',
  `foreign_key` int(10) unsigned default NULL,
  `alias` varchar(255) default '',
  `lft` int(10) default NULL,
  `rght` int(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acos`
--

LOCK TABLES `acos` WRITE;
/*!40000 ALTER TABLE `acos` DISABLE KEYS */;
INSERT INTO `acos` VALUES (1,NULL,'Account',2441,'2441',1,2),(2,NULL,'Account',2442,'2442',3,4),(3,NULL,'Account',2443,'2443',5,6),(4,NULL,'Site',4,'www.nextim.cn',7,8),(5,NULL,'Site',4,'www.sina.com',9,10),(6,NULL,'Site',4,'www.tsinghua.edu.cn',11,12),(7,NULL,'Account',2444,'2444',13,14),(8,NULL,'Account',2445,'2445',15,16),(9,NULL,'Site',4,'www.asdf.com',17,18),(10,NULL,'Account',2446,'2446',19,20),(11,NULL,'Site',4,'www.waixiew.net',21,22),(12,NULL,'Account',2447,'2447',23,24),(13,NULL,'Site',4,'mhk.net.cn',25,26),(14,NULL,'Account',2448,'2448',27,28),(15,NULL,'Account',2449,'2449',29,30),(16,NULL,'Account',2450,'2450',31,32),(17,NULL,'Site',4,'www.kaixin818.com',33,34),(18,NULL,'Account',2451,'2451',35,36),(19,NULL,'Site',4,'happygo.idv.tw',37,38),(20,NULL,'Account',2452,'2452',39,40),(21,NULL,'Site',4,'www.pukpuiclub.com',41,42),(22,NULL,'Account',2453,'2453',43,44),(23,NULL,'Account',2454,'2454',45,46),(24,NULL,'Site',4,'www.longyitong.com',47,48),(25,NULL,'Account',2455,'2455',49,50);
/*!40000 ALTER TABLE `acos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aros`
--

DROP TABLE IF EXISTS `aros`;
CREATE TABLE `aros` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `parent_id` int(10) default NULL,
  `model` varchar(255) default '',
  `foreign_key` int(10) unsigned default NULL,
  `alias` varchar(255) default '',
  `lft` int(10) default NULL,
  `rght` int(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aros`
--

LOCK TABLES `aros` WRITE;
/*!40000 ALTER TABLE `aros` DISABLE KEYS */;
INSERT INTO `aros` VALUES (1,NULL,'Account',2441,'2441',1,2),(2,NULL,'Account',2442,'2442',3,4),(3,NULL,'Account',2443,'2443',5,6),(4,NULL,'Account',2444,'2444',7,8),(5,NULL,'Account',2445,'2445',9,10),(6,NULL,'Account',2446,'2446',11,12),(7,NULL,'Account',2447,'2447',13,14),(8,NULL,'Account',2448,'2448',15,16),(9,NULL,'Account',2449,'2449',17,18),(10,NULL,'Account',2450,'2450',19,20),(11,NULL,'Account',2451,'2451',21,22),(12,NULL,'Account',2452,'2452',23,24),(13,NULL,'Account',2453,'2453',25,26),(14,NULL,'Account',2454,'2454',27,28),(15,NULL,'Account',2455,'2455',29,30);
/*!40000 ALTER TABLE `aros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aros_acos`
--

DROP TABLE IF EXISTS `aros_acos`;
CREATE TABLE `aros_acos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `aro_id` int(10) unsigned NOT NULL,
  `aco_id` int(10) unsigned NOT NULL,
  `_create` char(2) NOT NULL default '0',
  `_read` char(2) NOT NULL default '0',
  `_update` char(2) NOT NULL default '0',
  `_delete` char(2) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aros_acos`
--

LOCK TABLES `aros_acos` WRITE;
/*!40000 ALTER TABLE `aros_acos` DISABLE KEYS */;
INSERT INTO `aros_acos` VALUES (1,1,1,'1','1','1','1'),(2,2,2,'1','1','1','1'),(3,3,3,'1','1','1','1'),(4,1,4,'1','1','1','1'),(5,3,5,'1','1','1','1'),(6,3,6,'1','1','1','1'),(7,4,7,'1','1','1','1'),(8,5,8,'1','1','1','1'),(9,1,9,'1','1','1','1'),(10,6,10,'1','1','1','1'),(11,6,11,'1','1','1','1'),(12,7,12,'1','1','1','1'),(13,7,13,'1','1','1','1'),(14,8,14,'1','1','1','1'),(15,9,15,'1','1','1','1'),(16,10,16,'1','1','1','1'),(17,10,17,'1','1','1','1'),(18,11,18,'1','1','1','1'),(19,11,19,'1','1','1','1'),(20,12,20,'1','1','1','1'),(21,12,21,'1','1','1','1'),(22,13,22,'1','1','1','1'),(23,14,23,'1','1','1','1'),(24,14,24,'1','1','1','1'),(25,15,25,'1','1','1','1');
/*!40000 ALTER TABLE `aros_acos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboards`
--

DROP TABLE IF EXISTS `dashboards`;
CREATE TABLE `dashboards` (
  `id` int(11) NOT NULL auto_increment,
  `created` datetime default NULL,
  `updated` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dashboards`
--

LOCK TABLES `dashboards` WRITE;
/*!40000 ALTER TABLE `dashboards` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logm_operations`
--

DROP TABLE IF EXISTS `logm_operations`;
CREATE TABLE `logm_operations` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `session` varchar(50) NOT NULL,
  `user` smallint(6) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `action` varchar(255) default NULL,
  `result` varchar(255) default NULL,
  `details` varchar(255) default NULL,
  `module_name` varchar(255) default NULL,
  `terminal_ip` varchar(255) default NULL,
  `created` datetime default NULL,
  `updated` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logm_operations`
--

LOCK TABLES `logm_operations` WRITE;
/*!40000 ALTER TABLE `logm_operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `logm_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logm_securities`
--

DROP TABLE IF EXISTS `logm_securities`;
CREATE TABLE `logm_securities` (
  `id` int(11) NOT NULL auto_increment,
  `session` varchar(50) default NULL,
  `user` smallint(6) default NULL,
  `user_name` varchar(255) NOT NULL,
  `terminal_ip` varchar(255) default NULL,
  `host_name` varchar(255) NOT NULL,
  `security_cause` varchar(255) NOT NULL,
  `details` varchar(255) default NULL,
  `security_action` varchar(255) default NULL,
  `affected_user` varchar(255) default NULL,
  `result` varchar(255) default NULL,
  `created` datetime default NULL,
  `updated` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logm_securities`
--

LOCK TABLES `logm_securities` WRITE;
/*!40000 ALTER TABLE `logm_securities` DISABLE KEYS */;
/*!40000 ALTER TABLE `logm_securities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logm_systems`
--

DROP TABLE IF EXISTS `logm_systems`;
CREATE TABLE `logm_systems` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `level` varchar(255) default NULL,
  `module_name` varchar(255) default NULL,
  `details` varchar(255) default NULL,
  `created` datetime default NULL,
  `updated` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logm_systems`
--

LOCK TABLES `logm_systems` WRITE;
/*!40000 ALTER TABLE `logm_systems` DISABLE KEYS */;
/*!40000 ALTER TABLE `logm_systems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
CREATE TABLE `preferences` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `owner_type` varchar(255) NOT NULL,
  `group_id` int(11) default NULL,
  `group_type` varchar(255) default NULL,
  `value` varchar(255) default NULL,
  `created` datetime default NULL,
  `updated` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `index_preferences_on_owner_and_name_and_preference` (`owner_id`,`owner_type`,`name`,`group_id`,`group_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `id` int(11) NOT NULL auto_increment,
  `lang` varchar(255) default NULL,
  `theme` varchar(255) default NULL,
  `created` datetime default NULL,
  `updated` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_logs`
--

DROP TABLE IF EXISTS `site_logs`;
CREATE TABLE `site_logs` (
  `id` bigint(20) NOT NULL auto_increment,
  `oper` varchar(40) NOT NULL,
  `domain` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4145 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `site_logs`
--

LOCK TABLES `site_logs` WRITE;
/*!40000 ALTER TABLE `site_logs` DISABLE KEYS */;
INSERT INTO `site_logs` VALUES (4135,'insert','www.nextim.cn'),(4136,'insert','www.sina.com'),(4137,'insert','www.tsinghua.edu.cn'),(4138,'insert','www.asdf.com'),(4139,'insert','www.waixiew.net'),(4140,'insert','mhk.net.cn'),(4141,'insert','www.kaixin818.com'),(4142,'insert','happygo.idv.tw'),(4143,'insert','www.pukpuiclub.com'),(4144,'insert','www.longyitong.com');
/*!40000 ALTER TABLE `site_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
CREATE TABLE `sites` (
  `domain` varchar(255) NOT NULL default '',
  `id` binary(36) NOT NULL,
  `name` varchar(255) NOT NULL default '',
  `account_id` bigint(20) NOT NULL default '0',
  `status` varchar(40) NOT NULL default 'active',
  `maxusers` int(11) NOT NULL default '20',
  `expired_at` datetime NOT NULL default '1970-01-01 00:00:00',
  `created` datetime default NULL,
  `updated` datetime default NULL,
  `description` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `site_domain` (`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES ('www.nextim.cn','4b5febec-82dc-4805-b936-75e2d39056dd','123',2441,'active',20,'2011-01-27 00:00:00','2010-01-27 15:31:56','2010-01-27 15:31:56','321'),('www.sina.com','4b5fef5b-1a4c-458b-baac-7618d39056dd','test',2443,'active',20,'2011-01-27 00:00:00','2010-01-27 15:46:35','2010-01-27 15:46:35','asdf'),('www.tsinghua.edu.cn','4b5fef79-760c-461a-8824-7618d39056dd','asdf',2443,'active',20,'2011-01-27 00:00:00','2010-01-27 15:47:05','2010-01-27 15:47:05','sadf '),('www.asdf.com','4b6025a1-a008-418c-984f-0f02d39056dd','222',2441,'active',20,'2011-01-27 00:00:00','2010-01-27 19:38:09','2010-01-27 19:38:09','444'),('www.waixiew.net','4b60326c-6d08-43e0-bfc1-1256d39056dd','å¾®ç¬‘å®¶å›­',2446,'active',20,'2011-01-27 00:00:00','2010-01-27 20:32:44','2010-01-27 20:32:44','äº¤å‹ç¤¾åŒº'),('mhk.net.cn','4b604056-e05c-46e7-a157-158ed39056dd','æ¢…æ²³å£ç”Ÿæ´»ç½‘',2447,'active',20,'2011-01-27 00:00:00','2010-01-27 21:32:06','2010-01-27 21:32:06','å‰æž—æ¢…æ²³å£åœ°åŒºç”Ÿæ´»ä¿¡æ¯ç½‘ç«™'),('www.kaixin818.com','4b60678e-8648-487f-9405-1cc7d39056dd','å¼€å¿ƒ818',2450,'active',20,'2011-01-28 00:00:00','2010-01-28 00:19:26','2010-01-28 00:19:26','å¼€å¿ƒ818ï¼Œ818å¼€å¿ƒç½‘'),('happygo.idv.tw','4b60ff31-1b50-40a2-a413-2943d39056dd','happy3q',2451,'active',20,'2011-01-28 00:00:00','2010-01-28 11:06:25','2010-01-28 11:06:25','ç¤¾'),('www.pukpuiclub.com','4b616b90-da54-47ce-b8db-3f76d39056dd','Pukpuiclub',2452,'active',20,'2011-01-28 00:00:00','2010-01-28 18:48:48','2010-01-28 18:48:48','pukpuiclub home'),('www.longyitong.com','4b61c14c-b98c-4ae2-b292-5b84d39056dd','longyiong',2454,'active',20,'2011-01-29 00:00:00','2010-01-29 00:54:36','2010-01-29 00:54:36','longyiong');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`kiwi`@`%` */ /*!50003 TRIGGER `insert_site` AFTER INSERT ON `sites` FOR EACH ROW INSERT INTO site_logs(oper, domain) values('insert', NEW.domain) */;;

/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`kiwi`@`%` */ /*!50003 TRIGGER `update_site` AFTER UPDATE ON `sites` FOR EACH ROW INSERT INTO site_logs(oper, domain) values('update', NEW.domain) */;;

/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`kiwi`@`%` */ /*!50003 TRIGGER `delete_site` AFTER DELETE ON `sites` FOR EACH ROW INSERT INTO site_logs(oper, domain) values('delete', OLD.domain) */;;

DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(40) default NULL,
  `name` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `role_id` int(11) default NULL,
  `domain_id` int(11) default NULL,
  `department` varchar(100) default NULL,
  `telephone` varchar(30) default NULL,
  `mobile` varchar(30) default NULL,
  `memo` varchar(1024) default NULL,
  `status` varchar(40) default NULL,
  `crypted_password` varchar(40) default NULL,
  `salt` varchar(40) default NULL,
  `created` datetime default NULL,
  `updated` datetime default NULL,
  `expired_at` datetime default NULL,
  `remember_token` varchar(40) default NULL,
  `remember_token_expires_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `index_users_on_login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-02-22 16:49:13
