CREATE DATABASE  IF NOT EXISTS `racelog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `racelog`;
-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: racelog
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `canoe`
--

DROP TABLE IF EXISTS `canoe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canoe` (
  `canoe_num` int(11) NOT NULL,
  `CANOE_HULL_COLOR` varchar(20) DEFAULT NULL,
  `CANOE_GUNWALE_COLOR` varchar(20) DEFAULT NULL,
  `CANOE_TYPE` varchar(20) DEFAULT NULL,
  `CLUB_NAME` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`canoe_num`),
  KEY `CLUB_NAME` (`CLUB_NAME`),
  CONSTRAINT `canoe_ibfk_1` FOREIGN KEY (`CLUB_NAME`) REFERENCES `club` (`club_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canoe`
--

LOCK TABLES `canoe` WRITE;
/*!40000 ALTER TABLE `canoe` DISABLE KEYS */;
INSERT INTO `canoe` VALUES (17513,'Black','Red','Solo','Jericho'),(28010,'Blue','Purple','Solo','Hood River'),(28195,'Purple','Green','Team','Socc'),(36514,'White','Green','Solo','Kai pana'),(38796,'Black','Green','Solo','Socc'),(39936,'Red','Purple','Solo','Kailaika'),(42677,'Green','Black','Duo','Rccc'),(49937,'Red','Purple','Solo','Jericho'),(54602,'Purple','Purple','Team','Bridge City'),(55300,'Green','Green','Duo','Kai pana'),(64601,'Black','Red','Duo','Hood River'),(68065,'Blue','Green','Duo','Sand Point'),(70127,'Black','Purple','Duo','Kailaika'),(87579,'White','White','Solo','Bridge City'),(87758,'White','Purple','Team','Rccc');
/*!40000 ALTER TABLE `canoe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club` (
  `club_name` varchar(32) NOT NULL,
  `CLUB_CITY` varchar(100) DEFAULT NULL,
  `CLUB_STATE` varchar(20) DEFAULT NULL,
  `CLUB_COUNTRY` varchar(20) DEFAULT NULL,
  `CLUB_WEBSITE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`club_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES ('Bridge City','Zugaden','HI','USA','wowzub.it'),('Hood River','Gezahana','NE','USA','umolmub.mr'),('Jericho','Koniki','OH','Canada','jawzolopi.td'),('Kai pana','Kanhoan','DE','Canada','canoiz.ca'),('Kailaika','Amvipo','AR','Mexico','sugnesek.ht'),('Rccc','Klipsegart','HI','USA','omicarn.ch'),('Sand Point','Dogheoti','NJ','USA','gegzame.me'),('Socc','Henotat','WA','Mexico','haihud.gz');
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paddler`
--

