-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: acadme44
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `acadme4_app_admin`
--

DROP TABLE IF EXISTS `acadme4_app_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `admin_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_id` (`admin_id`),
  CONSTRAINT `AcadME4_app_admin_admin_id_497f020a_fk_AcadME4_app_customuser_id` FOREIGN KEY (`admin_id`) REFERENCES `acadme4_app_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_admin`
--

LOCK TABLES `acadme4_app_admin` WRITE;
/*!40000 ALTER TABLE `acadme4_app_admin` DISABLE KEYS */;
INSERT INTO `acadme4_app_admin` VALUES (1,'2025-02-18 17:38:17.043980','2025-02-18 17:38:17.043980',1),(2,'2025-02-23 20:05:53.653090','2025-02-23 20:05:53.653090',15);
/*!40000 ALTER TABLE `acadme4_app_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_assignment`
--

DROP TABLE IF EXISTS `acadme4_app_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_assignment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `due_date` date NOT NULL,
  `assignment_file` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `staff_id` int NOT NULL,
  `subject_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AcadME4_app_assignme_staff_id_731bd4d2_fk_AcadME4_a` (`staff_id`),
  KEY `AcadME4_app_assignme_subject_id_1f0bd0e7_fk_AcadME4_a` (`subject_id`),
  CONSTRAINT `AcadME4_app_assignme_staff_id_731bd4d2_fk_AcadME4_a` FOREIGN KEY (`staff_id`) REFERENCES `acadme4_app_staffs` (`id`),
  CONSTRAINT `AcadME4_app_assignme_subject_id_1f0bd0e7_fk_AcadME4_a` FOREIGN KEY (`subject_id`) REFERENCES `acadme4_app_subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_assignment`
--

