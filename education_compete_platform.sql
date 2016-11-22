-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: education_compete_platform_production
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` int(11) DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `offline` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,'2016年上海市高等职业院校信息化教学大赛暨2016年全国职业院校信息化教学大赛上海市选拔赛',NULL,'2016-07-16 00:00:00','2016-11-21 18:49:59','2016-11-21 18:49:59',0,'InfoCompetition::Activity','2016上海高职院校信息化教学大赛',NULL),(2,'2016年上海高等职业院校电子信息大类教师说课比赛',NULL,'2016-07-16 00:00:00','2016-11-21 18:49:59','2016-11-21 18:49:59',0,'TalkCompetition::Activity','2016上海高职院校电子信息说课比赛',NULL);
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulletins`
--

DROP TABLE IF EXISTS `bulletins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulletins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `activity_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_bulletins_on_activity_id` (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulletins`
--

LOCK TABLES `bulletins` WRITE;
/*!40000 ALTER TABLE `bulletins` DISABLE KEYS */;
INSERT INTO `bulletins` VALUES (1,'【公告】2016年上海市高等职业院校信息化教学大赛暨2016年全国职业院校信息化教学大赛上海市选拔赛','2016年上海市高等职业院校信息化教学大赛暨2016年全国职业院校信息化教学大赛上海市选拔赛，比赛时间:2016 年 8 月 22 日， 比赛地点:上海电子信息职业技术学院徐汇校区，比赛项目分为信息化教学设计比赛、信息化教学设计比赛、信息化实训教学比赛。参赛内容为高等职业学校公共基础课的,应参照相关课程“十二 五”职业教育国家规划教材(版本不限)进行制作和设计。参赛作品为职业生涯规划、职业礼仪、职业素质教育、心理健康教 育、就业与创业指导等课程教学内容的,可参加职业素养与就业创业能力 课程组比赛。参赛内容为专业技能课内容的,应依据教育部已发布的《高等职业 学校专业教学标准(试行)》的教学要求,参照相关课程“十二五”职业教 育国家规划教材(版本不限)进行制作和设计。',1,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(2,'【公告】2016年上海高等职业院校电子信息大类教师说课比赛','2016年上海高等职业院校电子信息大类教师说课比赛方案，比赛时间:决赛:2016 年 9 月,具体时间另行通知，比赛地点:初赛:各校自行举办，决赛:上海电子信息职业技术学院徐汇校区。参赛教师对某门课程设计的理念与思路,课程改革的逻辑起点,课程的 创新点,课程建设的预期成果等内容的总体设计,含课程定位、课程目标、 学生情况、教法学法、教材学材,教学过程、教学效果的评价等方面的分析, 体现教师的课程设计与实施能力;重点厘清“教学目标与教学内容、教学目 标与教学重点、教学目标与教学方法、教学目标与教学评价”等关系。',2,'2016-11-21 18:49:59','2016-11-21 18:49:59');
/*!40000 ALTER TABLE `bulletins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_departments_on_school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imageable_id` int(11) DEFAULT NULL,
  `imageable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_file_size` int(11) DEFAULT NULL,
  `file_updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_images_on_imageable_type_and_imageable_id` (`imageable_type`,`imageable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_competition_opuses`
--

DROP TABLE IF EXISTS `info_competition_opuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_competition_opuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recruit_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_info_competition_opuses_on_recruit_id` (`recruit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_competition_opuses`
--

LOCK TABLES `info_competition_opuses` WRITE;
/*!40000 ALTER TABLE `info_competition_opuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_competition_opuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_competition_recruits`
--

DROP TABLE IF EXISTS `info_competition_recruits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_competition_recruits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `project` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `cooperater_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cooperater_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cooperater_3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school_3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school_person` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_score` int(11) DEFAULT '0',
  `avg_score` float DEFAULT NULL,
  `score_count` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_info_competition_recruits_on_player_id` (`player_id`),
  KEY `index_info_competition_recruits_on_school_id` (`school_id`),
  KEY `index_info_competition_recruits_on_activity_id` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_competition_recruits`
--

LOCK TABLES `info_competition_recruits` WRITE;
/*!40000 ALTER TABLE `info_competition_recruits` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_competition_recruits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `item_array` text COLLATE utf8_unicode_ci,
  `expert_id` int(11) DEFAULT NULL,
  `recruitable_id` int(11) DEFAULT NULL,
  `recruitable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_marks_on_expert_id` (`expert_id`),
  KEY `index_marks_on_recruitable_type_and_recruitable_id` (`recruitable_type`,`recruitable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mediaable_id` int(11) DEFAULT NULL,
  `mediaable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_file_size` int(11) DEFAULT NULL,
  `file_updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_media_on_mediaable_type_and_mediaable_id` (`mediaable_type`,`mediaable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `activity_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `summary` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_news_on_activity_id` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opus`
--

DROP TABLE IF EXISTS `opus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opus`
--

LOCK TABLES `opus` WRITE;
/*!40000 ALTER TABLE `opus` DISABLE KEYS */;
/*!40000 ALTER TABLE `opus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papers`
--

DROP TABLE IF EXISTS `papers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `papers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paper_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paperable_id` int(11) DEFAULT NULL,
  `paperable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_file_size` int(11) DEFAULT NULL,
  `file_updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_papers_on_paperable_type_and_paperable_id` (`paperable_type`,`paperable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papers`
--

LOCK TABLES `papers` WRITE;
/*!40000 ALTER TABLE `papers` DISABLE KEYS */;
/*!40000 ALTER TABLE `papers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_infos`
--

DROP TABLE IF EXISTS `player_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `nation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `birth` date DEFAULT NULL,
  `professional_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `degree` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `special` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_player_infos_on_player_id` (`player_id`),
  KEY `index_player_infos_on_school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_infos`
--

LOCK TABLES `player_infos` WRITE;
/*!40000 ALTER TABLE `player_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_players_on_phone` (`phone`),
  UNIQUE KEY `index_players_on_reset_password_token` (`reset_password_token`),
  KEY `index_players_on_school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20160704101826'),('20160704103345'),('20160704104242'),('20160704104346'),('20160704104615'),('20160704113516'),('20160704152737'),('20160704183100'),('20160705015700'),('20160705025438'),('20160705095052'),('20160705124717'),('20160705135319'),('20160705141155'),('20160705153246'),('20160705153254'),('20160705153302'),('20160705153311'),('20160705155409'),('20160705160831'),('20160705161548'),('20160706043949'),('20160706044442'),('20160706044947'),('20160706054446'),('20160706073347'),('20160706105100'),('20160706131525'),('20160706132440'),('20160706132513'),('20160707080915'),('20160707080948'),('20160707182423'),('20160715161858'),('20160716102722'),('20160716140723'),('20160716140847'),('20160716142409'),('20160811221327'),('20160811221936'),('20160811223257'),('20160811224048'),('20160816060517'),('20160817111038'),('20160817111046'),('20160823134904'),('20160823200850'),('20160824082257'),('20160906025139');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools`
--

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` VALUES (1,'上海健康医学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(2,'上海出版印刷高等专科学校',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(3,'上海公安高等专科学校',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(4,'上海工艺美术职业学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(5,'上海旅游高等专科学校',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(6,'上海电子信息职业技术学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(7,'上海农林职业技术学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(8,'上海行健职业学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(9,'上海海事职业技术学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(10,'上海交通职业技术学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(11,'上海城建职业学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(12,'上海科学技术职业学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(13,'上海体育职业学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(14,'上海工会管理职业学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(15,'上海工商外国语职业学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(16,'上海立达职业技术学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(17,'上海东海职业技术学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(18,'上海工商职业技术学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(19,'上海济光职业技术学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(20,'上海中侨职业技术学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(21,'上海思博职业技术学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(22,'上海震旦职业学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(23,'上海邦德职业技术学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(24,'上海电影艺术职业学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(25,'上海民远职业技术学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(26,'上海第二工业大学高等职业技术学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(27,'上海工程技术大学高职学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(28,'上海电机学院高职学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(29,'上海商学院高等技术学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(30,'上海应用技术大学高职学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(31,'上海立信会计学院高职学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(32,'上海民航职业技术学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(33,'上海杉达学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(34,'信息化教学指导委员会',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59'),(35,'上海海事大学高等技术学院',NULL,'2016-11-21 18:49:59','2016-11-21 18:49:59');
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talk_competition_opuses`
--

DROP TABLE IF EXISTS `talk_competition_opuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talk_competition_opuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recruit_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_talk_competition_opuses_on_recruit_id` (`recruit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talk_competition_opuses`
--

LOCK TABLES `talk_competition_opuses` WRITE;
/*!40000 ALTER TABLE `talk_competition_opuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `talk_competition_opuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talk_competition_recruits`
--

DROP TABLE IF EXISTS `talk_competition_recruits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talk_competition_recruits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `school_person` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `work_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_score` int(11) DEFAULT '0',
  `avg_score` float DEFAULT NULL,
  `score_count` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_talk_competition_recruits_on_player_id` (`player_id`),
  KEY `index_talk_competition_recruits_on_school_id` (`school_id`),
  KEY `index_talk_competition_recruits_on_activity_id` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talk_competition_recruits`
--

LOCK TABLES `talk_competition_recruits` WRITE;
/*!40000 ALTER TABLE `talk_competition_recruits` DISABLE KEYS */;
/*!40000 ALTER TABLE `talk_competition_recruits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mark_id` int(11) DEFAULT NULL,
  `expert_id` int(11) DEFAULT NULL,
  `recruit_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tasks_on_mark_id` (`mark_id`),
  KEY `index_tasks_on_expert_id` (`expert_id`),
  KEY `index_tasks_on_recruit_id` (`recruit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_infos`
--

DROP TABLE IF EXISTS `user_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_card_type` int(11) DEFAULT NULL,
  `id_card` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_infos`
--

LOCK TABLES `user_infos` WRITE;
/*!40000 ALTER TABLE `user_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_phone` (`phone`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  KEY `index_users_on_school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'11111111','$2a$11$yKM3ZzxDIHdNOZBDT1A5i.RlUeQqq6tJSCrH2hDEHxu3w/cDd./gu',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2016-11-21 18:50:05','2016-11-21 18:50:05',1,NULL,NULL);
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

-- Dump completed on 2016-11-22 11:31:56
