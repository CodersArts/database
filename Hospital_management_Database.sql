-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sunnydb
-- ------------------------------------------------------
-- Server version	5.5.25

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `country` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `house_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'India','MP','Chhindwara','Sukludhana','321/12'),(2,'India','Bhopal','Bhopal','MP Naar','785/41'),(3,'india','Maharastra','Nagpur','bardi road','221/52'),(4,'india','MP','indore','station road','102/2'),(5,'india','MP','jabalpur','Ghama para','786/15'),(6,'india','MP','seoni','bus stand','152/45'),(7,'india','Chattisgarh','gondi','by pass','89/80'),(8,'india','Chattisgarh','raipur','kota coloney','86/125'),(9,'india','Haryana','Gurgaon','nirwana contry road ','452/78');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bed`
--

DROP TABLE IF EXISTS `bed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bed` (
  `id` int(11) NOT NULL,
  `bedNo` int(11) DEFAULT NULL,
  `supervisedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bedNo_UNIQUE` (`bedNo`),
  KEY `FK-supervisedByStaffNurse_idx` (`supervisedBy`),
  CONSTRAINT `FK-supervisedByStaffNurse` FOREIGN KEY (`supervisedBy`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed`
--

LOCK TABLES `bed` WRITE;
/*!40000 ALTER TABLE `bed` DISABLE KEYS */;
INSERT INTO `bed` VALUES (1,1,25),(2,2,26),(3,3,20);
/*!40000 ALTER TABLE `bed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `er_shift`
--

DROP TABLE IF EXISTS `er_shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `er_shift` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `inchargeStaffId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UNIQUE` (`startTime`,`endTime`),
  KEY `FK-inchargeStaffId_idx` (`inchargeStaffId`),
  CONSTRAINT `FK-inchargeStaffId` FOREIGN KEY (`inchargeStaffId`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `er_shift`
--

LOCK TABLES `er_shift` WRITE;
/*!40000 ALTER TABLE `er_shift` DISABLE KEYS */;
INSERT INTO `er_shift` VALUES (1,'Morning(M)','09:00:00','12:00:00',NULL),(2,'Afternoon(A)','12:00:00','06:00:00',NULL),(3,'Evening','06:00:00','09:00:00',NULL),(4,'Night','09:00:00','12:00:00',NULL);
/*!40000 ALTER TABLE `er_shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medication` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `dosage` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication`
--

LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
INSERT INTO `medication` VALUES (1,'Zhandu bam',2);
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contactNumber` bigint(10) NOT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `emergancyContactNumber` bigint(10) DEFAULT NULL,
  `addressId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contactNumber_UNIQUE` (`contactNumber`),
  KEY `FK-addressId_idx` (`addressId`),
  CONSTRAINT `FK-addressId` FOREIGN KEY (`addressId`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Pankaj','kumar','jaiswal','pk@gmail.com',9806155360,'1991-12-15','male',9138155360,1),(2,'Pavan','Kumar','khandelwal','pv@gmail.com',7845128956,'1991-07-15','male',9145568978,2),(3,'reena','','khandelwal','pv@gmail.com',7889564512,'1991-07-15','female',9145568978,3),(4,'leena','','khandelwal','pv@gmail.com',7823568945,'1991-07-15','female',9145568978,4),(5,'dhawal','bhai','balar',NULL,4556897845,NULL,'male',NULL,NULL),(6,'tushar','bhai','balar',NULL,7845128950,NULL,'male',NULL,NULL),(7,'shikha','','matur',NULL,2356457889,NULL,'female',NULL,NULL),(8,'poorvi','','awasthi',NULL,8945561223,NULL,'female',NULL,NULL),(9,'pooja','','soni',NULL,1656894533,NULL,'female',NULL,NULL),(10,'rina','','uikey',NULL,9876543210,NULL,'female',NULL,NULL),(11,'sourabh','Kumar','tomar',NULL,1232123121,NULL,'male',NULL,NULL),(12,'saurabh','Kumar','shukla',NULL,4566565555,NULL,'male',NULL,NULL),(13,'amratesh','Kumar','shukla',NULL,4848965218,NULL,'male',NULL,NULL),(14,'rohitendra','Kumar','thakur',NULL,8985599599,NULL,'male',NULL,NULL),(15,'manoj','Kumar','soni',NULL,8956955555,NULL,'male',NULL,NULL),(16,'yogesh',NULL,'sony',NULL,4848985945,NULL,'male',NULL,NULL),(17,'mayuri',NULL,'raghuwanshi',NULL,4964616589,NULL,'female',NULL,NULL),(18,'Suman',NULL,'Khatri',NULL,5965566983,NULL,'female',NULL,NULL),(19,'Rakhi',NULL,'Malvi',NULL,5959359859,NULL,'female',NULL,NULL),(20,'Aankesh',NULL,'juneja',NULL,8929556595,NULL,'male',NULL,NULL),(21,'ashish',NULL,'sarathe',NULL,5989595955,NULL,'male',NULL,NULL),(22,'rajesh',NULL,'singh',NULL,5992296292,NULL,'male',NULL,NULL),(23,'rinku',NULL,'soni',NULL,9517895646,NULL,'male',NULL,NULL),(24,'july',NULL,'sharma',NULL,9547786665,NULL,'female',NULL,NULL),(25,'vivek',NULL,'paliya',NULL,4584993587,NULL,'male',NULL,NULL),(26,'akash',NULL,'garg',NULL,4565558996,NULL,'male',NULL,NULL),(27,'ruhi',NULL,'trivedi',NULL,1599745566,NULL,'female',NULL,NULL),(28,'amisha',NULL,'patle',NULL,7531594658,NULL,'female',NULL,NULL),(29,'sheela',NULL,'barde',NULL,4563537888,NULL,'female',NULL,NULL),(30,'Sunita',NULL,'day',NULL,8644484885,NULL,'female',NULL,NULL),(31,'Rani',NULL,'sharma',NULL,9484948994,NULL,'female',NULL,NULL),(32,'amit',NULL,'sinha',NULL,5549656565,NULL,'male',NULL,NULL),(33,'hamant',NULL,'dubey',NULL,7561899999,NULL,'male',NULL,NULL),(34,'rahul',NULL,'indorkar',NULL,4874585455,NULL,'male',NULL,NULL),(35,'atul',NULL,'sharma',NULL,7845122325,NULL,'male',NULL,NULL),(36,'Pradeep',NULL,'sahu',NULL,7444444444,NULL,'male',NULL,NULL),(37,'Rakesh',NULL,'vishwa',NULL,1888888888,NULL,'male',NULL,NULL),(38,'Jitesh',NULL,'vinod',NULL,9885555444,NULL,'male',NULL,NULL),(39,'Ritesh','','Soni',NULL,1552222544,NULL,'male',NULL,NULL),(40,'Amit','','mishra',NULL,4445455454,NULL,'male',NULL,NULL),(41,'akanksha','','dohley',NULL,9595945565,NULL,'female',NULL,NULL),(42,'rohit','','tiwari',NULL,9544458888,NULL,'male',NULL,NULL),(43,'awdhesh','','verma',NULL,4512222222,NULL,'male',NULL,NULL),(44,'nitesh','','sahu',NULL,4545454512,NULL,'male',NULL,NULL),(45,'jitendra','','baghel',NULL,1245785621,NULL,'male',NULL,NULL),(46,'sonali','','kushwah',NULL,4523122222,NULL,'female',NULL,NULL),(47,'mitali','','patel',NULL,9594664632,NULL,'female',NULL,NULL),(48,'shaili','','sahu',NULL,4184158515,NULL,'female',NULL,NULL),(49,'vaishali','','thakur',NULL,4851545554,NULL,'female',NULL,NULL),(50,'Anita','','Soni',NULL,5468651951,NULL,'female',NULL,NULL);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `petient`
--

DROP TABLE IF EXISTS `petient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `petient` (
  `id` int(11) NOT NULL,
  `personId` int(11) DEFAULT NULL,
  `admittedBy` int(11) DEFAULT NULL,
  `supervisedBy` int(11) DEFAULT NULL,
  `bedId` int(11) DEFAULT NULL,
  `medicationId` int(11) DEFAULT NULL,
  `admittedDate` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK-doctor-staff_idx` (`supervisedBy`),
  KEY `FK-petient-bed_idx` (`bedId`),
  KEY `FK-medication_idx` (`medicationId`),
  CONSTRAINT `FK-doctor-staff` FOREIGN KEY (`supervisedBy`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK-medication` FOREIGN KEY (`medicationId`) REFERENCES `medication` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK-petient-bed` FOREIGN KEY (`bedId`) REFERENCES `bed` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petient`
--

LOCK TABLES `petient` WRITE;
/*!40000 ALTER TABLE `petient` DISABLE KEYS */;
INSERT INTO `petient` VALUES (1,20,26,30,1,1,'2018-10-30',26),(2,49,26,30,2,NULL,'2018-08-31',24),(3,45,24,30,3,NULL,'2018-08-31',22);
/*!40000 ALTER TABLE `petient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift_assigned`
--

DROP TABLE IF EXISTS `shift_assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shift_assigned` (
  `id` int(11) NOT NULL,
  `emergancyRoomShifId` int(11) DEFAULT NULL,
  `staffId` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staffId_idx` (`staffId`),
  KEY `FK-emergancyRoomShifId` (`emergancyRoomShifId`),
  CONSTRAINT `FK-staffId` FOREIGN KEY (`staffId`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift_assigned`
--

LOCK TABLES `shift_assigned` WRITE;
/*!40000 ALTER TABLE `shift_assigned` DISABLE KEYS */;
INSERT INTO `shift_assigned` VALUES (1,1,1,'2018-10-30'),(2,1,2,'2018-10-30'),(3,1,3,'2018-10-30'),(4,1,4,'2018-10-30'),(5,1,30,'2018-10-30'),(6,1,29,'2018-10-30');
/*!40000 ALTER TABLE `shift_assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `staffCategoryId` int(11) DEFAULT NULL,
  `staffGradeId` int(11) DEFAULT NULL,
  `staffTypeId` int(11) DEFAULT NULL,
  `personId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK-staffCategoryId_idx` (`staffCategoryId`),
  KEY `FK-staffGradeId_idx` (`staffGradeId`),
  KEY `FK-staffTypeId_idx` (`staffTypeId`),
  KEY `FK-personId_idx` (`personId`),
  CONSTRAINT `FK-personId` FOREIGN KEY (`personId`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK-staffCategoryId` FOREIGN KEY (`staffCategoryId`) REFERENCES `staff_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK-staffGradeId` FOREIGN KEY (`staffGradeId`) REFERENCES `staff_grade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK-staffTypeId` FOREIGN KEY (`staffTypeId`) REFERENCES `staff_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,1,1,3,1),(2,1,1,2,2),(3,1,1,3,3),(4,1,1,2,4),(5,1,2,3,5),(6,2,2,2,6),(7,1,2,3,7),(8,2,2,2,8),(9,1,2,3,9),(10,2,2,2,10),(11,1,2,3,11),(12,2,3,2,12),(13,1,3,3,13),(14,2,3,2,14),(15,1,3,3,15),(16,2,3,2,16),(17,1,3,3,17),(18,2,3,2,18),(19,1,4,3,19),(20,2,4,1,20),(21,1,4,1,21),(22,2,4,2,22),(23,1,4,2,23),(24,2,4,2,24),(25,1,1,2,30),(26,2,1,2,29),(27,1,1,2,28),(28,2,1,1,27),(29,1,1,1,26),(30,2,2,2,25);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_category`
--

DROP TABLE IF EXISTS `staff_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_category` (
  `id` int(11) NOT NULL,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_category`
--

LOCK TABLES `staff_category` WRITE;
/*!40000 ALTER TABLE `staff_category` DISABLE KEYS */;
INSERT INTO `staff_category` VALUES (1,'Permanent'),(2,'Contractual');
/*!40000 ALTER TABLE `staff_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_grade`
--

DROP TABLE IF EXISTS `staff_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_grade` (
  `id` int(11) NOT NULL,
  `grade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_grade`
--

LOCK TABLES `staff_grade` WRITE;
/*!40000 ALTER TABLE `staff_grade` DISABLE KEYS */;
INSERT INTO `staff_grade` VALUES (1,'N1'),(2,'N2'),(3,'N3'),(4,'N4');
/*!40000 ALTER TABLE `staff_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_type`
--

DROP TABLE IF EXISTS `staff_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_type` (
  `id` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_type`
--

LOCK TABLES `staff_type` WRITE;
/*!40000 ALTER TABLE `staff_type` DISABLE KEYS */;
INSERT INTO `staff_type` VALUES (3,'Doctor'),(2,'Nurse'),(1,'Receptionist');
/*!40000 ALTER TABLE `staff_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-02 17:13:57
