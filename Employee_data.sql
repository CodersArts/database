-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.67-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema employee_data
--

CREATE DATABASE IF NOT EXISTS employee_data;
USE employee_data;

--
-- Definition of table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL default '0',
  `Deptname` varchar(30) default NULL,
  `deptLocation` varchar(20) default NULL,
  `deptFloor` varchar(20) default NULL,
  PRIMARY KEY  (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`department_id`,`Deptname`,`deptLocation`,`deptFloor`) VALUES 
 (901,'IT','LONDON','1ST'),
 (902,'ENGG','LONDON','2ND'),
 (903,'HR','LONDON','3RD'),
 (904,'ELECTRICAL','LONDON','4TH'),
 (905,'MAINTENANCE','LONDON','5TH'),
 (2011,'PROGRAMMER1','PARIS','6TH');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;


--
-- Definition of table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL auto_increment,
  `Empname` varchar(25) NOT NULL,
  `Managerid` int(11) NOT NULL,
  `Dateofhire` date NOT NULL,
  `Jobname` varchar(15) NOT NULL,
  `Salary` decimal(10,2) NOT NULL,
  `department_id` int(11) NOT NULL,
  `DOB` date NOT NULL,
  `address` varchar(30) NOT NULL,
  PRIMARY KEY  (`employee_id`),
  KEY `FK_employee_1` (`department_id`),
  CONSTRAINT `FK_employee_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`employee_id`,`Empname`,`Managerid`,`Dateofhire`,`Jobname`,`Salary`,`department_id`,`DOB`,`address`) VALUES 
 (1001,'Mark',5001,'2000-08-01','PROGRAMMER','90000.00',902,'1994-05-23','101 Park Street LA'),
 (1002,'Mary',5002,'2017-08-23','TESTER','100000.00',902,'1990-04-27','101 Mark Street LA'),
 (1003,'Faith',5003,'2018-06-10','HR MANAGER','25000.00',903,'1988-05-05','101 Royal casa LA'),
 (1004,'Natalia',5004,'2018-05-26','MANAGER','96000.00',903,'1994-06-28','101 Wardha LA'),
 (1005,'Flynn',5005,'2019-12-27','ELECTRICAL ENGG','56000.00',904,'1987-07-29','101 Uchha Kuaa LA'),
 (1006,'Max',5006,'2016-07-19','IT MANAGER','19000.00',901,'1994-03-10','101 Lal Kuwa LA'),
 (1007,'Ronny',5007,'2018-03-18','PROGRAMMER','27000.00',902,'1990-02-08','101 Mandi House LA'),
 (1008,'Sheing',5008,'2014-09-28','ELECTRICAL ENGG','34000.00',904,'1991-01-05','101 Opera Street LA'),
 (1009,'Robert',5009,'2019-07-05','MAINTENANCE','78400.00',905,'1993-07-21','101 Nariman House LA'),
 (1010,'Kareena',5010,'2015-06-03','TESTER','120000.00',902,'1994-08-24','101 Henton house LA'),
 (1011,'Janet',5095,'2014-10-12','PROGRAMMER','90000.00',2011,'1994-08-24','101 Henton house LA');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


--
-- Definition of table `salary`
--

DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `salary_level` int(11) NOT NULL default '0',
  `salarymin` int(11) default NULL,
  `salarymax` int(11) default NULL,
  PRIMARY KEY  USING BTREE (`salary_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `salary`
--

/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` (`salary_level`,`salarymin`,`salarymax`) VALUES 
 (1,15000,30000),
 (2,30001,50000),
 (3,50001,70000),
 (4,70001,90000),
 (5,90001,120000);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
