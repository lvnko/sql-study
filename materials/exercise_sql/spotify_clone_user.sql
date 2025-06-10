-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (x86_64)
--
-- Host: 127.0.0.1    Database: spotify_clone
-- ------------------------------------------------------
-- Server version	5.7.44

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Charles Hughes','charles_hughes@catalystgrowth.info','https://randomuser.me/api/portraits/men/97.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(2,'Helen Abbott','helen_abbott@coreachievers.co','https://randomuser.me/api/portraits/men/139.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(3,'Joyce Cook','joyce_cook@brightfuturesolutions.tech','https://randomuser.me/api/portraits/women/64.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(4,'Janet Bishop','janet_bishop@apexinnovate.tech','https://randomuser.me/api/portraits/women/27.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(5,'Babara Crump','babara_crump@prosolutions.com','https://randomuser.me/api/portraits/men/121.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(6,'Brenda Peak','brenda_peak@summitascent.org','https://randomuser.me/api/portraits/women/65.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(7,'Betty Little','betty_little@strategicedge.net','https://randomuser.me/api/portraits/men/17.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(8,'Lauren Gallegos','lauren_gallegos@primeadvisors.info','https://randomuser.me/api/portraits/men/20.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(9,'Herman Dull','herman_dull@optimindgroup.biz','https://randomuser.me/api/portraits/women/62.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(10,'Rebecca Ogren','rebecca_ogren@globalimpact.co','https://randomuser.me/api/portraits/women/18.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(11,'Leroy Peters','leroy_peters@brightfuturesolutions.tech','https://randomuser.me/api/portraits/men/75.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(12,'Ellen Frink','ellen_frink@summitascent.org','https://randomuser.me/api/portraits/women/29.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(13,'Portia Snyder','portia_snyder@infinitepossibilities.biz','https://randomuser.me/api/portraits/men/33.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(14,'Lorene Murray','lorene_murray@elevatesuccess.org','https://randomuser.me/api/portraits/women/126.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(15,'Christopher Hart','christopher_hart@summitascent.org','https://randomuser.me/api/portraits/men/132.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(16,'Sharon Partain','sharon_partain@instagram.com','https://randomuser.me/api/portraits/women/82.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(17,'Thomas Vanhofwegen','thomas_vanhofwegen@summitascent.org','https://randomuser.me/api/portraits/men/25.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(18,'Eduardo Bode','eduardo_bode@premieralliance.com','https://randomuser.me/api/portraits/men/107.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(19,'Vita Campion','vita_campion@summitascent.org','https://randomuser.me/api/portraits/men/130.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(20,'Emily Shelly','emily_shelly@futureforward.net','https://randomuser.me/api/portraits/women/56.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(21,'Don Thomas','don_thomas@instagram.com','https://randomuser.me/api/portraits/men/123.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(22,'Janice Napier','janice_napier@spotify.com','https://randomuser.me/api/portraits/men/1.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(23,'Wallace Duffy','wallace_duffy@masterfulresults.net','https://randomuser.me/api/portraits/men/105.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(24,'Marvel Johnson','marvel_johnson@coreachievers.co','https://randomuser.me/api/portraits/men/61.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(25,'Ferdinand Sims','ferdinand_sims@venturepinnacle.io','https://randomuser.me/api/portraits/women/43.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(26,'Robert Koons','robert_koons@apexinnovate.tech','https://randomuser.me/api/portraits/men/65.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(27,'Wallace Evans','wallace_evans@venturepinnacle.io','https://randomuser.me/api/portraits/women/24.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(28,'Everett Marshall','everett_marshall@strategicedge.net','https://randomuser.me/api/portraits/women/24.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(29,'Roy Welle','roy_welle@quantumleap.com','https://randomuser.me/api/portraits/women/112.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(30,'Rubin Barnhill','rubin_barnhill@coreachievers.co','https://randomuser.me/api/portraits/men/149.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(31,'Richard Johnson','richard_johnson@elevatesuccess.org','https://randomuser.me/api/portraits/women/12.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(32,'Scott Heifner','scott_heifner@futureforward.net','https://randomuser.me/api/portraits/men/50.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(33,'Lakisha Guercio','lakisha_guercio@catalystgrowth.info','https://randomuser.me/api/portraits/women/88.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(34,'Michael Pierre','michael_pierre@synergypath.io','https://randomuser.me/api/portraits/men/102.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(35,'Paul Roberts','paul_roberts@elevatesuccess.org','https://randomuser.me/api/portraits/women/65.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(36,'Angela Rice','angela_rice@synergypath.io','https://randomuser.me/api/portraits/women/8.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(37,'Lucy Beck','lucy_beck@instagram.com','https://randomuser.me/api/portraits/women/101.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(38,'Mike Ortega','mike_ortega@infinitepossibilities.biz','https://randomuser.me/api/portraits/men/71.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(39,'Warren Yates','warren_yates@apexinnovate.tech','https://randomuser.me/api/portraits/women/116.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(40,'Kendrick Weeks','kendrick_weeks@catalystgrowth.info','https://randomuser.me/api/portraits/men/138.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(41,'Paul Ward','paul_ward@masterfulresults.net','https://randomuser.me/api/portraits/men/145.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(42,'Richard Adair','richard_adair@instagram.com','https://randomuser.me/api/portraits/men/79.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(43,'Mary Schrunk','mary_schrunk@gmail.com','https://randomuser.me/api/portraits/men/6.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(44,'Jamie Ellsworth','jamie_ellsworth@catalystgrowth.info','https://randomuser.me/api/portraits/women/53.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(45,'Candice Dubinsky','candice_dubinsky@apexinnovate.tech','https://randomuser.me/api/portraits/men/8.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(46,'Ilana Nims','ilana_nims@truenorthconsult.co','https://randomuser.me/api/portraits/men/31.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(47,'Victoria Clines','victoria_clines@gmail.com','https://randomuser.me/api/portraits/women/104.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(48,'Albert Gobel','albert_gobel@venturepinnacle.io','https://randomuser.me/api/portraits/women/54.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(49,'Robert Ferguson','robert_ferguson@premieralliance.com','https://randomuser.me/api/portraits/men/14.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00'),(50,'Joseph Scheidecker','joseph_scheidecker@gmail.com','https://randomuser.me/api/portraits/men/106.jpg','2025-06-06 21:10:00','2025-06-06 21:10:00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-09 16:31:23
