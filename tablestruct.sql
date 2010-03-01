-- MySQL dump 10.11
--
-- Host: localhost    Database: kiwi
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
) ENGINE=MyISAM AUTO_INCREMENT=2441 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=71119 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=616 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

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
-- Table structure for table `site_logs`
--

DROP TABLE IF EXISTS `site_logs`;
CREATE TABLE `site_logs` (
  `id` bigint(20) NOT NULL auto_increment,
  `oper` varchar(40) NOT NULL,
  `domain` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4135 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-10-24  9:05:01
