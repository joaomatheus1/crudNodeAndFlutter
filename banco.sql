-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: joaomatheus
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Table structure for table `ata_colaboradores`
--

DROP TABLE IF EXISTS `ata_colaboradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ata_colaboradores` (
  `ata_id` int NOT NULL,
  `colaborador_id` int NOT NULL,
  PRIMARY KEY (`ata_id`,`colaborador_id`),
  KEY `colaborador_id` (`colaborador_id`),
  CONSTRAINT `ata_colaboradores_ibfk_1` FOREIGN KEY (`ata_id`) REFERENCES `atas` (`id`),
  CONSTRAINT `ata_colaboradores_ibfk_2` FOREIGN KEY (`colaborador_id`) REFERENCES `colaboradores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ata_colaboradores`
--

LOCK TABLES `ata_colaboradores` WRITE;
/*!40000 ALTER TABLE `ata_colaboradores` DISABLE KEYS */;
INSERT INTO `ata_colaboradores` VALUES (1,2),(2,2),(3,2),(3,3),(1,4),(4,4),(10,11);
/*!40000 ALTER TABLE `ata_colaboradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atas`
--

DROP TABLE IF EXISTS `atas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `workshop_id` int NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `workshop_id_UNIQUE` (`workshop_id`),
  CONSTRAINT `atas_ibfk_1` FOREIGN KEY (`workshop_id`) REFERENCES `workshops` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atas`
--

LOCK TABLES `atas` WRITE;
/*!40000 ALTER TABLE `atas` DISABLE KEYS */;
INSERT INTO `atas` VALUES (1,1,'2024-07-21'),(2,2,'2024-07-21'),(3,3,'2024-07-21'),(4,4,'2024-07-21'),(7,5,'2024-07-21'),(10,6,'2024-07-22');
/*!40000 ALTER TABLE `atas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colaboradores`
--

DROP TABLE IF EXISTS `colaboradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colaboradores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaboradores`
--

LOCK TABLES `colaboradores` WRITE;
/*!40000 ALTER TABLE `colaboradores` DISABLE KEYS */;
INSERT INTO `colaboradores` VALUES (1,'Alice'),(11,'Batista'),(6,'Fabio'),(7,'Fernando'),(2,'João'),(10,'Luiz'),(3,'Matheus'),(9,'Paulo'),(4,'Pedro'),(5,'Yasmim');
/*!40000 ALTER TABLE `colaboradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshops`
--

DROP TABLE IF EXISTS `workshops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshops` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `dataRealizacao` date NOT NULL,
  `descricao` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshops`
--

LOCK TABLES `workshops` WRITE;
/*!40000 ALTER TABLE `workshops` DISABLE KEYS */;
INSERT INTO `workshops` VALUES (1,'Criptografia em flutter','2024-07-21','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an u'),(2,'Segurança de t.i','2024-07-21','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an u'),(3,'Flutter web','2024-07-21','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an u'),(4,'Hacking','2024-07-21','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an u'),(5,'Dia do programador','2024-07-21','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an u'),(6,'Flutter','2024-07-22','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an u');
/*!40000 ALTER TABLE `workshops` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-22 16:57:55