LOCK TABLES `acadme4_app_assignment` WRITE;
/*!40000 ALTER TABLE `acadme4_app_assignment` DISABLE KEYS */;
INSERT INTO `acadme4_app_assignment` VALUES (33,'gjgj','jgj','2025-03-31','assignments/B_9z3tp8i_3UKrYq7.TECH.V_SEM.2017.pdf','2025-03-30 18:46:21.063817','2025-03-30 18:46:21.063817',1,17),(34,'java','java','2025-04-02','assignments/B_EjmYeRp_zjINgUk.TECH.V_SEM.2017.pdf','2025-03-30 19:27:58.375364','2025-03-30 19:27:58.375364',1,2),(35,'xyz','xyz','2025-04-02','assignments/PEGASUS_Model_IXlFB7q.pdf','2025-03-31 18:38:03.237065','2025-03-31 18:38:03.237065',1,18),(36,'java assignmnent 2','submit on 2 april','2025-04-01','assignments/chem_lab_manual.pdf','2025-04-01 19:48:44.765163','2025-04-01 19:48:44.765163',1,2),(37,'rfgfr','dd','2025-04-03','assignments/AESAlgorithmpaper2017AKOMAbdullah_UPK6lw6_jyDel7B.docx.pdf','2025-04-01 21:19:32.665506','2025-04-01 21:19:32.665506',1,1),(38,'1st Assignment','Do it in plane A4 size sheets.','2025-04-09','assignments/systems_programming_by_donovan.pdf','2025-04-02 17:58:41.287056','2025-04-02 17:58:41.287056',1,11),(39,'2nd Assignment','Attempt any  5 questions.','2025-04-19','assignments/Computer_Fundamentals_P.K_Sinha___By_Yogi-By_www.LearnEngineering.in.pdf','2025-04-02 18:13:59.462494','2025-04-02 18:13:59.462494',3,14),(40,'COA','COA','2025-04-01','assignments/PEGASUS_Model_MS5lJgC_hbVQByB.pdf','2025-04-02 18:26:31.569858','2025-04-02 18:26:31.569858',1,17),(41,'DBMS','DBMS','2025-04-01','assignments/DCN_03_100818_ysSSfnt_iYLHOPs.pdf','2025-04-02 18:27:00.970184','2025-04-02 18:27:00.970184',1,1),(42,'DBMSS','DBMSS','2025-04-01','assignments/PEGASUS_Model_EIi06LM.pdf','2025-04-02 18:27:43.536903','2025-04-02 18:27:43.536903',1,18),(43,'java','ihlh','2025-04-09','assignments/AESAlgorithmpaper2017AKOMAbdullah_UPK6lw6_jyDel7B_arKat6u.docx.pdf','2025-04-09 21:11:21.410246','2025-04-09 21:11:21.410281',1,2),(44,'hsbgdj','sfah','2025-04-10','assignments/AESAlgorithmpaper2017AKOMAbdullah_D3xDPfT.docx.pdf','2025-04-09 21:13:51.146311','2025-04-09 21:13:51.146348',1,1),(45,'hi','hjh','2025-04-10','assignments/B_9z3tp8i_hLFxZm7.TECH.V_SEM.2017.pdf','2025-04-09 21:26:28.910266','2025-04-09 21:26:28.910335',1,1),(46,'kb','b m','2025-04-09','assignments/B_9z3tp8i_LfJ96Wb.TECH.V_SEM.2017.pdf','2025-04-09 21:30:07.983047','2025-04-09 21:30:07.983088',1,2),(47,'1st','c','2025-04-11','assignments/B_jNi9W8g.TECH.V_SEM.2017.pdf','2025-04-09 22:38:24.694660','2025-04-09 22:38:24.694692',1,12),(48,'xyz','xyz','2025-04-10','assignments/AESAlgorithmpaper2017AKOMAbdullah_UPK6lw6_jyDel7B_9YOhbQi.docx.pdf','2025-04-09 22:44:11.316636','2025-04-09 22:44:11.316715',1,17),(49,'abc','abc','2025-04-12','assignments/AESAlgorithmpaper2017AKOMAbdullah_UPK6lw6_jyDel7B_9YOhbQi_mnsoInY.docx.pdf','2025-04-09 22:46:11.223956','2025-04-09 22:46:11.224264',1,18),(50,'jdbfb','m d','2025-04-13','assignments/AESAlgorithmpaper2017AKOMAbdullah_UPK6lw6_jyDel7B_pxYlaPt.docx.pdf','2025-04-13 17:41:59.136891','2025-04-13 17:41:59.136928',1,1),(51,'hiii','mylife','2025-04-14','assignments/AESAlgorithmpaper2017AKOMAbdullah_UPK6lw6_jyDel7B_BNMM5Bp.docx.pdf','2025-04-13 17:59:21.901156','2025-04-13 17:59:21.901193',1,1),(52,'hii','tjrj','2025-04-14','assignments/AESAlgorithmpaper2017AKOMAbdullah_UPK6lw6_jyDel7B_9YOhbQi_mnsoInY_SLvg5OU.docx.pdf','2025-04-13 18:37:17.755176','2025-04-13 18:37:17.755209',1,1),(53,'hii','hiii','2025-04-14','assignments/AESAlgorithmpaper2017AKOMAbdullah_UPK6lw6_jyDel7B_arKat6u_knddWt9.docx.pdf','2025-04-13 19:35:39.107897','2025-04-13 19:35:39.107928',1,1),(54,'do it','hu','2025-04-15','assignments/AESAlgorithmpaper2017AKOMAbdullah_UPK6lw6_jyDel7B_HlAHJ45.docx.pdf','2025-04-14 08:32:43.187905','2025-04-14 08:32:43.187941',1,1);
/*!40000 ALTER TABLE `acadme4_app_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_assignmentsubmission`
--

DROP TABLE IF EXISTS `acadme4_app_assignmentsubmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_assignmentsubmission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `submission_file` varchar(100) NOT NULL,
  `submitted_at` datetime(6) NOT NULL,
  `status` varchar(20) NOT NULL,
  `feedback` longtext,
  `assignment_id` int NOT NULL,
  `student_id` int NOT NULL,
  `marks_obtained` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AcadME4_app_assignme_assignment_id_4bfbea26_fk_AcadME4_a` (`assignment_id`),
  KEY `AcadME4_app_assignmentsubmission_student_id_0b2a8ecc` (`student_id`),
  CONSTRAINT `AcadME4_app_assignme_assignment_id_4bfbea26_fk_AcadME4_a` FOREIGN KEY (`assignment_id`) REFERENCES `acadme4_app_assignment` (`id`),
  CONSTRAINT `AcadME4_app_assignme_student_id_0b2a8ecc_fk_AcadME4_a` FOREIGN KEY (`student_id`) REFERENCES `acadme4_app_students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_assignmentsubmission`
--

LOCK TABLES `acadme4_app_assignmentsubmission` WRITE;
/*!40000 ALTER TABLE `acadme4_app_assignmentsubmission` DISABLE KEYS */;
INSERT INTO `acadme4_app_assignmentsubmission` VALUES (80,'submissions/B_9z3tp8i.TECH.V_SEM.2017.pdf','2025-04-09 21:14:37.966053','Submitted',NULL,44,1,0),(81,'submissions/AESAlgorithmpaper2017AKOMAbdullah_UPK6lw6_jyDel7B_arKat6u.docx.pdf','2025-04-09 21:32:02.559662','Submitted',NULL,45,1,0),(82,'submissions/B_9z3tp8i_hLFxZm7.TECH.V_SEM.2017.pdf','2025-04-09 21:32:42.079498','Submitted',NULL,46,1,0),(83,'submissions/AESAlgorithmpaper2017AKOMAbdullah_UPK6lw6_jyDel7B_arKat6u_pXBh2zW.docx.pdf','2025-04-09 22:45:03.548742','Submitted',NULL,48,1,0),(84,'submissions/AESAlgorithmpaper2017AKOMAbdullah_UPK6lw6_jyDel7B_9YOhbQi.docx.pdf','2025-04-13 17:43:14.320474','Submitted',NULL,50,1,0),(85,'submissions/AESAlgorithmpaper2017AKOMAbdullah_UPK6lw6_jyDel7B_9YOhbQi_0KR3NKv.docx.pdf','2025-04-13 18:17:30.707305','Submitted',NULL,51,1,0),(86,'submissions/AESAlgorithmpaper2017AKOMAbdullah_UPK6lw6_jyDel7B_pxYlaPt.docx.pdf','2025-04-13 18:40:00.755963','Submitted',NULL,52,1,0),(87,'submissions/AESAlgorithmpaper2017AKOMAbdullah_UPK6lw6_jyDel7B.docx.pdf','2025-04-13 20:09:26.508314','Submitted',NULL,53,1,0),(88,'submissions/AESAlgorithmpaper2017AKOMAbdullah_UPK6lw6_jyDel7B_9YOhbQi_mnsoInY.docx.pdf','2025-04-14 08:35:25.673662','Submitted',NULL,54,1,0);
/*!40000 ALTER TABLE `acadme4_app_assignmentsubmission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_attendance`
--

DROP TABLE IF EXISTS `acadme4_app_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attendance_date` date NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `session_year_id_id` int NOT NULL,
  `subject_id_id` int NOT NULL,
  `class_type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AcadME4_app_attendan_subject_id_id_18327be5_fk_AcadME4_a` (`subject_id_id`),
  KEY `AcadME4_app_attendan_session_year_id_id_b3f5c583_fk_AcadME4_a` (`session_year_id_id`),
  CONSTRAINT `AcadME4_app_attendan_session_year_id_id_b3f5c583_fk_AcadME4_a` FOREIGN KEY (`session_year_id_id`) REFERENCES `acadme4_app_sessionyearmodel` (`id`),
  CONSTRAINT `AcadME4_app_attendan_subject_id_id_18327be5_fk_AcadME4_a` FOREIGN KEY (`subject_id_id`) REFERENCES `acadme4_app_subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_attendance`
--

LOCK TABLES `acadme4_app_attendance` WRITE;
/*!40000 ALTER TABLE `acadme4_app_attendance` DISABLE KEYS */;
INSERT INTO `acadme4_app_attendance` VALUES (45,'2025-03-25','2025-03-27 17:50:21.738244','2025-03-27 17:50:21.738244',5,24,'theory'),(46,'2025-03-26','2025-03-27 17:51:43.973645','2025-03-27 17:51:43.973645',5,24,'lab'),(47,'2025-03-26','2025-03-27 17:52:22.839576','2025-03-27 17:52:22.839576',5,24,'theory'),(48,'2025-03-25','2025-03-27 17:52:50.072005','2025-03-27 17:52:50.072005',5,24,'lab'),(49,'2025-03-25','2025-03-27 17:59:05.420903','2025-03-27 17:59:05.420903',5,8,'theory'),(50,'2025-03-26','2025-03-27 17:59:33.632107','2025-03-27 17:59:33.632107',5,14,'lab'),(51,'2025-03-26','2025-03-27 18:00:51.753752','2025-03-27 18:00:51.753752',5,16,'theory'),(52,'2025-03-26','2025-03-27 18:03:05.005136','2025-03-27 18:03:05.005136',5,20,'theory'),(53,'2025-03-25','2025-03-27 18:04:00.026231','2025-03-27 18:04:00.026231',5,16,'lab'),(54,'2025-03-27','2025-03-27 18:04:46.887952','2025-03-27 18:04:46.887952',5,16,'lab'),(55,'2025-03-26','2025-03-27 18:23:30.714114','2025-03-27 18:23:30.714114',5,1,'theory'),(56,'2025-03-26','2025-03-27 18:23:53.373068','2025-03-27 18:23:53.373068',5,3,'lab'),(57,'2025-03-26','2025-03-27 18:24:40.666645','2025-03-27 18:24:40.666645',5,1,'lab'),(58,'2025-03-27','2025-03-27 18:25:02.201811','2025-03-27 18:25:02.201811',5,11,'theory'),(59,'2025-03-27','2025-03-27 18:28:18.867808','2025-03-27 18:28:18.867808',5,1,'theory'),(60,'2025-03-27','2025-03-27 18:28:52.685416','2025-03-27 18:28:52.685416',5,1,'lab'),(61,'2025-03-25','2025-03-27 18:29:21.035423','2025-03-27 18:29:21.035423',5,11,'theory'),(62,'2025-03-28','2025-03-27 18:51:22.018721','2025-03-27 18:51:22.018739',5,17,'theory'),(64,'2025-03-28','2025-03-27 20:54:51.591642','2025-03-27 20:54:51.591642',5,1,'theory'),(65,'2025-03-28','2025-03-27 20:56:11.406050','2025-03-27 20:56:11.406050',5,19,'theory'),(66,'2025-03-28','2025-03-28 12:28:53.947166','2025-03-28 12:28:53.947166',5,12,'theory'),(67,'2025-04-01','2025-04-01 20:07:40.681935','2025-04-01 20:07:40.681935',5,1,'theory'),(68,'2025-03-31','2025-04-01 20:34:28.576421','2025-04-01 20:34:28.576421',5,1,'theory'),(69,'2025-04-02','2025-04-01 21:20:53.219488','2025-04-01 21:20:53.219488',5,3,'theory'),(70,'2025-04-02','2025-04-02 17:51:40.351822','2025-04-02 17:51:40.351822',5,19,'theory'),(71,'2025-04-02','2025-04-02 18:24:47.020345','2025-04-02 18:24:47.020345',5,11,'theory'),(72,'2025-04-10','2025-04-09 21:00:20.539989','2025-04-09 21:00:20.540050',5,1,'lab'),(73,'2025-04-14','2025-04-13 19:27:36.256753','2025-04-13 19:27:36.256792',5,1,'theory'),(74,'2025-04-14','2025-04-13 20:06:59.053816','2025-04-13 20:06:59.053891',5,12,'theory'),(75,'2025-04-13','2025-04-14 08:29:11.398962','2025-04-14 08:29:11.398991',5,1,'theory'),(76,'2025-04-15','2025-04-14 19:19:37.086984','2025-04-14 19:19:37.087060',5,1,'theory');
/*!40000 ALTER TABLE `acadme4_app_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_attendancereport`
--

DROP TABLE IF EXISTS `acadme4_app_attendancereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_attendancereport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `attendance_id_id` int NOT NULL,
  `student_id_id` int NOT NULL,
  `class_type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AcadME4_app_attendan_attendance_id_id_094923e2_fk_AcadME4_a` (`attendance_id_id`),
  KEY `AcadME4_app_attendan_student_id_id_10da28ab_fk_AcadME4_a` (`student_id_id`),
  CONSTRAINT `AcadME4_app_attendan_attendance_id_id_094923e2_fk_AcadME4_a` FOREIGN KEY (`attendance_id_id`) REFERENCES `acadme4_app_attendance` (`id`),
  CONSTRAINT `AcadME4_app_attendan_student_id_id_10da28ab_fk_AcadME4_a` FOREIGN KEY (`student_id_id`) REFERENCES `acadme4_app_students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_attendancereport`
--

LOCK TABLES `acadme4_app_attendancereport` WRITE;
/*!40000 ALTER TABLE `acadme4_app_attendancereport` DISABLE KEYS */;
INSERT INTO `acadme4_app_attendancereport` VALUES (192,1,'2025-03-27 17:50:21.738244','2025-03-27 17:50:21.738244',45,13,'theory'),(193,1,'2025-03-27 17:50:21.738244','2025-03-27 17:50:21.738244',45,42,'theory'),(194,1,'2025-03-27 17:50:21.753597','2025-03-27 17:50:21.753597',45,56,'theory'),(195,0,'2025-03-27 17:51:43.988925','2025-03-27 17:51:43.988925',46,13,'lab'),(196,1,'2025-03-27 17:51:43.988925','2025-03-27 17:51:43.988925',46,42,'lab'),(197,1,'2025-03-27 17:51:43.988925','2025-03-27 17:51:43.988925',46,56,'lab'),(198,1,'2025-03-27 17:52:22.855699','2025-03-27 17:52:22.855699',47,13,'theory'),(199,1,'2025-03-27 17:52:22.873591','2025-03-27 17:52:22.873591',47,42,'theory'),(200,1,'2025-03-27 17:52:22.873591','2025-03-27 17:52:22.873591',47,56,'theory'),(201,1,'2025-03-27 17:52:50.088422','2025-03-27 17:52:50.088422',48,13,'lab'),(202,0,'2025-03-27 17:52:50.088422','2025-03-27 17:52:50.088422',48,42,'lab'),(203,0,'2025-03-27 17:52:50.088422','2025-03-27 17:52:50.088422',48,56,'lab'),(204,1,'2025-03-27 17:59:05.437738','2025-03-27 17:59:05.437738',49,1,'theory'),(205,1,'2025-03-27 17:59:05.437738','2025-03-27 17:59:05.437738',49,3,'theory'),(206,0,'2025-03-27 17:59:05.437738','2025-03-27 17:59:05.437738',49,7,'theory'),(207,1,'2025-03-27 17:59:05.455053','2025-03-27 17:59:05.455053',49,36,'theory'),(208,0,'2025-03-27 17:59:05.457066','2025-03-27 17:59:05.457066',49,42,'theory'),(209,1,'2025-03-27 17:59:05.457066','2025-03-27 17:59:05.457066',49,48,'theory'),(211,1,'2025-03-27 17:59:05.471316','2025-03-27 17:59:05.471316',49,54,'theory'),(212,1,'2025-03-27 17:59:05.481755','2025-03-27 17:59:05.481755',49,58,'theory'),(213,1,'2025-03-27 17:59:33.638966','2025-03-27 17:59:33.638966',50,13,'lab'),(214,1,'2025-03-27 17:59:33.648184','2025-03-27 17:59:33.648184',50,42,'lab'),(215,1,'2025-03-27 17:59:33.654334','2025-03-27 17:59:33.654334',50,56,'lab'),(216,1,'2025-03-27 18:00:51.770631','2025-03-27 18:00:51.770631',51,9,'theory'),(217,0,'2025-03-27 18:00:51.776117','2025-03-27 18:00:51.776117',51,61,'theory'),(218,0,'2025-03-27 18:00:51.776117','2025-03-27 18:00:51.776117',51,62,'theory'),(219,1,'2025-03-27 18:00:51.787269','2025-03-27 18:00:51.787269',51,63,'theory'),(220,0,'2025-03-27 18:03:05.020496','2025-03-27 18:03:05.020496',52,1,'theory'),(221,1,'2025-03-27 18:03:05.020496','2025-03-27 18:03:05.020496',52,3,'theory'),(222,0,'2025-03-27 18:03:05.031928','2025-03-27 18:03:05.031928',52,7,'theory'),(223,1,'2025-03-27 18:03:05.037330','2025-03-27 18:03:05.037330',52,36,'theory'),(224,0,'2025-03-27 18:03:05.037330','2025-03-27 18:03:05.037330',52,42,'theory'),(225,0,'2025-03-27 18:03:05.047786','2025-03-27 18:03:05.047786',52,48,'theory'),(227,0,'2025-03-27 18:03:05.053456','2025-03-27 18:03:05.053456',52,54,'theory'),(228,1,'2025-03-27 18:03:05.063928','2025-03-27 18:03:05.063928',52,58,'theory'),(229,1,'2025-03-27 18:04:00.038907','2025-03-27 18:04:00.038907',53,9,'lab'),(230,0,'2025-03-27 18:04:00.038907','2025-03-27 18:04:00.038907',53,61,'lab'),(231,0,'2025-03-27 18:04:00.053125','2025-03-27 18:04:00.053125',53,62,'lab'),(232,1,'2025-03-27 18:04:00.053125','2025-03-27 18:04:00.053125',53,63,'lab'),(233,0,'2025-03-27 18:04:46.904063','2025-03-27 18:04:46.904063',54,9,'lab'),(234,1,'2025-03-27 18:04:46.904063','2025-03-27 18:04:46.904063',54,61,'lab'),(235,1,'2025-03-27 18:04:46.914284','2025-03-27 18:04:46.914284',54,62,'lab'),(236,0,'2025-03-27 18:04:46.920492','2025-03-27 18:04:46.920492',54,63,'lab'),(237,0,'2025-03-27 18:23:30.730639','2025-03-27 18:23:30.730639',55,1,'theory'),(238,1,'2025-03-27 18:23:30.735204','2025-03-27 18:23:30.735204',55,3,'theory'),(239,0,'2025-03-27 18:23:30.735204','2025-03-27 18:23:30.735204',55,7,'theory'),(240,1,'2025-03-27 18:23:30.751423','2025-03-27 18:23:30.751423',55,36,'theory'),(241,1,'2025-03-27 18:23:30.751746','2025-03-27 18:23:30.751746',55,48,'theory'),(243,1,'2025-03-27 18:23:30.767903','2025-03-27 18:23:30.768242',55,54,'theory'),(244,0,'2025-03-27 18:23:30.771646','2025-03-27 18:23:30.771646',55,58,'theory'),(245,1,'2025-03-27 18:23:53.390288','2025-03-27 18:23:53.390288',56,1,'lab'),(246,1,'2025-03-27 18:23:53.394326','2025-03-27 18:23:53.394326',56,3,'lab'),(247,0,'2025-03-27 18:23:53.399537','2025-03-27 18:23:53.399537',56,7,'lab'),(248,0,'2025-03-27 18:23:53.405843','2025-03-27 18:23:53.405843',56,36,'lab'),(249,1,'2025-03-27 18:23:53.409868','2025-03-27 18:23:53.409868',56,48,'lab'),(251,1,'2025-03-27 18:23:53.418893','2025-03-27 18:23:53.418893',56,54,'lab'),(252,1,'2025-03-27 18:23:53.418893','2025-03-27 18:23:53.418893',56,58,'lab'),(253,0,'2025-03-27 18:24:40.682768','2025-03-27 18:24:40.682768',57,1,'lab'),(254,1,'2025-03-27 18:24:40.685820','2025-03-27 18:24:40.685820',57,3,'lab'),(255,1,'2025-03-27 18:24:40.698139','2025-03-27 18:24:40.698139',57,7,'lab'),(256,1,'2025-03-27 18:24:40.702276','2025-03-27 18:24:40.702276',57,36,'lab'),(257,0,'2025-03-27 18:24:40.702276','2025-03-27 18:24:40.702276',57,48,'lab'),(259,1,'2025-03-27 18:24:40.718900','2025-03-27 18:24:40.718900',57,54,'lab'),(260,1,'2025-03-27 18:24:40.718900','2025-03-27 18:24:40.718900',57,58,'lab'),(261,0,'2025-03-27 18:25:02.217674','2025-03-27 18:25:02.217674',58,1,'theory'),(262,1,'2025-03-27 18:25:02.217674','2025-03-27 18:25:02.217674',58,3,'theory'),(263,1,'2025-03-27 18:25:02.217674','2025-03-27 18:25:02.217674',58,7,'theory'),(264,1,'2025-03-27 18:25:02.233947','2025-03-27 18:25:02.233947',58,36,'theory'),(265,1,'2025-03-27 18:25:02.233947','2025-03-27 18:25:02.233947',58,48,'theory'),(267,1,'2025-03-27 18:25:02.249681','2025-03-27 18:25:02.249681',58,54,'theory'),(268,1,'2025-03-27 18:25:02.250922','2025-03-27 18:25:02.250922',58,58,'theory'),(269,0,'2025-03-27 18:28:18.874249','2025-03-27 18:28:18.874249',59,1,'theory'),(270,1,'2025-03-27 18:28:18.884631','2025-03-27 18:28:18.884631',59,3,'theory'),(271,1,'2025-03-27 18:28:18.884631','2025-03-27 18:28:18.884631',59,7,'theory'),(272,1,'2025-03-27 18:28:18.899613','2025-03-27 18:28:18.899613',59,36,'theory'),(273,1,'2025-03-27 18:28:18.901046','2025-03-27 18:28:18.901046',59,48,'theory'),(275,1,'2025-03-27 18:28:18.913625','2025-03-27 18:28:18.913625',59,54,'theory'),(276,1,'2025-03-27 18:28:18.917990','2025-03-27 18:28:18.917990',59,58,'theory'),(277,0,'2025-03-27 18:28:52.706897','2025-03-27 18:28:52.706897',60,1,'lab'),(278,1,'2025-03-27 18:28:52.706897','2025-03-27 18:28:52.706897',60,3,'lab'),(279,1,'2025-03-27 18:28:52.717934','2025-03-27 18:28:52.717934',60,7,'lab'),(280,1,'2025-03-27 18:28:52.717934','2025-03-27 18:28:52.717934',60,36,'lab'),(281,1,'2025-03-27 18:28:52.717934','2025-03-27 18:28:52.717934',60,48,'lab'),(283,1,'2025-03-27 18:28:52.734410','2025-03-27 18:28:52.734410',60,54,'lab'),(284,1,'2025-03-27 18:28:52.734410','2025-03-27 18:28:52.734410',60,58,'lab'),(285,1,'2025-03-27 18:29:21.051963','2025-03-27 18:29:21.051963',61,1,'theory'),(286,1,'2025-03-27 18:29:21.051963','2025-03-27 18:29:21.051963',61,3,'theory'),(287,0,'2025-03-27 18:29:21.065737','2025-03-27 18:29:21.065737',61,7,'theory'),(288,1,'2025-03-27 18:29:21.068220','2025-03-27 18:29:21.068220',61,36,'theory'),(289,1,'2025-03-27 18:29:21.068220','2025-03-27 18:29:21.068220',61,48,'theory'),(291,1,'2025-03-27 18:29:21.087278','2025-03-27 18:29:21.087278',61,54,'theory'),(292,1,'2025-03-27 18:29:21.087278','2025-03-27 18:29:21.087278',61,58,'theory'),(293,1,'2025-03-27 18:51:22.056915','2025-03-27 18:51:22.056915',62,1,'theory'),(294,1,'2025-03-27 18:51:22.085885','2025-03-27 18:51:22.085885',62,3,'theory'),(295,1,'2025-03-27 18:51:22.127430','2025-03-27 18:51:22.127430',62,7,'theory'),(296,1,'2025-03-27 18:51:22.153580','2025-03-27 18:51:22.153580',62,36,'theory'),(297,1,'2025-03-27 18:51:22.251168','2025-03-27 18:51:22.251168',62,48,'theory'),(299,1,'2025-03-27 18:51:22.513681','2025-03-27 18:51:22.513681',62,54,'theory'),(300,1,'2025-03-27 18:51:22.622555','2025-03-27 18:51:22.622555',62,58,'theory'),(309,1,'2025-03-27 20:54:51.608605','2025-03-27 20:54:51.608605',64,1,'theory'),(310,1,'2025-03-27 20:54:51.642137','2025-03-27 20:54:51.642137',64,3,'theory'),(311,1,'2025-03-27 20:54:51.661261','2025-03-27 20:54:51.661261',64,36,'theory'),(312,1,'2025-03-27 20:54:51.724036','2025-03-27 20:54:51.724036',64,48,'theory'),(314,1,'2025-03-27 20:54:51.791750','2025-03-27 20:54:51.791750',64,54,'theory'),(315,1,'2025-03-27 20:54:51.811774','2025-03-27 20:54:51.811774',64,58,'theory'),(316,1,'2025-03-27 20:56:11.427532','2025-03-27 20:56:11.427532',65,9,'theory'),(317,1,'2025-03-27 20:56:11.463073','2025-03-27 20:56:11.463073',65,61,'theory'),(318,1,'2025-03-27 20:56:11.496945','2025-03-27 20:56:11.496945',65,62,'theory'),(319,1,'2025-03-27 20:56:11.532250','2025-03-27 20:56:11.532250',65,63,'theory'),(320,1,'2025-03-28 12:28:53.947166','2025-03-28 12:28:53.947166',66,1,'theory'),(321,1,'2025-03-28 12:28:53.963512','2025-03-28 12:28:53.963512',66,3,'theory'),(322,1,'2025-03-28 12:28:53.963512','2025-03-28 12:28:53.963512',66,36,'theory'),(323,1,'2025-03-28 12:28:53.980231','2025-03-28 12:28:53.980231',66,48,'theory'),(325,1,'2025-03-28 12:28:53.996767','2025-03-28 12:28:53.996767',66,54,'theory'),(326,1,'2025-03-28 12:28:54.007092','2025-03-28 12:28:54.007092',66,58,'theory'),(327,1,'2025-04-01 20:07:40.708195','2025-04-01 20:07:40.708195',67,1,'theory'),(328,1,'2025-04-01 20:07:40.734715','2025-04-01 20:07:40.734715',67,3,'theory'),(329,1,'2025-04-01 20:07:40.764869','2025-04-01 20:07:40.764869',67,36,'theory'),(330,0,'2025-04-01 20:07:40.802405','2025-04-01 20:07:40.802405',67,48,'theory'),(332,1,'2025-04-01 20:07:40.852886','2025-04-01 20:07:40.852886',67,54,'theory'),(333,1,'2025-04-01 20:07:40.878079','2025-04-01 20:07:40.878079',67,58,'theory'),(334,1,'2025-04-01 20:07:40.904678','2025-04-01 20:07:40.904678',67,85,'theory'),(335,1,'2025-04-01 20:34:28.599643','2025-04-01 20:34:28.599643',68,1,'theory'),(336,1,'2025-04-01 20:34:28.617054','2025-04-01 20:34:28.617054',68,3,'theory'),(337,1,'2025-04-01 20:34:28.636562','2025-04-01 20:34:28.636562',68,36,'theory'),(338,1,'2025-04-01 20:34:28.657418','2025-04-01 20:34:28.657418',68,48,'theory'),(340,1,'2025-04-01 20:34:28.702817','2025-04-01 20:34:28.702817',68,54,'theory'),(341,1,'2025-04-01 20:34:28.721182','2025-04-01 20:34:28.721182',68,58,'theory'),(342,1,'2025-04-01 20:34:28.739705','2025-04-01 20:34:28.739705',68,85,'theory'),(343,1,'2025-04-01 21:20:54.043699','2025-04-01 21:20:54.043699',69,1,'theory'),(344,1,'2025-04-01 21:20:54.667055','2025-04-01 21:20:54.667055',69,3,'theory'),(345,1,'2025-04-01 21:20:54.972674','2025-04-01 21:20:54.972674',69,36,'theory'),(346,1,'2025-04-01 21:20:55.480972','2025-04-01 21:20:55.480972',69,48,'theory'),(348,0,'2025-04-01 21:20:55.998062','2025-04-01 21:20:55.998062',69,54,'theory'),(349,1,'2025-04-01 21:20:56.113787','2025-04-01 21:20:56.113787',69,58,'theory'),(350,1,'2025-04-01 21:20:56.398236','2025-04-01 21:20:56.398236',69,85,'theory'),(351,0,'2025-04-02 17:51:40.381821','2025-04-02 17:51:40.381821',70,9,'theory'),(352,1,'2025-04-02 17:51:40.410624','2025-04-02 17:51:40.410624',70,61,'theory'),(353,1,'2025-04-02 17:51:40.439651','2025-04-02 17:51:40.440710',70,62,'theory'),(354,1,'2025-04-02 17:51:40.468325','2025-04-02 17:51:40.468325',70,63,'theory'),(355,0,'2025-04-02 18:24:47.036226','2025-04-02 18:24:47.036226',71,1,'theory'),(356,1,'2025-04-02 18:24:47.036226','2025-04-02 18:24:47.036226',71,3,'theory'),(357,1,'2025-04-02 18:24:47.052222','2025-04-02 18:24:47.052897',71,36,'theory'),(358,0,'2025-04-02 18:24:47.052897','2025-04-02 18:24:47.052897',71,48,'theory'),(360,1,'2025-04-02 18:24:47.069527','2025-04-02 18:24:47.069527',71,54,'theory'),(361,1,'2025-04-02 18:24:47.078878','2025-04-02 18:24:47.078878',71,58,'theory'),(362,1,'2025-04-02 18:24:47.086121','2025-04-02 18:24:47.086121',71,85,'theory'),(363,1,'2025-04-09 21:00:20.567526','2025-04-09 21:00:20.567553',72,1,'lab'),(364,0,'2025-04-09 21:00:20.637817','2025-04-09 21:00:20.637866',72,3,'lab'),(365,1,'2025-04-09 21:00:20.655500','2025-04-09 21:00:20.655559',72,36,'lab'),(366,1,'2025-04-09 21:00:20.671155','2025-04-09 21:00:20.671180',72,48,'lab'),(368,1,'2025-04-09 21:00:20.773499','2025-04-09 21:00:20.773549',72,54,'lab'),(369,1,'2025-04-09 21:00:20.860720','2025-04-09 21:00:20.860828',72,58,'lab'),(370,1,'2025-04-09 21:00:20.888356','2025-04-09 21:00:20.888381',72,85,'lab'),(371,1,'2025-04-13 19:27:36.274665','2025-04-13 19:27:36.274693',73,1,'theory'),(372,1,'2025-04-13 19:27:36.294092','2025-04-13 19:27:36.294118',73,3,'theory'),(373,1,'2025-04-13 19:27:36.322188','2025-04-13 19:27:36.322212',73,36,'theory'),(374,1,'2025-04-13 19:27:36.338895','2025-04-13 19:27:36.339031',73,48,'theory'),(376,1,'2025-04-13 19:27:36.436970','2025-04-13 19:27:36.436998',73,54,'theory'),(377,1,'2025-04-13 19:27:36.452896','2025-04-13 19:27:36.452921',73,58,'theory'),(378,1,'2025-04-13 19:27:36.468242','2025-04-13 19:27:36.468268',73,85,'theory'),(379,1,'2025-04-13 20:06:59.070688','2025-04-13 20:06:59.070717',74,1,'theory'),(380,1,'2025-04-13 20:06:59.093280','2025-04-13 20:06:59.093308',74,3,'theory'),(381,1,'2025-04-13 20:06:59.151033','2025-04-13 20:06:59.151209',74,36,'theory'),(382,1,'2025-04-13 20:06:59.181654','2025-04-13 20:06:59.181684',74,48,'theory'),(384,1,'2025-04-13 20:06:59.221083','2025-04-13 20:06:59.221233',74,54,'theory'),(385,1,'2025-04-13 20:06:59.252311','2025-04-13 20:06:59.252347',74,58,'theory'),(386,1,'2025-04-13 20:06:59.282465','2025-04-13 20:06:59.282496',74,85,'theory'),(387,1,'2025-04-14 08:29:11.444630','2025-04-14 08:29:11.444681',75,1,'theory'),(388,1,'2025-04-14 08:29:11.463767','2025-04-14 08:29:11.464551',75,3,'theory'),(389,1,'2025-04-14 08:29:11.481309','2025-04-14 08:29:11.481331',75,36,'theory'),(390,1,'2025-04-14 08:29:11.497499','2025-04-14 08:29:11.497519',75,48,'theory'),(391,1,'2025-04-14 08:29:11.509297','2025-04-14 08:29:11.509323',75,54,'theory'),(392,0,'2025-04-14 08:29:11.524685','2025-04-14 08:29:11.524709',75,58,'theory'),(393,1,'2025-04-14 08:29:11.541272','2025-04-14 08:29:11.541303',75,85,'theory'),(394,1,'2025-04-14 19:19:37.105611','2025-04-14 19:19:37.105636',76,1,'theory'),(395,1,'2025-04-14 19:19:37.123397','2025-04-14 19:19:37.123419',76,3,'theory'),(396,1,'2025-04-14 19:19:37.142200','2025-04-14 19:19:37.142261',76,36,'theory'),(397,1,'2025-04-14 19:19:37.160734','2025-04-14 19:19:37.160759',76,48,'theory'),(398,1,'2025-04-14 19:19:37.178490','2025-04-14 19:19:37.178511',76,54,'theory'),(399,1,'2025-04-14 19:19:37.197835','2025-04-14 19:19:37.197864',76,58,'theory'),(400,1,'2025-04-14 19:19:37.215502','2025-04-14 19:19:37.215522',76,85,'theory');
/*!40000 ALTER TABLE `acadme4_app_attendancereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_branch`
--

DROP TABLE IF EXISTS `acadme4_app_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_branch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `course_id_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AcadME4_app_branch_course_id_id_3b5ef792_fk_AcadME4_a` (`course_id_id`),
  CONSTRAINT `AcadME4_app_branch_course_id_id_3b5ef792_fk_AcadME4_a` FOREIGN KEY (`course_id_id`) REFERENCES `acadme4_app_courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_branch`
--

LOCK TABLES `acadme4_app_branch` WRITE;
/*!40000 ALTER TABLE `acadme4_app_branch` DISABLE KEYS */;
INSERT INTO `acadme4_app_branch` VALUES (2,'CS-A','2025-02-28 21:49:49.212095',1),(3,'AI','2025-02-28 22:47:14.627806',4),(4,'MT','2025-03-01 17:53:35.616851',1),(5,'IT','2025-03-01 22:19:20.190688',2),(20,'MT','2025-03-27 17:18:23.290920',2),(21,'Cyber Security','2025-03-27 17:21:13.971325',3),(22,'Cloud Computing','2025-03-27 17:21:34.032612',3),(23,'IT','2025-03-27 17:36:16.273336',1),(24,'EE','2025-03-27 17:36:34.059288',1),(25,'EI','2025-03-27 17:36:38.874379',1),(26,'EC','2025-03-27 17:36:42.490079',1),(27,'CS-B','2025-03-27 18:34:27.488653',1),(28,'CS-C','2025-03-27 18:34:35.013225',1),(30,'HR','2025-03-27 19:48:05.559316',10),(31,'Management','2025-03-27 20:49:32.846672',11);
/*!40000 ALTER TABLE `acadme4_app_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_courses`
--

DROP TABLE IF EXISTS `acadme4_app_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_courses`
--

LOCK TABLES `acadme4_app_courses` WRITE;
/*!40000 ALTER TABLE `acadme4_app_courses` DISABLE KEYS */;
INSERT INTO `acadme4_app_courses` VALUES (1,'B.Tech','2025-02-18 17:48:35.867923','2025-02-18 17:48:35.867923'),(2,'BCA','2025-02-18 17:48:39.115450','2025-02-18 17:48:39.115450'),(3,'MCA','2025-02-18 17:48:45.869762','2025-02-18 17:48:45.869762'),(4,'MTech','2025-02-18 17:48:51.520408','2025-02-18 17:48:51.520408'),(10,'MBA','2025-03-27 19:42:22.469677','2025-03-27 19:42:22.469677'),(11,'BBA','2025-03-27 20:48:33.304918','2025-03-27 20:48:33.304918'),(18,'BSC','2025-04-01 20:18:58.910259','2025-04-01 20:18:58.910259');
/*!40000 ALTER TABLE `acadme4_app_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_customuser`
--

DROP TABLE IF EXISTS `acadme4_app_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `user_type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_customuser`
--

LOCK TABLES `acadme4_app_customuser` WRITE;
/*!40000 ALTER TABLE `acadme4_app_customuser` DISABLE KEYS */;
INSERT INTO `acadme4_app_customuser` VALUES (1,'pbkdf2_sha256$870000$75GXjNsys5vLrg1SXudJYE$iwwQG8TucTJ05CGYDB2zZWdWr3ez6+wpxXFhH4w+zLI=','2025-05-10 10:17:50.208922',1,'admin','admin','4','admin@gmail.com',1,1,'2025-02-18 17:38:16.638211','1'),(2,'pbkdf2_sha256$1000000$Lww4b76LitRSWlRbtzzlA8$PG2qX9TwdftaQG+pxZWav8Uhle+nkli8r9q4Df7TXdw=','2025-04-15 05:08:29.007353',0,'ajay','Ajay Kumar','Yadav','ajay@gmail.com',0,1,'2025-02-18 17:45:34.120293','2'),(3,'pbkdf2_sha256$870000$yJ8iS9rHEDVIiUj23zxxX5$34wCNe7wOpC4KC97hb+bXjg82rzFPbgr2G0lJy6/1aI=','2025-03-27 17:57:46.546133',0,'Arvind','Arvind','Garg','arvindgarg.obc@gmail.com',0,1,'2025-02-18 17:47:40.856826','2'),(4,'pbkdf2_sha256$1000000$Lab7Si4WNXkCqPRkTiXagc$GPU1MixjDWQt2zqtwr4yZG+23MPvnyA1oPDlpgA4+7c=','2025-04-14 08:34:33.476567',0,'asmita','Asmita','Kamal','asmita@gmail.com',0,1,'2025-02-18 17:59:01.479280','3'),(6,'pbkdf2_sha256$870000$NUF7Q9uC1XSM1kMzkapXWv$EpSnkcMk1x1g6bLx8sJFGxjCvDV5YOYeaSXp0gca2C4=','2025-03-02 19:41:13.358672',0,'dakshita','Dakshita','Arora','dakshita@gmail.com',0,1,'2025-02-18 18:19:32.820685','3'),(7,'pbkdf2_sha256$870000$DRtjJhJnp8GlhWCVFM8kT9$Eqk/JLoIaoc/5gzHBSDa/9Wy1/E7H1zlg23qWtDaGZo=','2025-03-27 18:16:04.375080',0,'ardhisha','Ardhisha','Jain','ardhisha@gmail.com',0,1,'2025-02-18 18:20:33.905133','3'),(8,'pbkdf2_sha256$870000$6WHcukXJHq4prXad9leL62$CT/fPflkERpDXM0U9P5zU/BjoAHaJUMijX3oi4DQi2w=','2025-03-03 21:09:26.901332',0,'Sonam','Sonam','Gupta','sonam@gmail.com',0,1,'2025-02-20 11:48:40.691185','3'),(9,'pbkdf2_sha256$870000$NNuuSA5H8SdRtq0hhA0iZx$P5KAI5RmeYxwHw/D+gaTUnd24HzN43K6jIJ9mg2thGc=',NULL,0,'Arohi','Arohi','Yadav','arohi20@gmail.com',0,1,'2025-02-20 11:50:35.251956','3'),(10,'pbkdf2_sha256$870000$tjqk2S46gfSEMIcjF6I0ri$VyEVkghPPhyKyR0RkNJ42c6pBCqGDU4+7Tj2Cr8O9mE=',NULL,0,'tashvi','Tashvi','Sharma','tashvi@gmail.com',0,1,'2025-02-21 17:44:03.560588','3'),(12,'pbkdf2_sha256$870000$jIPrVBoviBG24PCinDOgs8$Palmoq6QMEmUvYMnNBPVGijgukmhYxSHozHlmasRZKU=',NULL,0,'meera','Meera','Yadav','meera@gmail.com',0,1,'2025-02-21 18:47:12.491011','3'),(13,'pbkdf2_sha256$870000$OtDOMSN8AdinrLi4M5hz5f$OEJ8qFtqXlsZKDOHjjxYQ/F6dwuCOPIy8W+Sza1AXmo=',NULL,0,'JIYA','Jiyanshi','Oberoi','jiyanshi@gmail.com',0,1,'2025-02-21 18:48:19.329967','3'),(14,'pbkdf2_sha256$870000$TuUqiPcaDxhZ9hfzXff7lU$fJSFuSpWnGyyTJD6hT+fFMzSW7K1cdRqcpQNkdFHZ6g=','2025-05-02 19:38:07.432618',0,'anurag','Anurag','Gupta','anurag@gmail.com',0,1,'2025-02-21 19:39:36.678432','2'),(15,'pbkdf2_sha256$870000$gbW5OGNT4ukpYlEUGTWy7T$XVpsMYQ8rmHIiyG50yJ7mH5GeSvxdodqHY+F3RNEzZo=','2025-03-27 21:41:21.773992',1,'admin2','','','acadmea442@gmail.com',1,1,'2025-02-23 20:05:53.218331','1'),(16,'pbkdf2_sha256$870000$dK8RC3JpSZgwe4342RR9zC$OawbUJaClm5Y7ZevlBUHaART63KYKfy+hpzZPn2YjmU=',NULL,0,'gauri','Gauri','Saraswat','gauri@gmail.com',0,1,'2025-02-28 21:42:52.845547','3'),(18,'pbkdf2_sha256$870000$wnzqKBEj7sZJZv2L8S56CW$36HGvnYhQMsAtif012NNtfW9Gozn6h6guen5h8vo5Jk=','2025-05-02 19:35:57.775102',0,'tanvi','Tanvi','Gupta','tanvi@gmail.com',0,1,'2025-02-28 23:12:12.493771','3'),(20,'pbkdf2_sha256$600000$9PhnVc5BsyMpoBNxctTU6j$u3k/+GzsSykgFG/YPN84c1Hp5xx/9YzSBu++wjtuR00=',NULL,0,'palak','Palak','arora','palak@gmail.com',0,1,'2025-03-02 21:18:24.971016','3'),(34,'pbkdf2_sha256$870000$crqeYapkkJkEvIuHqys2Lx$qIJpLWHKK/uh9Q6V6weMJd0o0OZpSFJ1evWvALdKmvk=',NULL,0,'arora','Dakshita','arora','dakshita@gmail.com',0,1,'2025-03-03 02:34:48.270154','3'),(39,'pbkdf2_sha256$870000$Au31nsY3x7aKNfGt87sBPv$4aOTzC4RVjA04SsJDXCwcLJMek2/8YyqysLx/vJLsvY=',NULL,0,'rohit','rohit','yadav','rohit@gmail.com',0,1,'2025-03-03 02:57:33.695943','2'),(56,'pbkdf2_sha256$870000$6hr6lFt5in46EEI0dJwYz2$OMUolDCx1dytsWEwB9I5QQSKCp5VBvs1MHRBR9dQOVo=',NULL,0,'drishti','drishti','nanda','drishti@gmail.com',0,1,'2025-03-03 05:08:00.532576','3'),(61,'pbkdf2_sha256$870000$jGWISHgCzLgzmRMuWUBbYY$nh7eJuO/u47bgFW2RUcav+vXxxwmzQobxKKLLUr2xqQ=',NULL,0,'lakshay','lakshay','sharma','lakshay@gmail.com',0,1,'2025-03-03 05:24:26.369396','2'),(63,'pbkdf2_sha256$870000$zlNtFiWYLmiIz9S9aDnBsW$3rNoabFnYNQ19khFfzSBKTXt/UEbMchlLlbVp9xDvm0=','2025-03-27 17:35:32.567762',0,'sushma','Sushma','Garg','sushma@gmail.com',0,1,'2025-03-03 11:52:43.673870','2'),(64,'pbkdf2_sha256$600000$np8S3w1HdbAegdnj6MvSr8$OALO8qiepRPCcmOq1UzByzwvftKSnYgzHbJf9R8T3uk=',NULL,0,'diksha','diksha','Jain','diksha@gmail.com',0,1,'2025-03-03 20:21:49.603540','2'),(65,'pbkdf2_sha256$870000$3kYGtUzhz43WJanewh23hC$bkB8vSs6Ip+nWa7llJ4eC3fh9e7nZWo3lgGNTc+bdK8=','2025-03-27 17:37:25.865401',0,'sara','Sara','Khanna','Sara@gmail.com',0,1,'2025-03-03 22:04:41.586893','2'),(68,'pbkdf2_sha256$870000$58090Hxool541YR3LOozZJ$RpJNdywuOVrnGZGgNlNGDEMQRKy7nueEla92Utf9yvU=',NULL,0,'prabha','prabha','saxena','prabha@gmail.com',0,1,'2025-03-03 22:26:33.000095','3'),(74,'pbkdf2_sha256$870000$EDhFOJgYYH951DkJZu3bpj$PkS0iPLf5s9VoZo5MrdD1zEEN0Flid2sqKXBQ1fesO8=',NULL,0,'kashish','kashish','arora','kashish@gmail.com',0,1,'2025-03-26 15:57:41.085609','3'),(75,'pbkdf2_sha256$870000$QeHg0VdhN7s31kuZcbtmJ9$3+LSotMQO/MifqOPhGSEF9luPVXFLyD8lrYEEfXfuTA=',NULL,0,'Jeeyanshi','Jeeyanshi','Yadav','jeeyanshi@gmail.com',0,1,'2025-03-26 16:36:16.056567','3'),(76,'pbkdf2_sha256$870000$J1M4JI1Sn5Wx0Lq09A74xf$mik1NYoGIctNMi0UA7RYJhq6Gy/1WbK7vOcok2MMVyM=','2025-03-27 17:37:55.480072',0,'atharv','atharv','jain','atharv@gmail.com',0,1,'2025-03-26 18:39:43.943042','2'),(78,'pbkdf2_sha256$870000$Z1XPUhECFgrUMob7hZEroJ$naeStKW5eAG8hyvkat5sFGx6q5LwzX63B2oZT7CWonA=',NULL,0,'hiya','hiya','sharma','hiya@gmail.com',0,1,'2025-03-26 18:44:10.096811','3'),(79,'pbkdf2_sha256$870000$69lAJTH6s1Y1yin7UgeSxj$bYecxZTNtte+QByLgo7mTxyOWHPGuJ7/cfYmFQXLVB4=','2025-03-27 17:38:37.627902',0,'hia','hia','yadav','hia@gmail.com',0,1,'2025-03-26 18:58:19.004587','2'),(84,'pbkdf2_sha256$870000$AkDZMc69HWkNb6y4M3njwK$iod9+Q/MYom0tltXAM4mHmWZLUxGDpMLcwUb9ab+dsg=',NULL,0,'raghav','raghav','sharma','raghav@gmail.com',0,1,'2025-03-27 17:04:00.099065','2'),(85,'pbkdf2_sha256$870000$WRVX92rdfgGlsJEdzRtKt8$lg42q/jwfBzEHDXsnrLDnFePmec+oMR8wpEy3t7u/kg=','2025-03-28 09:54:58.007577',0,'srishti','srishti','mehta','srishti@gmail.com',0,1,'2025-03-27 17:07:52.340274','3'),(86,'pbkdf2_sha256$870000$BQyi2cW0aoqe23nBVCYstc$c40PFXPrsI3eQe/NH8MxPSQFWZBlIkhYP1V4+IOdV+0=',NULL,0,'amit','Amit','Sehgal','amit@gmail.com',0,1,'2025-03-27 17:10:17.381672','2'),(87,'pbkdf2_sha256$870000$5N0sKocW6p7BwoKnERARtF$JtBJ/BtrwCE4R5XfU2b8viv7lXAHd6DGtmG6rWtclAw=',NULL,0,'shreya','Shreya','Ojha','shreya@gmail.com',0,1,'2025-03-27 17:11:05.330642','2'),(88,'pbkdf2_sha256$870000$xQglaY5PGEphD3zvChsMbm$H54lUComFbbnVUKvwlsyfMgrXOy7FAEgV2FrMb4wyhw=',NULL,0,'anika','anika','Shukla','anika@gmail.com',0,1,'2025-03-27 17:11:43.024288','2'),(89,'pbkdf2_sha256$870000$1IFGLzHJ8r9sKTwKRvpZ26$vyd5kEBT73bsLIbfCGik55MigwgGse4u8q5UbmnzCmQ=',NULL,0,'anubhav','Anubhav','Salman','anubhav@gmail.com',0,1,'2025-03-27 17:12:35.241251','2'),(90,'pbkdf2_sha256$870000$dER8q3ynaVVpl2iAei2rFi$FFhDXvV4ox6zHF224m+VDF7TnhsX6Xm5vpn0OHAiF+M=',NULL,0,'vaishnavi','vaishnavi','yadav','vaishnavi@gmail.com',0,1,'2025-03-27 17:13:14.083110','2'),(93,'pbkdf2_sha256$870000$LpGWE54Lo8JrntOUe5oUH3$4mc/X6xrn+JdwWH60ndcNF6FY8d4OIgkf22G1zr9tC8=',NULL,0,'akankshagaur','AKANKSHA','GAUR','akankshagaur1407@gmail.com',0,1,'2025-03-27 17:25:46.607091','3'),(94,'pbkdf2_sha256$870000$h4UonosHrpqYgo7u5nkY0F$m0O1TkdmLHO2UxV2eC1Z3mpA+HMVqBxbCwNHNrwxeYU=','2025-03-27 17:43:32.999070',0,'akshitashree','AKSHITA','SHREE','akshitashree1910@gmail.com',0,1,'2025-03-27 17:27:32.201245','3'),(95,'pbkdf2_sha256$870000$hTkd4eeMbV52vnKiW5jjwk$EH2TQPW03F1GY/dE7cJZ9a5oXRBWiX6A30Qeo2hN+Sk=',NULL,0,'amishasrivastava','AMISHA','SRIVASTAVA','amishasrivastava13@gmail.com',0,1,'2025-03-27 17:28:49.920333','3'),(96,'pbkdf2_sha256$870000$JsQI6kzTRJmAtVoU5lKGpB$GGF98Mk0hXFtxQuWI6fRk8pLg6Re0OCRnqm926jA/po=',NULL,0,'amritakumari','AMRITA','KUMARI','amritakumari34129@gmail.com',0,1,'2025-03-27 17:31:20.358136','3'),(97,'pbkdf2_sha256$870000$oqiwYbdFdGVzBVHpedJUoR$pLVpYBQsewokN71Mq2/B85q6PFDHPCnmaAkm9+9hzpM=',NULL,0,'charuarora','CHARU','ARORA','charuarora20044@gmail.com',0,1,'2025-03-27 17:32:45.297709','3'),(98,'pbkdf2_sha256$870000$u2JrQfkA0wGdyhO6uZyxkW$BSmUmpgty0qHx4fbor4GVGNsnN6WPuxNrQcYo9keugI=','2025-03-27 18:07:33.875642',0,'eshasingh','ESHA','SINGH','eshasingh1814@gmail.com',0,1,'2025-03-27 17:34:59.356921','3'),(99,'pbkdf2_sha256$870000$IZCVqVyiORkKQXyXcQtTGI$kLBI1QlrpMybPmCjOfz1/va18SbrH+4/OW30GJAl8Hw=',NULL,0,'himanshi','HIMANSHI','GARG','himanshi.garg2405@gmail.com',0,1,'2025-03-27 17:39:05.320471','3'),(100,'pbkdf2_sha256$870000$NO2ymlEvjNkj8svP4OOzJo$WcZKFUp5q+3Af0Jdt05GCdumTqDFfgUOmYB0QsdI/3I=',NULL,0,'jainakhanooja','JAINA','KHANOOJA','jainakhanooja21@gmail.com',0,1,'2025-03-27 17:42:17.282113','3'),(101,'pbkdf2_sha256$870000$XxsMLaSkvhSuey8AHokRjw$j3xGyNlwgcwh2Go2X7kaNRN0F+Y0oWOJBG1bkdjY7/Y=',NULL,0,'mahi','MAHI','RASTOGI','mahirastogi907@gmail.com',0,1,'2025-03-27 17:44:43.718016','3'),(115,'pbkdf2_sha256$870000$O2LIJNFKvSu3YOGWtzDKQp$VAgKFrBfnGp/o1Pg0k/qLZcxbVTSFr4/GYQfFSyl44M=',NULL,0,'abha','Abha','Agarwal','abha@gmail.com',0,1,'2025-03-27 18:57:40.221053','3'),(116,'pbkdf2_sha256$870000$r3Ufiw2aVx9Af1plPCvIZ2$RSpHbMbMGo7Wi1KZNA631V6t9ViPyvJJCuaRFPB3Gt8=',NULL,0,'chitwan','Chitwan','Omer','chitwan@gmail.com',0,1,'2025-03-27 18:58:04.005605','2'),(122,'pbkdf2_sha256$870000$Qx5vSeh3fR7Cujo1XWQkE1$FhFQW5TXGqebJNCUpagTZV4JqL1XsBjjfda7XVQE0ow=',NULL,0,'preeti','Preeti','Kiran','preeti@gmail.com',0,1,'2025-03-27 19:10:47.241249','2'),(163,'pbkdf2_sha256$870000$nqdJA7iMae0v8Ww6YZLinI$lUCXCUTDD/4l0edXJO56zxUzlEvrcDCHezv+/+kBEw8=',NULL,0,'sdnskd','dhfef','nmd','hdjdj@gmail.com',0,1,'2025-03-27 20:43:01.028035','3'),(166,'pbkdf2_sha256$870000$z2AH3Tv11fZaPnhF3fOiNP$EJwpF0x3w5X4S5xZ2q9ttlVcX1yx7BlpXQzTpw6uQQA=',NULL,0,'dfnsfs','hdkfda','hdkfhds','jdkjf@gmail.com',0,1,'2025-03-27 20:44:24.403375','3'),(167,'pbkdf2_sha256$870000$kVcsWbJQpUyk9joNdmxtJi$4Ktv8pdp0sBIXCdwoY8m6cSW18Un5pb5zN+RLwJ+7g4=',NULL,0,'yasy','yasy','yasy','yasy@gmail.com',0,1,'2025-03-27 20:44:52.689438','3'),(168,'pbkdf2_sha256$870000$BjycgI6HJt4IMstWyAB1sU$Tl7lGO3jIkkFSCMMjHORPy0wEjEYXnajWUsJ2T05UjQ=',NULL,0,'efjfb','hjhj','hjj','hdhh@gmail.com',0,1,'2025-03-27 20:47:36.233081','3'),(169,'pbkdf2_sha256$870000$hDl1gREQtAFjZU7zTFXsGG$+3ypt3yZjBfxgF/oX11sJPsy6EC8Gytok30+aKUlwio=',NULL,0,'dfndf','jdkfdj','jdfjf','hjhjd@gmail.com',0,1,'2025-03-27 20:48:09.309848','3'),(170,'pbkdf2_sha256$870000$cpl1eIsFC14xOfGD3HGq0L$iAJkRYOx11oWSbLnV5khVvMhvHXzcKb7k1qW17WIxmI=',NULL,0,'sjddj','sjdkjd','jsdls','djdj@gmail.com',0,1,'2025-03-27 21:03:48.499917','3'),(171,'pbkdf2_sha256$870000$NgIeMYiTSlC4UQC500vmES$LLxR4zcsYLfcPj2CpxB/vyI0c+DBRM4rC7EdXCkdoyQ=',NULL,0,'sbdsdn','sdksd','ndkns','dfks@gmail.com',0,1,'2025-03-27 21:08:24.978480','3'),(172,'pbkdf2_sha256$870000$3YGHrIJvuvGQwOcWhEU0em$P2lsXnNGX6bwIMTdhxnmbu3BKbJZOCIexlF6+o8iu1g=',NULL,0,'sdnsdn','sndsn','sdks','jkshah@gmail.com',0,1,'2025-03-27 21:09:30.360501','3'),(173,'pbkdf2_sha256$870000$TM3C8BUpj4WGX83ew4yt20$JTIgbJj5kxftmi+fWhWKIyD4Iqm6jLyVNcZzd7+HOY8=',NULL,0,'shreyansh','Shreyansh','Garg','shreyansh@gmail.com',0,1,'2025-03-27 21:42:39.834581','2'),(174,'pbkdf2_sha256$870000$mGOtawezDYs6TkxueegYGm$v1iYjLqTiQ/tgGtFTGVn5uFoP2Wr+Vbxn3U92W1+jkc=',NULL,0,'priyaaa','priyaaa','sharma','priyaaa@gmail.com',0,1,'2025-03-28 08:57:41.387540','3'),(176,'pbkdf2_sha256$870000$fZEdi25eYubKjIPNcdAjpi$VqJVJoGH8wes6BIVfGJDnEitYpmQBHjL+vDuJEphvSk=',NULL,0,'abvd','hdhdd','jain','abc@gmail.com',0,1,'2025-03-28 12:18:10.778245','2'),(177,'pbkdf2_sha256$870000$0FhsiqvSlOhYR14eNRfreY$yRfqU7ntAx6tSNSfI56zpcR6Q8BrVsxf7BtxoNgqeD0=',NULL,0,'djdjd','jdhsd','dkdk','aghsg@gmail.com',0,1,'2025-03-29 16:16:34.234975','3'),(179,'pbkdf2_sha256$870000$P9JD1fWrtSsDAOpQ2QVDFl$hYhJNzRmbWG7m6jpmpJYSaPnsFeIiD/oZyn2oCDMU4M=',NULL,0,'dbdd','sjdks','djdjd','ddh@gmail.com',0,1,'2025-03-29 16:19:50.322265','3'),(180,'pbkdf2_sha256$870000$FFTn7zEQwW6v4gzqCoTAO4$yQKjVUUsK9Fw+UxJfHIcO2JEFs0LPk6zexrrmtHsHDY=',NULL,0,'dhdj','hkds','nsk','dgd@gmail.com',0,1,'2025-03-29 16:26:11.943712','3'),(181,'pbkdf2_sha256$870000$RcIcZ2kgVauOJ0I26JKUIx$xPslpqeqkmRkzQfH+XgOhpnJRAZcLKQ2eWqQdHoiQbE=',NULL,0,'dnd','djs','djcs','gdd@gmail.com',0,1,'2025-03-29 16:33:17.684986','3'),(182,'pbkdf2_sha256$870000$txTwzWSIRI2rE5xlACrwGu$UjYVp4DLQAoxhEG1hjDewh2LmhAEYTUVoudXvooIYyQ=',NULL,0,'dbf','sjs','jss','ddj@gmail.com',0,1,'2025-03-29 16:37:09.227317','3'),(185,'pbkdf2_sha256$870000$wIELgd477qOfUNilh1XF7L$V422T19F/QApb4z/RBLFWY149rGMWppJVnCLomOYMzw=',NULL,0,'ff','djd','jff','jdd254@gmail.com',0,1,'2025-03-29 16:39:14.594833','3'),(190,'pbkdf2_sha256$870000$L3DGeg47wzFnoJg2MlQcjb$g1kqdAZE6/f1yHC44ysUNDKvhWbsDXOUfQSgt3KHc1s=',NULL,0,'snd','kjd','mxs','dgdh@gmail.com',0,1,'2025-03-29 16:44:44.005785','3'),(192,'pbkdf2_sha256$870000$GHVHHfFYvWzTv2gvkxT0sB$t8pMOleh5hD/IAAeof4qfzxxl54WOsqibCFjyy0l7BI=',NULL,0,'ddd','kd','jd','jdj@gmail.com',0,1,'2025-03-29 16:51:11.151430','3'),(193,'pbkdf2_sha256$870000$VN3xS2JK0HmzSMat1cyFgN$GjO1kkFx5oCtKOEskCq/+lO6wvB9UEzDY/Z3PVwo4LY=',NULL,0,'jss','siaos','sks','fhfj@gmail.com',0,1,'2025-03-29 16:53:10.914025','3'),(201,'pbkdf2_sha256$870000$LG4crbKqeRorab5lC1iAeH$rLxr5ge3Ge2l4SKZZ+SNFlkPqbFkfmhGiorZERwFAac=',NULL,0,'ddn','jdd','jdd','jddj@gmail.com',0,1,'2025-03-29 17:07:22.385099','3'),(203,'pbkdf2_sha256$870000$hvO7PBEXazmL6EUibmOQaO$qI9Dn82Tt1gFwEgXfUmRwbAfGxJfDX/229kwPledRP4=',NULL,0,'ddj','jxjxjc','jdjd','gssh@gmail.com',0,1,'2025-03-29 17:09:23.273257','3'),(204,'pbkdf2_sha256$870000$uQBDKWaSBLw666LMr60UYD$Z89lBkDw508Mzp9Q1KTBYJnSx2vZ5JdqNhaM3WcOzc0=',NULL,0,'dddss','sjsj','xxj','hd@gmail.com',0,1,'2025-03-29 17:11:27.308332','3'),(206,'pbkdf2_sha256$870000$eVHk7qMSaHmzgFyidHdXC3$yztyHvcaoGmVpUMeYLaGO7Rw21yWgy9vKVjnynJWxHE=',NULL,0,'gargiiii','gargiiii','jainnn','gargiii@gmail.com',0,1,'2025-03-29 17:16:20.748259','3'),(207,'pbkdf2_sha256$870000$z3KtPfSfWR9n5PrAlJEbyK$aMFyfJiZJKISM6uHUxKee8ulIA4fFfMpTAsJ/4ZxYdU=',NULL,0,'arohii','arohiii','jainnn','arohi@gmail.com',0,1,'2025-03-29 17:18:38.960813','3'),(208,'pbkdf2_sha256$870000$UHsLykCCGHt7HJe0RuXXdS$JSgpw8xn/JCxt4ec73eAxhW0IGEGnuuNN0Z/jmeUpe8=',NULL,0,'sbs','xskx','jskxj','isd@gmail.com',0,1,'2025-03-29 17:19:59.122129','2'),(209,'pbkdf2_sha256$870000$sUpJ0KVNlhewpHsf6MCbnq$r9KaVM51o3tioPG72pJ4YR96daCld4sKru3fEyzH0X0=',NULL,0,'kihsuu','kishu','gupta','kishu@gmail.com',0,1,'2025-03-31 18:28:53.176163','3'),(211,'pbkdf2_sha256$1000000$Y1Q5tFpbtiVRwAldHL9sl3$ZKjL6qlDeZh1obeZBnrBtmobD5qFDB1Os6jf6MBAANY=','2025-04-09 21:37:32.927724',0,'ananya','Ananya','Garg','ananya@gmail.com',0,1,'2025-03-31 21:18:36.236381','3'),(213,'pbkdf2_sha256$870000$o5mISZSYNVszj30ML2b3bo$CX3roihRYCYDeZEoVe5PJrTr1OgA0qTqMLrRzwL1rHg=',NULL,0,'sakshi','Sakshi','Goyal','sakshi@gmail.com',0,1,'2025-04-01 19:36:08.110919','3'),(218,'pbkdf2_sha256$870000$fEM9FfQ4TjSDzvZg1J6XXv$NyrFk6YiRBzOBkFkOl+jtqhjBlTuECEIl+bn76sWZ24=',NULL,0,'tarushi 1','tarushi','kharbanda','tarushi@gmail.com',0,1,'2025-04-01 21:08:07.537019','2'),(219,'pbkdf2_sha256$870000$6FcaYVTvfHLGVye9wwEJQe$leCFNDRVnWwUsNJh2Qtznbu1utKAlgUl/T3WvL5s0xo=',NULL,0,'yoshi','yoshi','dsouza','yoshi@gmail.com',0,1,'2025-04-01 21:10:01.932102','3'),(220,'pbkdf2_sha256$870000$9p5RxtDP7rfmx2KKi2eu4E$NLYTARwr7Va0uApIELRIYSjxVb1SXBjHFf/2PrFTibM=',NULL,0,'aditi','Aditi','Garg','aditi@gmail.com',0,1,'2025-04-02 18:41:10.052494','3');
/*!40000 ALTER TABLE `acadme4_app_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_customuser_groups`
--

DROP TABLE IF EXISTS `acadme4_app_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `AcadME4_app_customuser_g_customuser_id_group_id_4716308e_uniq` (`customuser_id`,`group_id`),
  KEY `AcadME4_app_customuser_groups_group_id_4484dd27_fk_auth_group_id` (`group_id`),
  CONSTRAINT `AcadME4_app_customus_customuser_id_b6577e60_fk_AcadME4_a` FOREIGN KEY (`customuser_id`) REFERENCES `acadme4_app_customuser` (`id`),
  CONSTRAINT `AcadME4_app_customuser_groups_group_id_4484dd27_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_customuser_groups`
--

LOCK TABLES `acadme4_app_customuser_groups` WRITE;
/*!40000 ALTER TABLE `acadme4_app_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `acadme4_app_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_customuser_user_permissions`
--

DROP TABLE IF EXISTS `acadme4_app_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `AcadME4_app_customuser_u_customuser_id_permission_04d36de9_uniq` (`customuser_id`,`permission_id`),
  KEY `AcadME4_app_customus_permission_id_979f2d5f_fk_auth_perm` (`permission_id`),
  CONSTRAINT `AcadME4_app_customus_customuser_id_e42cd5cc_fk_AcadME4_a` FOREIGN KEY (`customuser_id`) REFERENCES `acadme4_app_customuser` (`id`),
  CONSTRAINT `AcadME4_app_customus_permission_id_979f2d5f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_customuser_user_permissions`
--

LOCK TABLES `acadme4_app_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `acadme4_app_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `acadme4_app_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_faq`
--

DROP TABLE IF EXISTS `acadme4_app_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_faq` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `answer` longtext NOT NULL,
  `user_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `question` (`question`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_faq`
--

LOCK TABLES `acadme4_app_faq` WRITE;
/*!40000 ALTER TABLE `acadme4_app_faq` DISABLE KEYS */;
INSERT INTO `acadme4_app_faq` VALUES (1,'How do I access my schedule?','To view your schedule, click on the \'Timetable\' option in the sidebar.','staff'),(2,'How can I take attendance?','To record attendance for students, select the \'Attendance\' tab in the sidebar.','staff'),(3,'Where can I add new assignments and review submitted assignments?','Navigate to the \'Assignments\' panel to add new assignments and check the submissions.','staff'),(4,'How do I edit my profile and change my password?','Click on \'Edit Profile\' at the top left corner, then click on your name to update your password, name, and other details.','staff'),(5,'How can I add and update student results?','To add or modify student results, click on the \'Add/Edit Result\' option in the sidebar.','staff'),(6,'Where can I find information about the college, gallery, and achievements?','The final two tabs in the sidebar provide details about the college, the gallery, and notable achievements.','staff'),(7,'How can I change my password?','To change your password, click on the profile icon in the top-left corner of the sidebar (Edit Profile) and follow the prompts.','admin'),(8,'Where can I view notifications?','You can view notifications by selecting the \'Notifications\' option in the sidebar.','admin'),(9,'How can I access feedback submitted by students and staff?','Access feedback by clicking on the \'Student and Staff Feedback\' option in the side panel.','admin'),(10,'How can I learn about college achievements and view the gallery?','The last two options in the sidebar provide details about college achievements and showcase the gallery.','admin'),(11,'Where can I add staff and students?','Add staff and students using the \'Add Staff\' and \'Add Student\' functionalities located in the left sidebar.','admin'),(12,'How can I manage course details?','Manage course details by navigating to the \'Courses\' section in the sidebar.','admin'),(13,'Where can I schedule classes?','You can schedule classes by using the \'Timetable\' option in the sidebar.','admin'),(14,'How can I view my timetable?','You can view your timetable by clicking on the \'Timetable\' option in your dashboard sidebar.','student'),(15,'How do I edit my profile?','To update your personal information or change your password, click on the \'Edit Profile\' option at the top left corner.','student'),(16,'Where can I view college achievements and the gallery?','Select the last two options in the sidebar to explore college achievements and view the gallery.','student'),(17,'How can I check my attendance?','To check your attendance, click on the \'Attendance\' tab in the sidebar.','student'),(18,'How can I view my results?','You can view your results by selecting the \'View Result\' option in the sidebar.','student'),(19,'How can I provide feedback?','Click on the \'Feedback\' tab in the side panel to submit your feedback.','student'),(20,'How do I submit assignments?','To submit assignments, navigate to the \'Submit Assignment\' section in the sidebar.','student'),(21,'How can I access handouts and books?','Access handouts and books by clicking on the \'Materials\' section in the sidebar.','student');
/*!40000 ALTER TABLE `acadme4_app_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_feedbackstaffs`
--

DROP TABLE IF EXISTS `acadme4_app_feedbackstaffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_feedbackstaffs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `feedback` longtext NOT NULL,
  `feedback_reply` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `staff_id_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AcadME4_app_feedback_staff_id_id_6c4ca578_fk_AcadME4_a` (`staff_id_id`),
  CONSTRAINT `AcadME4_app_feedback_staff_id_id_6c4ca578_fk_AcadME4_a` FOREIGN KEY (`staff_id_id`) REFERENCES `acadme4_app_staffs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_feedbackstaffs`
--

LOCK TABLES `acadme4_app_feedbackstaffs` WRITE;
/*!40000 ALTER TABLE `acadme4_app_feedbackstaffs` DISABLE KEYS */;
INSERT INTO `acadme4_app_feedbackstaffs` VALUES (9,'projector is not working in room no.121','tested','2025-03-27 17:34:04.416146','2025-03-27 17:34:04.416146',3),(10,'test case 1','tested','2025-03-27 17:36:05.766130','2025-03-27 17:36:05.766130',6),(11,'test case 3','tested','2025-03-27 17:37:37.938046','2025-03-27 17:37:37.938046',8),(12,'test case 5','tested','2025-03-27 17:38:17.769109','2025-03-27 17:38:17.769109',11),(13,'test case 6','tested','2025-03-27 17:38:55.014807','2025-03-27 17:38:55.014807',12),(14,'Test8','hi','2025-03-27 19:44:19.068330','2025-03-27 19:44:19.068330',1),(15,'test1000','','2025-03-27 21:03:52.117646','2025-03-27 21:03:52.117646',1),(16,'test','','2025-04-01 18:21:10.616417','2025-04-01 18:21:10.616417',1),(17,'hii','','2025-04-01 19:47:46.720625','2025-04-01 19:47:46.720625',1),(18,'jj','hii','2025-04-01 21:18:34.978929','2025-04-01 21:18:34.978929',1),(19,'hello','hello','2025-04-09 20:58:12.178882','2025-04-09 20:58:12.178908',1),(20,'hi','','2025-04-13 19:31:24.648564','2025-04-13 19:31:24.648590',1),(21,'testing','','2025-04-14 08:31:56.265701','2025-04-14 08:31:56.265721',1);
/*!40000 ALTER TABLE `acadme4_app_feedbackstaffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_feedbackstudent`
--

DROP TABLE IF EXISTS `acadme4_app_feedbackstudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_feedbackstudent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `feedback` longtext NOT NULL,
  `feedback_reply` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `student_id_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AcadME4_app_feedback_student_id_id_b88f342d_fk_AcadME4_a` (`student_id_id`),
  CONSTRAINT `AcadME4_app_feedback_student_id_id_b88f342d_fk_AcadME4_a` FOREIGN KEY (`student_id_id`) REFERENCES `acadme4_app_students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_feedbackstudent`
--

LOCK TABLES `acadme4_app_feedbackstudent` WRITE;
/*!40000 ALTER TABLE `acadme4_app_feedbackstudent` DISABLE KEYS */;
INSERT INTO `acadme4_app_feedbackstudent` VALUES (4,'test case1','tested','2025-03-27 17:43:55.546819','2025-03-27 17:43:55.546819',57),(5,'test case2','tested','2025-03-27 17:44:50.240478','2025-03-27 17:44:50.240478',54),(6,'I have Submitted Fees','tested','2025-03-27 18:27:21.137540','2025-03-27 18:27:21.137540',1),(7,'test case 5','tested','2025-03-27 18:31:57.540583','2025-03-27 18:31:57.540583',1),(8,'test case 6','tested','2025-03-27 18:32:03.219295','2025-03-27 18:32:03.219295',1),(9,'test45','tested','2025-03-27 21:06:29.495723','2025-03-27 21:06:29.495723',1),(10,'test case 7','OK','2025-03-31 18:37:59.053597','2025-03-31 18:37:59.053597',1),(11,'test case 7','jbfdb','2025-03-31 18:37:59.379287','2025-03-31 18:37:59.379287',1),(12,'test','jki','2025-04-01 18:31:01.477065','2025-04-01 18:31:01.477065',1),(13,'test','hi','2025-04-01 19:57:58.697528','2025-04-01 19:57:58.697528',1),(14,'hi','hi','2025-04-01 21:22:27.817295','2025-04-01 21:22:27.817295',1),(15,'xyz','','2025-04-13 20:08:48.308509','2025-04-13 20:08:48.308536',1),(16,'testing','','2025-04-14 08:35:03.158570','2025-04-14 08:35:03.158594',1);
/*!40000 ALTER TABLE `acadme4_app_feedbackstudent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_labs`
--

DROP TABLE IF EXISTS `acadme4_app_labs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_labs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lab_id` varchar(50) NOT NULL,
  `lab_name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `subject_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lab_id` (`lab_id`),
  KEY `AcadME4_app_labs_subject_id_dfb5d0e5_fk_AcadME4_app_subjects_id` (`subject_id`),
  CONSTRAINT `AcadME4_app_labs_subject_id_dfb5d0e5_fk_AcadME4_app_subjects_id` FOREIGN KEY (`subject_id`) REFERENCES `acadme4_app_subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_labs`
--

LOCK TABLES `acadme4_app_labs` WRITE;
/*!40000 ALTER TABLE `acadme4_app_labs` DISABLE KEYS */;
INSERT INTO `acadme4_app_labs` VALUES (3,'LCDS2','Compiler & Design Lab','2025-03-01 22:23:41.071889',14),(4,'LCSP2','Python Lab 2','2025-03-01 22:43:13.051312',35),(6,'LCSCOA5','COA Lab','2025-03-01 23:11:24.346192',17),(9,'LCSAI3','AI-ML Lab','2025-03-02 18:36:50.862022',42),(10,'LJava12','Java Lab','2025-03-02 18:37:57.956019',2),(11,'LCSD32','DBMS Lab','2025-03-02 18:38:14.022855',18),(12,'LCDS431','DBMS Lab','2025-03-03 11:58:16.745552',24),(13,'LC74','OOPS Lab','2025-03-03 11:59:04.371996',3),(17,'LB8011','Machine Learning Lab','2025-03-27 17:22:53.934879',35);
/*!40000 ALTER TABLE `acadme4_app_labs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_notificationstaffs`
--

DROP TABLE IF EXISTS `acadme4_app_notificationstaffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_notificationstaffs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `staff_id_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AcadME4_app_notifica_staff_id_id_98051a82_fk_AcadME4_a` (`staff_id_id`),
  CONSTRAINT `AcadME4_app_notifica_staff_id_id_98051a82_fk_AcadME4_a` FOREIGN KEY (`staff_id_id`) REFERENCES `acadme4_app_staffs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_notificationstaffs`
--

LOCK TABLES `acadme4_app_notificationstaffs` WRITE;
/*!40000 ALTER TABLE `acadme4_app_notificationstaffs` DISABLE KEYS */;
INSERT INTO `acadme4_app_notificationstaffs` VALUES (1,'departmnet closed','2025-02-18 19:44:47.318292','2025-02-18 19:44:47.318292',1),(2,'departmnet closed','2025-02-18 19:44:47.318292','2025-02-18 19:44:47.319286',2),(17,'There will be a holiday on 31st March,2025','2025-03-27 17:43:15.111553','2025-03-27 17:43:15.111553',1),(18,'There will be a holiday on 31st March,2025','2025-03-27 17:43:15.111553','2025-03-27 17:43:15.111553',2),(19,'There will be a holiday on 31st March,2025','2025-03-27 17:43:15.111553','2025-03-27 17:43:15.111553',3),(20,'There will be a holiday on 31st March,2025','2025-03-27 17:43:15.111553','2025-03-27 17:43:15.111553',4),(21,'There will be a holiday on 31st March,2025','2025-03-27 17:43:15.111553','2025-03-27 17:43:15.111553',5),(22,'There will be a holiday on 31st March,2025','2025-03-27 17:43:15.111553','2025-03-27 17:43:15.111553',6),(23,'There will be a holiday on 31st March,2025','2025-03-27 17:43:15.111553','2025-03-27 17:43:15.111553',7),(24,'There will be a holiday on 31st March,2025','2025-03-27 17:43:15.111553','2025-03-27 17:43:15.111553',8),(25,'There will be a holiday on 31st March,2025','2025-03-27 17:43:15.111553','2025-03-27 17:43:15.111553',11),(26,'There will be a holiday on 31st March,2025','2025-03-27 17:43:15.111553','2025-03-27 17:43:15.111553',12),(27,'There will be a holiday on 31st March,2025','2025-03-27 17:43:15.111553','2025-03-27 17:43:15.111553',13),(28,'There will be a holiday on 31st March,2025','2025-03-27 17:43:15.111553','2025-03-27 17:43:15.111553',14),(29,'There will be a holiday on 31st March,2025','2025-03-27 17:43:15.111553','2025-03-27 17:43:15.111553',15),(30,'There will be a holiday on 31st March,2025','2025-03-27 17:43:15.111553','2025-03-27 17:43:15.111553',16),(31,'There will be a holiday on 31st March,2025','2025-03-27 17:43:15.111553','2025-03-27 17:43:15.111553',17),(32,'There will be a holiday on 31st March,2025','2025-03-27 17:43:15.111553','2025-03-27 17:43:15.111553',18),(34,'test case 1','2025-03-27 17:50:22.805654','2025-03-27 17:50:22.805654',1),(35,'test case 1','2025-03-27 17:50:22.805654','2025-03-27 17:50:22.805654',2),(36,'test case 1','2025-03-27 17:50:22.805654','2025-03-27 17:50:22.805654',3),(37,'test case 1','2025-03-27 17:50:22.805654','2025-03-27 17:50:22.805654',4),(38,'test case 1','2025-03-27 17:50:22.805654','2025-03-27 17:50:22.805654',5),(39,'test case 1','2025-03-27 17:50:22.805654','2025-03-27 17:50:22.805654',6),(40,'test case 1','2025-03-27 17:50:22.805654','2025-03-27 17:50:22.805654',7),(41,'test case 1','2025-03-27 17:50:22.805654','2025-03-27 17:50:22.805654',8),(42,'test case 1','2025-03-27 17:50:22.805654','2025-03-27 17:50:22.805654',11),(43,'test case 1','2025-03-27 17:50:22.805654','2025-03-27 17:50:22.805654',12),(44,'test case 1','2025-03-27 17:50:22.805654','2025-03-27 17:50:22.805654',13),(45,'test case 1','2025-03-27 17:50:22.805654','2025-03-27 17:50:22.805654',14),(46,'test case 1','2025-03-27 17:50:22.805654','2025-03-27 17:50:22.805654',15),(47,'test case 1','2025-03-27 17:50:22.805654','2025-03-27 17:50:22.805654',16),(48,'test case 1','2025-03-27 17:50:22.805654','2025-03-27 17:50:22.805654',17),(49,'test case 1','2025-03-27 17:50:22.805654','2025-03-27 17:50:22.805654',18),(51,'test case 2','2025-03-27 17:50:29.529478','2025-03-27 17:50:29.529478',1),(52,'test case 2','2025-03-27 17:50:29.530480','2025-03-27 17:50:29.530480',2),(53,'test case 2','2025-03-27 17:50:29.530480','2025-03-27 17:50:29.530480',3),(54,'test case 2','2025-03-27 17:50:29.530480','2025-03-27 17:50:29.530480',4),(55,'test case 2','2025-03-27 17:50:29.530480','2025-03-27 17:50:29.530480',5),(56,'test case 2','2025-03-27 17:50:29.530480','2025-03-27 17:50:29.530480',6),(57,'test case 2','2025-03-27 17:50:29.530480','2025-03-27 17:50:29.530480',7),(58,'test case 2','2025-03-27 17:50:29.530480','2025-03-27 17:50:29.530480',8),(59,'test case 2','2025-03-27 17:50:29.530480','2025-03-27 17:50:29.530480',11),(60,'test case 2','2025-03-27 17:50:29.530480','2025-03-27 17:50:29.530480',12),(61,'test case 2','2025-03-27 17:50:29.530480','2025-03-27 17:50:29.530480',13),(62,'test case 2','2025-03-27 17:50:29.530480','2025-03-27 17:50:29.530480',14),(63,'test case 2','2025-03-27 17:50:29.530480','2025-03-27 17:50:29.530480',15),(64,'test case 2','2025-03-27 17:50:29.530480','2025-03-27 17:50:29.530480',16),(65,'test case 2','2025-03-27 17:50:29.530480','2025-03-27 17:50:29.530480',17),(66,'test case 2','2025-03-27 17:50:29.530480','2025-03-27 17:50:29.531469',18),(68,'test case 4','2025-03-27 17:50:54.607683','2025-03-27 17:50:54.608695',1),(69,'test case 4','2025-03-27 17:50:54.608695','2025-03-27 17:50:54.608695',2),(70,'test case 4','2025-03-27 17:50:54.608695','2025-03-27 17:50:54.609678',3),(71,'test case 4','2025-03-27 17:50:54.609678','2025-03-27 17:50:54.609678',4),(72,'test case 4','2025-03-27 17:50:54.609678','2025-03-27 17:50:54.609678',5),(73,'test case 4','2025-03-27 17:50:54.609678','2025-03-27 17:50:54.609678',6),(74,'test case 4','2025-03-27 17:50:54.609678','2025-03-27 17:50:54.609678',7),(75,'test case 4','2025-03-27 17:50:54.609678','2025-03-27 17:50:54.609678',8),(76,'test case 4','2025-03-27 17:50:54.609678','2025-03-27 17:50:54.609678',11),(77,'test case 4','2025-03-27 17:50:54.609678','2025-03-27 17:50:54.609678',12),(78,'test case 4','2025-03-27 17:50:54.609678','2025-03-27 17:50:54.609678',13),(79,'test case 4','2025-03-27 17:50:54.610716','2025-03-27 17:50:54.610716',14),(80,'test case 4','2025-03-27 17:50:54.610716','2025-03-27 17:50:54.610716',15),(81,'test case 4','2025-03-27 17:50:54.610716','2025-03-27 17:50:54.610716',16),(82,'test case 4','2025-03-27 17:50:54.610716','2025-03-27 17:50:54.610716',17),(83,'test case 4','2025-03-27 17:50:54.610716','2025-03-27 17:50:54.610716',18),(85,'test case 5','2025-03-27 17:51:05.047063','2025-03-27 17:51:05.047063',1),(86,'test case 5','2025-03-27 17:51:05.047063','2025-03-27 17:51:05.047063',2),(87,'test case 5','2025-03-27 17:51:05.047063','2025-03-27 17:51:05.047063',3),(88,'test case 5','2025-03-27 17:51:05.047063','2025-03-27 17:51:05.047063',4),(89,'test case 5','2025-03-27 17:51:05.047063','2025-03-27 17:51:05.047063',5),(90,'test case 5','2025-03-27 17:51:05.047063','2025-03-27 17:51:05.047063',6),(91,'test case 5','2025-03-27 17:51:05.047063','2025-03-27 17:51:05.047063',7),(92,'test case 5','2025-03-27 17:51:05.047063','2025-03-27 17:51:05.047063',8),(93,'test case 5','2025-03-27 17:51:05.047063','2025-03-27 17:51:05.047063',11),(94,'test case 5','2025-03-27 17:51:05.047063','2025-03-27 17:51:05.047063',12),(95,'test case 5','2025-03-27 17:51:05.047063','2025-03-27 17:51:05.047063',13),(96,'test case 5','2025-03-27 17:51:05.047063','2025-03-27 17:51:05.047063',14),(97,'test case 5','2025-03-27 17:51:05.047063','2025-03-27 17:51:05.047063',15),(98,'test case 5','2025-03-27 17:51:05.047063','2025-03-27 17:51:05.047063',16),(99,'test case 5','2025-03-27 17:51:05.047063','2025-03-27 17:51:05.047063',17),(100,'test case 5','2025-03-27 17:51:05.047063','2025-03-27 17:51:05.047063',18),(102,'test case 7','2025-03-27 17:51:17.371610','2025-03-27 17:51:17.371610',1),(103,'test case 7','2025-03-27 17:51:17.371610','2025-03-27 17:51:17.371610',2),(104,'test case 7','2025-03-27 17:51:17.371610','2025-03-27 17:51:17.371610',3),(105,'test case 7','2025-03-27 17:51:17.371610','2025-03-27 17:51:17.371610',4),(106,'test case 7','2025-03-27 17:51:17.371610','2025-03-27 17:51:17.371610',5),(107,'test case 7','2025-03-27 17:51:17.371610','2025-03-27 17:51:17.371610',6),(108,'test case 7','2025-03-27 17:51:17.371610','2025-03-27 17:51:17.371610',7),(109,'test case 7','2025-03-27 17:51:17.371610','2025-03-27 17:51:17.371610',8),(110,'test case 7','2025-03-27 17:51:17.371610','2025-03-27 17:51:17.371610',11),(111,'test case 7','2025-03-27 17:51:17.371610','2025-03-27 17:51:17.371610',12),(112,'test case 7','2025-03-27 17:51:17.371610','2025-03-27 17:51:17.373984',13),(113,'test case 7','2025-03-27 17:51:17.373984','2025-03-27 17:51:17.373984',14),(114,'test case 7','2025-03-27 17:51:17.373984','2025-03-27 17:51:17.373984',15),(115,'test case 7','2025-03-27 17:51:17.373984','2025-03-27 17:51:17.373984',16),(116,'test case 7','2025-03-27 17:51:17.373984','2025-03-27 17:51:17.373984',17),(117,'test case 7','2025-03-27 17:51:17.373984','2025-03-27 17:51:17.373984',18),(119,'t5','2025-03-28 12:21:01.989750','2025-03-28 12:21:01.989750',1),(120,'t5','2025-03-28 12:21:01.989750','2025-03-28 12:21:01.989750',2),(121,'t5','2025-03-28 12:21:01.989750','2025-03-28 12:21:01.989750',3),(122,'t5','2025-03-28 12:21:01.989750','2025-03-28 12:21:01.989750',4),(123,'t5','2025-03-28 12:21:01.989750','2025-03-28 12:21:01.989750',5),(124,'t5','2025-03-28 12:21:01.989750','2025-03-28 12:21:01.989750',6),(125,'t5','2025-03-28 12:21:01.989750','2025-03-28 12:21:01.989750',7),(126,'t5','2025-03-28 12:21:01.989750','2025-03-28 12:21:01.989750',8),(127,'t5','2025-03-28 12:21:01.989750','2025-03-28 12:21:01.989750',11),(128,'t5','2025-03-28 12:21:01.989750','2025-03-28 12:21:01.989750',12),(129,'t5','2025-03-28 12:21:01.989750','2025-03-28 12:21:01.989750',13),(130,'t5','2025-03-28 12:21:01.989750','2025-03-28 12:21:01.989750',14),(131,'t5','2025-03-28 12:21:01.989750','2025-03-28 12:21:01.989750',15),(132,'t5','2025-03-28 12:21:01.989750','2025-03-28 12:21:01.989750',16),(133,'t5','2025-03-28 12:21:01.989750','2025-03-28 12:21:01.989750',17),(134,'t5','2025-03-28 12:21:01.989750','2025-03-28 12:21:01.989750',18),(135,'t5','2025-03-28 12:21:01.989750','2025-03-28 12:21:01.989750',20),(136,'t5','2025-03-28 12:21:01.989750','2025-03-28 12:21:01.989750',21),(137,'t5','2025-03-28 12:21:01.989750','2025-03-28 12:21:01.989750',23),(138,'t5','2025-03-28 12:21:01.989750','2025-03-28 12:21:01.989750',24),(139,'hii','2025-03-29 18:45:40.317931','2025-03-29 18:45:40.317931',1),(140,'hii','2025-03-29 18:45:40.317931','2025-03-29 18:45:40.317931',2),(141,'hii','2025-03-29 18:45:40.317931','2025-03-29 18:45:40.318928',3),(142,'hii','2025-03-29 18:45:40.318928','2025-03-29 18:45:40.318928',4),(143,'hii','2025-03-29 18:45:40.318928','2025-03-29 18:45:40.318928',5),(144,'hii','2025-03-29 18:45:40.318928','2025-03-29 18:45:40.318928',6),(145,'hii','2025-03-29 18:45:40.318928','2025-03-29 18:45:40.318928',7),(146,'hii','2025-03-29 18:45:40.318928','2025-03-29 18:45:40.318928',8),(147,'hii','2025-03-29 18:45:40.318928','2025-03-29 18:45:40.318928',11),(148,'hii','2025-03-29 18:45:40.318928','2025-03-29 18:45:40.318928',12),(149,'hii','2025-03-29 18:45:40.318928','2025-03-29 18:45:40.318928',13),(150,'hii','2025-03-29 18:45:40.318928','2025-03-29 18:45:40.318928',14),(151,'hii','2025-03-29 18:45:40.318928','2025-03-29 18:45:40.318928',15),(152,'hii','2025-03-29 18:45:40.318928','2025-03-29 18:45:40.318928',16),(153,'hii','2025-03-29 18:45:40.318928','2025-03-29 18:45:40.318928',17),(154,'hii','2025-03-29 18:45:40.318928','2025-03-29 18:45:40.318928',18),(155,'hii','2025-03-29 18:45:40.318928','2025-03-29 18:45:40.318928',20),(156,'hii','2025-03-29 18:45:40.318928','2025-03-29 18:45:40.318928',21),(157,'hii','2025-03-29 18:45:40.318928','2025-03-29 18:45:40.318928',23),(158,'hii','2025-03-29 18:45:40.318928','2025-03-29 18:45:40.318928',24),(159,'hii','2025-03-29 18:45:40.318928','2025-03-29 18:45:40.318928',25),(160,'hey','2025-04-13 19:58:51.217661','2025-04-13 19:58:51.217683',1),(161,'hey','2025-04-13 19:58:51.217695','2025-04-13 19:58:51.217702',2),(162,'hey','2025-04-13 19:58:51.217711','2025-04-13 19:58:51.217718',3),(163,'hey','2025-04-13 19:58:51.217769','2025-04-13 19:58:51.217776',4),(164,'hey','2025-04-13 19:58:51.217785','2025-04-13 19:58:51.217792',5),(165,'hey','2025-04-13 19:58:51.217802','2025-04-13 19:58:51.217809',6),(166,'hey','2025-04-13 19:58:51.217819','2025-04-13 19:58:51.217826',7),(167,'hey','2025-04-13 19:58:51.217835','2025-04-13 19:58:51.217842',8),(168,'hey','2025-04-13 19:58:51.217853','2025-04-13 19:58:51.217859',11),(169,'hey','2025-04-13 19:58:51.217868','2025-04-13 19:58:51.217874',12),(170,'hey','2025-04-13 19:58:51.217883','2025-04-13 19:58:51.217889',13),(171,'hey','2025-04-13 19:58:51.217899','2025-04-13 19:58:51.217905',14),(172,'hey','2025-04-13 19:58:51.217915','2025-04-13 19:58:51.217922',15),(173,'hey','2025-04-13 19:58:51.217933','2025-04-13 19:58:51.217939',16),(174,'hey','2025-04-13 19:58:51.217949','2025-04-13 19:58:51.217956',17),(175,'hey','2025-04-13 19:58:51.217965','2025-04-13 19:58:51.217971',18),(176,'hey','2025-04-13 19:58:51.217982','2025-04-13 19:58:51.217988',20),(177,'hey','2025-04-13 19:58:51.217997','2025-04-13 19:58:51.218003',21),(178,'hey','2025-04-13 19:58:51.218013','2025-04-13 19:58:51.218019',23),(179,'hey','2025-04-13 19:58:51.218028','2025-04-13 19:58:51.218035',24),(180,'hey','2025-04-13 19:58:51.218044','2025-04-13 19:58:51.218050',25),(181,'hey','2025-04-13 19:58:51.218060','2025-04-13 19:58:51.218066',29);
/*!40000 ALTER TABLE `acadme4_app_notificationstaffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_notificationstudent`
--

DROP TABLE IF EXISTS `acadme4_app_notificationstudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_notificationstudent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `student_id_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AcadME4_app_notifica_student_id_id_c1af55d3_fk_AcadME4_a` (`student_id_id`),
  CONSTRAINT `AcadME4_app_notifica_student_id_id_c1af55d3_fk_AcadME4_a` FOREIGN KEY (`student_id_id`) REFERENCES `acadme4_app_students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_notificationstudent`
--

LOCK TABLES `acadme4_app_notificationstudent` WRITE;
/*!40000 ALTER TABLE `acadme4_app_notificationstudent` DISABLE KEYS */;
INSERT INTO `acadme4_app_notificationstudent` VALUES (126,'There will be a holiday on 31st March,2025','2025-03-27 17:41:49.195252','2025-03-27 17:41:49.195252',3),(127,'There will be a holiday on 31st March,2025','2025-03-27 17:41:49.195252','2025-03-27 17:41:49.195252',4),(128,'There will be a holiday on 31st March,2025','2025-03-27 17:41:49.195252','2025-03-27 17:41:49.195252',6),(129,'There will be a holiday on 31st March,2025','2025-03-27 17:41:49.195252','2025-03-27 17:41:49.195252',7),(130,'There will be a holiday on 31st March,2025','2025-03-27 17:41:49.195252','2025-03-27 17:41:49.195252',9),(131,'There will be a holiday on 31st March,2025','2025-03-27 17:41:49.195252','2025-03-27 17:41:49.195252',11),(132,'There will be a holiday on 31st March,2025','2025-03-27 17:41:49.195252','2025-03-27 17:41:49.195252',13),(133,'There will be a holiday on 31st March,2025','2025-03-27 17:41:49.195252','2025-03-27 17:41:49.195252',36),(134,'There will be a holiday on 31st March,2025','2025-03-27 17:41:49.195252','2025-03-27 17:41:49.195252',42),(135,'There will be a holiday on 31st March,2025','2025-03-27 17:41:49.195252','2025-03-27 17:41:49.195252',42),(136,'There will be a holiday on 31st March,2025','2025-03-27 17:41:49.196753','2025-03-27 17:41:49.196753',48),(138,'There will be a holiday on 31st March,2025','2025-03-27 17:41:49.196753','2025-03-27 17:41:49.196753',54),(139,'There will be a holiday on 31st March,2025','2025-03-27 17:41:49.196753','2025-03-27 17:41:49.196753',56),(140,'There will be a holiday on 31st March,2025','2025-03-27 17:41:49.196753','2025-03-27 17:41:49.196753',57),(141,'There will be a holiday on 31st March,2025','2025-03-27 17:41:49.196753','2025-03-27 17:41:49.196753',58),(142,'There will be a holiday on 31st March,2025','2025-03-27 17:41:49.196753','2025-03-27 17:41:49.196753',59),(143,'There will be a holiday on 31st March,2025','2025-03-27 17:41:49.196753','2025-03-27 17:41:49.196753',60),(144,'There will be a holiday on 31st March,2025','2025-03-27 17:41:49.196753','2025-03-27 17:41:49.196753',61),(145,'There will be a holiday on 31st March,2025','2025-03-27 17:41:49.196753','2025-03-27 17:41:49.196753',62),(146,'Test1','2025-03-27 17:43:23.110717','2025-03-27 17:43:23.110717',1),(147,'Test1','2025-03-27 17:43:23.110717','2025-03-27 17:43:23.110717',3),(148,'Test1','2025-03-27 17:43:23.110717','2025-03-27 17:43:23.110717',4),(149,'Test1','2025-03-27 17:43:23.110717','2025-03-27 17:43:23.110717',6),(150,'Test1','2025-03-27 17:43:23.110717','2025-03-27 17:43:23.110717',7),(151,'Test1','2025-03-27 17:43:23.110717','2025-03-27 17:43:23.110717',9),(152,'Test1','2025-03-27 17:43:23.110717','2025-03-27 17:43:23.110717',11),(153,'Test1','2025-03-27 17:43:23.111732','2025-03-27 17:43:23.111732',13),(154,'Test1','2025-03-27 17:43:23.111732','2025-03-27 17:43:23.111732',36),(155,'Test1','2025-03-27 17:43:23.111732','2025-03-27 17:43:23.111732',42),(156,'Test1','2025-03-27 17:43:23.111732','2025-03-27 17:43:23.111732',42),(157,'Test1','2025-03-27 17:43:23.111732','2025-03-27 17:43:23.111732',48),(159,'Test1','2025-03-27 17:43:23.111732','2025-03-27 17:43:23.111732',54),(160,'Test1','2025-03-27 17:43:23.111732','2025-03-27 17:43:23.111732',56),(161,'Test1','2025-03-27 17:43:23.111732','2025-03-27 17:43:23.111732',57),(162,'Test1','2025-03-27 17:43:23.111732','2025-03-27 17:43:23.111732',58),(163,'Test1','2025-03-27 17:43:23.111732','2025-03-27 17:43:23.111732',59),(164,'Test1','2025-03-27 17:43:23.111732','2025-03-27 17:43:23.111732',60),(165,'Test1','2025-03-27 17:43:23.111732','2025-03-27 17:43:23.111732',61),(166,'Test1','2025-03-27 17:43:23.111732','2025-03-27 17:43:23.111732',62),(167,'Test1','2025-03-27 17:43:23.111732','2025-03-27 17:43:23.111732',63),(168,'Test2','2025-03-27 17:43:30.781658','2025-03-27 17:43:30.781658',1),(169,'Test2','2025-03-27 17:43:30.781658','2025-03-27 17:43:30.781658',3),(170,'Test2','2025-03-27 17:43:30.781658','2025-03-27 17:43:30.781658',4),(171,'Test2','2025-03-27 17:43:30.781658','2025-03-27 17:43:30.781658',6),(172,'Test2','2025-03-27 17:43:30.781658','2025-03-27 17:43:30.781658',7),(173,'Test2','2025-03-27 17:43:30.781658','2025-03-27 17:43:30.781658',9),(174,'Test2','2025-03-27 17:43:30.781658','2025-03-27 17:43:30.781658',11),(175,'Test2','2025-03-27 17:43:30.781658','2025-03-27 17:43:30.781658',13),(176,'Test2','2025-03-27 17:43:30.781658','2025-03-27 17:43:30.781658',36),(177,'Test2','2025-03-27 17:43:30.781658','2025-03-27 17:43:30.781658',42),(178,'Test2','2025-03-27 17:43:30.781658','2025-03-27 17:43:30.781658',42),(179,'Test2','2025-03-27 17:43:30.781658','2025-03-27 17:43:30.781658',48),(181,'Test2','2025-03-27 17:43:30.781658','2025-03-27 17:43:30.781658',54),(182,'Test2','2025-03-27 17:43:30.781658','2025-03-27 17:43:30.781658',56),(183,'Test2','2025-03-27 17:43:30.781658','2025-03-27 17:43:30.781658',57),(184,'Test2','2025-03-27 17:43:30.781658','2025-03-27 17:43:30.781658',58),(185,'Test2','2025-03-27 17:43:30.781658','2025-03-27 17:43:30.781658',59),(186,'Test2','2025-03-27 17:43:30.781658','2025-03-27 17:43:30.781658',60),(187,'Test2','2025-03-27 17:43:30.781658','2025-03-27 17:43:30.781658',61),(188,'Test2','2025-03-27 17:43:30.783064','2025-03-27 17:43:30.783064',62),(189,'Test2','2025-03-27 17:43:30.783064','2025-03-27 17:43:30.783064',63),(190,'Test3','2025-03-27 17:43:36.898706','2025-03-27 17:43:36.898706',1),(191,'Test3','2025-03-27 17:43:36.898706','2025-03-27 17:43:36.898706',3),(192,'Test3','2025-03-27 17:43:36.898706','2025-03-27 17:43:36.898706',4),(193,'Test3','2025-03-27 17:43:36.898706','2025-03-27 17:43:36.898706',6),(194,'Test3','2025-03-27 17:43:36.898706','2025-03-27 17:43:36.898706',7),(195,'Test3','2025-03-27 17:43:36.898706','2025-03-27 17:43:36.898706',9),(196,'Test3','2025-03-27 17:43:36.898706','2025-03-27 17:43:36.898706',11),(197,'Test3','2025-03-27 17:43:36.898706','2025-03-27 17:43:36.900155',13),(199,'Test3','2025-03-27 17:43:36.900155','2025-03-27 17:43:36.900155',42),(200,'Test3','2025-03-27 17:43:36.900155','2025-03-27 17:43:36.900155',42),(201,'Test3','2025-03-27 17:43:36.900155','2025-03-27 17:43:36.900155',48),(203,'Test3','2025-03-27 17:43:36.900155','2025-03-27 17:43:36.900155',54),(204,'Test3','2025-03-27 17:43:36.900155','2025-03-27 17:43:36.900155',56),(205,'Test3','2025-03-27 17:43:36.900155','2025-03-27 17:43:36.900155',57),(206,'Test3','2025-03-27 17:43:36.900155','2025-03-27 17:43:36.900155',58),(207,'Test3','2025-03-27 17:43:36.900155','2025-03-27 17:43:36.900155',59),(208,'Test3','2025-03-27 17:43:36.900155','2025-03-27 17:43:36.900155',60),(209,'Test3','2025-03-27 17:43:36.900155','2025-03-27 17:43:36.900155',61),(210,'Test3','2025-03-27 17:43:36.900155','2025-03-27 17:43:36.900155',62),(211,'Test3','2025-03-27 17:43:36.900155','2025-03-27 17:43:36.900155',63),(212,'Test4','2025-03-27 17:43:41.968504','2025-03-27 17:43:41.968504',1),(213,'Test4','2025-03-27 17:43:41.968504','2025-03-27 17:43:41.968504',3),(214,'Test4','2025-03-27 17:43:41.968504','2025-03-27 17:43:41.968504',4),(215,'Test4','2025-03-27 17:43:41.968504','2025-03-27 17:43:41.968504',6),(216,'Test4','2025-03-27 17:43:41.968504','2025-03-27 17:43:41.968504',7),(217,'Test4','2025-03-27 17:43:41.968504','2025-03-27 17:43:41.968504',9),(218,'Test4','2025-03-27 17:43:41.968504','2025-03-27 17:43:41.968504',11),(219,'Test4','2025-03-27 17:43:41.968504','2025-03-27 17:43:41.968504',13),(220,'Test4','2025-03-27 17:43:41.968504','2025-03-27 17:43:41.968504',36),(221,'Test4','2025-03-27 17:43:41.969509','2025-03-27 17:43:41.969509',42),(222,'Test4','2025-03-27 17:43:41.969509','2025-03-27 17:43:41.969509',42),(223,'Test4','2025-03-27 17:43:41.969509','2025-03-27 17:43:41.969509',48),(225,'Test4','2025-03-27 17:43:41.969509','2025-03-27 17:43:41.969509',54),(226,'Test4','2025-03-27 17:43:41.969509','2025-03-27 17:43:41.969509',56),(227,'Test4','2025-03-27 17:43:41.969509','2025-03-27 17:43:41.969509',57),(228,'Test4','2025-03-27 17:43:41.969509','2025-03-27 17:43:41.969509',58),(229,'Test4','2025-03-27 17:43:41.969509','2025-03-27 17:43:41.969509',59),(230,'Test4','2025-03-27 17:43:41.969509','2025-03-27 17:43:41.969509',60),(231,'Test4','2025-03-27 17:43:41.970504','2025-03-27 17:43:41.970504',61),(232,'Test4','2025-03-27 17:43:41.970504','2025-03-27 17:43:41.970504',62),(233,'Test4','2025-03-27 17:43:41.970504','2025-03-27 17:43:41.970504',63),(234,'Test5','2025-03-27 17:43:47.648198','2025-03-27 17:43:47.648198',1),(235,'Test5','2025-03-27 17:43:47.648198','2025-03-27 17:43:47.649354',3),(236,'Test5','2025-03-27 17:43:47.649354','2025-03-27 17:43:47.649354',4),(237,'Test5','2025-03-27 17:43:47.649354','2025-03-27 17:43:47.649354',6),(238,'Test5','2025-03-27 17:43:47.649354','2025-03-27 17:43:47.649354',7),(239,'Test5','2025-03-27 17:43:47.649354','2025-03-27 17:43:47.649354',9),(240,'Test5','2025-03-27 17:43:47.649354','2025-03-27 17:43:47.649354',11),(241,'Test5','2025-03-27 17:43:47.649354','2025-03-27 17:43:47.649354',13),(242,'Test5','2025-03-27 17:43:47.649354','2025-03-27 17:43:47.649354',36),(243,'Test5','2025-03-27 17:43:47.649354','2025-03-27 17:43:47.649354',42),(244,'Test5','2025-03-27 17:43:47.649354','2025-03-27 17:43:47.649354',42),(245,'Test5','2025-03-27 17:43:47.649354','2025-03-27 17:43:47.649354',48),(247,'Test5','2025-03-27 17:43:47.649354','2025-03-27 17:43:47.649354',54),(248,'Test5','2025-03-27 17:43:47.649354','2025-03-27 17:43:47.649354',56),(249,'Test5','2025-03-27 17:43:47.649354','2025-03-27 17:43:47.649354',57),(250,'Test5','2025-03-27 17:43:47.649354','2025-03-27 17:43:47.649354',58),(251,'Test5','2025-03-27 17:43:47.649354','2025-03-27 17:43:47.649354',59),(252,'Test5','2025-03-27 17:43:47.649354','2025-03-27 17:43:47.649354',60),(253,'Test5','2025-03-27 17:43:47.649354','2025-03-27 17:43:47.649354',61),(254,'Test5','2025-03-27 17:43:47.649354','2025-03-27 17:43:47.649354',62),(255,'Test5','2025-03-27 17:43:47.649354','2025-03-27 17:43:47.649354',63),(256,'test','2025-03-27 20:52:48.315030','2025-03-27 20:52:48.315030',1),(257,'test','2025-03-27 20:52:48.315030','2025-03-27 20:52:48.315030',3),(258,'test','2025-03-27 20:52:48.315030','2025-03-27 20:52:48.315030',4),(259,'test','2025-03-27 20:52:48.315030','2025-03-27 20:52:48.315030',6),(260,'test','2025-03-27 20:52:48.315030','2025-03-27 20:52:48.315030',7),(261,'test','2025-03-27 20:52:48.315030','2025-03-27 20:52:48.315030',9),(262,'test','2025-03-27 20:52:48.316065','2025-03-27 20:52:48.316065',11),(263,'test','2025-03-27 20:52:48.316065','2025-03-27 20:52:48.316065',13),(264,'test','2025-03-27 20:52:48.316065','2025-03-27 20:52:48.316065',36),(265,'test','2025-03-27 20:52:48.316065','2025-03-27 20:52:48.316065',42),(266,'test','2025-03-27 20:52:48.316065','2025-03-27 20:52:48.316065',48),(268,'test','2025-03-27 20:52:48.316065','2025-03-27 20:52:48.316065',54),(269,'test','2025-03-27 20:52:48.316065','2025-03-27 20:52:48.316065',56),(270,'test','2025-03-27 20:52:48.316065','2025-03-27 20:52:48.316065',57),(271,'test','2025-03-27 20:52:48.316065','2025-03-27 20:52:48.316065',58),(272,'test','2025-03-27 20:52:48.316065','2025-03-27 20:52:48.316065',59),(273,'test','2025-03-27 20:52:48.316065','2025-03-27 20:52:48.316065',60),(274,'test','2025-03-27 20:52:48.316065','2025-03-27 20:52:48.316065',61),(275,'test','2025-03-27 20:52:48.316065','2025-03-27 20:52:48.316065',62),(276,'test','2025-03-27 20:52:48.317078','2025-03-27 20:52:48.317078',63),(277,'test','2025-03-27 20:52:48.317078','2025-03-27 20:52:48.317078',64),(278,'hi','2025-03-28 09:42:44.070427','2025-03-28 09:42:44.070427',1),(279,'hi','2025-03-28 09:42:44.070427','2025-03-28 09:42:44.070427',3),(280,'hi','2025-03-28 09:42:44.070427','2025-03-28 09:42:44.070427',4),(281,'hi','2025-03-28 09:42:44.070427','2025-03-28 09:42:44.070427',6),(282,'hi','2025-03-28 09:42:44.070427','2025-03-28 09:42:44.070427',7),(283,'hi','2025-03-28 09:42:44.070427','2025-03-28 09:42:44.070427',9),(284,'hi','2025-03-28 09:42:44.070427','2025-03-28 09:42:44.070427',11),(285,'hi','2025-03-28 09:42:44.070427','2025-03-28 09:42:44.070427',13),(286,'hi','2025-03-28 09:42:44.070427','2025-03-28 09:42:44.070427',36),(287,'hi','2025-03-28 09:42:44.070427','2025-03-28 09:42:44.070427',42),(288,'hi','2025-03-28 09:42:44.070427','2025-03-28 09:42:44.070427',48),(290,'hi','2025-03-28 09:42:44.070427','2025-03-28 09:42:44.070427',54),(291,'hi','2025-03-28 09:42:44.070427','2025-03-28 09:42:44.070427',56),(292,'hi','2025-03-28 09:42:44.070427','2025-03-28 09:42:44.070427',57),(293,'hi','2025-03-28 09:42:44.070427','2025-03-28 09:42:44.070427',58),(294,'hi','2025-03-28 09:42:44.070427','2025-03-28 09:42:44.070427',59),(295,'hi','2025-03-28 09:42:44.070427','2025-03-28 09:42:44.070427',60),(296,'hi','2025-03-28 09:42:44.070427','2025-03-28 09:42:44.070427',61),(297,'hi','2025-03-28 09:42:44.070427','2025-03-28 09:42:44.070427',62),(298,'hi','2025-03-28 09:42:44.070427','2025-03-28 09:42:44.070427',63),(299,'hi','2025-03-28 09:42:44.070427','2025-03-28 09:42:44.070427',64),(300,'hii','2025-03-29 16:41:43.359795','2025-03-29 16:41:43.359795',1),(301,'hii','2025-03-29 16:41:43.359795','2025-03-29 16:41:43.359795',3),(302,'hii','2025-03-29 16:41:43.359795','2025-03-29 16:41:43.359795',4),(303,'hii','2025-03-29 16:41:43.359795','2025-03-29 16:41:43.359795',6),(304,'hii','2025-03-29 16:41:43.359795','2025-03-29 16:41:43.360746',7),(305,'hii','2025-03-29 16:41:43.360746','2025-03-29 16:41:43.360746',9),(306,'hii','2025-03-29 16:41:43.360746','2025-03-29 16:41:43.360746',11),(307,'hii','2025-03-29 16:41:43.360746','2025-03-29 16:41:43.360746',13),(308,'hii','2025-03-29 16:41:43.360746','2025-03-29 16:41:43.360746',36),(309,'hii','2025-03-29 16:41:43.360746','2025-03-29 16:41:43.360746',42),(310,'hii','2025-03-29 16:41:43.360746','2025-03-29 16:41:43.360746',48),(312,'hii','2025-03-29 16:41:43.360746','2025-03-29 16:41:43.360746',54),(313,'hii','2025-03-29 16:41:43.360746','2025-03-29 16:41:43.360746',56),(314,'hii','2025-03-29 16:41:43.360746','2025-03-29 16:41:43.360746',57),(315,'hii','2025-03-29 16:41:43.360746','2025-03-29 16:41:43.360746',58),(316,'hii','2025-03-29 16:41:43.360746','2025-03-29 16:41:43.360746',59),(317,'hii','2025-03-29 16:41:43.360746','2025-03-29 16:41:43.360746',60),(318,'hii','2025-03-29 16:41:43.360746','2025-03-29 16:41:43.360746',61),(319,'hii','2025-03-29 16:41:43.360746','2025-03-29 16:41:43.360746',62),(320,'hii','2025-03-29 16:41:43.360746','2025-03-29 16:41:43.360746',63),(321,'hii','2025-03-29 16:41:43.360746','2025-03-29 16:41:43.360746',64),(322,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',1),(323,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',3),(324,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',4),(325,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',6),(326,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',7),(327,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',9),(328,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',11),(329,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',13),(330,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',36),(331,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',42),(332,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',48),(334,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',54),(335,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',56),(336,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',57),(337,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',58),(338,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',59),(339,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',60),(340,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',61),(341,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',62),(342,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',63),(343,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',64),(344,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',82),(345,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',83),(346,'no','2025-03-31 18:31:32.293891','2025-03-31 18:31:32.293891',84),(347,'hi','2025-04-13 19:58:41.293582','2025-04-13 19:58:41.293616',82),(348,'hi','2025-04-13 19:58:41.293629','2025-04-13 19:58:41.293636',83),(349,'hi','2025-04-13 19:58:41.293644','2025-04-13 19:58:41.293651',84),(350,'hi','2025-04-13 19:58:41.293661','2025-04-13 19:58:41.293666',85),(351,'hi','2025-04-13 19:58:41.293674','2025-04-13 19:58:41.293680',87),(352,'hi','2025-04-13 19:58:41.293689','2025-04-13 19:58:41.293695',90),(353,'hi','2025-04-13 19:58:41.293704','2025-04-13 19:58:41.293710',91),(354,'hiii','2025-04-14 08:25:00.580669','2025-04-14 08:25:00.580691',1),(355,'hiii','2025-04-14 08:25:00.580702','2025-04-14 08:25:00.580708',3),(356,'hiii','2025-04-14 08:25:00.580716','2025-04-14 08:25:00.580721',4),(357,'hiii','2025-04-14 08:25:00.580729','2025-04-14 08:25:00.580734',6),(358,'hiii','2025-04-14 08:25:00.580741','2025-04-14 08:25:00.580745',7),(359,'hiii','2025-04-14 08:25:00.580753','2025-04-14 08:25:00.580758',9),(360,'hiii','2025-04-14 08:25:00.580765','2025-04-14 08:25:00.580770',11),(361,'hiii','2025-04-14 08:25:00.580777','2025-04-14 08:25:00.580782',13),(362,'hiii','2025-04-14 08:25:00.580789','2025-04-14 08:25:00.580794',36),(363,'hiii','2025-04-14 08:25:00.580801','2025-04-14 08:25:00.580806',42),(364,'hiii','2025-04-14 08:25:00.580813','2025-04-14 08:25:00.580818',48),(365,'hiii','2025-04-14 08:25:00.580825','2025-04-14 08:25:00.580830',54),(366,'hiii','2025-04-14 08:25:00.580837','2025-04-14 08:25:00.580841',56),(367,'hiii','2025-04-14 08:25:00.580848','2025-04-14 08:25:00.580854',57),(368,'hiii','2025-04-14 08:25:00.580860','2025-04-14 08:25:00.580866',58),(369,'hiii','2025-04-14 08:25:00.580872','2025-04-14 08:25:00.580877',59),(370,'hiii','2025-04-14 08:25:00.580884','2025-04-14 08:25:00.580889',60),(371,'hiii','2025-04-14 08:25:00.580897','2025-04-14 08:25:00.580901',61),(372,'hiii','2025-04-14 08:25:00.580908','2025-04-14 08:25:00.580913',62),(373,'hiii','2025-04-14 08:25:00.580920','2025-04-14 08:25:00.580924',63),(374,'hiii','2025-04-14 08:25:00.580931','2025-04-14 08:25:00.580936',64),(375,'hiii','2025-04-14 08:25:00.580942','2025-04-14 08:25:00.580947',82),(376,'hiii','2025-04-14 08:25:00.580953','2025-04-14 08:25:00.580958',83),(377,'hiii','2025-04-14 08:25:00.580965','2025-04-14 08:25:00.580970',84),(378,'hiii','2025-04-14 08:25:00.580977','2025-04-14 08:25:00.580982',85),(379,'hiii','2025-04-14 08:25:00.580989','2025-04-14 08:25:00.580993',87),(380,'hiii','2025-04-14 08:25:00.581000','2025-04-14 08:25:00.581004',90),(381,'hiii','2025-04-14 08:25:00.581011','2025-04-14 08:25:00.581016',91);
/*!40000 ALTER TABLE `acadme4_app_notificationstudent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_passwordresettoken`
--

DROP TABLE IF EXISTS `acadme4_app_passwordresettoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_passwordresettoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `AcadME4_app_password_user_id_6a5b1a75_fk_AcadME4_a` (`user_id`),
  CONSTRAINT `AcadME4_app_password_user_id_6a5b1a75_fk_AcadME4_a` FOREIGN KEY (`user_id`) REFERENCES `acadme4_app_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_passwordresettoken`
--

LOCK TABLES `acadme4_app_passwordresettoken` WRITE;
/*!40000 ALTER TABLE `acadme4_app_passwordresettoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `acadme4_app_passwordresettoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_sessionyearmodel`
--

DROP TABLE IF EXISTS `acadme4_app_sessionyearmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_sessionyearmodel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_start_year` date NOT NULL,
  `session_end_year` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_sessionyearmodel`
--

LOCK TABLES `acadme4_app_sessionyearmodel` WRITE;
/*!40000 ALTER TABLE `acadme4_app_sessionyearmodel` DISABLE KEYS */;
INSERT INTO `acadme4_app_sessionyearmodel` VALUES (1,'2025-04-04','2026-04-04'),(5,'2025-03-15','2026-03-28'),(6,'2025-03-28','2027-03-28'),(7,'2024-01-01','2025-01-01'),(8,'2025-01-01','2025-12-31'),(9,'2025-01-01','2025-12-31'),(10,'2025-01-01','2025-12-31'),(11,'2025-04-03','2025-04-17');
/*!40000 ALTER TABLE `acadme4_app_sessionyearmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_staffs`
--

DROP TABLE IF EXISTS `acadme4_app_staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_staffs` (
  `gender` varchar(15) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` varchar(20) NOT NULL,
  `address` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `admin_id` bigint NOT NULL,
  `profile_pic` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_id` (`admin_id`),
  CONSTRAINT `AcadME4_app_staffs_admin_id_4a73da43_fk_AcadME4_a` FOREIGN KEY (`admin_id`) REFERENCES `acadme4_app_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_staffs`
--

LOCK TABLES `acadme4_app_staffs` WRITE;
/*!40000 ALTER TABLE `acadme4_app_staffs` DISABLE KEYS */;
INSERT INTO `acadme4_app_staffs` VALUES ('Male',1,'TC5578','BV','2025-02-18 17:45:35.415732','2025-02-18 17:45:35.415732',2,'/media/smiling-young-man-illustration_1308-174669_Gzxcatr_Gdkc8NZ.avif'),('Male',2,'TC44445','Agra','2025-02-18 17:47:42.181478','2025-02-18 17:47:42.181478',3,'/media/smiling-young-man-illustration_1308-174669.avif'),('Male',3,'TC33347','Kanpur','2025-02-21 19:39:37.137142','2025-02-21 19:39:37.137142',14,'/media/smiling-young-man-illustration_1308-174669_WGB9m8E.avif'),('Male',4,'TC1520','Police Line, Gurgaon','2025-03-03 02:57:34.909951','2025-03-03 02:57:34.909951',39,'/media/IMG_20230206_180600_4SNMdOl_ZFpAnf8.jpg'),('Male',5,'TC2112','Sector 4,Delhi','2025-03-03 05:24:27.241452','2025-03-03 05:24:27.241452',61,'/media/Screenshot_20221104_033725.png'),('Female',6,'TC7771','Agra','2025-03-03 11:52:44.385353','2025-03-03 11:52:44.386453',63,'/media/avatar-01_DE39GkE.jpg'),('Female',7,'TC0408','Harayana','2025-03-03 20:21:50.397507','2025-03-03 20:21:50.397507',64,'/media/avatar-01_jxsMWn2.jpg'),('Female',8,'TC6879','goa','2025-03-03 22:04:43.546149','2025-03-03 22:04:43.546149',65,'/media/avatar-01_2U6RQt7_7L066FO_x6oBGH1.jpg'),('Male',11,'TC11111','Gurgaon','2025-03-26 18:39:44.840728','2025-03-26 18:39:44.840728',76,'/media/istockphoto-1142192548-612x612_h8CwOy4.jpg'),('Female',12,'TC678','Jharkhand','2025-03-26 18:58:19.794576','2025-03-26 18:58:19.794576',79,'/media/istockphoto-1142192548-612x612.jpg'),('Male',13,'TC9990','pune','2025-03-27 17:04:01.287975','2025-03-27 17:04:01.287975',84,'/media/istockphoto-1142192548-612x612_2LeUCcp.jpg'),('Male',14,'TC3316','Kashipur','2025-03-27 17:10:18.547086','2025-03-27 17:10:18.549639',86,'/media/smiling-young-man-illustration_1308-174669_Gzxcatr.avif'),('Female',15,'TC5512','Agra','2025-03-27 17:11:06.460676','2025-03-27 17:11:06.460676',87,'/media/avatar-01_nX99S3n.jpg'),('Female',16,'TC9901','Delhi','2025-03-27 17:11:44.365121','2025-03-27 17:11:44.365121',88,'/media/avatar-01_2U6RQt7_kx5Ml0Q.jpg'),('Male',17,'TC55001','Kashmir','2025-03-27 17:12:36.595262','2025-03-27 17:12:36.595262',89,'/media/istockphoto-1142192548-612x612_h8CwOy4_pP4aVT7.jpg'),('Female',18,'TC4210','Bihar','2025-03-27 17:13:15.467292','2025-03-27 17:13:15.467292',90,'/media/avatar-17_4Jn4i6m_0uMwKtI.jpg'),('Male',20,'TC6452','Noida','2025-03-27 18:58:04.306459','2025-03-27 18:58:04.306459',116,'/media/smiling-young-man-illustration_1308-174669_YY8PNCf.avif'),('Female',21,'TC87800','Kanpur','2025-03-27 19:10:48.518886','2025-03-27 19:10:48.518886',122,'/media/avatar-01_prKOqNt.jpg'),('Male',23,'TC8543','Agra','2025-03-27 21:42:41.235262','2025-03-27 21:42:41.235262',173,'/media/avatar5.png'),('Female',24,'','delhiu','2025-03-28 12:18:12.035859','2025-03-28 12:18:12.035859',176,'/media/avatar2_4tYBgEK.png'),('Female',25,'shj895','shjiushfj','2025-03-29 17:20:00.242475','2025-03-29 17:20:00.242475',208,'/media/avatar-01_2FUZUvr_vDqZDTd.jpg'),('Female',29,'','delhi ','2025-04-01 21:08:08.304955','2025-04-01 21:08:08.304955',218,'/media/avatar-01_2FUZUvr_mtxMqBc.jpg');
/*!40000 ALTER TABLE `acadme4_app_staffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_studentresult`
--

DROP TABLE IF EXISTS `acadme4_app_studentresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_studentresult` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assignment2_marks` double DEFAULT NULL,
  `assignment1_marks` double DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `student_id_id` int NOT NULL,
  `subject_id_id` int NOT NULL,
  `periodical1_marks` double DEFAULT NULL,
  `periodical2_marks` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AcadME4_app_studentr_student_id_id_f8586149_fk_AcadME4_a` (`student_id_id`),
  KEY `AcadME4_app_studentr_subject_id_id_2f5298ee_fk_AcadME4_a` (`subject_id_id`),
  CONSTRAINT `AcadME4_app_studentr_student_id_id_f8586149_fk_AcadME4_a` FOREIGN KEY (`student_id_id`) REFERENCES `acadme4_app_students` (`id`),
  CONSTRAINT `AcadME4_app_studentr_subject_id_id_2f5298ee_fk_AcadME4_a` FOREIGN KEY (`subject_id_id`) REFERENCES `acadme4_app_subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_studentresult`
--

LOCK TABLES `acadme4_app_studentresult` WRITE;
/*!40000 ALTER TABLE `acadme4_app_studentresult` DISABLE KEYS */;
INSERT INTO `acadme4_app_studentresult` VALUES (1,4,9,'2025-02-18 18:27:30.382111','2025-02-18 18:27:30.382111',1,1,8,5),(2,4,6,'2025-02-21 18:40:11.284338','2025-02-21 18:40:11.284338',4,2,NULL,NULL),(3,6,8,'2025-02-21 18:48:52.279536','2025-02-21 18:48:52.279536',1,2,10,5),(4,7,6,'2025-02-21 20:28:38.564747','2025-02-21 20:28:38.564747',3,1,6,6),(5,6,6,'2025-02-21 20:28:38.580784','2025-02-21 20:28:38.580784',4,1,6,6),(6,6,6,'2025-02-21 20:28:38.595251','2025-02-21 20:28:38.595251',6,1,6,6),(7,6,6,'2025-02-21 20:28:38.597719','2025-02-21 20:28:38.597719',7,1,6,6),(8,9,10,'2025-02-21 21:43:38.307981','2025-02-21 21:43:38.307981',3,2,9,9),(9,NULL,NULL,'2025-02-21 21:43:38.320013','2025-02-21 21:43:38.320013',6,2,NULL,NULL),(10,78,6,'2025-02-21 21:43:38.322759','2025-02-21 21:43:38.322759',7,2,NULL,NULL),(11,5,5,'2025-02-21 21:43:52.316674','2025-02-21 21:43:52.316674',1,3,5,5),(12,5,5,'2025-02-21 21:43:52.339701','2025-02-21 21:43:52.339701',3,3,8,5),(13,5,5,'2025-02-21 21:43:52.352673','2025-02-21 21:43:52.352673',4,3,5,5),(14,5,5,'2025-02-21 21:43:52.355804','2025-02-21 21:43:52.355804',6,3,5,5),(15,5,5,'2025-02-21 21:43:52.372825','2025-02-21 21:43:52.372825',7,3,5,5),(16,NULL,NULL,'2025-03-02 19:53:04.672899','2025-03-02 19:53:04.672899',11,2,NULL,NULL),(18,NULL,NULL,'2025-03-02 22:12:58.743829','2025-03-02 22:12:58.743829',11,1,NULL,NULL),(21,5,5,'2025-03-03 22:07:17.506773','2025-03-03 22:07:17.507771',36,2,6,3),(22,3,4,'2025-03-03 22:10:48.994235','2025-03-03 22:10:48.994235',9,19,24,NULL),(23,NULL,8,'2025-03-03 22:28:34.623442','2025-03-03 22:28:34.623442',1,11,NULL,NULL),(24,NULL,3,'2025-03-03 22:28:34.670505','2025-03-03 22:28:34.670505',7,11,NULL,NULL),(26,6,8,'2025-03-03 22:28:34.728842','2025-03-03 22:28:34.728842',36,11,NULL,NULL),(27,7,6,'2025-03-27 17:52:39.649914','2025-03-27 17:52:39.649914',13,14,9,10),(28,8,4,'2025-03-27 17:52:39.863963','2025-03-27 17:52:39.863963',42,14,3,5),(29,3,4,'2025-03-27 17:52:40.082411','2025-03-27 17:52:40.082411',56,14,7,6),(30,2,5,'2025-03-27 17:53:36.724995','2025-03-27 17:53:36.724995',9,16,7,3),(31,6,5,'2025-03-27 17:53:36.799529','2025-03-27 17:53:36.799529',61,16,7,4),(32,8,7,'2025-03-27 17:53:36.958049','2025-03-27 17:53:36.958049',62,16,8,5),(33,5,8,'2025-03-27 17:53:37.077878','2025-03-27 17:53:37.077878',63,16,6,7),(34,8,9,'2025-03-27 17:55:08.139851','2025-03-27 17:55:08.139851',13,24,8,7),(35,9,8,'2025-03-27 17:55:08.155634','2025-03-27 17:55:08.155634',42,24,9,6),(36,7,9,'2025-03-27 17:55:08.164261','2025-03-27 17:55:08.164261',56,24,6,8),(37,6,5,'2025-03-27 17:56:40.973720','2025-03-27 17:56:40.973720',9,15,6,9),(38,8,8,'2025-03-27 17:56:41.240330','2025-03-27 17:56:41.240330',61,15,5,9),(39,6,9,'2025-03-27 17:56:41.395865','2025-03-27 17:56:41.395865',62,15,4,8),(40,6,8,'2025-03-27 17:56:41.741416','2025-03-27 17:56:41.741416',63,15,6,6),(41,9,6,'2025-03-27 19:42:17.712037','2025-03-27 19:42:17.712037',1,18,8,8),(42,9,9,'2025-03-27 19:42:17.729268','2025-03-27 19:42:17.729268',3,18,7,6),(43,6,9,'2025-03-27 19:42:17.729268','2025-03-27 19:42:17.729268',7,18,8,6),(44,7,9,'2025-03-27 19:42:17.745182','2025-03-27 19:42:17.745182',36,18,6,9),(45,9,8,'2025-03-27 19:42:17.745182','2025-03-27 19:42:17.745182',48,18,8,7),(47,9,5,'2025-03-27 19:42:17.778211','2025-03-27 19:42:17.778211',54,18,8,8),(48,7,7,'2025-03-27 19:42:17.778211','2025-03-27 19:42:17.778211',58,18,7,NULL),(49,NULL,8,'2025-03-27 21:02:42.865066','2025-03-27 21:02:42.865066',36,1,NULL,NULL),(50,3,12,'2025-03-27 21:02:42.914942','2025-03-27 21:02:42.914942',48,1,6,7),(52,NULL,NULL,'2025-03-27 21:02:43.018217','2025-03-27 21:02:43.018217',54,1,NULL,NULL),(53,NULL,NULL,'2025-03-27 21:02:43.047818','2025-03-27 21:02:43.047818',58,1,NULL,NULL),(54,9,8,'2025-03-28 09:38:02.396638','2025-03-28 09:38:02.396638',48,2,10,10),(56,10,10,'2025-03-28 09:38:02.421338','2025-03-28 09:38:02.421338',54,2,10,10),(57,10,10,'2025-03-28 09:38:02.428427','2025-03-28 09:38:02.428427',58,2,10,10),(65,NULL,10,'2025-03-29 21:03:24.261062','2025-03-29 21:03:24.261062',1,17,NULL,NULL),(66,NULL,10,'2025-03-29 21:03:24.316399','2025-03-29 21:03:24.316399',3,17,NULL,NULL),(67,NULL,6,'2025-03-29 21:03:24.368345','2025-03-29 21:03:24.368345',36,17,NULL,NULL),(68,NULL,10,'2025-03-29 21:03:24.424957','2025-03-29 21:03:24.424957',48,17,NULL,NULL),(70,NULL,NULL,'2025-03-29 21:03:24.541307','2025-03-29 21:03:24.541307',54,17,NULL,NULL),(71,NULL,NULL,'2025-03-29 21:03:24.602804','2025-03-29 21:03:24.602804',58,17,NULL,NULL),(72,NULL,NULL,'2025-04-01 19:51:21.151174','2025-04-01 19:51:21.151174',85,1,NULL,NULL),(73,7,NULL,'2025-04-02 20:07:40.793675','2025-04-02 20:07:40.793675',3,11,NULL,NULL),(74,NULL,NULL,'2025-04-02 20:07:40.829280','2025-04-02 20:07:40.829280',48,11,9,NULL),(76,NULL,NULL,'2025-04-02 20:07:40.856012','2025-04-02 20:07:40.856012',54,11,NULL,NULL),(77,NULL,NULL,'2025-04-02 20:07:40.870302','2025-04-02 20:07:40.870302',58,11,NULL,NULL),(78,NULL,NULL,'2025-04-02 20:07:40.884458','2025-04-02 20:07:40.884458',85,11,NULL,NULL),(79,NULL,NULL,'2025-04-02 20:10:48.391453','2025-04-02 20:10:48.391453',85,2,NULL,NULL),(80,6,NULL,'2025-04-02 20:11:10.339791','2025-04-02 20:11:10.339791',36,3,NULL,NULL),(81,NULL,9,'2025-04-02 20:11:10.355540','2025-04-02 20:11:10.355540',48,3,8,NULL),(83,NULL,NULL,'2025-04-02 20:11:10.384304','2025-04-02 20:11:10.384304',54,3,NULL,NULL),(84,NULL,NULL,'2025-04-02 20:11:10.397673','2025-04-02 20:11:10.398845',58,3,NULL,NULL),(85,NULL,NULL,'2025-04-02 20:11:10.411869','2025-04-02 20:11:10.411869',85,3,NULL,NULL),(86,NULL,NULL,'2025-04-02 20:11:56.810775','2025-04-02 20:11:56.810775',1,12,NULL,NULL),(87,NULL,NULL,'2025-04-02 20:11:56.831408','2025-04-02 20:11:56.831408',3,12,6,NULL),(88,5,NULL,'2025-04-02 20:11:56.844406','2025-04-02 20:11:56.844406',36,12,NULL,NULL),(89,NULL,NULL,'2025-04-02 20:11:56.859418','2025-04-02 20:11:56.859418',48,12,NULL,NULL),(91,NULL,NULL,'2025-04-02 20:11:56.884453','2025-04-02 20:11:56.884453',54,12,NULL,NULL),(92,NULL,NULL,'2025-04-02 20:11:56.897632','2025-04-02 20:11:56.897632',58,12,NULL,NULL),(93,NULL,NULL,'2025-04-02 20:11:56.909561','2025-04-02 20:11:56.909561',85,12,NULL,NULL),(94,NULL,NULL,'2025-04-02 20:12:54.560038','2025-04-02 20:12:54.561040',85,17,NULL,NULL),(95,NULL,NULL,'2025-04-02 20:13:09.744115','2025-04-02 20:13:09.744115',85,18,NULL,NULL);
/*!40000 ALTER TABLE `acadme4_app_studentresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_students`
--

DROP TABLE IF EXISTS `acadme4_app_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roll_no` varchar(20) NOT NULL,
  `btbt_id` varchar(30) NOT NULL,
  `profile_pic` varchar(100) NOT NULL,
  `address` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `admin_id` bigint NOT NULL,
  `course_id_id` int NOT NULL,
  `session_year_id_id` int NOT NULL DEFAULT '5',
  `branch_id_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roll_no` (`roll_no`),
  UNIQUE KEY `admin_id` (`admin_id`),
  KEY `AcadME4_app_students_course_id_id_5099fb29_fk_AcadME4_a` (`course_id_id`),
  KEY `AcadME4_app_students_session_year_id_id_963e7ad7_fk_AcadME4_a` (`session_year_id_id`),
  KEY `AcadME4_app_students_branch_id_id_336985ae_fk_AcadME4_a` (`branch_id_id`),
  CONSTRAINT `AcadME4_app_students_admin_id_d98a4ac3_fk_AcadME4_a` FOREIGN KEY (`admin_id`) REFERENCES `acadme4_app_customuser` (`id`),
  CONSTRAINT `AcadME4_app_students_branch_id_id_336985ae_fk_AcadME4_a` FOREIGN KEY (`branch_id_id`) REFERENCES `acadme4_app_branch` (`id`),
  CONSTRAINT `AcadME4_app_students_course_id_id_5099fb29_fk_AcadME4_a` FOREIGN KEY (`course_id_id`) REFERENCES `acadme4_app_courses` (`id`),
  CONSTRAINT `AcadME4_app_students_session_year_fk` FOREIGN KEY (`session_year_id_id`) REFERENCES `acadme4_app_sessionyearmodel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_students`
--

LOCK TABLES `acadme4_app_students` WRITE;
/*!40000 ALTER TABLE `acadme4_app_students` DISABLE KEYS */;
INSERT INTO `acadme4_app_students` VALUES (1,'2216245','BTBTC22165','/media/avatar-17_tKejKNh.jpg','Delhii','2025-02-18 17:59:02.983295','2025-02-18 17:59:02.983295',4,1,5,2),(3,'2216258','BTBTC22164','/media/avatar-07_qRRKVKf_oXWO1fj.jpg','Delhi','2025-02-18 18:19:34.289447','2025-02-18 18:19:34.289447',6,1,5,2),(4,'2216145','BTBTC22145','/media/avatar-01_D5NqYJJ_6vsTWe4.jpg','Gurgaon','2025-02-18 18:20:35.242328','2025-02-18 18:20:35.242328',7,1,5,4),(6,'2216236','BTBTC22147','/media/avatar-01_UVisini_Esu3BjO.jpg','Police Lines,Gurgaon','2025-02-20 11:50:36.604796','2025-02-20 11:50:36.604796',9,1,5,4),(7,'2216324','BTBTC22176','/media/avatar3_vLXhzZw.png','haryana','2025-02-21 17:44:14.422967','2025-02-21 17:44:14.422967',10,1,5,28),(9,'2216723','BTBTC22162','/media/avatar-08_hOVoRay_X9qNf0S.jpg','Rail vihar,Gurgaon','2025-02-21 18:47:14.419088','2025-02-21 18:47:14.419088',12,4,5,3),(11,'221836','BTBTC221632','/media/avatar-17_tKejKNh_U2qsasu_xHCH6aM.jpg','kashipur','2025-02-28 21:42:53.754408','2025-02-28 21:42:53.754408',16,1,5,4),(13,'2216220','BTBTC22177','/media/avatar-01_2U6RQt7_494WMSF.jpg','Anand enclave','2025-02-28 23:12:13.038425','2025-02-28 23:12:13.038425',18,2,5,5),(36,'2216279','BTBTC4569','/media/avatar-01_vMMDTmr.jpg','Delhi','2025-03-03 05:08:02.138597','2025-03-03 05:08:02.138597',56,1,5,2),(42,'221625','BTBTC789','/media/avatar-01_jxsMWn2_7mSD5QB.jpg','delhi','2025-03-03 22:26:34.708084','2025-03-03 22:26:34.708084',68,2,5,5),(48,'2217353','BTBTC22519','/media/avatar-01_n4w3efl.jpg','Gurgaon','2025-03-26 16:36:17.385015','2025-03-26 16:36:17.385015',75,1,5,2),(54,'22233367','BTBTC10002','/media/avatar-01_d3wPB6T.jpg','guragon','2025-03-27 17:07:53.522066','2025-03-27 17:07:53.522066',85,1,5,2),(56,'2216204','btbtc22244','/media/avatar-01_mz3RGFI.jpg','Agra','2025-03-27 17:25:47.445676','2025-03-27 17:25:47.445676',93,2,5,5),(57,'2216207','btbtc22109','/media/avatar-01_M4RCbbI.jpg','Pune','2025-03-27 17:27:33.519573','2025-03-27 17:27:33.519573',94,2,5,20),(58,'2216208','btbtc22315','/media/avatar-01_xkCpN3j.jpg','Goa','2025-03-27 17:28:51.064204','2025-03-27 17:28:51.064204',95,1,5,2),(59,'2216209','btbtc22031','/media/avatar-01_2U6RQt7_Wxc2L6c.jpg','Agra','2025-03-27 17:31:21.540529','2025-03-27 17:31:21.541803',96,3,5,21),(60,'2216254','btbtc22096','/media/avatar-01_2U6RQt7_tFq2Jy0.jpg','Delhi','2025-03-27 17:32:46.191746','2025-03-27 17:32:46.191746',97,3,5,22),(61,'2216269','BTBTC22088','/media/avatar-17_tKejKNh_U2qsasu_xHCH6aM_6Fo5wOp.jpg','UK','2025-03-27 17:35:00.316298','2025-03-27 17:35:00.316298',98,4,5,3),(62,'2216281','BTBTC22069','/media/avatar-09_Ig68bp0.jpg','Unnao','2025-03-27 17:39:06.431339','2025-03-27 17:39:06.431339',99,4,5,3),(63,'2216289','BTBTC22304','/media/avatar-01_WQelPRq.jpg','Agra','2025-03-27 17:42:18.324080','2025-03-27 17:42:18.324080',100,4,5,3),(64,'2216314','btbtc22114','/media/avatar-01_kLMh6CG.jpg','Meerut','2025-03-27 17:44:44.608469','2025-03-27 17:44:44.608469',101,3,5,22),(82,'11522636','BTbtc23187353','/media/avatar-01_XcF4YS3.jpg','jdishd','2025-03-29 17:16:21.847558','2025-03-29 17:16:21.847558',206,2,1,5),(83,'221234','Btbtc2315','/media/avatar-01_2FUZUvr_WL8VHZ6.jpg','pune','2025-03-29 17:18:40.020603','2025-03-29 17:18:40.020603',207,3,5,21),(84,'35216','Btbtc2746','/media/avatar-01_ugi0sYv.jpg','up','2025-03-31 18:28:54.690273','2025-03-31 18:28:54.690273',209,10,5,30),(85,'2216212','BTBTC22188','/media/Tfemale_logo.png','Agra','2025-03-31 21:18:36.726732','2025-03-31 21:18:36.726732',211,1,5,2),(87,'2216111','BTBTC2033','','Delhi','2025-04-01 19:36:08.859160','2025-04-01 19:36:08.859160',213,1,1,27),(90,'2219876','BTBTC25678','/media/avatar-01_2U6RQt7_kAytqOa_yofUZx5.jpg','USA','2025-04-01 21:10:02.698483','2025-04-01 21:10:02.698483',219,2,1,5),(91,'2219212','ABBCA22188','/media/photo3.jpg','Agra','2025-04-02 18:41:11.552595','2025-04-02 18:41:11.552595',220,2,5,5);
/*!40000 ALTER TABLE `acadme4_app_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_subjects`
--

DROP TABLE IF EXISTS `acadme4_app_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_subjects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(255) NOT NULL,
  `subject_code` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `course_id_id` int NOT NULL,
  `staff_id_id` bigint NOT NULL,
  `branch_id_id` int NOT NULL,
  `lab_id` int DEFAULT NULL,
  `has_lab` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `AcadME4_app_subjects_subject_code_3a863439_uniq` (`subject_code`),
  KEY `AcadME4_app_subjects_course_id_id_8a763e10_fk_AcadME4_a` (`course_id_id`),
  KEY `AcadME4_app_subjects_staff_id_id_11d21f26_fk_AcadME4_a` (`staff_id_id`),
  KEY `AcadME4_app_subjects_branch_id_id_34e95fa3_fk_AcadME4_a` (`branch_id_id`),
  KEY `AcadME4_app_subjects_lab_id_4a2fe959_fk_AcadME4_app_labs_id` (`lab_id`),
  CONSTRAINT `AcadME4_app_subjects_branch_id_id_34e95fa3_fk_AcadME4_a` FOREIGN KEY (`branch_id_id`) REFERENCES `acadme4_app_branch` (`id`),
  CONSTRAINT `AcadME4_app_subjects_course_id_id_8a763e10_fk_AcadME4_a` FOREIGN KEY (`course_id_id`) REFERENCES `acadme4_app_courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_subjects`
--

LOCK TABLES `acadme4_app_subjects` WRITE;
/*!40000 ALTER TABLE `acadme4_app_subjects` DISABLE KEYS */;
INSERT INTO `acadme4_app_subjects` VALUES (1,'AI-ML','SC341','2025-02-18 17:49:04.919567','2025-02-18 17:49:04.919567',1,2,2,NULL,1),(2,'Java','SC342','2025-02-18 17:49:16.861219','2025-02-18 17:49:16.861219',1,2,2,NULL,1),(3,'C++','SC343','2025-02-18 17:49:25.670059','2025-02-18 17:49:25.670059',1,2,2,NULL,1),(8,'Microprocessor','SC344','2025-03-01 00:35:03.078976','2025-03-01 00:35:03.078976',1,14,2,2,0),(11,'System Programming','SC345','2025-03-01 18:09:01.184312','2025-03-01 18:09:01.184312',1,2,2,NULL,0),(12,'C','SC346','2025-03-01 18:30:40.152809','2025-03-01 18:30:40.152809',1,2,2,NULL,0),(14,'Compiler & Design','SC348','2025-03-01 22:23:41.068086','2025-03-01 22:23:41.068086',2,14,5,NULL,1),(15,'ML','SC349','2025-03-01 22:42:22.464223','2025-03-01 22:42:22.464223',4,14,3,NULL,0),(16,'Python','SC350','2025-03-01 22:43:13.051312','2025-03-01 22:43:13.051312',4,14,3,NULL,1),(17,'COA','SC351','2025-03-01 23:11:24.340328','2025-03-01 23:11:24.343750',1,2,2,NULL,1),(18,'DBMS','SC353','2025-03-02 18:20:31.917028','2025-03-02 18:20:31.917028',1,2,2,NULL,1),(19,'Numerical','SC990','2025-03-02 19:20:03.068927','2025-03-02 19:20:03.068927',4,2,3,NULL,0),(20,'Complex ','SC360','2025-03-02 22:39:13.845561','2025-03-02 22:39:13.845561',1,14,2,NULL,0),(23,'Discrete Mathematics','SC370','2025-03-03 11:57:31.304919','2025-03-03 11:57:31.304919',2,63,5,NULL,0),(24,'DBMS','SC371','2025-03-03 11:58:16.740253','2025-03-03 11:58:16.740253',2,3,5,NULL,1),(28,'Basic Electronics','SC391','2025-03-25 20:58:10.699796','2025-03-25 20:58:10.699796',4,63,3,NULL,1),(30,'Data Structures','SC123','2025-03-27 17:16:54.174022','2025-03-27 17:16:54.174022',2,87,5,NULL,1),(32,'Software Engineering','SC4411','2025-03-27 17:18:10.402218','2025-03-27 17:18:10.402218',2,39,5,NULL,0),(34,'Robotics','SC6011','2025-03-27 17:19:25.941084','2025-03-27 17:19:25.941084',2,64,20,NULL,0),(35,'Networking','SC1346','2025-03-27 17:22:02.921443','2025-03-27 17:22:02.921443',3,116,21,NULL,0),(36,'Machine Learning','SC9090','2025-03-27 17:22:53.851463','2025-03-27 17:22:53.851463',3,61,22,NULL,1),(38,'Finance','SC457','2025-03-27 20:50:01.156966','2025-03-27 20:50:01.156966',11,90,31,NULL,0),(42,'Calculus 2','CS308','2025-04-01 21:11:32.840587','2025-04-01 21:11:32.840587',4,90,3,NULL,1),(45,'Networkingss','NS784','2025-04-14 08:22:56.579451','2025-04-14 08:22:56.579474',1,2,4,NULL,0);
/*!40000 ALTER TABLE `acadme4_app_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_syllabus`
--

DROP TABLE IF EXISTS `acadme4_app_syllabus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_syllabus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `subject_id` int NOT NULL,
  `uploaded_by_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AcadME4_app_syllabus_subject_id_8964f8a2_fk_AcadME4_a` (`subject_id`),
  KEY `AcadME4_app_syllabus_uploaded_by_id_7bfdd373_fk_AcadME4_a` (`uploaded_by_id`),
  CONSTRAINT `AcadME4_app_syllabus_subject_id_8964f8a2_fk_AcadME4_a` FOREIGN KEY (`subject_id`) REFERENCES `acadme4_app_subjects` (`id`),
  CONSTRAINT `AcadME4_app_syllabus_uploaded_by_id_7bfdd373_fk_AcadME4_a` FOREIGN KEY (`uploaded_by_id`) REFERENCES `acadme4_app_staffs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_syllabus`
--

LOCK TABLES `acadme4_app_syllabus` WRITE;
/*!40000 ALTER TABLE `acadme4_app_syllabus` DISABLE KEYS */;
INSERT INTO `acadme4_app_syllabus` VALUES (1,'handout','syllabus/DCN_01.pdf','2025-02-25 19:55:32.383816',2,1),(14,'test case 1','syllabus/DCN_01_1.pdf','2025-03-27 17:59:39.791895',14,3),(15,'test case3','syllabus/DCN_01_1_7JfpFaI.pdf','2025-03-27 17:59:59.952869',20,3),(16,'test case 4','syllabus/DCN_01_1_oSaTMoa.pdf','2025-03-27 18:04:28.543148',16,3),(17,'test case2','syllabus/DCN_01_1_oSaTMoa_pWfB0Xk.pdf','2025-03-27 18:36:12.367674',1,1),(18,'test case 3','syllabus/DCN_01_1_oSaTMoa_GWX47oK.pdf','2025-03-27 18:36:28.860457',11,1),(19,'test case 5','syllabus/DCN_01_1_AgJzsgT.pdf','2025-03-27 18:36:44.679851',12,1),(21,'New Material','syllabus/AESAlgorithmpaper2017AKOMAbdullah_UPK6lw6.docx.pdf','2025-03-27 21:05:03.503021',1,1),(22,'etyer','syllabus/DCN_01_ws17GbN.pdf','2025-03-28 12:32:03.546180',12,1),(23,'thh','syllabus/chem_lab_manual.pdf','2025-04-01 19:49:41.245705',1,1),(24,'ef','syllabus/B_9z3tp8i.TECH.V_SEM.2017.pdf','2025-04-01 21:20:12.946689',3,1),(25,'ef','syllabus/B_9z3tp8i_7AxmNX9.TECH.V_SEM.2017.pdf','2025-04-01 21:20:13.481622',3,1),(26,'ef','syllabus/B_9z3tp8i_Lscmq5O.TECH.V_SEM.2017.pdf','2025-04-01 21:20:15.364005',3,1),(27,'ef','syllabus/B_9z3tp8i_OPYmS1y.TECH.V_SEM.2017.pdf','2025-04-01 21:20:15.906275',3,1),(28,'hi','syllabus/AESAlgorithmpaper2017AKOMAbdullah_UPK6lw6_jyDel7B_9YOhbQi_mnsoInY_SLvg5OU.docx.pdf','2025-04-13 19:32:45.018173',1,1),(29,'book','syllabus/AESAlgorithmpaper2017AKOMAbdullah_UPK6lw6_jyDel7B_arKat6u_knddWt9.docx.pdf','2025-04-14 08:33:55.762847',1,1);
/*!40000 ALTER TABLE `acadme4_app_syllabus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acadme4_app_timetable`
--

DROP TABLE IF EXISTS `acadme4_app_timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acadme4_app_timetable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `day_of_week` varchar(10) NOT NULL,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) NOT NULL,
  `course_id` int NOT NULL,
  `subject_id` int DEFAULT NULL,
  `teacher_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AcadME4_app_timetabl_course_id_bc83f897_fk_AcadME4_a` (`course_id`),
  KEY `AcadME4_app_timetabl_teacher_id_e1a530db_fk_AcadME4_a` (`teacher_id`),
  KEY `AcadME4_app_timetabl_subject_id_3d2900e2_fk_AcadME4_a` (`subject_id`),
  CONSTRAINT `AcadME4_app_timetabl_course_id_bc83f897_fk_AcadME4_a` FOREIGN KEY (`course_id`) REFERENCES `acadme4_app_courses` (`id`),
  CONSTRAINT `AcadME4_app_timetabl_subject_id_3d2900e2_fk_AcadME4_a` FOREIGN KEY (`subject_id`) REFERENCES `acadme4_app_subjects` (`id`),
  CONSTRAINT `AcadME4_app_timetabl_teacher_id_e1a530db_fk_AcadME4_a` FOREIGN KEY (`teacher_id`) REFERENCES `acadme4_app_staffs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acadme4_app_timetable`
--

LOCK TABLES `acadme4_app_timetable` WRITE;
/*!40000 ALTER TABLE `acadme4_app_timetable` DISABLE KEYS */;
INSERT INTO `acadme4_app_timetable` VALUES (90,'Wednesday','11:00:00.000000','12:00:00.000000',1,2,1),(91,'Friday','13:00:00.000000','14:00:00.000000',1,1,1),(93,'Monday','09:00:00.000000','10:00:00.000000',1,8,3),(94,'Monday','10:00:00.000000','11:00:00.000000',1,1,1),(95,'Monday','11:00:00.000000','12:00:00.000000',1,2,1),(96,'Thursday','09:00:00.000000','10:00:00.000000',1,1,1),(97,'Thursday','13:00:00.000000','14:00:00.000000',1,1,1),(98,'Monday','13:00:00.000000','14:00:00.000000',1,17,1),(100,'Monday','15:00:00.000000','16:00:00.000000',1,20,3),(101,'Monday','16:00:00.000000','17:00:00.000000',1,20,3),(102,'Wednesday','13:00:00.000000','14:00:00.000000',1,20,3),(103,'Wednesday','14:00:00.000000','15:00:00.000000',1,11,3),(104,'Wednesday','15:00:00.000000','16:00:00.000000',1,12,1),(105,'Thursday','11:00:00.000000','12:00:00.000000',1,12,1),(106,'Thursday','14:00:00.000000','15:00:00.000000',1,18,1),(107,'Thursday','15:00:00.000000','16:00:00.000000',1,11,1),(110,'Saturday','09:00:00.000000','10:00:00.000000',1,11,1),(112,'Saturday','14:00:00.000000','15:00:00.000000',1,20,3),(113,'Saturday','15:00:00.000000','16:00:00.000000',1,1,1),(114,'Saturday','16:00:00.000000','17:00:00.000000',1,17,1),(116,'Friday','16:00:00.000000','17:00:00.000000',1,8,1),(117,'Sunday','09:00:00.000000','10:00:00.000000',1,8,3),(119,'Sunday','13:00:00.000000','14:00:00.000000',1,18,1),(120,'Sunday','13:00:00.000000','14:00:00.000000',2,23,6),(121,'Sunday','14:00:00.000000','15:00:00.000000',2,30,15),(122,'Saturday','16:00:00.000000','17:00:00.000000',2,30,15),(123,'Sunday','16:00:00.000000','17:00:00.000000',2,14,3),(124,'Wednesday','09:00:00.000000','10:00:00.000000',2,14,3),(125,'Wednesday','15:00:00.000000','16:00:00.000000',2,23,6),(126,'Monday','09:00:00.000000','10:00:00.000000',2,24,2),(127,'Wednesday','15:00:00.000000','16:00:00.000000',2,24,2),(128,'Thursday','15:00:00.000000','16:00:00.000000',2,24,2),(129,'Wednesday','10:00:00.000000','11:00:00.000000',1,1,1),(134,'Saturday','13:00:00.000000','14:00:00.000000',2,34,7),(135,'Saturday','13:00:00.000000','14:00:00.000000',1,1,1),(136,'Wednesday','16:00:00.000000','17:00:00.000000',1,17,1),(137,'Thursday','16:00:00.000000','17:00:00.000000',1,3,1),(138,'Monday','10:00:00.000000','11:00:00.000000',2,14,3),(139,'Monday','11:00:00.000000','12:00:00.000000',2,14,3),(140,'Friday','10:00:00.000000','11:00:00.000000',1,17,1),(141,'Friday','09:00:00.000000','10:00:00.000000',1,17,1),(142,'Wednesday','09:00:00.000000','10:00:00.000000',1,1,1),(144,'Wednesday','10:00:00.000000','11:00:00.000000',2,23,6),(145,'Thursday','11:00:00.000000','12:00:00.000000',3,35,17),(146,'Monday','14:00:00.000000','15:00:00.000000',1,2,1),(147,'Monday','13:00:00.000000','14:00:00.000000',4,15,3);
/*!40000 ALTER TABLE `acadme4_app_timetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add courses',7,'add_courses'),(26,'Can change courses',7,'change_courses'),(27,'Can delete courses',7,'delete_courses'),(28,'Can view courses',7,'view_courses'),(29,'Can add session year model',8,'add_sessionyearmodel'),(30,'Can change session year model',8,'change_sessionyearmodel'),(31,'Can delete session year model',8,'delete_sessionyearmodel'),(32,'Can view session year model',8,'view_sessionyearmodel'),(33,'Can add user',9,'add_customuser'),(34,'Can change user',9,'change_customuser'),(35,'Can delete user',9,'delete_customuser'),(36,'Can view user',9,'view_customuser'),(37,'Can add admin',10,'add_admin'),(38,'Can change admin',10,'change_admin'),(39,'Can delete admin',10,'delete_admin'),(40,'Can view admin',10,'view_admin'),(41,'Can add attendance',11,'add_attendance'),(42,'Can change attendance',11,'change_attendance'),(43,'Can delete attendance',11,'delete_attendance'),(44,'Can view attendance',11,'view_attendance'),(45,'Can add staffs',12,'add_staffs'),(46,'Can change staffs',12,'change_staffs'),(47,'Can delete staffs',12,'delete_staffs'),(48,'Can view staffs',12,'view_staffs'),(49,'Can add notification staffs',13,'add_notificationstaffs'),(50,'Can change notification staffs',13,'change_notificationstaffs'),(51,'Can delete notification staffs',13,'delete_notificationstaffs'),(52,'Can view notification staffs',13,'view_notificationstaffs'),(53,'Can add feed back staffs',14,'add_feedbackstaffs'),(54,'Can change feed back staffs',14,'change_feedbackstaffs'),(55,'Can delete feed back staffs',14,'delete_feedbackstaffs'),(56,'Can view feed back staffs',14,'view_feedbackstaffs'),(57,'Can add students',15,'add_students'),(58,'Can change students',15,'change_students'),(59,'Can delete students',15,'delete_students'),(60,'Can view students',15,'view_students'),(61,'Can add notification student',16,'add_notificationstudent'),(62,'Can change notification student',16,'change_notificationstudent'),(63,'Can delete notification student',16,'delete_notificationstudent'),(64,'Can view notification student',16,'view_notificationstudent'),(65,'Can add feed back student',17,'add_feedbackstudent'),(66,'Can change feed back student',17,'change_feedbackstudent'),(67,'Can delete feed back student',17,'delete_feedbackstudent'),(68,'Can view feed back student',17,'view_feedbackstudent'),(69,'Can add attendance report',18,'add_attendancereport'),(70,'Can change attendance report',18,'change_attendancereport'),(71,'Can delete attendance report',18,'delete_attendancereport'),(72,'Can view attendance report',18,'view_attendancereport'),(73,'Can add subjects',19,'add_subjects'),(74,'Can change subjects',19,'change_subjects'),(75,'Can delete subjects',19,'delete_subjects'),(76,'Can view subjects',19,'view_subjects'),(77,'Can add student result',20,'add_studentresult'),(78,'Can change student result',20,'change_studentresult'),(79,'Can delete student result',20,'delete_studentresult'),(80,'Can view student result',20,'view_studentresult'),(81,'Can add assignment submission',21,'add_assignmentsubmission'),(82,'Can change assignment submission',21,'change_assignmentsubmission'),(83,'Can delete assignment submission',21,'delete_assignmentsubmission'),(84,'Can view assignment submission',21,'view_assignmentsubmission'),(85,'Can add assignment',22,'add_assignment'),(86,'Can change assignment',22,'change_assignment'),(87,'Can delete assignment',22,'delete_assignment'),(88,'Can view assignment',22,'view_assignment'),(89,'Can add timetable',23,'add_timetable'),(90,'Can change timetable',23,'change_timetable'),(91,'Can delete timetable',23,'delete_timetable'),(92,'Can view timetable',23,'view_timetable'),(93,'Can add timetablee',24,'add_timetablee'),(94,'Can change timetablee',24,'change_timetablee'),(95,'Can delete timetablee',24,'delete_timetablee'),(96,'Can view timetablee',24,'view_timetablee'),(97,'Can add syllabus',25,'add_syllabus'),(98,'Can change syllabus',25,'change_syllabus'),(99,'Can delete syllabus',25,'delete_syllabus'),(100,'Can view syllabus',25,'view_syllabus'),(101,'Can add books',26,'add_books'),(102,'Can change books',26,'change_books'),(103,'Can delete books',26,'delete_books'),(104,'Can view books',26,'view_books'),(105,'Can add quiz response',27,'add_quizresponse'),(106,'Can change quiz response',27,'change_quizresponse'),(107,'Can delete quiz response',27,'delete_quizresponse'),(108,'Can view quiz response',27,'view_quizresponse'),(109,'Can add quiz',28,'add_quiz'),(110,'Can change quiz',28,'change_quiz'),(111,'Can delete quiz',28,'delete_quiz'),(112,'Can view quiz',28,'view_quiz'),(113,'Can add quiz result',29,'add_quizresult'),(114,'Can change quiz result',29,'change_quizresult'),(115,'Can delete quiz result',29,'delete_quizresult'),(116,'Can view quiz result',29,'view_quizresult'),(117,'Can add quiz attempt',30,'add_quizattempt'),(118,'Can change quiz attempt',30,'change_quizattempt'),(119,'Can delete quiz attempt',30,'delete_quizattempt'),(120,'Can view quiz attempt',30,'view_quizattempt'),(121,'Can add quiz question',31,'add_quizquestion'),(122,'Can change quiz question',31,'change_quizquestion'),(123,'Can delete quiz question',31,'delete_quizquestion'),(124,'Can view quiz question',31,'view_quizquestion'),(125,'Can add book',32,'add_book'),(126,'Can change book',32,'change_book'),(127,'Can delete book',32,'delete_book'),(128,'Can view book',32,'view_book'),(129,'Can add question',33,'add_question'),(130,'Can change question',33,'change_question'),(131,'Can delete question',33,'delete_question'),(132,'Can view question',33,'view_question'),(133,'Can add option',34,'add_option'),(134,'Can change option',34,'change_option'),(135,'Can delete option',34,'delete_option'),(136,'Can view option',34,'view_option'),(137,'Can add discussion thread',35,'add_discussionthread'),(138,'Can change discussion thread',35,'change_discussionthread'),(139,'Can delete discussion thread',35,'delete_discussionthread'),(140,'Can view discussion thread',35,'view_discussionthread'),(141,'Can add answer',36,'add_answer'),(142,'Can change answer',36,'change_answer'),(143,'Can delete answer',36,'delete_answer'),(144,'Can view answer',36,'view_answer'),(145,'Can add discussion post',37,'add_discussionpost'),(146,'Can change discussion post',37,'change_discussionpost'),(147,'Can delete discussion post',37,'delete_discussionpost'),(148,'Can view discussion post',37,'view_discussionpost'),(149,'Can add branch',38,'add_branch'),(150,'Can change branch',38,'change_branch'),(151,'Can delete branch',38,'delete_branch'),(152,'Can view branch',38,'view_branch'),(153,'Can add labs',39,'add_labs'),(154,'Can change labs',39,'change_labs'),(155,'Can delete labs',39,'delete_labs'),(156,'Can view labs',39,'view_labs'),(157,'Can add gamification',40,'add_gamification'),(158,'Can change gamification',40,'change_gamification'),(159,'Can delete gamification',40,'delete_gamification'),(160,'Can view gamification',40,'view_gamification'),(161,'Can add faq',41,'add_faq'),(162,'Can change faq',41,'change_faq'),(163,'Can delete faq',41,'delete_faq'),(164,'Can view faq',41,'view_faq'),(165,'Can add password reset token',42,'add_passwordresettoken'),(166,'Can change password reset token',42,'change_passwordresettoken'),(167,'Can delete password reset token',42,'delete_passwordresettoken'),(168,'Can view password reset token',42,'view_passwordresettoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$jefDtSQFDgTxHRd6lCHg8k$lmqZ8ZyR0a4CKoM4aCwtF9uM8UtUaXzImIGzXWNyABE=','2025-02-18 17:29:27.670238',1,'admin','','','admin@gmail.com',1,1,'2025-02-18 17:25:41.868006'),(2,'pbkdf2_sha256$870000$V12Vs1WLeJZW5cf5WSG3bm$DlzQLV5WtBZNniATXckJ6X1pi3qry9pimajDPKCd0Cw=','2025-02-18 17:29:45.346762',1,'ananya','','','ananya@gmail.com',1,1,'2025-02-18 17:27:49.815931');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (10,'AcadME4_app','admin'),(36,'AcadME4_app','answer'),(22,'AcadME4_app','assignment'),(21,'AcadME4_app','assignmentsubmission'),(11,'AcadME4_app','attendance'),(18,'AcadME4_app','attendancereport'),(32,'AcadME4_app','book'),(26,'AcadME4_app','books'),(38,'AcadME4_app','branch'),(7,'AcadME4_app','courses'),(9,'AcadME4_app','customuser'),(37,'AcadME4_app','discussionpost'),(35,'AcadME4_app','discussionthread'),(41,'AcadME4_app','faq'),(14,'AcadME4_app','feedbackstaffs'),(17,'AcadME4_app','feedbackstudent'),(40,'AcadME4_app','gamification'),(39,'AcadME4_app','labs'),(13,'AcadME4_app','notificationstaffs'),(16,'AcadME4_app','notificationstudent'),(34,'AcadME4_app','option'),(42,'AcadME4_app','passwordresettoken'),(33,'AcadME4_app','question'),(28,'AcadME4_app','quiz'),(30,'AcadME4_app','quizattempt'),(31,'AcadME4_app','quizquestion'),(27,'AcadME4_app','quizresponse'),(29,'AcadME4_app','quizresult'),(8,'AcadME4_app','sessionyearmodel'),(12,'AcadME4_app','staffs'),(20,'AcadME4_app','studentresult'),(15,'AcadME4_app','students'),(19,'AcadME4_app','subjects'),(25,'AcadME4_app','syllabus'),(23,'AcadME4_app','timetable'),(24,'AcadME4_app','timetablee'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-02-18 16:53:33.389517'),(2,'contenttypes','0002_remove_content_type_name','2025-02-18 16:53:33.468867'),(3,'auth','0001_initial','2025-02-18 16:53:34.057319'),(4,'auth','0002_alter_permission_name_max_length','2025-02-18 16:53:34.131370'),(5,'auth','0003_alter_user_email_max_length','2025-02-18 16:53:34.155996'),(6,'auth','0004_alter_user_username_opts','2025-02-18 16:53:34.155996'),(7,'auth','0005_alter_user_last_login_null','2025-02-18 16:53:34.218065'),(8,'auth','0006_require_contenttypes_0002','2025-02-18 16:53:34.218065'),(9,'auth','0007_alter_validators_add_error_messages','2025-02-18 16:53:34.234683'),(10,'auth','0008_alter_user_username_max_length','2025-02-18 16:53:34.299304'),(11,'auth','0009_alter_user_last_name_max_length','2025-02-18 16:53:34.363066'),(12,'auth','0010_alter_group_name_max_length','2025-02-18 16:53:34.379005'),(13,'auth','0011_update_proxy_permissions','2025-02-18 16:53:34.386173'),(14,'auth','0012_alter_user_first_name_max_length','2025-02-18 16:53:34.439086'),(20,'sessions','0001_initial','2025-02-18 16:53:36.329271'),(86,'AcadME4_app','0001_initial','2025-03-19 11:16:44.581147'),(87,'admin','0001_initial','2025-03-19 11:16:44.595361'),(88,'admin','0002_logentry_remove_auto_add','2025-03-19 11:16:44.602396'),(89,'admin','0003_logentry_add_action_flag_choices','2025-03-19 11:16:44.611450'),(90,'AcadME4_app','0002_alter_timetable_class_type','2025-03-25 22:41:27.452088'),(91,'AcadME4_app','0003_alter_timetable_class_type','2025-03-25 22:41:27.547906'),(92,'AcadME4_app','0004_timetable_branch','2025-03-25 22:41:27.648271'),(93,'AcadME4_app','0005_alter_timetable_branch','2025-03-25 22:41:27.664358'),(94,'AcadME4_app','0002_alter_subjects_subject_code','2025-03-19 12:42:37.244780'),(95,'AcadME4_app','0003_faq','2025-03-19 14:15:00.500063'),(96,'AcadME4_app','0006_alter_timetable_class_type','2025-03-26 09:39:01.399667'),(97,'AcadME4_app','0007_alter_timetable_class_type','2025-03-26 09:39:11.142265'),(98,'AcadME4_app','0008_alter_timetable_class_type','2025-03-26 09:53:14.947887'),(99,'AcadME4_app','0009_alter_timetable_class_type','2025-03-26 09:53:24.940967'),(100,'AcadME4_app','0010_alter_timetable_branch','2025-03-26 15:57:56.445027'),(101,'AcadME4_app','0004_alter_attendancereport_student_id','2025-03-26 17:25:53.767759'),(102,'AcadME4_app','0005_alter_branch_name','2025-03-26 18:15:50.576860'),(103,'AcadME4_app','0011_remove_timetable_branch_remove_timetable_class_type_and_more','2025-03-26 19:33:11.310344'),(104,'AcadME4_app','0006_alter_studentresult_assignment1_marks_and_more','2025-03-29 20:45:34.957118'),(105,'AcadME4_app','0007_alter_studentresult_assignment1_marks_and_more','2025-03-29 20:47:54.452592'),(106,'AcadME4_app','0008_alter_studentresult_assignment1_marks_and_more','2025-03-29 21:08:46.090688'),(107,'AcadME4_app','0009_alter_assignmentsubmission_student','2025-03-30 19:15:49.121605'),(108,'AcadME4_app','0010_remove_assignmentsubmission_marks_obtained_and_more','2025-03-30 19:42:11.169248'),(109,'AcadME4_app','0011_remove_assignmentsubmission_unique_assignment_submission_and_more','2025-03-30 22:18:52.098657'),(110,'AcadME4_app','0012_alter_assignment_due_date','2025-04-13 17:57:30.057936'),(111,'AcadME4_app','0013_alter_attendance_subject_id','2025-04-13 19:06:10.403751');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0ha45b90381gc0r2i9w5kt2cdbgdcrd6','.eJxVi0EOwiAQRe_C2phhYKC404SlZyADg6FRm6a1K-PdxZ1d_v_ee6vE26ulba1LGkWdlFaH_y9zudfpB86F5Rpt4nk-xiePj0tHcZLd2MeN19ZLYNBA7iYWpA4D18DWGSMEnpCCZIO6-qxdYbLoGI0P5G3uHoKgqM8XVHo0mA:1twpV9:3SFkvxFu3DMRWSrdHkivTot-Kz9Jw3XPjJizvgfrbqE','2025-04-07 21:38:31.404994'),('1cvcx22o5brrod6floo85bk4jqz128rv','e30:1tkRPT:wJB1YxcS4L6wyYfqUEoTUYnfoRJSpozbEzw-ZXc-Ujk','2025-03-04 17:29:27.670238'),('1fsj1vdv4qey6dgnjzloen2iu6dtkhlx','.eJxVizEOwjAMAP-SGSGSNHbCBlJG3hA5tqtUQFW1dEL8nbLR8e50b1NofbWyLjqXQczZWHP4d5X4ruMvXJjklrtC03TMTxoe1y3lUXawnxstbTuhl5oUREkwQe_RKSuBOmAb0skGdl4T-q7aGIP3FpGQoIYILkRG8_kChXM0-Q:1twkvW:TEUWzgMS7RJSdiuN5GkSPu4OlyaFEMX1KCe8Fak6Kzk','2025-04-07 16:45:26.272142'),('1gf8pu1d5izq9lptihbi3i57p9qa7ls8','.eJxVi0EOwiAQRe_C2phhYKC404SlZyADg6FRm6a1K-PdxZ1d_v_ee6vE26ulba1LGkWdlFaH_y9zudfpB86F5Rpt4nk-xiePj0tHcZLd2MeN19ZLYNBA7iYWpA4D18DWGSMEnpCCZIO6-qxdYbLoGI0P5G3uHoKgqM8XVHo0mA:1tyalI:ejCyM0865wn_Szr2NTmDl7bSdwimTXMUGSkU7Ba3BaM','2025-04-12 18:18:28.898268'),('1rdsa93f0dusbdvlwvfllnlsdl074e5h','.eJxVizEOwjAMAP-SGaGmTlKbDaSMvCFy7ESpgKqidEL8nbLR8e50b5N4fbW0LuWZRjUnY83h32WWW5l-4Sys1-gSz_MxPni8X7YUJ93Bfm68tO1EqgMCBCy-zx77ITsrHYJFYtaKGGqALIUJrRbrBdRKAHKdDwRA5vMFUnc0bw:1tqECT:WW9O7uxpq_c27MmZQ7lT0X8DMrglhtD2VXBjCO6phew','2025-03-20 16:35:57.353092'),('22jn7spdpl0cksr6vbf5colwv9psvt79','.eJxVizEOwjAMAP-SGaGkSeqYDaSOvCFyHVupgKqidEL8nbDR8e50b5Npe9W8rfLMUzEnE83h343EN5l_4cxUrkPItCzH4UHT_dLSMJcd7OdKa21ngI7JAylEEE3MzlqMHiA56yXFTjBZbSJiccIKoyKi7Xv1ZINE8_kCWHs0og:1twq4H:Z9bEUJn6PsD4NEwAUHJG2kIJCMD_3lOzdVf3rhiyAOE','2025-04-07 22:14:49.256783'),('3c4cixttwl1egmtr0j4b7rktutubez3h','.eJxVizEOwjAMAP-SGaEkNknNBlJG3hA5saNWQFW1dEL8nbLR8e50b5N5ffV5XXTOg5izcebw7wrXu46_cKkst4SZp-mYnjw8rltKo-xgP_e89NvZUVAFiqDii7XBRW1kY-VGhKJBoSviwYEPJxGHBE0cMxa0HtU28_kCa3s1Pw:1twl4P:J_m24s4kGviXB6ozIUvxnJYBRWdqa6uxvM31O2CEZZ8','2025-04-07 16:54:37.595822'),('3nzyjcfduol3jtpry2azfir0cx95jgdy','.eJxVi0EOwiAQRe_C2phhYKC404SlZyADg6FRm6a1K-PdxZ1d_v_ee6vE26ulba1LGkWdlFaH_y9zudfpB86F5Rpt4nk-xiePj0tHcZLd2MeN19ZLYNBA7iYWpA4D18DWGSMEnpCCZIO6-qxdYbLoGI0P5G3uHoKgqM8XVHo0mA:1txBqE:jb-X9cuVHnJ9Y_xnkrwynlpQX3Xg7UvSxJCqUESdFDM','2025-04-08 21:29:46.121349'),('3uiinrli5iftw0hi81r5utb1glfqwifu','e30:1tkRP2:wkM3UICbuI86x1CzWRM-2UL_8dreRDeDepDAys3MhGo','2025-03-04 17:29:00.710572'),('4e64xtt6u0q1r7tujch2x2s4pu6aq3v5','.eJxVi0sKAjEQRO-StQhJOp92p5ClZwjd-ZBBHQbHWYl3t905m6LqPeqtMm2vkbe1PfNU1UmBOvwzpnJr80-cC9VrgkzLckwPmu4XUWmuu7E_D1qHPC0CtRCdkdIYPLLWrjFFTVxYEqPBKKCD7b3G4CgYsR7Qow1Ofb5sMjT9:1txuQO:UBR0FS_t3YNM77KH5dyrvOpPmL-h59sHjHoy2Lcqv0U','2025-04-10 21:06:04.099290'),('53p7wd02km6o574699ymzx6ac83z9eul','.eJxVizEOwjAQBP_iGiH7iE1CB5JL3mCt73xyBEQRIRXi75iOdDs7mrdJWF81rUt5plHMyTiz-_8y-Famnzgz5Bq7hHnexwfG-6WpOMkGtnHFUlupRbzCIVP2QQIXy6Q2iBUH1uyIjxTaONBghyK9gyL3vlMmTwyYzxeyTjb3:1uAvgz:3C1_jHfmEHgoo0g0fjrN_m3b_ZOcpRWqMrl1owYqQEU','2025-05-16 19:05:01.247678'),('5ihqh5g1puzsx9x4wh5tetteo1ga8fbh','.eJxVi0sKwjAUAO-StUjSl7w07hSy9AzhfRJa1FKsXYl3t-7scmaYtym0voayLvVZRjUn05nDv2OSW51-4Syk1-wLzfMxP2i8X7aUJ93Bfh5oGbZTOIYuWddqowRB-waILMIIYIGZYh99ZQ6MKUVq7FG9OOuAvUOr5vMFg141kw:1tmzK3:8nIxFHOo-TaVUJujghoDNwKsWrTuOzKwYICIxwCnoZM','2025-03-11 18:06:23.498082'),('5sxqxpvp6vhs65ewe3g00tvk18zb1wov','.eJxVi0EOwiAQRe_C2phhYKC404SlZyADg6FRm6a1K-PdxZ1d_v_ee6vE26ulba1LGkWdlFaH_y9zudfpB86F5Rpt4nk-xiePj0tHcZLd2MeN19ZLYNBA7iYWpA4D18DWGSMEnpCCZIO6-qxdYbLoGI0P5G3uHoKgqM8XVHo0mA:1txRMk:DvEmmtJ3D4nFmCRpmrnV_jseAn0pS6QYvXMJQFZmOwE','2025-04-09 14:04:22.354505'),('5vizmou9hsxzw5vzmmkt27xwneqrhesj','.eJxVi0EOwiAQRe_C2phhYKC404SlZyADg6FRm6a1K-PdxZ1d_v_ee6vE26ulba1LGkWdlFaH_y9zudfpB86F5Rpt4nk-xiePj0tHcZLd2MeN19ZLYNBA7iYWpA4D18DWGSMEnpCCZIO6-qxdYbLoGI0P5G3uHoKgqM8XVHo0mA:1u05AC:UeOusN5X60knRF8uIimTYsK8EZHlRgIf97jhAvVn_T8','2025-04-16 20:58:20.158342'),('5xrhyyohiascn1n39mpmu4f667603i31','.eJxVi7sOwjAMAP8lM0LBeThlAykj3xA5dqJUQFW1dEL995aNjnen-6pEy6elZS5T6kVdFajTv8vEzzL8wo1JHtEmGsdzfFP_uu8pDnKA49xobvvJIVfvgyCC98JAYAp3iJegtcnoQjWuQ2Fnqycx6LIVAbBUHBYNpNYNZow1HA:1u02AP:4poGJuJu_omrU95-W3bqwTbdCQ8PCmuiQ_TWBdwcO24','2025-04-16 17:46:21.986333'),('6em7gk6j2cwc70h0berwnfpq0sxdmr7j','.eJxVi7sOwjAMAP8lM0J5OMRhAykj3xA5ia1UQFW1dEL8O2Wj493p3irT-up5XXjOQ1NnZdXh3xWqdx5_4VKp3RJkmqZjetLwuG4pjW0H-7nT0rcTsWqAxsaRRFs8a4sMLooRLCcP7APGgKZ4HcRpb9mAuGglVGHGoj5fW4Y0-g:1txVix:2tPIZL5TQjkVU29HarFtET4cY_oYdYBJROib2hXhMNU','2025-04-09 18:43:35.635606'),('7hwd4ipk5r9b1e98p7xah69e8jpargkn','.eJxVi0EOwiAQRe_C2phhYKC404SlZyADg6FRm6a1K-PdxZ1d_v_ee6vE26ulba1LGkWdlFaH_y9zudfpB86F5Rpt4nk-xiePj0tHcZLd2MeN19ZLYNBA7iYWpA4D18DWGSMEnpCCZIO6-qxdYbLoGI0P5G3uHoKgqM8XVHo0mA:1u05qP:_hibsqcN0-DOTnPbSE-DTbbXRJPo29ZS9bZEbbumfcE','2025-04-16 21:41:57.233233'),('7mb6jkw1pzzg4fjcw1tddogi7oxv7kol','.eJxVi0sKAjEQRO-StQhJOp92p5ClZwjd-ZBBHQbHWYl3t905m6LqPeqtMm2vkbe1PfNU1UmBOvwzpnJr80-cC9VrgkzLckwPmu4XUWmuu7E_D1qHPC0CtRCdkdIYPLLWrjFFTVxYEqPBKKCD7b3G4CgYsR7Qow1Ofb5sMjT9:1txOFh:r6XhH3HrwFmlVyLTzKxa1lXUIXL8DDlnKBo7CYJHPBg','2025-04-09 10:44:53.632648'),('87w92ncp751ebzrfkyqa45t411lfuzj8','.eJxVi8EOgjAQBf-lZ2MKXdmuN0169Bua13YbiEoIyMn47-JNjjOTeZuI9dXHddE5DsWcDZnDv0vIdx1_4ZJRboEipukYnhge1y2FsexgP_dY-u1kf-pEk60etfHOCjrUVgXsW3LkKgtxtiy5ojRMypkaiIq4DprUfL5mEzVk:1tl57O:S2CclrnPLmcWmFO0zNzl9wb_jKgniGu0h_gieUhQFxs','2025-03-06 11:53:26.094788'),('9ruj2sirsjwkoy5146l7x3fbei2ts2p7','.eJxVi0EOwiAQRe_C2phhYKC404SlZyADg6FRm6a1K-PdxZ1d_v_ee6vE26ulba1LGkWdlFaH_y9zudfpB86F5Rpt4nk-xiePj0tHcZLd2MeN19ZLYNBA7iYWpA4D18DWGSMEnpCCZIO6-qxdYbLoGI0P5G3uHoKgqM8XVHo0mA:1tutHf:2cRFlWzb9DQ3EcqE_EcpYRIVDspCFHPFdSSRhFHVuNc','2025-04-02 13:16:35.309526'),('bcg1yx7k47qrjik21mny5bpslx8v3nru','.eJxVizsOwjAQBe_iGiF_1naWDiSXnMFa7zpyBEQRIRXi7piOlO_NzFtl2l4tb2t95knUSRlQh_-zEN_q_CNnJrkmyLQsx_Sg6X7pKM2yG_u40dp6CYN3wTJo1hTGwoSIgcmhkRglFgYC9Fa0AR9MHYrrUmALBUdG8urzBYvMNaQ:1txBdX:ARtKdTsX-uWfszEphN5WJ3eVsFNOQ2NfIrjux5LTms0','2025-04-08 21:16:39.562684'),('cc5z259w6rv6v5u9rukqkslesfx9xzet','.eJxVizEOwjAMAP-SGaHUdRqHDaSMvCFyYkepgKqidEL8nbLR8e50b5N4fbW0LvpMo5iTQXP4d5nLTadfOBeWa8TE83yMDx7vly3FSXawnxsvbTsDdGBBAKwdqoSMrgKFwp5Uq3MyQMmOsFRve8xAvfpOoScmRsUs5vMFVwg1Dw:1tzKFF:XnI7BOqPM-ePvPCtztvt5PM18zDeJLee7pRyci5gpew','2025-04-14 18:52:25.469978'),('covylx05eowkwz4qqmwv61gywjzqlmc5','e30:1tkRPl:MSFBSbkZ7DMqGd2aoINNfBMXgeK13nQuh-ssYTU5cME','2025-03-04 17:29:45.341002'),('d6dynowxtek1lelmfssr4c59o9dkv3y0','.eJxVi0EOwiAQRe_C2phhYKC404SlZyADg6FRm6a1K-PdxZ1d_v_ee6vE26ulba1LGkWdlFaH_y9zudfpB86F5Rpt4nk-xiePj0tHcZLd2MeN19ZLYNBA7iYWpA4D18DWGSMEnpCCZIO6-qxdYbLoGI0P5G3uHoKgqM8XVHo0mA:1txs0g:qxJVcrEKYOhTvf1a4XSWB2hyrzEfjUsaMdZRshTVumQ','2025-04-10 18:31:22.273601'),('dg0b26cc1hva8qajol6wwcncntw4y9bw','.eJxVi0sKwjAUAO-StUjSJnmNO4UsPUN4nzxS1FKsXYl3t-7scmaYtym4vlpZl_oso5iTcebw7wj5VqdfODPKNfuC83zMDxzvly3lSXawnxsubTvZAYfEAinGXjxTQO4UlGxFp0hqrYpj6oNNEDWIVOY0QEfgcUjWfL6cODZg:1tlbUB:KkFCQbIKBI5otlWK3q3OxbhBKQYMAXJ6RuwYHNr_CcU','2025-03-07 22:27:07.253436'),('e7mh4q5f8v4g3xv8vibvgu4t6318pgo7','.eJxVjUEKwjAQRe-StUhSnCTjTiFLzxAmMxlS1FJauxLvbtzZ5X-Px3-bTNur5W2tSx7FnM1gDv-sEN_r9BMXJrmlU6Z5PqYnjY9rV2mS3djHjdbWSwH06AuHYH0sDqACKrI6ZYoqsWP2fhBL_SIolOAUMYBlJtWC5vMFegc2JQ:1toT7M:tkHA0gYE559uVdCrxGLcZv9-XvWIHYPDJwNK_cGVmbA','2025-03-15 20:07:24.846093'),('eeh4nsc4vpslefoir341ss6q1yuvxmoq','.eJxVizEOwjAMAP-SGaE0td2EDaSMvCFy4lipgKqidEL8nbLR8e50b5N4fbW0LvWZRjEnA-bw7zKXW51-4VxYrhESz_MxPni8X7YUJ9nBfm68tO100FPue0-Sy6CevEXvlIRYcahdCU5VUcFWIES1UjgET2C5A3SZzecLZbk1Ig:1tqFK0:yKuCB7Rpy0pSQ-DqNdvfkT3PojI_vjGhSmCeew6r9pc','2025-03-20 17:47:48.447844'),('f5albn7se0bedizdk6kgcnxldwt7yk1s','.eJxVi0EOwiAQAP_C2Rh2gQW8acLRN5BloaFRm8bak_Hv1ps9zkzmrTKvr57XpT3zWNVJWXX4d4Xl1qZfOAvXa7KZ5_mYHjzeL1tKU93Bfu689O0EroNrCFI1kongjJCEEC1VbEUigyMtvhgMWAiAwFsbB4-EmpiM-nwBXQY0Fg:1toA8R:3xC3KrVzECEMsZX5fVoR6qLf2CfdQ898ktj6Fzh3PqI','2025-03-14 23:51:15.391376'),('g91k7bo3gr0te2hf5468u8655c63n6pl','e30:1tkROt:EPETFE7RpFn4VkwEgk-HYYneAL_69p6zr4ZFI__sW9Q','2025-03-04 17:28:51.940028'),('grfb2wihgg1dpw25l6er2row54oqb1wa','.eJxVi7sOwjAMAP8lM0J5OMRhAykj3xA5ia1UQFW1dEL8O2Wj493p3irT-up5XXjOQ1NnZdXh3xWqdx5_4VKp3RJkmqZjetLwuG4pjW0H-7nT0rcTsWqAxsaRRFs8a4sMLooRLCcP7APGgKZ4HcRpb9mAuGglVGHGoj5fW4Y0-g:1tweAc:saEBY2UAZkaSgnxuZdcvJhshrh4qZRzkHG62tUrNH6c','2025-04-07 09:32:34.886427'),('h8rb6l1mnylt903fkvjiyb9smojfhmlk','.eJxVi7sOwjAMAP8lM0LBeThlAykj3xA5dqJUQFW1dEL995aNjnen-6pEy6elZS5T6kVdFajTv8vEzzL8wo1JHtEmGsdzfFP_uu8pDnKA49xobvvJIVfvgyCC98JAYAp3iJegtcnoQjWuQ2Fnqycx6LIVAbBUHBYNpNYNZow1HA:1u04Ty:RB03hc6O8XXhrp29MYyVQmPcTsUXFXhy6YEQq3SUKJ0','2025-04-16 20:14:42.880200'),('hmwbc7y498knztik7w2x9lhs35whvqep','.eJxVi0EOwiAQRe_C2phhYKC404SlZyADg6FRm6a1K-PdxZ1d_v_ee6vE26ulba1LGkWdlFaH_y9zudfpB86F5Rpt4nk-xiePj0tHcZLd2MeN19ZLYNBA7iYWpA4D18DWGSMEnpCCZIO6-qxdYbLoGI0P5G3uHoKgqM8XVHo0mA:1txtIC:kEY3ciunMK1xLokDWcc-DgJRCMZaYXSplrr2bjhEXAM','2025-04-10 19:53:32.530905'),('hzl4ecp0v6i1cw900dv4q470k1ddsmn6','.eJxVi0EOwiAQRe_C2phhYKC404SlZyADg6FRm6a1K-PdxZ1d_v_ee6vE26ulba1LGkWdlFaH_y9zudfpB86F5Rpt4nk-xiePj0tHcZLd2MeN19ZLYNBA7iYWpA4D18DWGSMEnpCCZIO6-qxdYbLoGI0P5G3uHoKgqM8XVHo0mA:1txVmz:wRvN-SP7YN00WELHwh8hFCD4yJQoZFU-2r5sfhSI4c0','2025-04-09 18:47:45.590890'),('jd5cjzcd5mmi41qfygwg6yjeo1p9kr8c','.eJxVjssKwjAURP8la5HeJjdJ3Sl06TeE-0hpUUsx6Ur8dytu7HLmcIZ5mURrHdNa8jNNak4G0Bz-Sya55flLzkJ67V2iZTn2D5rulw31s-7CXh6pjJsZrWJnUR0DCiGGFp3zPqAIRuGstpM2oI1gmR3HAYClgUFxQGw8bKOlrprn-vvozfsDLUU6Ng:1txsh4:z3JSE0gfMalxB8O4lkA6MQ9nWxQI8-_lFWL9nx-cc-w','2025-04-10 19:15:10.380394'),('jjbaln78vhajg0wibukqyt7vqzjzhujp','.eJxVizEOwjAMAP-SGSGSNHbCBlJG3hA5tqtUQFW1dEL8nbLR8e50b1NofbWyLjqXQczZWHP4d5X4ruMvXJjklrtC03TMTxoe1y3lUXawnxstbTuhl5oUREkwQe_RKSuBOmAb0skGdl4T-q7aGIP3FpGQoIYILkRG8_kChXM0-Q:1tqEyG:u2Qdo12n_X_hCgjQwlRMd9wW6_3agyWLU7YAj6GX41g','2025-03-20 17:25:20.882363'),('jp5yhx68o1eh8z4cujdxsuuk6kq4xma4','.eJxVi0EOwiAQAP_C2Rh2gQW8acLRN5BloaFRm8bak_Hv1ps9zkzmrTKvr57XpT3zWNVJWXX4d4Xl1qZfOAvXa7KZ5_mYHjzeL1tKU93Bfu689O0EroNrCFI1kongjJCEEC1VbEUigyMtvhgMWAiAwFsbB4-EmpiM-nwBXQY0Fg:1tncQi:foOqsXrOaQQsgIoDsW9lLCwduEIwlGusm_qpE53kaQo','2025-03-13 11:51:52.026441'),('jxdbjlu6hrdbragq2ocsjkxh0fx34352','.eJxVi0sKAjEQRO-StQhJOp92p5ClZwjd-ZBBHQbHWYl3t905m6LqPeqtMm2vkbe1PfNU1UmBOvwzpnJr80-cC9VrgkzLckwPmu4XUWmuu7E_D1qHPC0CtRCdkdIYPLLWrjFFTVxYEqPBKKCD7b3G4CgYsR7Qow1Ofb5sMjT9:1tyrI2:lx3BS2J314aRF9fFVPdb6xbKJpx83EdDd9Le2pZ4qKU','2025-04-13 11:57:22.690333'),('mtthlxejo9yqtoobz3arapvvp2j9ixcn','.eJxVizEOwjAMAP-SGaHUdRqHDaSMvCFyYkepgKqidEL8nbLR8e50b5N4fbW0LvpMo5iTQXP4d5nLTadfOBeWa8TE83yMDx7vly3FSXawnxsvbTsDdGBBAKwdqoSMrgKFwp5Uq3MyQMmOsFRve8xAvfpOoScmRsUs5vMFVwg1Dw:1tyyIR:cRUZGTuqUnItjqN3fnRYj6SbA1C6wa60JGXlrI0uXhE','2025-04-13 19:26:15.842528'),('mxfei7gbv7w4g6y3r5vvqi2tqr0plvxh','.eJxVi0EOwiAQRe_C2phhYKC404SlZyADg6FRm6a1K-PdxZ1d_v_ee6vE26ulba1LGkWdlFaH_y9zudfpB86F5Rpt4nk-xiePj0tHcZLd2MeN19ZLYNBA7iYWpA4D18DWGSMEnpCCZIO6-qxdYbLoGI0P5G3uHoKgqM8XVHo0mA:1tzMRr:znpAJpnCnTTQS8E_SnW7m84UedDFDvLmd-GlJYyGY9Q','2025-04-14 21:13:35.277239'),('n89hqa5dn6sztwwvur24uur8pfmbq14m','.eJxVi7sOwjAMAP8lM0J5OMRhAykj3xA5ia1UQFW1dEL8O2Wj493p3irT-up5XXjOQ1NnZdXh3xWqdx5_4VKp3RJkmqZjetLwuG4pjW0H-7nT0rcTsWqAxsaRRFs8a4sMLooRLCcP7APGgKZ4HcRpb9mAuGglVGHGoj5fW4Y0-g:1tyvto:2M4naL7Gd6eDZ3wqPvMBkRrdouGixovc6eHHcZQnJ8g','2025-04-13 16:52:40.267449'),('nqkul8jn4t78ix9z3odj87hm6i0cfiqy','.eJxVi0EOgjAURO_StTG0n5aPO0269AzNtL-mRCUEZGW8u2UHy3lv3lcFrJ8S1iXPYRB1UVqd9iwiPfO4iWuC3H0bME1n_8bwulXlRzmMY1ywlFoClBMogoxDz0Y4C8XIpqKGRVsnuiXTA-DuYUSnJqZMluuls06r3x-RujWv:1toR2d:Mm_07G6Z9dX13oH1hw4ZWg0jgNCXgAenA_3XcAGUOXk','2025-03-15 17:54:23.144432'),('o8gza3x84p6jlpduiy65zq76qtmw5c83','.eJxVizEOwjAMAP-SGaHUdRqHDaSMvCFyYkepgKqidEL8nbLR8e50b5N4fbW0LvpMo5iTQXP4d5nLTadfOBeWa8TE83yMDx7vly3FSXawnxsvbTsDdGBBAKwdqoSMrgKFwp5Uq3MyQMmOsFRve8xAvfpOoScmRsUs5vMFVwg1Dw:1tyyIU:FjbY3Plq3f29rVFMn3ziVy1G9isak5T12B6IV2u5xos','2025-04-13 19:26:18.890796'),('pgw8s67xipv6fscht9jbxl034rfyfi05','.eJxVi0sKAjEQRO-StQhJOp92p5ClZwjd-ZBBHQbHWYl3t905m6LqPeqtMm2vkbe1PfNU1UmBOvwzpnJr80-cC9VrgkzLckwPmu4XUWmuu7E_D1qHPC0CtRCdkdIYPLLWrjFFTVxYEqPBKKCD7b3G4CgYsR7Qow1Ofb5sMjT9:1turXR:cWimyCo5ez3PDq0IQ_Hx7e5TQ9Nf-QL7-mkCq4K56WQ','2025-04-02 11:24:45.123479'),('pwrm2lqz1d8o7hnm0lsuk0efjz5ccfe9','.eJxVi0EOwiAQRe_C2phhYKC404SlZyADg6FRm6a1K-PdxZ1d_v_ee6vE26ulba1LGkWdlFaH_y9zudfpB86F5Rpt4nk-xiePj0tHcZLd2MeN19ZLYNBA7iYWpA4D18DWGSMEnpCCZIO6-qxdYbLoGI0P5G3uHoKgqM8XVHo0mA:1txrzJ:iYkUvsy2ciuB5iaE4guf3gLCB0k7IrW1yvwjBvFFeD4','2025-04-10 18:29:57.203949'),('pzrjtb8x5blsh6nvi3iq7forgcfuyvxu','.eJxVjMEOwiAQRP-FszGwhWXxpglHv4FsgQ2N2jStPRn_3fZmjzPvzXxU4vXd0rrUOQ1FXZQhdfove86POu7kmrnco008Tef44uF521AcyyEcx42Xtn9qHwwbT8FR7XwhLQIOAwj2hOAsdeI7ZzVmEELm6sPmAogriFWr7w9bXDQh:1u04ct:F4uXgigIBp5kIm8SfHP3K-O62eTzg8aawYjIkShKRm4','2025-04-16 20:23:55.965127'),('qkzxonsz5f6gpodcmkenm73e1elml9qb','.eJxVi0EOwiAQRe_C2phhYKC404SlZyADg6FRm6a1K-PdxZ1d_v_ee6vE26ulba1LGkWdlFaH_y9zudfpB86F5Rpt4nk-xiePj0tHcZLd2MeN19ZLYNBA7iYWpA4D18DWGSMEnpCCZIO6-qxdYbLoGI0P5G3uHoKgqM8XVHo0mA:1twotG:AXhYrV9wOMDjCLg6_jd-idVRwZQFWduIeSXArxYaVI0','2025-04-07 20:59:22.027144'),('qvz3nk3747jtgpxhhr0cmvfpou7ueiqs','.eJxVizEOwjAMAP-SGSGSNHbCBlJG3hA5tqtUQFW1dEL8nbLR8e50b1NofbWyLjqXQczZWHP4d5X4ruMvXJjklrtC03TMTxoe1y3lUXawnxstbTuhl5oUREkwQe_RKSuBOmAb0skGdl4T-q7aGIP3FpGQoIYILkRG8_kChXM0-Q:1tqF0e:eHRNE54OGx5G5eoguo8pZnWbO5No9bVhrK_zDWzOHrs','2025-03-20 17:27:48.255214'),('r1410wmttrtuahhnkkkricupfysovdv0','.eJxVizEOwjAMAP-SGaHUdRqHDaSMvCFyYkepgKqidEL8nbLR8e50b5N4fbW0LvpMo5iTQXP4d5nLTadfOBeWa8TE83yMDx7vly3FSXawnxsvbTsDdGBBAKwdqoSMrgKFwp5Uq3MyQMmOsFRve8xAvfpOoScmRsUs5vMFVwg1Dw:1tyyIO:0pmlvd0j3slV0idhoYT0iH-WnRetLWxhE5QmS-ws8Lc','2025-04-13 19:26:12.362635'),('r8hnhfws6ih0qs6swib2ww0d3aysljmp','.eJxVizEOwjAMAP-SGaHUcdKGDaSMvCFybEepgKqidEL8nbLR8e50b5NpfbW8LvrMo5iT6czh3xXim06_cGaSa8JM83xMDxrvly2lSXawnxstbTuLVMeiCF3okYWhohvAe9QI6MpQY3RWiIpnLSCBLWDsSYKqClsyny-H1DZU:1toR2d:enK1VZ0K5nRB31YIhzJZcqOWHzSzP3I5F7O8DGmbA54','2025-03-15 17:54:23.144432'),('r9g10nuusp83wmo9rhr8o9pw8lx8vvza','.eJxVizEOwjAMAP-SGaE0td2EDaSMvCFy4lipgKqidEL8nbLR8e50b5N4fbW0LvWZRjEnA-bw7zKXW51-4VxYrhESz_MxPni8X7YUJ9nBfm68tO100FPue0-Sy6CevEXvlIRYcahdCU5VUcFWIES1UjgET2C5A3SZzecLZbk1Ig:1tq9zI:1K6Je9APNCgtNvedtW_myoZ_3uytSKcSYCfNG1AM0fM','2025-03-20 12:06:04.808017'),('rk46z62m3jyprrvl8vhz43ekqhqt8ski','.eJxVizEOwjAQBP_iGiH7iE1CB5JL3mCt73xyBEQRIRXi75iOdDs7mrdJWF81rUt5plHMyTiz-_8y-Famnzgz5Bq7hHnexwfG-6WpOMkGtnHFUlupRbzCIVP2QQIXy6Q2iBUH1uyIjxTaONBghyK9gyL3vlMmTwyYzxeyTjb3:1uDhHC:yRbTtLYjbQ3KGCJjFSkL8rh4XL92JLyzaOY4OlaFkH8','2025-05-24 10:17:50.220681'),('rokjele4jk8byf29fu3low0t5mb35jln','.eJxVi8EOwiAQBf-FszFSF-h604Sj30Ae7BIatWmsPRn_3Xqzx5nJvE3C8mppmfWZBjEn05ndv8soNx1_4Vwg10gJ07SPDwz3y5riKBvYzg1zW08VBQeXob5Wy6zkSy0Eomr9gbmydIV7gYOTI1mR6hGEOwblPmTz-QKmOzaA:1tmIik:jWeKP4NGiJpTi6lhw0UCx0ekKjsJBGEtsEQzgksCD60','2025-03-09 20:37:02.905598'),('sqmcf0mt0sw8krmjrjdd2p9zgkllhn7x','.eJxVi0sKAjEQRO-StQhJOp92p5ClZwjd-ZBBHQbHWYl3t905m6LqPeqtMm2vkbe1PfNU1UmBOvwzpnJr80-cC9VrgkzLckwPmu4XUWmuu7E_D1qHPC0CtRCdkdIYPLLWrjFFTVxYEqPBKKCD7b3G4CgYsR7Qow1Ofb5sMjT9:1ty8x5:cSjQTDXFAhvRbBS6IhhRdu5fw45oR0wCke29HUkpJsA','2025-04-11 12:36:47.355683'),('tfkaclcqvo2yk7563k2gzm6b3rpxtzdc','.eJxVi0EOwiAQRe_C2phhYKC404SlZyADg6FRm6a1K-PdxZ1d_v_ee6vE26ulba1LGkWdlFaH_y9zudfpB86F5Rpt4nk-xiePj0tHcZLd2MeN19ZLYNBA7iYWpA4D18DWGSMEnpCCZIO6-qxdYbLoGI0P5G3uHoKgqM8XVHo0mA:1tutHb:Wqk6hDacx5qyIfE1nSWSDMAqii7UZeQ83Ua-YxjIiDc','2025-04-02 13:16:31.554674'),('tja7fx7h9fzq1em07x6els6lj2aa8uly','.eJxVzE0KwjAUBOC7ZC2SNnk1daeQpWcI834gRS3F2pV4d9udXc58zHxcwfKuZZntVQZ1Zxfd4b9jyN3GDS4CveVYME3H_MTwuK6UR92F_bhirttlPBmzNEGbRL3vODAheeMA8_AhGliFREl69mboulaotRUogpL7_gCJfDYP:1u2cXj:gD0dnm0IWDGfmpAEGK_jJ0rZD5EmUXiNnnp9g1YSyxs','2025-04-23 21:01:07.483104'),('u9u2aclcqo2yn94o9cxbxl3ubtpid206','.eJxVizsOwjAQBe_iGiF_1naWDiSXnMFa7zpyBEQRIRXi7piOlO_NzFtl2l4tb2t95knUSRlQh_-zEN_q_CNnJrkmyLQsx_Sg6X7pKM2yG_u40dp6CYN3wTJo1hTGwoSIgcmhkRglFgYC9Fa0AR9MHYrrUmALBUdG8urzBYvMNaQ:1uAwD1:N6twpcHp6GeHbp0Fdxr1psgsXugdij3u0Xr1uSA0fLU','2025-05-16 19:38:07.459314'),('v9wijgxtmr543wm15hu07hk653mx79tv','.eJxVi0EOwiAQAP_C2Rh2Cwt404SjbyDLAqFRm8bak_Hv1ps9zkzmrRKvr57WpT7TWNRJgTr8u8xyq9MvnIXLNZrE83yMDx7vly3FqexgP3de-nY2W1yhgJUsQfZStQdCgGADicHmYCAkEe0NDzY7Dt63rNmY5jOiU58vTkE0XA:1toTGK:u_dRpmJjO1nSZopAYuOyhzhP-XHdV4CmW9P4el7csHo','2025-03-15 20:16:40.301203'),('vbraabrkex5300u1xjhk6ipmqbak5rty','.eJxVizEOwjAMAP-SGSE7TWJgAykjb4jsxFYroKoonRB_p2x0vDvd2xVeXn1ZZn2WobmT84hu92-F603HXzpXbtccCk_TPj94uF_WlMe2ge3c89yvZyBKEswLKgT1AAeWeEwcMXVEILGpdSJQkUhiimqmAYM3g2jI5D5fpP41kQ:1u2d6p:CTlkAQ8kKdB4CyHooPbpFgTsNHOQxffOtFzeqIt2RkM','2025-04-23 21:37:23.620063'),('vi2iq35tiy2pzxsnor4eb832dg1l7v71','.eJxVi0EOwiAURO_C2hgg3wLuNGHpGcjA_4RGbZrWrox3F3d2N29e3lslbK-WtlWWNLI6K6MO_19Gucv0E5cCvkVKmOdjfGJ8XLuKE-9gHzesrZcEgoF4zdQnFZuFdTaoNUAPRD6QGC3krSFHYu2gT-IC1xwYRpz6fAF2VzVa:1toUYV:rK4DIIqbCV2XmkfsNdoWVzbnwe05Ia9zMN51G2lr_3g','2025-03-15 21:39:31.532748'),('vpbiymhshe7olj7sffan0f4grrjx1lr7','.eJxVizsOwjAQBe_iGqFs_MGmA8klZ7Ced205AqIoIRXi7oSOlDOjeauE9dXSupQ5DaLOitTh32XwvYy_cGHILZqEaTrGJ4bHdUtxlB3s54albWfoxRtiD0apDrAQU2y1J9c5sYUtyFPQmTot3lKPYFhXU6rxwuSy-nwBh0M1xw:1toRjq:HuulrSOIitzzVK6DAfhTgzIM4a8NME8K6HtKAbfy85k','2025-03-15 18:39:02.132990'),('w4vppqfsz9gfss8s1cplk8gmzm9cktxs','.eJxVi0EOwiAQRe_C2phhYKC404SlZyADg6FRm6a1K-PdxZ1d_v_ee6vE26ulba1LGkWdlFaH_y9zudfpB86F5Rpt4nk-xiePj0tHcZLd2MeN19ZLYNBA7iYWpA4D18DWGSMEnpCCZIO6-qxdYbLoGI0P5G3uHoKgqM8XVHo0mA:1txRMi:DPwKem6YLNRRWSCaEyke0sT2Ty2JuGY0qvkB_-UAFtw','2025-04-09 14:04:20.386296'),('x8jganexowa8omst6712miw51eibz9m1','.eJxVi0EOwiAQRe_C2phhYKC404SlZyADg6FRm6a1K-PdxZ1d_v_ee6vE26ulba1LGkWdlFaH_y9zudfpB86F5Rpt4nk-xiePj0tHcZLd2MeN19ZLYNBA7iYWpA4D18DWGSMEnpCCZIO6-qxdYbLoGI0P5G3uHoKgqM8XVHo0mA:1u0501:pJS2oJMRpA0TMCf-oOxi_I4_YenKw-1zpS5tlA7hXxk','2025-04-16 20:47:49.814023'),('xfmevj7288vcbu98nijhw1kmafplkftn','.eJxVizEOwjAMAP-SGSGHOGnKBlJG3hA5jq1UQFW1dEL8nbLR8e50b5NpfbW8LjLnoZqzseDM4d8W4ruMv3RhqreEmabpmJ40PK5bSmPdwX5utLTtFKhkyRHbnrUIRAw-MmJ1BF4kej5FK6heQ69dVCnWMVHHgk4hgPl8AdmmNog:1txsHf:-d-uEN-ho2ERo0VsMZQflWGs0bJs948njiTO2RPL2Qk','2025-04-10 18:48:55.315449'),('xh3agghx31jval9xl850rti7d4slsgql','.eJxVi0EOwiAQRe_C2phhYKC404SlZyADg6FRm6a1K-PdxZ1d_v_ee6vE26ulba1LGkWdlFaH_y9zudfpB86F5Rpt4nk-xiePj0tHcZLd2MeN19ZLYNBA7iYWpA4D18DWGSMEnpCCZIO6-qxdYbLoGI0P5G3uHoKgqM8XVHo0mA:1tziWA:bViDpLzWTJycxrL6iaYUJ3QvSesfxt3pBrDxWLBLM0I','2025-04-15 20:47:30.301565'),('yc44sugiyqf6jesdyv22sd0dzx6ew4jq','.eJxVi0EOwiAQAP_C2ZilwILeNOHoG8jCLqFRm6a1J9O_t97scWYyX5Vo-bS0zDKlntVVaXX6d5nKU4ZfuBXiR7SJxvEc39S_7nuKAx_gODea234yEzsDGGoVyyF0GlE85o7AVANe2AIj6IDotSWsiObicjEC2nkX1LoBa1s0hA:1to94W:MCooIT7lqWlojk8FnZ94nKG054yTzPdIJob2KaazdJg','2025-03-14 22:43:08.316468'),('ytoxq80k9ak436yip24anee06e64mcsv','.eJxVi0sKAjEQRO-StQhJOp92p5ClZwjd-ZBBHQbHWYl3t905m6LqPeqtMm2vkbe1PfNU1UmBOvwzpnJr80-cC9VrgkzLckwPmu4XUWmuu7E_D1qHPC0CtRCdkdIYPLLWrjFFTVxYEqPBKKCD7b3G4CgYsR7Qow1Ofb5sMjT9:1twq6g:ni7ax28iq_rxh2FgehiS_PLDJwiwfmbVBzhfF_g0m2Q','2025-04-07 22:17:18.305557');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'acadme44'
--

--
-- Dumping routines for database 'acadme44'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-10 15:55:52
