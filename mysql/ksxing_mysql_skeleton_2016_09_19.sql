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
-- Table structure for table `admin_op_log`
--

DROP TABLE IF EXISTS `admin_op_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_op_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `operation` int(11) DEFAULT NULL,
  `op_object` varchar(30) DEFAULT NULL,
  `op_url` varchar(30) DEFAULT NULL,
  `login_ip` varchar(30) DEFAULT NULL,
  `op_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4280 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `prefix` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmodify`
--

DROP TABLE IF EXISTS `cmodify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmodify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `logo_is_default` int(11) DEFAULT NULL,
  `logo_file` varchar(120) DEFAULT NULL,
  `redirect_url` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_id` (`company_id`),
  UNIQUE KEY `redirect_url` (`redirect_url`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_api`
--

DROP TABLE IF EXISTS `company_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_api` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` smallint(5) unsigned DEFAULT NULL,
  `app_key` char(64) DEFAULT NULL,
  `api_type` char(64) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `admin_login` tinyint(1) NOT NULL DEFAULT '0',
  `admin_mark` tinyint(1) NOT NULL DEFAULT '0',
  `import_question` tinyint(1) NOT NULL DEFAULT '0',
  `student_login` tinyint(1) NOT NULL DEFAULT '0',
  `student_exam` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_id` (`company_id`),
  UNIQUE KEY `app_key` (`app_key`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_config`
--

DROP TABLE IF EXISTS `company_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `can_sel_dep` tinyint(1) DEFAULT '0',
  `department_id` int(11) NOT NULL,
  `uname_required` tinyint(4) NOT NULL DEFAULT '0',
  `name_required` tinyint(4) NOT NULL DEFAULT '0',
  `gender_required` int(11) DEFAULT NULL,
  `email_required` int(11) DEFAULT NULL,
  `phone_required` int(11) DEFAULT NULL,
  `cno_required` int(11) DEFAULT NULL,
  `position_required` int(11) DEFAULT NULL COMMENT '职位信息是否必填, 0是, 1否',
  `notice_required` int(11) DEFAULT NULL COMMENT '备注信息是否必填。0是，1否。',
  `sequence` varchar(64) DEFAULT '1,2,3,4,5,6',
  `pc_url` varchar(256) DEFAULT NULL,
  `mobile_url` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_file`
--

DROP TABLE IF EXISTS `company_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_file` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` smallint(5) unsigned NOT NULL,
  `admin_file` bigint(20) unsigned DEFAULT NULL,
  `staff_file` bigint(20) unsigned DEFAULT NULL,
  `recent_upload_time` datetime DEFAULT NULL,
  `recent_upload_user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_id` (`company_id`),
  KEY `comapny_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `companys`
--

DROP TABLE IF EXISTS `companys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companys` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '自增键',
  `company_name` char(64) NOT NULL COMMENT '企业名称',
  `domain` char(32) NOT NULL COMMENT '企业域名',
  `admin_email` char(64) NOT NULL COMMENT '联系人邮箱',
  `admin_phone` char(32) NOT NULL COMMENT '联系人电话',
  `count_limit` int(64) NOT NULL COMMENT '账户人数上限',
  `online_limit` int(64) DEFAULT '0',
  `production` tinyint(1) NOT NULL DEFAULT '2' COMMENT '产品类型.1是高级版,2普通版',
  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `expiration_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '到期时间',
  `status` enum('disable','enable') DEFAULT 'enable' COMMENT '状态',
  `channel_id` int(11) DEFAULT NULL COMMENT '注册渠道id',
  `enable_test_encrpt` int(11) DEFAULT '1' COMMENT '是否支持试题加密.0可以,1不可以',
  `enable_domain_modify` int(11) DEFAULT '1' COMMENT '是否支持自定义域.0可以,1不可以',
  `enable_mobile` int(11) DEFAULT '1' COMMENT '是否支持移动版.0可以,1不可以',
  `enable_results_analys` int(11) DEFAULT '1' COMMENT '是否支持成绩分析.0可以,1不可以',
  `notice` char(64) DEFAULT NULL COMMENT '此字段已用作考生注册时备注自定义，不可作为他用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=4597 DEFAULT CHARSET=utf8 COMMENT='企业表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `companys_new`
--

DROP TABLE IF EXISTS `companys_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companys_new` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` char(64) NOT NULL COMMENT '公司名称',
  `domain` char(32) NOT NULL COMMENT '公司域名',
  `admin_email` char(64) DEFAULT NULL,
  `admin_phone` char(32) NOT NULL COMMENT '管理员电话',
  `rights_grade` tinyint(3) unsigned NOT NULL DEFAULT '8' COMMENT '公司权限等级',
  `created_time` datetime NOT NULL COMMENT '注册时间',
  `expiration_time` datetime NOT NULL COMMENT '到期时间',
  `remain_frequency` int(10) unsigned DEFAULT '0' COMMENT '剩余考试人次数',
  `status` enum('disable','enable') DEFAULT 'enable' COMMENT '状态',
  `channel_id` int(11) DEFAULT NULL COMMENT '注册渠道id',
  `custom_remark_name` char(64) DEFAULT '备注' COMMENT '用户自定义考生注册备注字段名称',
  `notice` int(11) DEFAULT NULL,
  `salesman_name` char(64) DEFAULT NULL COMMENT '销售人员姓名',
  `salesman_email` char(64) DEFAULT NULL COMMENT '销售人员邮箱',
  `change_rights` tinyint(4) DEFAULT NULL COMMENT '用户在原版本未到期时购买其他版本，记录到期日需要更改的版本号',
  `change_expiration_time` datetime DEFAULT NULL COMMENT '用户在原版本未到期时购买其他版本，记录到期日需要更改的新的到期日',
  `custom_count_limit` int(64) DEFAULT NULL COMMENT '用户定制考生数量上限',
  `custom_online_limit` int(64) DEFAULT NULL COMMENT '用户定制在线人数上限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6426 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consumption_record`
--

DROP TABLE IF EXISTS `consumption_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumption_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `consume_type` tinyint(3) unsigned NOT NULL COMMENT '消费类型，1为考试人次，2为短信',
  `company_id` int(10) unsigned NOT NULL COMMENT '公司id',
  `exam_id` int(10) unsigned DEFAULT NULL COMMENT '考试id',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '考生id',
  `consume_time` datetime DEFAULT NULL COMMENT '消耗时间',
  `notice` char(64) DEFAULT NULL COMMENT '备注，预留自段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19872 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `department_tree`
--

DROP TABLE IF EXISTS `department_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department_tree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `pId` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `department_user`
--

DROP TABLE IF EXISTS `department_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department_user` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '自增键',
  `user_id` int(64) NOT NULL COMMENT '用户id',
  `department_id` int(64) DEFAULT NULL COMMENT '所属部门id',
  `company_id` int(64) NOT NULL COMMENT '用户所属企业的id',
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  KEY `department_user_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=512192 DEFAULT CHARSET=utf8mb4 COMMENT='用户和部门的映射表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `department_user_backup`
--

DROP TABLE IF EXISTS `department_user_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department_user_backup` (
  `id` int(64) NOT NULL DEFAULT '0' COMMENT '自增键',
  `user_id` int(64) NOT NULL COMMENT '用户id',
  `department_id` int(64) DEFAULT NULL COMMENT '所属部门id',
  `company_id` int(64) NOT NULL COMMENT '用户所属企业的id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '自增键',
  `name` char(64) NOT NULL COMMENT '部门名称',
  `pId` int(64) DEFAULT '0' COMMENT '父级部门id.0表示是个根节点',
  `company_id` int(64) DEFAULT NULL COMMENT '所属公司id',
  `status` enum('0','1') DEFAULT '0' COMMENT '状态.0正常,1禁用',
  PRIMARY KEY (`id`),
  KEY `pId` (`pId`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19374 DEFAULT CHARSET=utf8mb4 COMMENT='公司部门树表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departments_test`
--

DROP TABLE IF EXISTS `departments_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments_test` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '自增键',
  `name` char(64) NOT NULL COMMENT '部门名称',
  `pId` int(64) DEFAULT '0' COMMENT '父级部门id.0表示是个根节点',
  `company_id` int(64) DEFAULT NULL COMMENT '所属公司id',
  `status` enum('0','1') DEFAULT '0' COMMENT '状态.0正常,1禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='公司部门树表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exam_dep`
--

DROP TABLE IF EXISTS `exam_dep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_dep` (
  `id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `exam_info_id` int(64) NOT NULL,
  `company_id` int(64) NOT NULL,
  `department_id` int(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=309666 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exam_info`
--

DROP TABLE IF EXISTS `exam_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_info` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '自增键',
  `exam_name` char(32) NOT NULL COMMENT '考试名称',
  `before_answer_notice` text,
  `exam_style` int(64) DEFAULT NULL COMMENT '考试分类id',
  `status` enum('0','1') DEFAULT '0' COMMENT '考试状态.0正常,1异常',
  `exam_mode` enum('1','2') DEFAULT '1' COMMENT '考试模式.1是整卷模式,2是逐题模式',
  `pass_mark` int(4) NOT NULL DEFAULT '60' COMMENT '及格分数',
  `exam_start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '考试开始时间',
  `exam_end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '考试结束时间',
  `exam_time_restrict` enum('0','1') DEFAULT '1' COMMENT '是否有答卷时间限制.0是,1否',
  `exam_time` int(4) NOT NULL COMMENT '答卷时间',
  `exam_times_restrict` enum('0','1') DEFAULT '1' COMMENT '是否限制每人最多参加考试次数,0是,1否',
  `exam_times` int(4) NOT NULL COMMENT '每人最多参加考试次数',
  `set_disable_paste` enum('0','1') DEFAULT '1' COMMENT '答卷时禁用粘贴及鼠标右键.0是,1否',
  `set_full_screen` enum('0','1') DEFAULT '1' COMMENT '全屏防作弊.0是,1否',
  `blur_count` tinyint(4) DEFAULT '3',
  `set_quiet_cheat` tinyint(1) DEFAULT '0',
  `quiet_second` tinyint(4) DEFAULT NULL,
  `set_random_order_test` enum('0','1') DEFAULT '1' COMMENT '试题顺序随机.0是,1否',
  `set_ban_after_min` int(4) DEFAULT NULL COMMENT '开始考试x分钟后禁止考生参加',
  `set_ban_wthin_min` int(4) DEFAULT NULL COMMENT '开始考试x分钟内禁止考生交卷',
  `show_ranking` tinyint(1) DEFAULT '0',
  `set_release_way` char(2) DEFAULT NULL,
  `set_release_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '成绩发布时间',
  `set_mark_notice` tinyint(1) DEFAULT '0',
  `set_release_notice` char(64) DEFAULT NULL,
  `set_allows_paper_answer` enum('0','1') DEFAULT '1' COMMENT '允许考试查看试卷和答案.0是,1否',
  `company_id` int(64) NOT NULL COMMENT '所属公司id',
  `create_user_id` int(64) NOT NULL COMMENT '创建人id',
  `paper_info_id` int(64) NOT NULL COMMENT '关联的试卷id',
  `is_archive` tinyint(1) DEFAULT '1' COMMENT '表示此数据是否为归档状态.0是,1否',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `for_sale` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(10,2) DEFAULT NULL,
  `skip_login` int(4) DEFAULT '0',
  `practice_mode` int(4) DEFAULT '0',
  `wechat` tinyint(1) NOT NULL DEFAULT '0',
  `wechat_title` text,
  `wechat_pic` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22700 DEFAULT CHARSET=utf8 COMMENT='考试信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exam_pay_record`
--

DROP TABLE IF EXISTS `exam_pay_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_pay_record` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) NOT NULL,
  `exam_info_id` mediumint(8) unsigned DEFAULT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `pay_time` datetime NOT NULL,
  `notice` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `query_index` (`id`,`exam_info_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exam_results`
--

DROP TABLE IF EXISTS `exam_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_results` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '自增键',
  `user_id` int(64) NOT NULL COMMENT '参加考试的考生id',
  `exam_info_id` int(64) NOT NULL COMMENT '参加考试的id',
  `results` float(5,1) DEFAULT NULL,
  `is_pass` tinyint(1) DEFAULT '1' COMMENT '考试是否通过.0通过,1未通过',
  `company_id` int(64) NOT NULL COMMENT '用户所属企业id',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '考生开始考试时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '强制结束时间',
  `commit_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '考生交卷时间',
  `num_times` int(64) NOT NULL COMMENT '考生参加同一个考试的次数',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  KEY `index_name` (`user_id`),
  KEY `commit_time` (`commit_time`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `exam_info_id` (`exam_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=751546 DEFAULT CHARSET=utf8 COMMENT='考生考试结果记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exam_results_backup`
--

DROP TABLE IF EXISTS `exam_results_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_results_backup` (
  `id` int(64) NOT NULL DEFAULT '0' COMMENT '自增键',
  `user_id` int(64) NOT NULL COMMENT '参加考试的考生id',
  `exam_info_id` int(64) NOT NULL COMMENT '参加考试的id',
  `results` int(4) DEFAULT '10' COMMENT '成绩',
  `is_pass` tinyint(1) DEFAULT '1' COMMENT '考试是否通过.0通过,1未通过',
  `company_id` int(64) NOT NULL COMMENT '用户所属企业id',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '考生开始考试时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '强制结束时间',
  `commit_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '考生交卷时间',
  `num_times` int(64) NOT NULL COMMENT '考生参加同一个考试的次数',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exam_style_tree`
--

DROP TABLE IF EXISTS `exam_style_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_style_tree` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '自增键',
  `name` char(64) NOT NULL COMMENT '考试分类名称',
  `pId` int(64) DEFAULT '0' COMMENT '父级部门id.0表示是个根节点',
  `company_id` int(64) DEFAULT NULL COMMENT '所属公司id',
  `status` enum('0','1') DEFAULT '0' COMMENT '状态.0正常,1禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9407 DEFAULT CHARSET=utf8mb4 COMMENT='考试分类树表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exam_test_record`
--

DROP TABLE IF EXISTS `exam_test_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_test_record` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '自增键',
  `exam_results_id` int(64) NOT NULL COMMENT '关联考试记录id',
  `test_id` int(64) NOT NULL COMMENT '试题id',
  `test_ans` text COMMENT '考生所填答案',
  `status` enum('0','1') DEFAULT '0' COMMENT '是否是已交卷状态.0为未交卷,1为已交卷',
  PRIMARY KEY (`id`),
  KEY `exam_results_id` (`exam_results_id`),
  KEY `index_name` (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3204995 DEFAULT CHARSET=utf8 COMMENT='记录考生所解答的每一道题的详细信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exam_tree`
--

DROP TABLE IF EXISTS `exam_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_tree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `pId` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exam_user`
--

DROP TABLE IF EXISTS `exam_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_user` (
  `id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `exam_info_id` int(64) NOT NULL,
  `company_id` int(64) NOT NULL,
  `user_id` int(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72013 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `examinees`
--

DROP TABLE IF EXISTS `examinees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examinees` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '自增键',
  `exam_info_id` int(64) NOT NULL COMMENT '与exam_info表关联的id',
  `company_id` int(64) NOT NULL COMMENT '所属企业id',
  `user_ids` varchar(1024) DEFAULT NULL COMMENT '关联用户的所有id,用逗号分隔',
  `department_ids` mediumtext COMMENT '关联部门的所有id,用逗号分隔',
  `is_all` enum('0','1') DEFAULT '0' COMMENT '是否全员.0是,1否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_info_id` (`exam_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15497 DEFAULT CHARSET=utf8 COMMENT='考生与考试关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ext_paper_test`
--

DROP TABLE IF EXISTS `ext_paper_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_paper_test` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '自增键',
  `paper_info_id` int(64) NOT NULL COMMENT '所属试卷的id',
  `test_seq` int(4) NOT NULL COMMENT '试题在试卷中的顺序',
  `test_type` tinyint(1) NOT NULL COMMENT '题型.1代表单选,2代表多选,3代表判断,4代表填空,5代表问答',
  `test_tittle` mediumtext NOT NULL COMMENT '题型标题',
  `test_peer_score` float(5,1) NOT NULL,
  `has_option_peer_score` enum('1','0') DEFAULT '0',
  `option_peer_score` float(5,1) DEFAULT NULL,
  `test_classify_ids` text COMMENT '试题分类ids',
  `is_avg` enum('0','1') DEFAULT NULL COMMENT '是否平均抽取,0表示是,1表示否',
  `hard` char(32) NOT NULL COMMENT '试题难度分布',
  `test_ids` mediumtext NOT NULL COMMENT '每一道题的id,用逗号做分隔',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6513 DEFAULT CHARSET=utf8 COMMENT='抽题组卷类型的题型设置信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ext_paper_test_backup`
--

DROP TABLE IF EXISTS `ext_paper_test_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_paper_test_backup` (
  `id` int(64) NOT NULL DEFAULT '0' COMMENT '自增键',
  `paper_info_id` int(64) NOT NULL COMMENT '所属试卷的id',
  `test_seq` int(4) NOT NULL COMMENT '试题在试卷中的顺序',
  `test_type` tinyint(1) NOT NULL COMMENT '题型.1代表单选,2代表多选,3代表判断,4代表填空,5代表问答',
  `test_tittle` mediumtext CHARACTER SET utf8 NOT NULL COMMENT '题型标题',
  `test_peer_score` int(4) NOT NULL COMMENT '每题分数',
  `test_classify_ids` text CHARACTER SET utf8 COMMENT '试题分类ids',
  `is_avg` enum('0','1') CHARACTER SET utf8 DEFAULT NULL COMMENT '是否平均抽取,0表示是,1表示否',
  `hard` char(32) CHARACTER SET utf8 NOT NULL COMMENT '试题难度分布',
  `test_ids` mediumtext CHARACTER SET utf8 NOT NULL COMMENT '每一道题的id,用逗号做分隔',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file_info`
--

DROP TABLE IF EXISTS `file_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(40) DEFAULT NULL,
  `file_type` varchar(20) DEFAULT NULL,
  `file_size` mediumint(8) unsigned DEFAULT NULL,
  `file_url` text,
  `pId` int(10) unsigned NOT NULL DEFAULT '0',
  `view` tinyint(1) DEFAULT '0',
  `download` tinyint(1) DEFAULT '0',
  `visible_dep` varchar(255) DEFAULT NULL,
  `visible_user` varchar(255) DEFAULT NULL,
  `company_id` mediumint(8) unsigned NOT NULL,
  `creater` int(10) unsigned NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=694 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fix_paper_test`
--

DROP TABLE IF EXISTS `fix_paper_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fix_paper_test` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '自增键',
  `paper_info_id` int(64) NOT NULL COMMENT '所属试卷的id',
  `test_seq` int(4) NOT NULL COMMENT '试题在试卷中的顺序',
  `test_type` tinyint(1) NOT NULL COMMENT '题型.1代表单选,2代表多选,3代表判断,4代表填空,5代表问答',
  `test_tittle` mediumtext NOT NULL COMMENT '题型标题',
  `test_peer_score` float(5,1) NOT NULL,
  `has_option_peer_score` enum('1','0') DEFAULT '0',
  `option_peer_score` float(5,1) DEFAULT '0.0',
  `test_ids` mediumtext NOT NULL COMMENT '每一道题的id,用逗号做分隔',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19744 DEFAULT CHARSET=utf8 COMMENT='组卷试题类型的题型设置信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fix_paper_test_backup1`
--

DROP TABLE IF EXISTS `fix_paper_test_backup1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fix_paper_test_backup1` (
  `id` int(64) NOT NULL DEFAULT '0' COMMENT '自增键',
  `paper_info_id` int(64) NOT NULL COMMENT '所属试卷的id',
  `test_seq` int(4) NOT NULL COMMENT '试题在试卷中的顺序',
  `test_type` tinyint(1) NOT NULL COMMENT '题型.1代表单选,2代表多选,3代表判断,4代表填空,5代表问答',
  `test_tittle` mediumtext CHARACTER SET utf8 NOT NULL COMMENT '题型标题',
  `test_peer_score` float(5,1) NOT NULL,
  `has_option_peer_score` enum('1','0') CHARACTER SET utf8 DEFAULT '0',
  `option_peer_score` float(5,1) DEFAULT NULL,
  `test_ids` mediumtext CHARACTER SET utf8 NOT NULL COMMENT '每一道题的id,用逗号做分隔'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paper_info`
--

DROP TABLE IF EXISTS `paper_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper_info` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '自增键',
  `company_id` int(64) NOT NULL COMMENT '所属公司id',
  `paper_name` char(32) NOT NULL COMMENT '试卷名称',
  `paper_style` int(64) DEFAULT '0' COMMENT '试卷分类id',
  `paper_type` enum('1','2','3') DEFAULT '1' COMMENT '组卷方式,1代表选题组卷,2代表抽题组卷,3随机组卷',
  `total_score` float(5,1) DEFAULT '100.0',
  `status` enum('0','1') DEFAULT '0' COMMENT '试卷状态,0正常,1禁用',
  `create_user_id` int(64) NOT NULL COMMENT '试卷创建人id',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18733 DEFAULT CHARSET=utf8 COMMENT='试卷信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paper_info_backup`
--

DROP TABLE IF EXISTS `paper_info_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper_info_backup` (
  `id` int(64) NOT NULL DEFAULT '0' COMMENT '自增键',
  `company_id` int(64) NOT NULL COMMENT '所属公司id',
  `paper_name` char(32) CHARACTER SET utf8 NOT NULL COMMENT '试卷名称',
  `paper_style` int(64) DEFAULT '0' COMMENT '试卷分类id',
  `paper_type` enum('1','2','3') CHARACTER SET utf8 DEFAULT '1' COMMENT '组卷方式,1代表选题组卷,2代表抽题组卷,3随机组卷',
  `total_score` int(4) DEFAULT '100' COMMENT '试卷总分',
  `status` enum('0','1') CHARACTER SET utf8 DEFAULT '0' COMMENT '试卷状态,0正常,1禁用',
  `create_user_id` int(64) NOT NULL COMMENT '试卷创建人id',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paper_style_tree`
--

DROP TABLE IF EXISTS `paper_style_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper_style_tree` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '自增键',
  `paper_style_name` char(64) NOT NULL COMMENT '试卷分类名称',
  `pId` int(64) DEFAULT '0' COMMENT '父级部门id.0表示是个根节点',
  `company_id` int(64) DEFAULT NULL COMMENT '所属公司id',
  `status` enum('0','1') DEFAULT '0' COMMENT '状态.0正常,1禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11458 DEFAULT CHARSET=utf8mb4 COMMENT='试卷分类树表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paper_tree`
--

DROP TABLE IF EXISTS `paper_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper_tree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `pId` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rand_paper_test_ids`
--

DROP TABLE IF EXISTS `rand_paper_test_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rand_paper_test_ids` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '自增键',
  `rand_paper_test_info_id` int(64) NOT NULL COMMENT '所属随机试卷行数据的id',
  `exam_results_id` int(64) NOT NULL COMMENT '关联exam_results数据的id',
  `test_ids` mediumtext NOT NULL COMMENT '每一道题的id,用逗号做分隔',
  PRIMARY KEY (`id`),
  KEY `rand_paper_test_info_id` (`rand_paper_test_info_id`),
  KEY `exam_results_id` (`exam_results_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1023134 DEFAULT CHARSET=utf8 COMMENT='随机组卷类型的题型设置信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rand_paper_test_info`
--

DROP TABLE IF EXISTS `rand_paper_test_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rand_paper_test_info` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '自增键',
  `paper_info_id` int(64) NOT NULL COMMENT '所属试卷的id',
  `test_seq` int(4) NOT NULL COMMENT '试题在试卷中的顺序',
  `test_type` tinyint(1) NOT NULL COMMENT '题型.1代表单选,2代表多选,3代表判断,4代表填空,5代表问答',
  `test_tittle` mediumtext NOT NULL COMMENT '题型标题',
  `test_peer_score` float(5,1) NOT NULL,
  `has_option_peer_score` enum('1','0') DEFAULT '0',
  `option_peer_score` float(5,1) DEFAULT NULL,
  `test_classify_ids` mediumtext NOT NULL COMMENT '试题分类ids',
  `is_avg` enum('0','1') DEFAULT NULL COMMENT '是否平均抽取,0表示是,1表示否',
  `hard` char(32) NOT NULL COMMENT '试题难度分布',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14208 DEFAULT CHARSET=utf8 COMMENT='随机组卷类型的题型设置基本信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rand_paper_test_info_backup_1`
--

DROP TABLE IF EXISTS `rand_paper_test_info_backup_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rand_paper_test_info_backup_1` (
  `id` int(64) NOT NULL DEFAULT '0' COMMENT '自增键',
  `paper_info_id` int(64) NOT NULL COMMENT '所属试卷的id',
  `test_seq` int(4) NOT NULL COMMENT '试题在试卷中的顺序',
  `test_type` tinyint(1) NOT NULL COMMENT '题型.1代表单选,2代表多选,3代表判断,4代表填空,5代表问答',
  `test_tittle` mediumtext CHARACTER SET utf8 NOT NULL COMMENT '题型标题',
  `test_peer_score` float(5,1) NOT NULL,
  `has_option_peer_score` enum('1','0') CHARACTER SET utf8 DEFAULT '0',
  `option_peer_score` float(5,1) DEFAULT NULL,
  `test_classify_ids` mediumtext CHARACTER SET utf8 NOT NULL COMMENT '试题分类ids',
  `is_avg` enum('0','1') CHARACTER SET utf8 DEFAULT NULL COMMENT '是否平均抽取,0表示是,1表示否',
  `hard` char(32) CHARACTER SET utf8 NOT NULL COMMENT '试题难度分布',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skip_login_config`
--

DROP TABLE IF EXISTS `skip_login_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skip_login_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(64) NOT NULL,
  `company_id` int(11) NOT NULL,
  `uname_required` int(11) DEFAULT '2',
  `name_required` int(11) DEFAULT '2',
  `gender_required` int(11) DEFAULT '2',
  `email_required` int(11) DEFAULT '2',
  `phone_required` int(11) DEFAULT '2',
  `cno_required` int(11) DEFAULT '2',
  `position_required` int(11) DEFAULT '2',
  `notice_required` int(11) DEFAULT '2',
  `orders` varchar(20) DEFAULT NULL,
  `can_sel_dep` tinyint(1) DEFAULT '0',
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1032 DEFAULT CHARSET=utf8 COMMENT='免登录用户信息设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub_admin`
--

DROP TABLE IF EXISTS `sub_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_admin` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `company_id` int(64) NOT NULL,
  `allow_user_mgr` tinyint(4) DEFAULT '0',
  `allow_user_add` tinyint(4) DEFAULT '0',
  `allow_user_reg` tinyint(4) DEFAULT '0',
  `allow_user_pay_set` tinyint(4) DEFAULT '0',
  `allow_sub_admin_mgr` tinyint(4) DEFAULT '0',
  `allow_paper_add` tinyint(4) DEFAULT '0',
  `allow_addtestqm` tinyint(4) DEFAULT '0',
  `allow_showtestqm` tinyint(4) DEFAULT '0',
  `allow_paper_mgr` tinyint(4) DEFAULT '0',
  `allow_exam_mgr` tinyint(4) DEFAULT '0',
  `allow_result_mgr` tinyint(4) DEFAULT '0',
  `allow_analysis_exam` tinyint(4) DEFAULT '0',
  `allow_modify` tinyint(4) DEFAULT '0',
  `allow_file_manager` tinyint(1) DEFAULT '0',
  `allow_pay_center` tinyint(4) DEFAULT '0',
  `allow_transaction_record` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=671 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub_admin_data_right`
--

DROP TABLE IF EXISTS `sub_admin_data_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_admin_data_right` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `staff_class_ids` text,
  `question_class_ids` text,
  `paper_class_ids` text,
  `exam_class_ids` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_tree`
--

DROP TABLE IF EXISTS `test_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_tree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `pId` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testqm`
--

DROP TABLE IF EXISTS `testqm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testqm` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '自增健',
  `cop_id` int(64) NOT NULL COMMENT '公司企业id',
  `creater` char(64) NOT NULL COMMENT '创建者',
  `status` enum('enable','disable') DEFAULT 'enable' COMMENT '考题状态',
  `classification` char(64) NOT NULL COMMENT '考题分类',
  `difficult` enum('simple','middle','hard') NOT NULL COMMENT '考题难度',
  `type` char(64) NOT NULL COMMENT '考题类型',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_mod_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tab_num` char(16) NOT NULL COMMENT '选项数量',
  `position` char(128) NOT NULL COMMENT '考题所在位置',
  `picture_location` char(128) DEFAULT NULL COMMENT '图片位置',
  `notice` char(64) DEFAULT NULL,
  `is_encrypt` int(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cop_id` (`cop_id`),
  KEY `classification` (`classification`),
  KEY `difficult` (`difficult`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=238752 DEFAULT CHARSET=utf8 COMMENT='考题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tests_class`
--

DROP TABLE IF EXISTS `tests_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests_class` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '自增键',
  `test_name` char(64) NOT NULL COMMENT '试题分类名称',
  `pId` int(64) DEFAULT '0' COMMENT '父级试题分类id.0表示是个根节点',
  `company_id` int(64) DEFAULT NULL COMMENT '所属公司id',
  `status` enum('0','1') DEFAULT '0' COMMENT '状态.0正常,1禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23724 DEFAULT CHARSET=utf8mb4 COMMENT='试题分类树表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction_record`
--

DROP TABLE IF EXISTS `transaction_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` char(64) NOT NULL,
  `company_id` int(10) unsigned NOT NULL COMMENT '公司Id',
  `name` char(64) NOT NULL COMMENT '交易名称',
  `quantity` int(10) unsigned DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL COMMENT '交易金额',
  `order_time` datetime NOT NULL COMMENT '订单时间',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `notice` char(64) DEFAULT NULL COMMENT '备注，预留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=694 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_exam_log`
--

DROP TABLE IF EXISTS `user_exam_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_exam_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `exam_info_id` int(11) DEFAULT NULL,
  `device` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=979206 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `login_is_succ` int(11) DEFAULT NULL,
  `login_device` int(11) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_ip` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1036353 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_login_new`
--

DROP TABLE IF EXISTS `user_login_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_new` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned DEFAULT NULL,
  `company_id` smallint(5) unsigned DEFAULT NULL,
  `login_is_succ` tinyint(4) DEFAULT NULL,
  `login_device` tinyint(4) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login_time_index` (`id`,`company_id`,`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1763393 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_page_view_last`
--

DROP TABLE IF EXISTS `user_page_view_last`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_page_view_last` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `view_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_name` (`user_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3160427 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_pay`
--

DROP TABLE IF EXISTS `user_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_pay` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '自增键',
  `company_id` int(64) NOT NULL COMMENT '企业id',
  `department_id` int(11) NOT NULL COMMENT '企业部门ID',
  `pay_required` int(11) DEFAULT '0',
  `price` decimal(6,2) NOT NULL COMMENT '支付金额',
  `pingpp_url` char(255) DEFAULT NULL COMMENT 'ping++渠道链接',
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='用户支付设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_priv`
--

DROP TABLE IF EXISTS `user_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_priv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `style` int(11) DEFAULT NULL,
  `priv` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '自增键',
  `user_name` char(64) NOT NULL COMMENT '登录用户名',
  `surname` char(64) NOT NULL COMMENT '用户姓名',
  `email` char(64) DEFAULT NULL COMMENT '用户联系邮箱',
  `is_email_verified` tinyint(1) DEFAULT '0' COMMENT '邮箱验证是否通过.0未通过,1通过',
  `company_id` int(64) NOT NULL COMMENT '用户所属企业的id',
  `status` enum('0','1') DEFAULT '0' COMMENT '用户状态.0正常,1禁用',
  `role` char(16) NOT NULL DEFAULT 'staff' COMMENT '用户角色',
  `position` char(32) DEFAULT NULL,
  `identity_card` char(32) DEFAULT NULL COMMENT '身份证号码',
  `phone` char(32) DEFAULT NULL COMMENT '联系电话',
  `sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '性别.0女,1男',
  `password` char(64) NOT NULL COMMENT '密码',
  `session_id` char(64) DEFAULT NULL COMMENT 'session id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `notice` char(64) DEFAULT NULL,
  `push_notification` tinyint(4) DEFAULT '0' COMMENT '是否推送新功能通知',
  `creater` int(64) DEFAULT NULL,
  `wechat_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_name_2` (`user_name`,`password`),
  UNIQUE KEY `wechat_id` (`wechat_id`),
  KEY `notice` (`notice`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=530072 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-02 15:02:08
