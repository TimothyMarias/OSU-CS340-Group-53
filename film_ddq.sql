-- Group 53 Film Database

-- Table structure for table film
DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `film` (
  `film_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `box_office` bigint(20) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
	`release_year` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,'	Star Wars: The Force Awakens',2068223624,'Science-Fiction', 2015),(2,'Jurassic World', 1671713208,'Science-Fiction', 2015),(3,'	Furious 7',1516045911,'Action', 2015), (4,'Bohemian Rhapsody',903655259,'Drama', 2015);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `award`
--

DROP TABLE IF EXISTS `award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `award` (
  `award_id` int(11) NOT NULL AUTO_INCREMENT,
  `movies` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `award`
--

LOCK TABLES `award` WRITE;
/*!40000 ALTER TABLE `award` DISABLE KEYS */;
INSERT INTO `award` VALUES (1,'Best Picture'),(2,'Best Director'),(3,'Best Actor'),(4,'Best Actress');
/*!40000 ALTER TABLE `award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `people_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `movie` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie` (`movie`),
  CONSTRAINT `people_ibfk_1` FOREIGN KEY (`movie`) REFERENCES `film` (`title`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'Vin Diesel','Actor', 'Fast'),(2,'Harrison Ford','Actor','Star Wars: Episode VII – The Force Awakens'),(3,'Rami Malek', 'Actor','Bohemian Rhapsody'), (4,'Chris Pratt', 'Actor','Jurassic World');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `award_film`
--

DROP TABLE IF EXISTS `award_film`;
CREATE TABLE `award_film` (
  `aaid` int(11) NOT NULL DEFAULT '0',
  `fid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aaid`,`fid`),
  KEY `fid` (`fid`),
  CONSTRAINT `award_film_ibfk_1` FOREIGN KEY (`aaid`) REFERENCES `award` (`id`),
  CONSTRAINT `award_film_ibfk_2` FOREIGN KEY (`fid`) REFERENCES `film_movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `award_film`
--

LOCK TABLES `award_film` WRITE;
/*!40000 ALTER TABLE `award_film` DISABLE KEYS */;
INSERT INTO `award_film` VALUES (3,4),(4,2),(4,3);
/*!40000 ALTER TABLE `award_film` ENABLE KEYS */;
UNLOCK TABLES;
