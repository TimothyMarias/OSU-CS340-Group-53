-- Group 53 Film Database
-- I was trying to import the database into PHPmyadmin and it wasn't running. I had
--- downloaded one of the example files, so I slowly made changes while I tested it in PHPmyadmin. 
---  This isn't done. I do think we should use the top ten movies of the last five years, otherwise
---  we will have no award winners at all. 

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
-- Table structure for table `film_movies`
--

DROP TABLE IF EXISTS `film_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `box_office` bigint(20) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
	`release_year` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_movies`
--

LOCK TABLES `film_movies` WRITE;
/*!40000 ALTER TABLE `film_movies` DISABLE KEYS */;
INSERT INTO `film_movies` VALUES (1,'	Star Wars: The Force Awakens',2068223624,'Science-Fiction', 2015),(2,'Jurassic World', 1671713208,'Science-Fiction', 2015),(3,'	Furious 7',1516045911,'Action', 2015), (4,'Bohemian Rhapsody',903655259,'Drama', 2015);
/*!40000 ALTER TABLE `film_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academy_award`
--

DROP TABLE IF EXISTS `academy_award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academy_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movies` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academy_award`
--

LOCK TABLES `academy_award` WRITE;
/*!40000 ALTER TABLE `academy_award` DISABLE KEYS */;
INSERT INTO `academy_award` VALUES (1,'Best Picture'),(2,'Best Director'),(3,'Best Actor'),(4,'Best Actress');
/*!40000 ALTER TABLE `academy_award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_people`
--

DROP TABLE IF EXISTS `film_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `movie` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie` (`movie`),
  CONSTRAINT `film_people_ibfk_1` FOREIGN KEY (`movie`) REFERENCES `film_movies` (`title`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_people`
--

LOCK TABLES `film_people` WRITE;
/*!40000 ALTER TABLE `film_people` DISABLE KEYS */;
INSERT INTO `film_people` VALUES (1,'Vin Diesel','Actor', 'Fast'),(2,'Harrison Ford','Actor','Star Wars: Episode VII – The Force Awakens'),(3,'Rami Malek', 'Actor','Bohemian Rhapsody'), (4,'Chris Pratt', 'Actor','Jurassic World');
/*!40000 ALTER TABLE `film_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academy_award_film`
--

DROP TABLE IF EXISTS `academy_award_film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academy_award_film` (
  `aaid` int(11) NOT NULL DEFAULT '0',
  `fid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aaid`,`fid`),
  KEY `fid` (`fid`),
  CONSTRAINT `academy_award_film_ibfk_1` FOREIGN KEY (`aaid`) REFERENCES `academy_award` (`id`),
  CONSTRAINT `academy_award_film_ibfk_2` FOREIGN KEY (`fid`) REFERENCES `film_movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academy_award_film`
--

LOCK TABLES `academy_award_film` WRITE;
/*!40000 ALTER TABLE `academy_award_film` DISABLE KEYS */;
INSERT INTO `academy_award_film` VALUES (3,4),(4,2),(4,3);
/*!40000 ALTER TABLE `academy_award_film` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;



-- Dump completed on 2013-02-04 12:54:40
