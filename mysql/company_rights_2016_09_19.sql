-- MySQL dump 10.13  Distrib 5.6.31, for Linux (x86_64)
--
-- Host: localhost    Database: ksxing
-- ------------------------------------------------------
-- Server version	5.6.31-log

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
-- Table structure for table `company_rights`
--

DROP TABLE IF EXISTS `company_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_rights` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(64) NOT NULL COMMENT '权限级别名称',
  `count_limit` int(64) NOT NULL COMMENT '注册考生数量上线',
  `online_limit` int(64) NOT NULL COMMENT '同时在线考生数量上限',
  `domain_modify` tinyint(4) DEFAULT '0' COMMENT '是否支持启用域管理功能，默认0否，1是',
  `mobile_function` tinyint(4) DEFAULT '0' COMMENT '是否支持手机客户端功能，默认0否，1是',
  `result_analysis` tinyint(4) DEFAULT '0' COMMENT '是否支持考试结果分析，默认0否，1是',
  `file_manager` tinyint(1) DEFAULT '0',
  `space_size_limit` int(11) DEFAULT NULL COMMENT '空间大小限制，单位MB',
  `notice` char(64) DEFAULT NULL COMMENT '备注信息，预留自段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_rights`
--

LOCK TABLES `company_rights` WRITE;
/*!40000 ALTER TABLE `company_rights` DISABLE KEYS */;
INSERT INTO `company_rights` VALUES (1,'超级用户',999999,999999,1,1,1,1,1024,'超级用户，限制可随意更改'),(2,'体验版',25,25,1,1,1,0,1024,'新注册用户上限为25人，14天使用期限，功能齐全'),(3,'人次版',999999,999999,1,1,1,0,1024,'人次用户，人数无限制，功能齐全，按人次收费'),(4,'专业版',500,150,1,1,1,1,512,'专业用户，人数有限制，功能齐全，按时间收费'),(5,'企业版',999999,500,1,1,1,1,1024,'企业用户，人数有限制，功能齐全，按时间收费'),(6,'原有免费用户',50,50,0,0,0,1,1024,'援用免费用户，人数有限制，无附加功能'),(7,'杭州维卓',700,200,1,1,1,1,1024,'杭州维卓定制权限'),(8,'免费版',25,25,0,1,0,0,1024,'新注册用户');
/*!40000 ALTER TABLE `company_rights` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-03 12:10:53