DROP TABLE IF EXISTS `paddler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paddler` (
  `PADDLER_NAME` varchar(30) NOT NULL,
  `TSHIRT_SIZE` varchar(10) DEFAULT NULL,
  `TEAM_NUMBER` int(11) NOT NULL,
  `CLUB_NAME` varchar(100) DEFAULT NULL,
  `SIGNED_WAIVER` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`PADDLER_NAME`,`TEAM_NUMBER`),
  KEY `CLUB_NAME` (`CLUB_NAME`),
  KEY `TEAM_NUMBER` (`TEAM_NUMBER`),
  CONSTRAINT `paddler_ibfk_1` FOREIGN KEY (`CLUB_NAME`) REFERENCES `club` (`club_name`),
  CONSTRAINT `paddler_ibfk_2` FOREIGN KEY (`TEAM_NUMBER`) REFERENCES `registration` (`TEAM_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paddler`
--

LOCK TABLES `paddler` WRITE;
/*!40000 ALTER TABLE `paddler` DISABLE KEYS */;
INSERT INTO `paddler` VALUES ('Aaron Hoffman','Large',12615,'Kailaika',1),('Abbie Cobb','Medium',52870,'Kai pana',1),('Abbie Walker','Medium',8993,'Kai pana',0),('Ada Jordan','Large',36925,'Kailaika',0),('Adam Beck','X Large',53733,'Bridge City',0),('Adelaide Castro','X Large',81828,'Bridge City',1),('Adelaide Moss','Small',36037,'Bridge City',1),('Adele Horton','Small',11853,'Socc',1),('Adele Schwartz','Medium',38440,'Kailaika',1),('Adrian Fuller','X Large',92410,'Rccc',1),('Aiden Hopkins','Small',74215,'Jericho',0),('Alan Griffith','X Large',82321,'Kai pana',0),('Alejandro Horton','Medium',28025,'Socc',0),('Alex Jensen','X Small',7981,'Hood River',0),('Alex Jensen','Medium',99455,'Rccc',1),('Alex Malone','X Small',70133,'Socc',0),('Alex Newman','X Small',36652,'Socc',0),('Alfred Parker','Medium',89632,'Hood River',0),('Alice Mann','Small',98856,'Bridge City',1),('Allen Hernandez','Large',67162,'Rccc',1),('Allen Kennedy','X Large',72929,'Hood River',0),('Allie Jackson','X Large',45360,'Socc',0),('Alma Schultz','X Small',38832,'Hood River',1),('Alta Pittman','Small',24544,'Jericho',0),('Amanda Ray','X Large',39393,'Hood River',1),('Amelia Duncan','Medium',31744,'Hood River',0),('Amy Bishop','X Small',7981,'Sand Point',0),('Amy Erickson','X Large',36925,'Kailaika',1),('Andre Dean','X Large',39393,'Sand Point',0),('Andre Vaughn','Large',38145,'Socc',0),('Andrew Ball','Large',74628,'Rccc',0),('Andrew Brock','X Small',45360,'Socc',1),('Ann Goodwin','Large',71723,'Kailaika',0),('Ann Jackson','Medium',92410,'Rccc',1),('Ann Ward','Medium',70133,'Bridge City',1),('Anne Dixon','Small',84554,'Rccc',1),('Annie Rivera','Medium',27709,'Sand Point',0),('Augusta Robinson','X Large',859,'Sand Point',0),('Austin Douglas','Large',17615,'Socc',0),('Austin McDaniel','Large',21585,'Sand Point',0),('Barbara Cross','Large',86954,'Bridge City',0),('Barbara Griffin','Small',54058,'Bridge City',0),('Barbara Morgan','Large',39393,'Sand Point',1),('Barbara Pittman','Large',71723,'Kai pana',0),('Barbara Sutton','X Large',50759,'Bridge City',1),('Barry Gordon','Small',11344,'Sand Point',0),('Belle Haynes','X Large',81828,'Socc',0),('Benjamin Stephens','X Small',50759,'Socc',1),('Bernard Curtis','Large',8993,'Kailaika',0),('Bertha Riley','Medium',28025,'Bridge City',0),('Bertie French','Medium',96250,'Kailaika',1),('Bertie Stewart','X Small',68422,'Hood River',0),('Bess Cohen','X Small',64502,'Bridge City',1),('Bess Gordon','Medium',22205,'Socc',0),('Bessie Hopkins','Large',67162,'Jericho',0),('Bessie Knight','X Small',37471,'Rccc',1),('Bessie McDaniel','X Small',40154,'Kailaika',0),('Bettie Simpson','Small',36037,'Bridge City',1),('Beulah Foster','Medium',22205,'Socc',1),('Beulah Rhodes','X Small',27957,'Jericho',1),('Bradley Andrews','X Small',20149,'Kai pana',1),('Bradley Simmons','Large',81828,'Bridge City',0),('Brandon Collins','X Small',36647,'Kailaika',0),('Brent Page','Medium',23510,'Bridge City',1),('Brian Lawson','X Large',40154,'Kai pana',1),('Callie Banks','Small',46220,'Sand Point',0),('Cameron Sanchez','X Large',64741,'Jericho',1),('Cameron Santos','X Small',27957,'Rccc',0),('Carl Bates','X Large',29288,'Bridge City',1),('Carl Bush','X Large',89632,'Sand Point',0),('Carl Martin','Medium',93135,'Kai pana',0),('Carl Peterson','Medium',36926,'Jericho',1),('Carolyn Adams','Medium',28025,'Socc',1),('Carolyn Griffith','X Large',20149,'Kailaika',0),('Carrie Armstrong','Large',38832,'Hood River',1),('Cecelia Cain','X Small',67619,'Kai pana',1),('Cecelia Griffin','X Small',89857,'Kailaika',1),('Cecilia McGee','X Small',57878,'Kai pana',0),('Celia Edwards','Medium',11853,'Socc',1),('Chad Bryan','Medium',36926,'Rccc',1),('Chad Cummings','X Large',17330,'Sand Point',0),('Chad Glover','Medium',4397,'Kai pana',0),('Chad Price','X Small',17330,'Sand Point',0),('Charlie Schneider','Large',89857,'Kai pana',1),('Charlotte Brown','X Small',91497,'Rccc',0),('Chase Harrington','Medium',29288,'Bridge City',0),('Chris Bishop','X Small',72929,'Sand Point',1),('Christine Reese','X Large',91497,'Rccc',1),('Christopher Gregory','Medium',31744,'Sand Point',0),('Clarence Butler','X Small',81873,'Rccc',1),('Cody Meyer','Medium',36875,'Rccc',0),('Cody Rogers','Medium',67619,'Kailaika',0),('Cody Underwood','Small',82321,'Kailaika',0),('Cole Mann','Large',99455,'Jericho',0),('Cole Parsons','Small',74628,'Rccc',0),('Connor Conner','Large',23510,'Bridge City',0),('Connor Thornton','X Large',93421,'Hood River',0),('Corey Maxwell','Small',68422,'Sand Point',1),('Cynthia Hines','Large',60917,'Socc',1),('Cynthia Hughes','Small',12660,'Kai pana',1),('Cynthia Schmidt','X Large',859,'Hood River',0),('Daisy Wilson','Large',57351,'Kailaika',0),('Danny Bates','Large',36037,'Socc',1),('Danny Harris','X Small',85477,'Bridge City',1),('Danny Sanchez','Medium',12660,'Kailaika',1),('Darrell Joseph','Large',27957,'Rccc',0),('David Adams','Large',86954,'Bridge City',0),('David Martin','X Small',32961,'Kai pana',0),('David Mathis','X Small',19554,'Socc',1),('Dean Davidson','Small',7981,'Hood River',1),('Dean Holmes','Medium',57376,'Sand Point',0),('Della Garner','Small',859,'Sand Point',0),('Dennis Lloyd','X Large',99637,'Rccc',0),('Derek Douglas','Large',98031,'Kai pana',0),('Derrick Warner','X Small',37471,'Jericho',0),('Devin Cole','X Large',65815,'Rccc',0),('Devin West','Medium',4397,'Kailaika',0),('Dollie Willis','X Small',44879,'Kailaika',0),('Don Guzman','X Large',50599,'Rccc',0),('Don Hanson','Small',36875,'Jericho',1),('Donald Mann','Medium',70133,'Socc',0),('Donald Matthews','Large',17611,'Rccc',1),('Dora Washington','X Large',74628,'Jericho',0),('Dorothy Barrett','Small',74215,'Jericho',0),('Douglas Ortiz','Large',71083,'Hood River',1),('Earl Ramirez','X Small',82513,'Sand Point',1),('Edward Owens','Large',82321,'Kai pana',0),('Edwin Buchanan','X Small',24544,'Jericho',0),('Effie Walters','Small',17615,'Bridge City',1),('Eleanor Bass','X Small',25823,'Jericho',1),('Elijah Harris','Small',17615,'Socc',0),('Elijah Ortega','X Large',38832,'Sand Point',0),('Eliza Ryan','Medium',21585,'Hood River',1),('Elizabeth Davis','Medium',53733,'Bridge City',1),('Ella Collins','Small',57878,'Kailaika',1),('Ellen Hubbard','Small',87101,'Hood River',0),('Elmer Armstrong','Small',57376,'Hood River',0),('Elnora Sharp','X Small',36875,'Rccc',0),('Elsie Lindsey','Medium',93421,'Sand Point',1),('Elsie Ramirez','X Small',93421,'Hood River',0),('Emilie Allison','X Large',4298,'Jericho',0),('Emilie Bradley','Medium',82513,'Sand Point',0),('Emilie Gray','Medium',52870,'Kailaika',0),('Emilie Mack','X Small',71723,'Kai pana',1),('Emily Kelly','Small',50599,'Rccc',0),('Eric Nguyen','X Small',65815,'Rccc',0),('Erik Moss','Small',57351,'Kai pana',1),('Erik Thompson','Large',64502,'Socc',0),('Ernest Edwards','Large',5442,'Hood River',1),('Ernest Riley','Small',50599,'Jericho',1),('Estella Anderson','X Large',76761,'Sand Point',1),('Estella Green','X Small',93421,'Sand Point',1),('Estelle Anderson','X Large',25823,'Rccc',1),('Estelle Fleming','X Large',64741,'Rccc',0),('Ethan Butler','X Large',14971,'Socc',1),('Ethan Campbell','Medium',5442,'Sand Point',1),('Ethan Potter','Large',87101,'Sand Point',0),('Ethel Medina','Large',96250,'Kai pana',0),('Ethel Spencer','X Large',74215,'Rccc',1),('Eugene Goodwin','Small',22178,'Kai pana',1),('Eugenia Diaz','X Small',36652,'Socc',1),('Eugenia Tucker','X Large',63533,'Sand Point',0),('Eugenia Vargas','Large',54058,'Bridge City',0),('Eula Santiago','Medium',46220,'Sand Point',0),('Eunice Buchanan','Small',34899,'Jericho',1),('Eunice Spencer','Medium',64502,'Bridge City',1),('Eva Dunn','X Small',11853,'Bridge City',0),('Evan Lawrence','Large',98345,'Jericho',0),('Evelyn Terry','X Large',89857,'Kailaika',0),('Fanny Conner','X Large',72929,'Sand Point',1),('Flora Long','Small',44879,'Kai pana',1),('Flora Warner','Medium',98345,'Rccc',0),('Flora Young','Large',50599,'Rccc',1),('Florence Dawson','X Small',27957,'Jericho',1),('Floyd Dixon','Small',64741,'Rccc',0),('Francisco Medina','Medium',81873,'Rccc',0),('Francisco Ryan','X Small',14971,'Socc',0),('Francisco Vargas','Small',84554,'Jericho',1),('Frank Goodwin','X Large',24544,'Rccc',0),('Frank Young','X Small',98856,'Socc',1),('Franklin Reed','Small',12615,'Kailaika',0),('Franklin Vargas','X Small',44952,'Rccc',1),('Frederick Young','Large',24544,'Rccc',0),('Gabriel James','Medium',80286,'Kai pana',0),('Gavin Arnold','X Large',36652,'Socc',1),('Gavin Dixon','Small',44952,'Rccc',1),('Gavin Gomez','Small',17611,'Rccc',0),('Gene Curtis','Large',98031,'Kailaika',0),('George Bishop','X Small',36652,'Bridge City',1),('Georgia Schultz','X Small',50759,'Bridge City',1),('Gertrude Bass','Small',23510,'Socc',1),('Gertrude Mason','X Small',5442,'Hood River',1),('Gertrude Tate','Large',46220,'Sand Point',0),('Glen Simon','X Large',91497,'Jericho',1),('Glen Valdez','Large',27351,'Sand Point',1),('Glenn Malone','Large',62109,'Kai pana',0),('Gordon Miles','X Large',54058,'Bridge City',0),('Gordon Spencer','X Large',17747,'Hood River',0),('Gregory Dawson','Medium',11853,'Socc',0),('Gregory Harper','Large',65815,'Jericho',0),('Gregory Patton','X Large',27351,'Hood River',1),('Gregory Phelps','X Large',37471,'Rccc',1),('Harold Ruiz','Small',93740,'Sand Point',1),('Harold Watkins','Large',70133,'Bridge City',1),('Harriet Tate','X Large',71083,'Sand Point',0),('Harriett Holloway','Small',17747,'Sand Point',1),('Harry Pearson','X Large',38145,'Bridge City',1),('Harry Quinn','Small',82513,'Hood River',1),('Harvey Bush','Small',29288,'Socc',0),('Harvey Lawson','Large',93621,'Socc',1),('Harvey Walton','X Small',45360,'Bridge City',1),('Helen Collins','Large',21585,'Sand Point',0),('Helena Alvarado','Medium',68422,'Hood River',0),('Henrietta Simmons','Large',38832,'Hood River',1),('Henry Rose','Medium',57351,'Kailaika',1),('Herbert Wright','X Small',36647,'Kai pana',1),('Herman McDaniel','Large',89632,'Hood River',0),('Hester Atkins','X Large',98856,'Bridge City',1),('Hester Barber','X Small',85477,'Bridge City',1),('Hester Perez','Small',40154,'Kailaika',0),('Hester Stokes','X Large',44952,'Jericho',1),('Hettie Tate','Medium',12660,'Kailaika',1),('Hilda Hopkins','Medium',859,'Sand Point',1),('Hulda Garza','X Large',91497,'Jericho',0),('Ida Lee','Medium',22205,'Bridge City',1),('Ina Jacobs','Large',22178,'Kailaika',1),('Irene Chambers','X Small',50820,'Kailaika',0),('Isaac Hubbard','X Small',93740,'Sand Point',0),('Isabel Beck','Medium',64502,'Socc',0),('Isabel Bowers','Medium',63533,'Hood River',0),('Isabel Terry','Small',12615,'Kai pana',0),('Isabella Alvarez','Medium',67619,'Kai pana',1),('Isabelle Lamb','Large',34899,'Jericho',0),('Isaiah Harrington','Large',57878,'Kailaika',0),('Ivan Harvey','X Small',93135,'Kai pana',0),('Jack Daniel','Large',82513,'Hood River',0),('Jack Lambert','X Small',25823,'Jericho',0),('Jack Vaughn','Medium',63533,'Sand Point',1),('Jackson Bass','Large',38440,'Kailaika',0),('Jacob Farmer','Medium',62109,'Kailaika',0),('James Ramsey','Medium',7981,'Sand Point',0),('Jay Hammond','X Small',65815,'Jericho',1),('Jay Johnson','X Small',93135,'Kailaika',0),('Jay Robertson','X Small',22178,'Kai pana',1),('Jayden Cole','X Small',17611,'Jericho',0),('Jayden Fleming','Medium',93740,'Hood River',1),('Jean Colon','Small',63533,'Hood River',1),('Jean Jennings','Medium',87101,'Hood River',1),('Jeanette Bell','X Large',93621,'Socc',1),('Jeanette Carter','Small',17747,'Sand Point',0),('Jeff Logan','Large',74215,'Rccc',0),('Jeffery Scott','X Large',93135,'Kai pana',1),('Jeremiah Cook','Large',54058,'Socc',1),('Jeremiah Stewart','X Large',36926,'Jericho',1),('Jerome Carter','X Small',17747,'Sand Point',1),('Jerome Fleming','X Small',11344,'Hood River',0),('Jerome French','X Small',19554,'Bridge City',0),('Jerry Bowman','Small',92410,'Jericho',0),('Jessie Hawkins','X Large',57878,'Kai pana',1),('Jim Ortiz','X Small',46220,'Hood River',1),('Jim Thompson','Small',8993,'Kai pana',1),('Joe Abbott','X Large',27351,'Hood River',1),('Joe Mullins','X Large',76761,'Sand Point',0),('Joel Mack','Large',87928,'Bridge City',1),('Joel Owen','X Small',17330,'Hood River',0),('Johnny Jones','X Small',45360,'Bridge City',0),('Jonathan Bowen','Medium',89857,'Kai pana',0),('Jonathan Walsh','Large',7981,'Hood River',1),('Jonathan Warren','Small',19554,'Socc',1),('Jordan Fox','Medium',64502,'Socc',1),('Jorge Sanchez','Medium',93621,'Bridge City',0),('Jorge Terry','Small',98345,'Rccc',0),('Jorge Underwood','Small',84554,'Rccc',1),('Josephine Herrera','X Large',27709,'Hood River',0),('Joshua Banks','Large',14971,'Bridge City',1),('Joshua Flores','X Large',29288,'Socc',0),('Joshua Gonzales','Large',40154,'Kai pana',0),('Joshua Sparks','Large',17615,'Bridge City',0),('Juan Kim','Medium',86954,'Socc',0),('Juan Norris','Large',87928,'Socc',1),('Juan Vargas','Small',71083,'Hood River',0),('Kate Garner','Large',27351,'Hood River',0),('Katharine Bates','Medium',80286,'Kailaika',1),('Katharine Taylor','Small',25823,'Jericho',0),('Kathryn Boyd','Small',86954,'Socc',0),('Kathryn Houston','Large',22178,'Kailaika',0),('Katie Hines','Small',60917,'Socc',1),('Kenneth Fisher','X Large',32961,'Kailaika',0),('Kenneth Romero','Small',81828,'Socc',1),('Kenneth Saunders','X Large',94098,'Rccc',0),('Kenneth Watts','X Small',89857,'Kai pana',0),('Kevin Bowers','Large',36925,'Kai pana',1),('Kyle Welch','Medium',64076,'Rccc',0),('Lawrence Austin','Medium',42415,'Hood River',0),('Leila Barrett','Medium',80286,'Kai pana',0),('Leila Wallace','X Small',50901,'Bridge City',1),('Lena Lambert','Large',44879,'Kailaika',0),('Lenora Collier','X Large',94098,'Jericho',0),('Leo Cross','X Small',36875,'Jericho',1),('Leo Jennings','X Large',93421,'Hood River',0),('Leonard Duncan','X Small',44879,'Kailaika',1),('Leonard Goodman','Medium',53733,'Socc',0),('Leonard Stephens','X Small',99637,'Jericho',1),('Leonard Thomas','Medium',89632,'Sand Point',1),('Leonard Weaver','Large',38440,'Kai pana',0),('Leroy Carpenter','Small',52870,'Kailaika',0),('Lester Wilkins','X Small',86954,'Socc',1),('Lettie Henderson','X Small',36652,'Bridge City',0),('Lida Ellis','X Small',60917,'Bridge City',0),('Lida Lane','Medium',93135,'Kailaika',0),('Lilly Olson','X Small',4298,'Rccc',1),('Lina Bush','Medium',57376,'Hood River',0),('Lina Davis','X Small',31744,'Hood River',1),('Lina Jennings','X Small',57878,'Kailaika',0),('Linnie Floyd','X Large',62109,'Kailaika',0),('Linnie Reynolds','Large',96250,'Kailaika',1),('Lloyd Guzman','Medium',17747,'Hood River',0),('Lloyd Jensen','Medium',98031,'Kai pana',0),('Lloyd Simmons','Small',99455,'Jericho',1),('Lois Russell','Medium',99637,'Rccc',1),('Lottie Burgess','Small',57351,'Kailaika',0),('Louisa Robbins','Large',67619,'Kailaika',0),('Louise Black','Small',20149,'Kai pana',0),('Louise Porter','Medium',62109,'Kai pana',0),('Lucas Carr','X Large',25823,'Rccc',1),('Lucinda Allison','Medium',32961,'Kai pana',1),('Luke Griffin','Small',93621,'Bridge City',1),('Luke Reyes','Large',24544,'Rccc',0),('Lulu Ball','Medium',82321,'Kailaika',1),('Lydia Crawford','X Large',64076,'Jericho',1),('Lydia Hayes','Small',38440,'Kailaika',0),('Lydia Larson','Small',37471,'Jericho',0),('Mabel Glover','Small',76761,'Sand Point',0),('Mabelle Green','X Small',36647,'Kailaika',0),('Mabelle Reid','Large',71083,'Sand Point',0),('Mable Henderson','Small',4397,'Kai pana',0),('Mae Robbins','Medium',42415,'Sand Point',1),('Maggie Reynolds','Large',84554,'Rccc',0),('Manuel Fox','X Small',42415,'Sand Point',0),('Marc Armstrong','X Small',50901,'Bridge City',1),('Marc Banks','X Small',99455,'Jericho',1),('Marcus Duncan','Large',22178,'Kailaika',1),('Marcus Gross','X Large',96250,'Kai pana',0),('Margaret Mendez','Small',62109,'Kai pana',1),('Marguerite Phelps','Medium',17330,'Sand Point',1),('Marguerite Reynolds','X Large',28025,'Socc',1),('Marguerite Sanders','Small',50759,'Socc',1),('Maria Riley','X Small',38145,'Bridge City',1),('Marian Wolfe','X Small',27957,'Jericho',1),('Marie Buchanan','X Large',21585,'Hood River',1),('Marie Russell','Medium',81873,'Rccc',0),('Marie Welch','X Large',85477,'Bridge City',1),('Marion Ingram','Medium',12615,'Kai pana',1),('Marion Park','Large',67162,'Jericho',0),('Mark Duncan','Small',38145,'Socc',1),('Martha Little','Large',93740,'Hood River',0),('Martha Wise','Medium',4298,'Rccc',1),('Martin Stevenson','X Large',36647,'Kailaika',0),('Martin Warner','Large',42415,'Sand Point',0),('Marvin Ellis','X Small',87101,'Sand Point',1),('Mary Bridges','X Small',27351,'Sand Point',0),('Mary Francis','Small',28025,'Bridge City',0),('Mary Long','X Small',81873,'Jericho',0),('Mary Robertson','Small',50820,'Kai pana',1),('Mary Swanson','X Small',11344,'Sand Point',0),('Mason Curry','X Small',50820,'Kailaika',1),('Mason Hall','X Large',92410,'Jericho',0),('Mathilda Frazier','Small',67162,'Rccc',1),('Matilda Powell','X Small',65815,'Jericho',1),('Matthew Strickland','Large',19554,'Socc',1),('Mattie Jimenez','X Large',21585,'Sand Point',0),('Maud Buchanan','Large',53733,'Bridge City',1),('Maud Mathis','X Small',36875,'Jericho',0),('Maude Franklin','X Large',859,'Hood River',0),('Maurice Stone','X Large',36037,'Bridge City',0),('Max Brady','X Large',76761,'Hood River',0),('May Morales','Small',37471,'Rccc',1),('Micheal French','Medium',93740,'Sand Point',1),('Miguel Lee','X Small',8993,'Kailaika',1),('Mildred Barnett','X Large',4298,'Jericho',0),('Mildred Bates','Large',20149,'Kailaika',1),('Mildred Gomez','Medium',36925,'Kai pana',1),('Millie Buchanan','X Small',71083,'Hood River',1),('Milton Francis','X Small',85477,'Socc',0),('Mina Paul','Small',87928,'Socc',1),('Minerva Grant','X Large',98031,'Kailaika',0),('Minerva Lowe','Medium',68422,'Sand Point',1),('Minerva Richards','Medium',11344,'Sand Point',0),('Minnie Schneider','Large',64741,'Jericho',1),('Myra Strickland','X Large',99637,'Rccc',1),('Nancy Campbell','X Small',80286,'Kailaika',1),('Nancy Phelps','X Large',98345,'Jericho',1),('Nannie Simpson','Small',44879,'Kai pana',0),('Nathaniel McKenzie','X Large',74215,'Jericho',1),('Nelle Farmer','X Small',76761,'Hood River',1),('Nettie Wright','X Large',81828,'Bridge City',1),('Nicholas Mason','Small',45360,'Bridge City',0),('Nina Jimenez','Medium',54058,'Socc',1),('Noah Hernandez','Large',29288,'Bridge City',0),('Nora Graham','X Small',31744,'Sand Point',1),('Olga Adams','X Large',72929,'Sand Point',1),('Olga Woods','X Small',50759,'Bridge City',0),('Olive Carr','X Small',70133,'Bridge City',0),('Olive Clayton','X Large',89632,'Hood River',1),('Olivia Ball','Large',32961,'Kai pana',1),('Ophelia Wong','X Small',39393,'Hood River',1),('Ora Hale','X Large',53733,'Socc',1),('Ora McLaughlin','Large',22205,'Bridge City',1),('Ora Vega','Medium',94098,'Rccc',0),('Owen Vega','Small',64741,'Jericho',1),('Paul Fleming','Small',74628,'Jericho',0),('Paul Townsend','X Small',50901,'Socc',0),('Pauline Conner','Large',67162,'Rccc',0),('Pauline Kennedy','Small',82321,'Kailaika',0),('Peter Daniel','X Small',85477,'Socc',0),('Philip Elliott','Small',5442,'Hood River',1),('Phillip Olson','Medium',63533,'Hood River',0),('Polly Ross','Medium',11344,'Hood River',1),('Randall Vargas','X Large',94098,'Rccc',1),('Randy Pope','Small',64076,'Rccc',0),('Raymond Allison','Large',36037,'Socc',0),('Rebecca Delgado','Small',87928,'Bridge City',0),('Rhoda Ray','Large',57376,'Hood River',1),('Ronald Bryant','X Large',60917,'Bridge City',0),('Rosa Lawrence','X Large',80286,'Kai pana',1),('Rosalie Kelly','Medium',50599,'Jericho',0),('Rosalie Phillips','X Large',82513,'Hood River',0),('Rose Ortega','Small',38440,'Kai pana',1),('Rosetta Frazier','Large',91497,'Jericho',0),('Roxie Morales','Small',27709,'Sand Point',0),('Ruby Gordon','X Large',39393,'Sand Point',0),('Ruth Hudson','Small',11853,'Bridge City',0),('Ryan Lee','Medium',67619,'Kai pana',0),('Sadie Hunt','Small',22205,'Socc',1),('Sallie Brady','X Large',23510,'Socc',0),('Sallie Weaver','X Small',34899,'Rccc',1),('Sean Klein','Medium',14971,'Socc',1),('Seth Stevenson','Small',57376,'Sand Point',0),('Shane Alvarado','X Large',74628,'Rccc',0),('Shane Little','Small',44952,'Jericho',0),('Shawn Estrada','X Large',12660,'Kai pana',0),('Shawn Gray','X Small',40154,'Kai pana',1),('Sophia Smith','X Small',20149,'Kailaika',0),('Sophia Spencer','Large',72929,'Hood River',0),('Sophie Edwards','Large',81873,'Jericho',1),('Sophie Hampton','Medium',34899,'Rccc',0),('Stella Hill','Large',98856,'Bridge City',1),('Stella Holmes','Medium',94098,'Jericho',0),('Stella Nunez','Medium',17611,'Rccc',1),('Steve Wood','X Large',4397,'Kai pana',0),('Steven Bates','Small',98856,'Socc',0),('Susan Franklin','X Large',17615,'Bridge City',0),('Teresa Weaver','X Small',8993,'Kailaika',0),('Terry Barrett','X Large',93621,'Socc',1),('Terry French','Large',14971,'Bridge City',0),('Theodore Williamson','Medium',34899,'Jericho',0),('Theresa Rodgers','Medium',96250,'Kailaika',0),('Thomas Rice','X Small',27709,'Hood River',0),('Timothy Miller','Large',36925,'Kai pana',0),('Todd Barnes','X Large',84554,'Jericho',0),('Tom Garner','Small',92410,'Rccc',1),('Tom Nguyen','Large',46220,'Hood River',1),('Tommy Palmer','X Large',17330,'Hood River',0),('Tony Buchanan','X Large',36647,'Kai pana',1),('Tony Herrera','Large',27709,'Hood River',0),('Trevor Sutton','X Large',98031,'Kai pana',0),('Trevor Welch','Small',57351,'Kai pana',1),('Troy Rodriguez','Large',38145,'Socc',0),('Tyler Hampton','Medium',87928,'Socc',0),('Vera Haynes','X Small',23510,'Bridge City',0),('Verna Baldwin','X Small',68422,'Hood River',0),('Verna Gibson','Large',4397,'Kailaika',1),('Verna Reed','X Small',87101,'Sand Point',0),('Vernon Abbott','X Large',5442,'Sand Point',1),('Vernon Page','Large',17611,'Jericho',1),('Victoria James','Medium',36926,'Rccc',0),('Victoria Lee','Small',52870,'Kai pana',1),('Victoria Stone','Large',50901,'Socc',1),('Virgie Bates','Large',4298,'Jericho',1),('Virgie Hanson','X Large',12615,'Kai pana',0),('Virginia James','Large',99637,'Jericho',1),('Walter Graves','Large',12660,'Kailaika',0),('Wayne Jimenez','Small',71723,'Kailaika',1),('Wayne Lawrence','X Small',50820,'Kai pana',1),('Wayne Moody','X Large',99455,'Rccc',0),('Wesley Barrett','Small',64076,'Jericho',1),('Wesley Lucas','Small',52870,'Kailaika',1),('Wesley Underwood','X Small',19554,'Bridge City',0),('William Houston','X Small',38832,'Sand Point',1),('Winnie Walters','X Small',60917,'Bridge City',0),('Zachary Kelley','Medium',64076,'Jericho',1),('Zachary Obrien','X Small',36926,'Rccc',1);
/*!40000 ALTER TABLE `paddler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `race`
--

DROP TABLE IF EXISTS `race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `race` (
  `race_name` varchar(32) NOT NULL,
  `RACE_DATE` datetime DEFAULT NULL,
  `RACE_WEBSITE` varchar(50) DEFAULT NULL,
  `CLUB_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`race_name`),
  KEY `CLUB_NAME` (`CLUB_NAME`),
  CONSTRAINT `race_ibfk_1` FOREIGN KEY (`CLUB_NAME`) REFERENCES `club` (`club_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race`
--

LOCK TABLES `race` WRITE;
/*!40000 ALTER TABLE `race` DISABLE KEYS */;
INSERT INTO `race` VALUES ('Hawaii Open','2019-07-21 00:00:00','HIOpen.biz','Kailaika'),('Hood River Race','2019-09-16 00:00:00','HRR2019.org','Hood River'),('NW Nationals','2019-06-05 00:00:00','NWnats.com','Socc');
/*!40000 ALTER TABLE `race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `race_result`
--

DROP TABLE IF EXISTS `race_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `race_result` (
  `TEAM_NUM` int(11) DEFAULT NULL,
  `CATEGORY` varchar(32) DEFAULT NULL,
  `DIVISION` varchar(32) DEFAULT NULL,
  `COURSE` varchar(32) DEFAULT NULL,
  `PLACE` int(11) DEFAULT NULL,
  KEY `TEAM_NUM` (`TEAM_NUM`),
  CONSTRAINT `race_result_ibfk_1` FOREIGN KEY (`TEAM_NUM`) REFERENCES `registration` (`TEAM_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race_result`
--

LOCK TABLES `race_result` WRITE;
/*!40000 ALTER TABLE `race_result` DISABLE KEYS */;
INSERT INTO `race_result` VALUES (27709,'Mixed','Masters','Challenge',1),(36647,'Mixed','Junior Novice','Challenge',5),(53733,'Womens','Unlimited','Challenge',3),(91497,'Mixed','Junior Novice','Short',1),(21585,'Womens','Masters','Long',4),(40154,'Womens','Junior Novice','Long',3),(50901,'Mixed','Junior Novice','Sprint',3),(74628,'Womens','Unlimited','Sprint',1),(38832,'Womens','Sr Masters','Long',1),(82321,'Womens','Junior Novice','Short',5),(29288,'Mens','Masters','Short',2),(64741,'Mens','Masters','Short',4),(11344,'Womens','Junior Novice','Short',3),(67619,'Mixed','Junior Novice','Short',4),(64502,'Mixed','Masters','Sprint',5),(36926,'Mens','Unlimited','Long',1),(71083,'Mixed','Sr Masters','Short',1),(20149,'Mens','Sr Masters','Short',2),(54058,'Mixed','Sr Masters','Short',4),(4298,'Womens','Unlimited','Sprint',3),(93740,'Mens','Open','Short',2),(89857,'Mens','Open','Sprint',4),(28025,'Womens','Open','Short',1),(67162,'Mixed','Masters','Sprint',1),(68422,'Womens','Limited','Long',4),(12660,'Mixed','Unlimited','Long',5),(98856,'Mens','Sr Masters','Long',1),(34899,'Mens','Sr Masters','Long',2),(859,'Mens','Junior Novice','Long',1),(62109,'Mixed','Open','Sprint',2),(38145,'Mens','Unlimited','Short',1),(81873,'Mens','Limited','Sprint',3),(89632,'Mens','Open','Sprint',5),(22178,'Mixed','Masters','Challenge',2),(36037,'Mens','Limited','Short',2),(65815,'Mens','Junior Novice','Long',3),(46220,'Mens','Sr Masters','Short',4),(93135,'Mixed','Unlimited','Short',2),(36652,'Womens','Open','Short',3),(94098,'Mens','Unlimited','Challenge',1),(5442,'Mens','Junior Novice','Long',2),(96250,'Mens','Unlimited','Short',2),(45360,'Womens','Limited','Sprint',4),(74215,'Mens','Masters','Long',1),(76761,'Mens','Limited','Short',5),(71723,'Mens','Limited','Short',1),(87928,'Mens','Unlimited','Sprint',3),(84554,'Womens','Junior Novice','Challenge',3),(93421,'Womens','Unlimited','Long',5),(8993,'Mixed','Sr Masters','Long',4),(85477,'Womens','Limited','Short',3),(99455,'Mixed','Unlimited','Long',5),(17747,'Mixed','Sr Masters','Challenge',2),(98031,'Mixed','Limited','Long',2),(11853,'Mixed','Limited','Short',3),(99637,'Womens','Sr Masters','Short',5),(31744,'Mens','Limited','Long',5),(44879,'Mens','Masters','Long',1),(70133,'Mixed','Junior Novice','Sprint',2),(27957,'Mens','Unlimited','Sprint',2),(87101,'Mens','Sr Masters','Short',5),(4397,'Womens','Masters','Long',1),(14971,'Womens','Unlimited','Short',2),(24544,'Womens','Sr Masters','Long',5),(82513,'Mixed','Junior Novice','Long',1),(38440,'Mixed','Sr Masters','Short',1),(50759,'Mixed','Sr Masters','Short',5),(44952,'Mixed','Sr Masters','Long',4),(42415,'Mixed','Limited','Sprint',1),(32961,'Mixed','Unlimited','Long',3),(93621,'Womens','Masters','Challenge',4),(17611,'Mixed','Limited','Long',3),(27351,'Mens','Junior Novice','Challenge',3),(57878,'Mixed','Junior Novice','Long',4),(17615,'Mixed','Junior Novice','Short',3),(98345,'Mens','Masters','Challenge',3),(72929,'Mixed','Open','Long',4),(80286,'Womens','Limited','Long',4),(19554,'Mixed','Sr Masters','Challenge',3),(50599,'Mens','Unlimited','Long',4),(57376,'Mens','Unlimited','Short',3),(52870,'Mixed','Limited','Challenge',4),(60917,'Womens','Sr Masters','Short',3),(36875,'Mens','Masters','Challenge',1),(17330,'Mixed','Junior Novice','Short',4),(36925,'Mens','Unlimited','Short',3),(22205,'Mens','Junior Novice','Short',1),(37471,'Mixed','Masters','Short',2),(7981,'Mens','Junior Novice','Sprint',5),(57351,'Mens','Sr Masters','Long',3),(81828,'Womens','Junior Novice','Challenge',1),(25823,'Womens','Limited','Challenge',1),(39393,'Womens','Junior Novice','Sprint',2),(12615,'Mixed','Sr Masters','Long',3),(86954,'Mixed','Limited','Challenge',1),(92410,'Mens','Open','Challenge',2),(63533,'Womens','Unlimited','Challenge',5),(50820,'Womens','Limited','Long',5),(23510,'Mixed','Sr Masters','Challenge',1),(64076,'Womens','Limited','Long',3);
/*!40000 ALTER TABLE `race_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `race_time`
--

DROP TABLE IF EXISTS `race_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `race_time` (
  `TEAM_NUM` int(11) NOT NULL,
  `TIME_IN_SECONDS` int(11) NOT NULL,
  KEY `TEAM_NUM` (`TEAM_NUM`),
  CONSTRAINT `race_time_ibfk_1` FOREIGN KEY (`TEAM_NUM`) REFERENCES `registration` (`TEAM_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race_time`
--

LOCK TABLES `race_time` WRITE;
/*!40000 ALTER TABLE `race_time` DISABLE KEYS */;
INSERT INTO `race_time` VALUES (859,747),(4298,5418),(4397,2573),(5442,8865),(7981,30),(8993,6684),(11344,8987),(11853,234),(11853,454),(11853,1904),(12615,4153),(12660,6191),(14971,7041),(17330,6609),(17611,2709),(17615,7177),(17747,4505),(19554,5528),(20149,4226),(21585,6675),(22178,7337),(22205,2568),(23510,4814),(24544,5851),(25823,8241),(27351,99),(27709,7590),(27957,4549),(28025,5655),(29288,2452),(31744,7852),(32961,4017),(34899,4462),(36037,3953),(36647,2088),(36652,6680),(36875,1982),(36925,946),(36926,2658),(37471,8754),(38145,4611),(38440,7835),(38832,7355),(39393,5048),(40154,2579),(42415,6308),(44879,4543),(44952,942),(45360,5499),(46220,8246),(50599,8302),(50759,4576),(50820,4535),(50901,7803),(52870,1390),(53733,4681),(54058,4875),(57351,6984),(57376,1596),(57878,3946),(60917,2130),(62109,3697),(63533,2683),(64076,2736),(64502,3560),(64741,4062),(65815,858),(67162,3777),(67619,2675),(68422,4702),(70133,5297),(71083,7339),(71723,1140),(72929,4465),(74215,3919),(74628,6603),(76761,7287),(80286,7878),(81828,8096),(81873,5551),(82321,9243),(82513,8264),(84554,858),(85477,7271),(86954,6932),(87101,3885),(87928,6307),(89632,3458),(89857,6234),(91497,8481),(92410,6407),(93135,7535),(93421,5779),(93621,6287),(93740,7019),(94098,4132),(96250,5747),(98031,6990),(98345,3929),(98856,6864),(99455,7698),(99637,4943);
/*!40000 ALTER TABLE `race_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration` (
  `TEAM_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `TEAM_NAME` varchar(100) DEFAULT NULL,
  `CATEGORY` varchar(32) DEFAULT NULL,
  `DIVISION` varchar(32) DEFAULT NULL,
  `COURSE` varchar(32) DEFAULT NULL,
  `CLUB_NAME` varchar(32) DEFAULT NULL,
  `CANOE_NUM` int(11) DEFAULT NULL,
  `RACE_NAME` varchar(32) DEFAULT NULL,
  `PAID_FEE` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`TEAM_NUM`),
  KEY `RACE_NAME` (`RACE_NAME`),
  CONSTRAINT `registration_ibfk_1` FOREIGN KEY (`RACE_NAME`) REFERENCES `race` (`race_name`)
) ENGINE=InnoDB AUTO_INCREMENT=99638 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES (859,'Team 3','Mens','Junior Novice','Long','Sand Point',49937,'Hood River Race',1),(4298,'Team 4','Womens','Unlimited','Sprint','Kailaika',70127,'NW Nationals',0),(4397,'Team 3','Womens','Masters','Long','Rccc',38796,'NW Nationals',0),(5442,'Team 1','Mens','Junior Novice','Long','Rccc',64601,'Hawaii Open',1),(7981,'Team 3','Mens','Junior Novice','Sprint','Kikaha',49937,'Hood River Race',1),(8993,'Team 2','Mixed','Sr Masters','Long','Socc',70127,'NW Nationals',0),(11344,'Team 4','Womens','Junior Novice','Short','Socc',54602,'NW Nationals',0),(11853,'Team 4','Mixed','Limited','Short','Kai pana',87758,'Hawaii Open',1),(12615,'Team 3','Mixed','Sr Masters','Long','Rccc',28010,'Hood River Race',0),(12660,'Team 5','Mixed','Unlimited','Long','Jericho',64601,'NW Nationals',1),(14971,'Team 2','Womens','Unlimited','Short','Socc',42677,'NW Nationals',0),(17330,'Team 4','Mixed','Junior Novice','Short','Sand Point',87758,'Hood River Race',1),(17611,'Team 1','Mixed','Limited','Long','Socc',39936,'NW Nationals',0),(17615,'Team 4','Mixed','Junior Novice','Short','Rccc',68065,'Hood River Race',1),(17747,'Team 3','Mixed','Sr Masters','Challenge','Rccc',55300,'NW Nationals',0),(19554,'Team 5','Mixed','Sr Masters','Challenge','Kailaika',28010,'Hood River Race',0),(20149,'Team 2','Mens','Sr Masters','Short','Jericho',42677,'NW Nationals',0),(21585,'Team 3','Womens','Masters','Long','Sand Point',70127,'Hood River Race',1),(22178,'Team 2','Mixed','Masters','Challenge','Rccc',28010,'Hood River Race',0),(22205,'Team 2','Mens','Junior Novice','Short','Kai pana',39936,'Hood River Race',1),(23510,'Team 5','Mixed','Sr Masters','Challenge','Bridge City',28195,'Hawaii Open',0),(24544,'Team 1','Womens','Sr Masters','Long','Bridge City',28010,'Hawaii Open',1),(25823,'Team 2','Womens','Limited','Challenge','Rccc',38796,'Hood River Race',1),(27351,'Team 5','Mens','Junior Novice','Challenge','Hood River',54602,'Hood River Race',0),(27709,'Team 5','Mixed','Masters','Challenge','Hood River',36514,'NW Nationals',1),(27957,'Team 5','Mens','Unlimited','Sprint','Sand Point',68065,'NW Nationals',1),(28025,'Team 5','Womens','Open','Short','Rccc',55300,'Hawaii Open',0),(29288,'Team 5','Mens','Masters','Short','Kai pana',64601,'Hawaii Open',0),(31744,'Team 4','Mens','Limited','Long','Hood River',39936,'Hawaii Open',0),(32961,'Team 4','Mixed','Unlimited','Long','Socc',87758,'NW Nationals',1),(34899,'Team 1','Mens','Sr Masters','Long','Kikaha',54602,'Hawaii Open',0),(36037,'Team 2','Mens','Limited','Short','Hood River',70127,'Hood River Race',1),(36647,'Team 3','Mixed','Junior Novice','Challenge','Kailaika',38796,'Hawaii Open',0),(36652,'Team 4','Womens','Open','Short','Kikaha',28195,'Hood River Race',1),(36875,'Team 1','Mens','Masters','Challenge','Bridge City',28195,'Hawaii Open',1),(36925,'Team 3','Mens','Unlimited','Short','Sand Point',64601,'Hawaii Open',1),(36926,'Team 2','Mens','Unlimited','Long','Rccc',36514,'NW Nationals',0),(37471,'Team 4','Mixed','Masters','Short','Socc',54602,'Hood River Race',1),(38145,'Team 4','Mens','Unlimited','Short','Kai pana',36514,'Hawaii Open',0),(38440,'Team 5','Mixed','Sr Masters','Short','Socc',87579,'Hood River Race',0),(38832,'Team 3','Womens','Sr Masters','Long','Jericho',28195,'Hawaii Open',1),(39393,'Team 1','Womens','Junior Novice','Sprint','Kikaha',42677,'Hood River Race',1),(40154,'Team 5','Womens','Junior Novice','Long','Rccc',87579,'Hood River Race',1),(42415,'Team 3','Mixed','Limited','Sprint','Kailaika',28195,'NW Nationals',0),(44879,'Team 1','Mens','Masters','Long','Hood River',54602,'Hawaii Open',1),(44952,'Team 2','Mixed','Sr Masters','Long','Sand Point',55300,'NW Nationals',1),(45360,'Team 3','Womens','Limited','Sprint','Kai pana',54602,'Hood River Race',0),(46220,'Team 3','Mens','Sr Masters','Short','Jericho',17513,'NW Nationals',0),(50599,'Team 2','Mens','Unlimited','Long','Hood River',70127,'Hood River Race',0),(50759,'Team 5','Mixed','Sr Masters','Short','Rccc',17513,'Hawaii Open',1),(50820,'Team 3','Womens','Limited','Long','Sand Point',55300,'Hood River Race',1),(50901,'Team 4','Mixed','Junior Novice','Sprint','Bridge City',17513,'Hood River Race',0),(52870,'Team 3','Mixed','Limited','Challenge','Socc',17513,'Hood River Race',1),(53733,'Team 4','Womens','Unlimited','Challenge','Bridge City',42677,'Hawaii Open',0),(54058,'Team 2','Mixed','Sr Masters','Short','Kikaha',28010,'NW Nationals',0),(57351,'Team 4','Mens','Sr Masters','Long','Sand Point',68065,'Hawaii Open',0),(57376,'Team 3','Mens','Unlimited','Short','Hood River',87579,'NW Nationals',0),(57878,'Team 5','Mixed','Junior Novice','Long','Kikaha',49937,'Hawaii Open',1),(60917,'Team 5','Womens','Sr Masters','Short','Kikaha',55300,'NW Nationals',0),(62109,'Team 3','Mixed','Open','Sprint','Kailaika',68065,'Hawaii Open',1),(63533,'Team 2','Womens','Unlimited','Challenge','Sand Point',17513,'Hood River Race',0),(64076,'Team 3','Womens','Limited','Long','Kikaha',87758,'Hood River Race',1),(64502,'Team 1','Mixed','Masters','Sprint','Kailaika',68065,'Hood River Race',0),(64741,'Team 5','Mens','Masters','Short','Hood River',39936,'Hood River Race',0),(65815,'Team 2','Mens','Junior Novice','Long','Socc',87579,'NW Nationals',0),(67162,'Team 2','Mixed','Masters','Sprint','Kikaha',28195,'NW Nationals',1),(67619,'Team 5','Mixed','Junior Novice','Short','Hood River',49937,'Hood River Race',0),(68422,'Team 1','Womens','Limited','Long','Sand Point',87758,'Hawaii Open',1),(70133,'Team 3','Mixed','Junior Novice','Sprint','Kikaha',49937,'Hood River Race',1),(71083,'Team 2','Mixed','Sr Masters','Short','Rccc',38796,'Hood River Race',0),(71723,'Team 3','Mens','Limited','Short','Bridge City',36514,'Hood River Race',1),(72929,'Team 3','Mixed','Open','Long','Sand Point',38796,'NW Nationals',0),(74215,'Team 3','Mens','Masters','Long','Hood River',49937,'NW Nationals',1),(74628,'Team 1','Womens','Unlimited','Sprint','Sand Point',55300,'NW Nationals',1),(76761,'Team 1','Mens','Limited','Short','Sand Point',68065,'Hood River Race',1),(80286,'Team 1','Womens','Limited','Long','Jericho',42677,'NW Nationals',0),(81828,'Team 5','Womens','Junior Novice','Challenge','Kikaha',36514,'NW Nationals',0),(81873,'Team 1','Mens','Limited','Sprint','Rccc',38796,'Hawaii Open',1),(82321,'Team 1','Womens','Junior Novice','Short','Bridge City',87758,'Hood River Race',1),(82513,'Team 2','Mixed','Junior Novice','Long','Kikaha',70127,'Hood River Race',1),(84554,'Team 3','Womens','Junior Novice','Challenge','Bridge City',42677,'Hood River Race',1),(85477,'Team 4','Womens','Limited','Short','Kailaika',87579,'Hood River Race',0),(86954,'Team 5','Mixed','Limited','Challenge','Sand Point',70127,'NW Nationals',0),(87101,'Team 2','Mens','Sr Masters','Short','Hood River',36514,'NW Nationals',0),(87928,'Team 4','Mens','Unlimited','Sprint','Socc',38796,'Hood River Race',0),(89632,'Team 1','Mens','Open','Sprint','Socc',42677,'Hood River Race',0),(89857,'Team 2','Mens','Open','Sprint','Hood River',17513,'NW Nationals',0),(91497,'Team 4','Mixed','Junior Novice','Short','Jericho',28010,'Hawaii Open',1),(92410,'Team 3','Mens','Open','Challenge','Kai pana',87579,'NW Nationals',1),(93135,'Team 2','Mixed','Unlimited','Short','Hood River',55300,'Hawaii Open',1),(93421,'Team 3','Womens','Unlimited','Long','Socc',28010,'Hood River Race',1),(93621,'Team 4','Womens','Masters','Challenge','Sand Point',64601,'Hawaii Open',0),(93740,'Team 3','Mens','Open','Short','Kai pana',87579,'NW Nationals',1),(94098,'Team 1','Mens','Unlimited','Challenge','Jericho',87758,'NW Nationals',0),(96250,'Team 1','Mens','Unlimited','Short','Socc',39936,'Hawaii Open',0),(98031,'Team 5','Mixed','Limited','Long','Kai pana',28195,'NW Nationals',0),(98345,'Team 3','Mens','Masters','Challenge','Kai pana',36514,'Hawaii Open',0),(98856,'Team 2','Mens','Sr Masters','Long','Sand Point',39936,'NW Nationals',1),(99455,'Team 3','Mixed','Unlimited','Long','Bridge City',17513,'NW Nationals',1),(99637,'Team 5','Womens','Sr Masters','Short','Socc',64601,'NW Nationals',1);
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'racelog'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-01  0:05:09
