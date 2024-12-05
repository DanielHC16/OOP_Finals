-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: finalsoop
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `college`
--

DROP TABLE IF EXISTS `college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `college` (
  `college_code` varchar(10) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_opened` date DEFAULT NULL,
  `date_closed` date DEFAULT NULL,
  `status` char(1) DEFAULT 'A',
  PRIMARY KEY (`college_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college`
--

LOCK TABLES `college` WRITE;
/*!40000 ALTER TABLE `college` DISABLE KEYS */;
INSERT INTO `college` VALUES ('CET','College of Engineering and Technology','1970-06-01','9999-12-31','A'),('CISTM','College of Information, Systems and Technology Management','2024-09-01','9999-12-31','A');
/*!40000 ALTER TABLE `college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_code` varchar(10) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `college_code` varchar(10) NOT NULL,
  `date_opened` date DEFAULT NULL,
  `date_closed` date DEFAULT NULL,
  `status` char(1) DEFAULT 'A',
  PRIMARY KEY (`course_code`),
  KEY `course_college_fk` (`college_code`),
  CONSTRAINT `course_college_fk` FOREIGN KEY (`college_code`) REFERENCES `college` (`college_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('BSCS-CS','BSComputer Studies-Computer Science','CET','2000-06-01','9999-12-31','A'),('BSCS-IT','BSComputer Studies-Information Technology','CISTM','2000-06-01','9999-12-31','A');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` varchar(10) NOT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `cp_num` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `bday` date DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `date_started` date DEFAULT NULL,
  `date_resigned` date DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('E001','Regala','Richard','rregala@yahoo.com','M','09987654321','Manila',NULL,'A','1994-06-01','9999-12-31'),('E002','Santos','Rene','rsantos@yahoo.com','M','09997654321','Manila',NULL,'A','2000-06-01','9999-12-31');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `syear` varchar(10) NOT NULL,
  `semester` varchar(1) NOT NULL,
  `student_no` varchar(10) NOT NULL,
  `subject_code` varchar(10) NOT NULL,
  `block_no` varchar(15) NOT NULL,
  `grade` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`syear`,`semester`,`student_no`,`subject_code`,`block_no`),
  KEY `semester_fk1` (`semester`),
  KEY `student_no_fk` (`student_no`),
  KEY `subject_code_fk1` (`subject_code`),
  CONSTRAINT `semester_fk1` FOREIGN KEY (`semester`) REFERENCES `semester` (`semester`),
  CONSTRAINT `student_no_fk` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`),
  CONSTRAINT `subject_code_fk1` FOREIGN KEY (`subject_code`) REFERENCES `subject` (`subject_code`),
  CONSTRAINT `syear_fk1` FOREIGN KEY (`syear`) REFERENCES `schoolyear` (`syear`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES ('2023-2024','1','12345','OOP','CS21',3.00),('2023-2024','1','12346','OOP','CS21',2.75);
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schoolyear`
--

DROP TABLE IF EXISTS `schoolyear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schoolyear` (
  `syear` varchar(10) NOT NULL,
  PRIMARY KEY (`syear`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schoolyear`
--

LOCK TABLES `schoolyear` WRITE;
/*!40000 ALTER TABLE `schoolyear` DISABLE KEYS */;
INSERT INTO `schoolyear` VALUES ('2023-2024'),('2024-2025');
/*!40000 ALTER TABLE `schoolyear` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semester` (
  `semester` varchar(1) NOT NULL,
  PRIMARY KEY (`semester`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES ('1'),('2'),('3'),('S');
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_no` varchar(10) NOT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `course_code` varchar(10) NOT NULL,
  `cp_num` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `bday` date DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `date_started` date DEFAULT NULL,
  `date_graduated` date DEFAULT NULL,
  PRIMARY KEY (`student_no`),
  KEY `student_course_fk` (`course_code`),
  CONSTRAINT `student_course_fk` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('12345','Atienza','Francis','fcatienza@yahoo.com','M','BSCS-CS','0998123456','Cavite','2000-01-12','I','2020-09-01','2024-07-31'),('12346','Aquino','Kris','aquinok@yahoo.com','F','BSCS-CS','0998654321','Tarlac','2000-02-14','A','2022-09-01','9999-12-31');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `student_grades_view`
--

DROP TABLE IF EXISTS `student_grades_view`;
/*!50001 DROP VIEW IF EXISTS `student_grades_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `student_grades_view` AS SELECT 
 1 AS `school_year`,
 1 AS `semester`,
 1 AS `student_no`,
 1 AS `student_name`,
 1 AS `subject_code`,
 1 AS `subject_description`,
 1 AS `grade`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `subject_code` varchar(10) NOT NULL,
  `description` varchar(200) NOT NULL,
  `units` int DEFAULT '3',
  `curriculum` varchar(10) DEFAULT '2000',
  `college_code` varchar(10) NOT NULL,
  `status` char(1) DEFAULT 'A',
  `date_opened` date DEFAULT NULL,
  `date_closed` date DEFAULT NULL,
  PRIMARY KEY (`subject_code`,`college_code`),
  KEY `subject_college_fk` (`college_code`),
  CONSTRAINT `subject_college_fk` FOREIGN KEY (`college_code`) REFERENCES `college` (`college_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('OOP','Object Oriented Programming',3,'2010','CISTM','A','2024-09-01','9999-12-31');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_schedule`
--

DROP TABLE IF EXISTS `subject_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_schedule` (
  `syear` varchar(10) NOT NULL,
  `semester` varchar(1) NOT NULL,
  `college_code` varchar(10) NOT NULL,
  `block_no` varchar(15) NOT NULL,
  `subject_code` varchar(10) NOT NULL,
  `day` varchar(10) NOT NULL,
  `time` varchar(20) NOT NULL,
  `room` varchar(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  `sequence_no` int NOT NULL DEFAULT '1',
  `employee_id` varchar(10) DEFAULT 'TBA',
  PRIMARY KEY (`syear`,`semester`,`block_no`,`subject_code`,`sequence_no`,`college_code`),
  KEY `semester_fk` (`semester`),
  KEY `college_code_fk2` (`college_code`),
  KEY `subject_code_fk` (`subject_code`),
  KEY `employee_id_fk` (`employee_id`),
  CONSTRAINT `college_code_fk2` FOREIGN KEY (`college_code`) REFERENCES `college` (`college_code`),
  CONSTRAINT `employee_id_fk` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `semester_fk` FOREIGN KEY (`semester`) REFERENCES `semester` (`semester`),
  CONSTRAINT `subject_code_fk` FOREIGN KEY (`subject_code`) REFERENCES `subject` (`subject_code`),
  CONSTRAINT `syear_fk` FOREIGN KEY (`syear`) REFERENCES `schoolyear` (`syear`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_schedule`
--

LOCK TABLES `subject_schedule` WRITE;
/*!40000 ALTER TABLE `subject_schedule` DISABLE KEYS */;
INSERT INTO `subject_schedule` VALUES ('2023-2024','1','CISTM','CS21','OOP','S','8:00-10:00','GCA301','F2F',1,'E001');
/*!40000 ALTER TABLE `subject_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `subject_schedule_view`
--

DROP TABLE IF EXISTS `subject_schedule_view`;
/*!50001 DROP VIEW IF EXISTS `subject_schedule_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `subject_schedule_view` AS SELECT 
 1 AS `school_year`,
 1 AS `semester`,
 1 AS `college_code`,
 1 AS `block_no`,
 1 AS `subject_code`,
 1 AS `subject_description`,
 1 AS `day`,
 1 AS `time`,
 1 AS `room`,
 1 AS `type`,
 1 AS `sequence_no`,
 1 AS `employee_id`,
 1 AS `faculty_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `student_grades_view`
--

/*!50001 DROP VIEW IF EXISTS `student_grades_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_grades_view` AS select `g`.`syear` AS `school_year`,`g`.`semester` AS `semester`,`g`.`student_no` AS `student_no`,concat(`s`.`lastname`,', ',`s`.`firstname`) AS `student_name`,`g`.`subject_code` AS `subject_code`,`sub`.`description` AS `subject_description`,`g`.`grade` AS `grade` from ((`grades` `g` join `student` `s` on((`g`.`student_no` = `s`.`student_no`))) join `subject` `sub` on((`g`.`subject_code` = `sub`.`subject_code`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `subject_schedule_view`
--

/*!50001 DROP VIEW IF EXISTS `subject_schedule_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `subject_schedule_view` AS select `ss`.`syear` AS `school_year`,`ss`.`semester` AS `semester`,`ss`.`college_code` AS `college_code`,`ss`.`block_no` AS `block_no`,`ss`.`subject_code` AS `subject_code`,`s`.`description` AS `subject_description`,`ss`.`day` AS `day`,`ss`.`time` AS `time`,`ss`.`room` AS `room`,`ss`.`type` AS `type`,`ss`.`sequence_no` AS `sequence_no`,`ss`.`employee_id` AS `employee_id`,concat(`e`.`lastname`,', ',`e`.`firstname`) AS `faculty_name` from ((`subject_schedule` `ss` join `subject` `s` on((`ss`.`subject_code` = `s`.`subject_code`))) join `employee` `e` on((`ss`.`employee_id` = `e`.`employee_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-05 11:34:33
