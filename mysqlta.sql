-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.8.9.0    Database: ta
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(250) NOT NULL,
  `password` varchar(32) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'vamsi1234@fau.edu','password','vamsi','javvad'),(2,'ZviRoth@fau.edu.in','password','Zvi','Roth'),(8,'Yufei Tang@fau.edu.in','password','Yufei','Tang'),(9,'Xingquan Zhu@fau.edu.in','password','Xingquan','Zhu'),(10,'XiangnanZhong@fau.edu.in','password','Xiangnan','Zhong');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(60) NOT NULL,
  `status` tinyint DEFAULT NULL,
  `department_id` int NOT NULL,
  `instructor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_course_instructors_idx` (`instructor_id`),
  KEY `course_name_index` (`course_name`),
  KEY `fk_course_department_idx` (`department_id`),
  CONSTRAINT `fk_course_instructors` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (0,'none',0,999999,0),(1,'(CEN 4356) Software Engineering',1,1,1),(2,'(CAP 3421) Analysis of Algorithms',1,1,2),(3,'(COT 2312) Intro to Data Science',1,3,3),(22,'(CEN 1286) Theory of implementation of database',1,1,12),(23,'(CAP 9351) Data mining and Machine Learning',1,3,13),(24,'(CEN 5912) Deep learning',1,4,14),(25,'(CIS 8242) advanced internet systems',1,2,15),(26,'(CDA 6382) bio imaging',1,3,16),(27,'(CNT 7382) intro to biomed engineering',1,9,17),(28,'(CEN 6371) computational foundation of ai',1,4,18);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (0,'none'),(1,'Computer Science'),(2,'Electrical Engineering'),(3,'Data Science'),(4,'Artificial Intelligence'),(9,'Environmental Engineering');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `course_id` int unsigned NOT NULL DEFAULT '0',
  `department_id` int DEFAULT '0',
  PRIMARY KEY (`id`,`course_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (0,'none','none','none','none','none',0,NULL),(1,'harikalva@fau.edu.in','password','hari','Kalva','Software Engineering',1,1),(2,'AshanPerera@fau.edu.in','password','Ashan','Perera','',0,0),(3,'BassemAlhalabi@fau.edu','password','Bassem','Alhalabi','Intro to Data Science',3,3),(12,'BehnazGhoraani@fau.edu.in','password','Behnaz','Ghoraani','Theory of implementation of database',22,1),(13,'DanielRaviv@fau.edu.in','password','Daniel','Raviv','Data mining and Machine Learning',23,3),(14,'BorivojeFurht@fau.edu.in','password','Borivoje','Furht','Deep Learning',24,4),(15,'Chang-HwanLee@fau.edu.in','password','Chang-Hwan','Lee','advanced internet systems',25,2),(16,'abhijithpadya@fau.edu.in','password','abhijith','padya','bio imaging',26,3),(17,'amymalker@fau.edu.in','password','amy','malker','intro to biomed engineering',27,9),(18,'hanchizhuang@fau.edu','password','hanchi','zhuang','computational foundation of ai',1,1);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_feedback`
--

DROP TABLE IF EXISTS `instructor_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor_feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `instructor_name` varchar(45) DEFAULT NULL,
  `performance_rating` int DEFAULT NULL,
  `TA_id` int NOT NULL,
  `technical_skill` int DEFAULT NULL,
  `communication_skill` int DEFAULT NULL,
  `overall_feedback` varchar(500) DEFAULT NULL,
  `instructor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_TA_Application_course1_idx` (`course_id`),
  KEY `fk_Instructor_feedback_tas_idx` (`TA_id`),
  CONSTRAINT `fk_TA_Application_course10` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `fk_TAs_InstructorFeedback` FOREIGN KEY (`TA_id`) REFERENCES `tas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_feedback`
--

LOCK TABLES `instructor_feedback` WRITE;
/*!40000 ALTER TABLE `instructor_feedback` DISABLE KEYS */;
INSERT INTO `instructor_feedback` VALUES (1,1,'Hari Kalva',5,1,5,5,'bad',1),(2,2,'Ashan Perera',8,2,6,7,'good',2),(5,22,'Behnaz Ghoraani',9,3,7,8,'very good',12),(31,2,'hari Kalva',9,2,3,2,'sss',1);
/*!40000 ALTER TABLE `instructor_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ta_applicant`
--

DROP TABLE IF EXISTS `ta_applicant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ta_applicant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(70) DEFAULT NULL,
  `znumber` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `znumber_UNIQUE` (`znumber`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ta_applicant`
--

LOCK TABLES `ta_applicant` WRITE;
/*!40000 ALTER TABLE `ta_applicant` DISABLE KEYS */;
INSERT INTO `ta_applicant` VALUES (1,'vamsi','javvadi','z23748100','vamsi@fau.edu','password'),(2,'Sricharan','Kontham','z23748101','charan@fau.edu','password'),(3,'madhuri','raagu','z23748102','madhuri@fau.edu','password'),(4,'ashwini','vemula','z23748103','ashmwini@fau.edu','password'),(5,'adhitya','koppula','z23748104','adhitya@fau.edu','password'),(6,'rakesh','varanasi','z23748105','rakesh@fau.edu','password'),(7,'pravallika','naraharisetti','z23748107','pravallika@fau.edu','password'),(8,'navya','raagu','z23748108','navya@example.com','password'),(9,'meghana','pamarthi','z23748109','meghana@example.com','password'),(10,'harika','saidhu','z23748110','harika@example.com','password'),(29,'buggal','muthyalapati','z23748111','buggal@fau.edu','password');
/*!40000 ALTER TABLE `ta_applicant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ta_application`
--

DROP TABLE IF EXISTS `ta_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ta_application` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ta_applicant_id` int NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `znumber` varchar(45) DEFAULT NULL,
  `cgpa` float DEFAULT NULL,
  `present_department` varchar(45) DEFAULT NULL,
  `education_level` varchar(45) DEFAULT NULL,
  `graduation_date` date DEFAULT NULL,
  `cv` varchar(45) DEFAULT NULL,
  `previous_experience` tinyint DEFAULT NULL,
  `exp_course` varchar(45) DEFAULT NULL,
  `exp_duration` int DEFAULT NULL,
  `department_id` int NOT NULL,
  `course_id` int NOT NULL,
  `instructor_feedback_id` int DEFAULT NULL,
  `instructor_id` int DEFAULT NULL,
  `recommended` tinyint DEFAULT '0',
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_TA_Application_course1_idx` (`course_id`),
  KEY `fk_TA_Application_ta applicant_idx` (`ta_applicant_id`),
  KEY `fk_ta_Application_instructor_users_idx` (`instructor_id`),
  KEY `fk_TA_Application_department_id_idx` (`department_id`),
  CONSTRAINT `fk_TA_Application_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `fk_TA_Application_department` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `fk_TA_Application_ta_applicant` FOREIGN KEY (`ta_applicant_id`) REFERENCES `ta_applicant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ta_application`
--

LOCK TABLES `ta_application` WRITE;
/*!40000 ALTER TABLE `ta_application` DISABLE KEYS */;
INSERT INTO `ta_application` VALUES (1,1,'vamsi','javvadi','vamsi@fau.edu','z23748100',2.39,'1','grad','2023-11-10','EDA.pdf',1,'Software Engineering',10,1,1,1,1,1,'Rejected'),(2,2,'charan','kontham','charan@fau.edu','z23748101',2.45,'4','postgrad','2023-11-29','EDA.pdf',1,'Analysis of Algorithms',8,1,2,2,2,1,'Approved'),(3,3,'madhuri','raagu','madhuri@fau.edu','z23748102',2.46,'2','grad','2023-11-11','EDA.pdf',0,NULL,NULL,1,22,NULL,12,0,'Approved'),(4,4,'ashwini','vemula','ashmwini@fau.edu','z23748103',2.5,'2','undergrad','2023-11-09','EDA.pdf',0,NULL,NULL,2,25,NULL,15,1,'In-Review'),(5,5,'adhitya','koppula','adhitya@fau.edu','z23748104',3.49,'3','undergrad','2023-11-28','Group_16_Team_Optimus_ASSIGNMENT_4.pdf',0,NULL,NULL,3,3,NULL,3,1,'Rejected'),(6,6,'rakesh','varanasi','rakesh@fau.edu','z23748105',3.82,'3','undergrad','2023-12-28','Group_16_Team_Optimus_ASSIGNMENT_4.pdf',1,'Data mining and Machine Learning',5,3,23,6,13,1,'Approved'),(7,7,'pravallika','naraharisetti','pravallika@fau.edu','z23748107',3.87,'9','undergrad','2023-12-24','EDA.pdf',1,'bio imaging',6,3,26,7,16,1,'Approved'),(8,8,'navya','raagu','navya@example.com','z23748108',3.5,'4','undergrad','2023-05-01','navya_cv.pdf',1,'Deep learning',3,4,24,8,14,1,'Open'),(9,9,'meghana','pamarthi','meghana@example.com','z23748109',3.7,'2','grad','2022-12-15','meghana_cv.pdf',1,'computational foundation of ai',6,4,28,9,18,1,'Rejected'),(10,10,'harika','saidhu','harika@example.com','z23748110',3.9,'9','grad','2022-11-30','harika_cv.pdf',1,'intro to biomed engineering',4,9,27,10,17,1,'In-Review'),(30,1,'vamsi','javvadi','vamsi@fau.edu','z23748100',3.77,'2','undergrad','2025-11-11','SricharanKontham_Project.pdf',0,'none',0,2,25,1,15,1,'Open'),(31,1,'vamsi','javvadi','vamsi@fau.edu','z23748100',3.55,'4','postgrad','2024-12-05','SricharanKontham_Project.pdf',0,'none',0,3,23,1,13,0,'Open'),(35,2,'charan','kontham','charan@fau.edu','z23748101',3.2,'9','undergrad','2026-06-16','Solution of Assignment 5.pdf',0,'none',0,9,27,NULL,17,0,'Approved'),(36,2,'charan','kontham','charan@fau.edu','z23748101',3.56,'1','undergrad','2024-04-15','SricharanKontham_Project.pdf',1,'Intro to Data Science',2,1,1,NULL,1,0,'Open');
/*!40000 ALTER TABLE `ta_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ta_committee`
--

DROP TABLE IF EXISTS `ta_committee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ta_committee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ta_committee`
--

LOCK TABLES `ta_committee` WRITE;
/*!40000 ALTER TABLE `ta_committee` DISABLE KEYS */;
INSERT INTO `ta_committee` VALUES (1,'WaseemAsghar@fau.edu','password','wass','asghar'),(6,'VancePeterson@fau.edu','password','Vance','Peterson'),(7,'ValentineAalo@fau.edu','password','Valentine','Aalo'),(8,'TamiSorgente@fau.edu','password','Tami','Sorgente'),(9,'TaghiKhoshgoftaar@fau.edu','password','Taghi','Khoshgoftaar'),(10,'SarehTaebi@fau.edu','password','Sareh','Taebi'),(22,'madhuri@fau.edu','password','madhuri',NULL);
/*!40000 ALTER TABLE `ta_committee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tas`
--

DROP TABLE IF EXISTS `tas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `instructor_id` int DEFAULT NULL,
  `ta_applicant_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ta_application_id` int DEFAULT NULL,
  `offer_sent` tinyint DEFAULT NULL,
  `offer_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tas_instructor_idx` (`instructor_id`),
  KEY `fk_tas_taapplicant_idx` (`ta_applicant_id`),
  KEY `fk_tas_course_idx` (`course_id`),
  KEY `fk_tas_department_idx` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tas`
--

LOCK TABLES `tas` WRITE;
/*!40000 ALTER TABLE `tas` DISABLE KEYS */;
INSERT INTO `tas` VALUES (2,'charan kontham',1,2,2,1,'charan@fau.edu',2,1,'accepted'),(3,'madhuri raagu',12,3,22,1,'madhuri@fau.edu',3,1,'accepted'),(7,'pravallika naraharisetti',16,7,26,3,'pravallika@fau.edu',7,1,''),(23,'rakesh varanasi',13,6,23,3,'rakesh@fau.edu',6,NULL,NULL);
/*!40000 ALTER TABLE `tas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-07 17:22:03
