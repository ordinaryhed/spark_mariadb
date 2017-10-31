-- MySQL dump 10.16  Distrib 10.2.9-MariaDB, for osx10.13 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	10.2.9-MariaDB

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
-- Table structure for table `tbl_approvalstatus`
--

DROP TABLE IF EXISTS `tbl_approvalstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_approvalstatus` (
  `approvalstatus_id` int(11) NOT NULL,
  `approvalstatus_name` varchar(50) NOT NULL,
  `approvalstatus_showdefinition` bit(1) NOT NULL,
  `approvalstatus_foreditorapproval` bit(1) DEFAULT NULL,
  `approvalstatus_foruserapproval` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_approvalstatus`
--

LOCK TABLES `tbl_approvalstatus` WRITE;
/*!40000 ALTER TABLE `tbl_approvalstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_approvalstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_definition`
--

DROP TABLE IF EXISTS `tbl_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_definition` (
  `def_id` int(11) NOT NULL AUTO_INCREMENT,
  `def_user_id` int(11) DEFAULT NULL,
  `def_approvalstatus_id` int(11) NOT NULL,
  `def_word` varchar(255) DEFAULT NULL,
  `def_text` varchar(4000) DEFAULT NULL,
  `def_example` varchar(4000) DEFAULT NULL,
  `def_datecreated` datetime DEFAULT NULL,
  `def_editor_id` int(11) NOT NULL,
  `def_editor_check_date` datetime DEFAULT NULL,
  `def_userlocation` varchar(50) DEFAULT NULL,
  `def_userip` varchar(50) DEFAULT NULL,
  `def_usercode` int(11) DEFAULT NULL,
  PRIMARY KEY (`def_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_definition`
--

LOCK TABLES `tbl_definition` WRITE;
/*!40000 ALTER TABLE `tbl_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_definitioncomment`
--

DROP TABLE IF EXISTS `tbl_definitioncomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_definitioncomment` (
  `defco_id` int(11) NOT NULL AUTO_INCREMENT,
  `defco_def_id` int(11) NOT NULL,
  `defco_comment` varchar(4000) NOT NULL,
  `defco_name` varchar(50) NOT NULL,
  `defco_date` datetime NOT NULL,
  PRIMARY KEY (`defco_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_definitioncomment`
--

LOCK TABLES `tbl_definitioncomment` WRITE;
/*!40000 ALTER TABLE `tbl_definitioncomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_definitioncomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_definitionlockedtoeditor`
--

DROP TABLE IF EXISTS `tbl_definitionlockedtoeditor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_definitionlockedtoeditor` (
  `dlte_id` int(11) NOT NULL AUTO_INCREMENT,
  `dlte_def_id` int(11) NOT NULL,
  `dlte_editor_id` int(11) NOT NULL,
  `dlte_lockdate` datetime NOT NULL,
  PRIMARY KEY (`dlte_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_definitionlockedtoeditor`
--

LOCK TABLES `tbl_definitionlockedtoeditor` WRITE;
/*!40000 ALTER TABLE `tbl_definitionlockedtoeditor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_definitionlockedtoeditor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_definitiontotag`
--

DROP TABLE IF EXISTS `tbl_definitiontotag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_definitiontotag` (
  `deftotag_id` int(11) NOT NULL AUTO_INCREMENT,
  `def_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`deftotag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_definitiontotag`
--

LOCK TABLES `tbl_definitiontotag` WRITE;
/*!40000 ALTER TABLE `tbl_definitiontotag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_definitiontotag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_editor`
--

DROP TABLE IF EXISTS `tbl_editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_editor` (
  `editor_id` int(11) NOT NULL AUTO_INCREMENT,
  `editor_editorlevel_id` int(11) NOT NULL,
  `editor_firstname` varchar(50) NOT NULL,
  `editor_lastname` varchar(50) NOT NULL,
  `editor_email` varchar(50) NOT NULL,
  `editor_username` varchar(50) NOT NULL,
  `editor_password` varchar(50) NOT NULL,
  PRIMARY KEY (`editor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_editor`
--

LOCK TABLES `tbl_editor` WRITE;
/*!40000 ALTER TABLE `tbl_editor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_editorlevel`
--

DROP TABLE IF EXISTS `tbl_editorlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_editorlevel` (
  `editorlevel_id` int(11) NOT NULL AUTO_INCREMENT,
  `editorlevel_name` varchar(50) NOT NULL,
  PRIMARY KEY (`editorlevel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_editorlevel`
--

LOCK TABLES `tbl_editorlevel` WRITE;
/*!40000 ALTER TABLE `tbl_editorlevel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_editorlevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_newslettermember`
--

DROP TABLE IF EXISTS `tbl_newslettermember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_newslettermember` (
  `nlm_id` int(11) NOT NULL AUTO_INCREMENT,
  `nlm_email` varchar(50) NOT NULL,
  `nlm_signupdate` datetime NOT NULL,
  PRIMARY KEY (`nlm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_newslettermember`
--

LOCK TABLES `tbl_newslettermember` WRITE;
/*!40000 ALTER TABLE `tbl_newslettermember` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_newslettermember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_synonym`
--

DROP TABLE IF EXISTS `tbl_synonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_synonym` (
  `sy_id` int(11) NOT NULL AUTO_INCREMENT,
  `sy_word` varchar(255) NOT NULL,
  PRIMARY KEY (`sy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_synonym`
--

LOCK TABLES `tbl_synonym` WRITE;
/*!40000 ALTER TABLE `tbl_synonym` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_synonym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tag`
--

DROP TABLE IF EXISTS `tbl_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_text` varchar(50) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tag`
--

LOCK TABLES `tbl_tag` WRITE;
/*!40000 ALTER TABLE `tbl_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_topdefinition`
--

DROP TABLE IF EXISTS `tbl_topdefinition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_topdefinition` (
  `topdef_id` int(11) NOT NULL AUTO_INCREMENT,
  `topdef_def_id` int(11) NOT NULL,
  `topdef_displaydate` datetime DEFAULT NULL,
  PRIMARY KEY (`topdef_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_topdefinition`
--

LOCK TABLES `tbl_topdefinition` WRITE;
/*!40000 ALTER TABLE `tbl_topdefinition` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_topdefinition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `usr_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_alias` varchar(50) DEFAULT NULL,
  `usr_email` varchar(50) DEFAULT NULL,
  `usr_emailverificationstring` varchar(50) DEFAULT NULL,
  `usr_emailverifieddate` datetime DEFAULT NULL,
  `usr_password` varchar(50) DEFAULT NULL,
  `usr_anonymousaccount` bit(1) NOT NULL,
  PRIMARY KEY (`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_votecontroller`
--

DROP TABLE IF EXISTS `tbl_votecontroller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_votecontroller` (
  `votecontroller_id` int(11) NOT NULL AUTO_INCREMENT,
  `votecontroller_def_id` int(11) NOT NULL,
  `votecontroller_vote` int(11) DEFAULT NULL,
  `votecontroller_time` datetime NOT NULL,
  `votecontroller_ip` varchar(50) NOT NULL,
  PRIMARY KEY (`votecontroller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_votecontroller`
--

LOCK TABLES `tbl_votecontroller` WRITE;
/*!40000 ALTER TABLE `tbl_votecontroller` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_votecontroller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_votes`
--

DROP TABLE IF EXISTS `tbl_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_votes` (
  `votes_def_id` int(11) NOT NULL,
  `votes_up` int(11) NOT NULL,
  `votes_down` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_votes`
--

LOCK TABLES `tbl_votes` WRITE;
/*!40000 ALTER TABLE `tbl_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_wantedword`
--

DROP TABLE IF EXISTS `tbl_wantedword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_wantedword` (
  `ww_id` int(11) NOT NULL AUTO_INCREMENT,
  `ww_word` varchar(255) DEFAULT NULL,
  `ww_comment` varchar(4000) DEFAULT NULL,
  `ww_name` varchar(50) DEFAULT NULL,
  `ww_email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ww_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_wantedword`
--

LOCK TABLES `tbl_wantedword` WRITE;
/*!40000 ALTER TABLE `tbl_wantedword` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_wantedword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_word`
--

DROP TABLE IF EXISTS `tbl_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_word` (
  `wo_id` int(11) NOT NULL AUTO_INCREMENT,
  `wo_word` varchar(255) NOT NULL,
  `wo_intro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`wo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_word`
--

LOCK TABLES `tbl_word` WRITE;
/*!40000 ALTER TABLE `tbl_word` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_word` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-30 20:09:45
