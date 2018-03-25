-- MySQL dump 10.13  Distrib 5.7.21-20, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cs4411_hw2
-- ------------------------------------------------------
-- Server version	5.7.21-20

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
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `Course_name` varchar(100) NOT NULL DEFAULT '',
  `Course_number` varchar(10) NOT NULL DEFAULT '',
  `Credit_hours` smallint(4) unsigned NOT NULL DEFAULT '0',
  `Department` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`Course_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('Intro to Computer Science','CS1310',4,'CS');
INSERT INTO `course` VALUES ('Data Structures','CS3320',4,'CS');
INSERT INTO `course` VALUES ('Database','CS3380',3,'CS');
INSERT INTO `course` VALUES ('Discrete Mathematics','MATH2410',3,'MATH');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_report`
--

DROP TABLE IF EXISTS `grade_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_report` (
  `Student_number` int(10) unsigned NOT NULL,
  `Section_identifier` int(10) unsigned NOT NULL DEFAULT '0',
  `Grade` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`Section_identifier`),
  KEY `grade_report_student_Student_number_fk` (`Student_number`),
  CONSTRAINT `grade_report_section_Section_identifier_fk` FOREIGN KEY (`Section_identifier`) REFERENCES `section` (`Section_identifier`),
  CONSTRAINT `grade_report_student_Student_number_fk` FOREIGN KEY (`Student_number`) REFERENCES `student` (`Student_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_report`
--

LOCK TABLES `grade_report` WRITE;
/*!40000 ALTER TABLE `grade_report` DISABLE KEYS */;
INSERT INTO `grade_report` VALUES (8,85,'A');
INSERT INTO `grade_report` VALUES (8,92,'A');
INSERT INTO `grade_report` VALUES (8,102,'B');
INSERT INTO `grade_report` VALUES (17,112,'B');
INSERT INTO `grade_report` VALUES (17,119,'C');
INSERT INTO `grade_report` VALUES (8,135,'A');
/*!40000 ALTER TABLE `grade_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prerequisite`
--

DROP TABLE IF EXISTS `prerequisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prerequisite` (
  `Course_number` varchar(10) NOT NULL DEFAULT '0',
  `Prerequisite_number` varchar(10) NOT NULL DEFAULT '0',
  KEY `Course_number` (`Course_number`),
  CONSTRAINT `prerequisite_course_Course_number_fk` FOREIGN KEY (`Course_number`) REFERENCES `course` (`Course_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prerequisite`
--

LOCK TABLES `prerequisite` WRITE;
/*!40000 ALTER TABLE `prerequisite` DISABLE KEYS */;
INSERT INTO `prerequisite` VALUES ('CS3380','CS3320');
INSERT INTO `prerequisite` VALUES ('CS3380','MATH2410');
INSERT INTO `prerequisite` VALUES ('CS3320','CS1310');
/*!40000 ALTER TABLE `prerequisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `Section_identifier` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Course_number` varchar(10) NOT NULL DEFAULT '',
  `Semester` enum('Fall','Spring','Summer') NOT NULL DEFAULT 'Fall',
  `year` year(4) NOT NULL DEFAULT '2014',
  `Instructor` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Section_identifier`),
  KEY `Course_number` (`Course_number`),
  CONSTRAINT `section_course_Course_number_fk` FOREIGN KEY (`Course_number`) REFERENCES `course` (`Course_number`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (85,'MATH2410','Fall',2007,'King');
INSERT INTO `section` VALUES (92,'CS1310','Fall',2007,'Andreson');
INSERT INTO `section` VALUES (102,'CS3320','Spring',2008,'Knuth');
INSERT INTO `section` VALUES (112,'MATH2410','Fall',2008,'Chang');
INSERT INTO `section` VALUES (119,'CS1310','Fall',2008,'Andreson');
INSERT INTO `section` VALUES (135,'CS3380','Fall',2008,'Stonen');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Student_number` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Class` int(10) unsigned NOT NULL DEFAULT '0',
  `Major` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`Student_number`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('Brown',8,2,'CS');
INSERT INTO `student` VALUES ('Smith',17,1,'CS');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-25 15:43:22
