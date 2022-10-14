-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
Create database produccion;
use produccion;
-- Host: localhost    Database: produccion
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `_tbl_procesoprod`
--

DROP TABLE IF EXISTS `_tbl_procesoprod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tbl_procesoprod` (
  `codigo_proceso_tbl_procesoprod` int NOT NULL,
  `idordenes_tbl_procesoprod` int NOT NULL,
  `producto_fabricar_tbl_procesoprod` varchar(60) NOT NULL,
  `cantidad_fabricar_tbl_procesoprod` varchar(60) NOT NULL,
  `fecha_entrega_tbl_procesoprod` varchar(20) NOT NULL,
  `proceso_pro_tbl_procesoprod` varchar(10) NOT NULL,
  `estado_orden_tbl_procesoprod` varchar(1) NOT NULL,
  PRIMARY KEY (`codigo_proceso_tbl_procesoprod`),
  KEY `fkidordenes_idx` (`idordenes_tbl_procesoprod`),
  CONSTRAINT `fkidordenes` FOREIGN KEY (`idordenes_tbl_procesoprod`) REFERENCES `tbl_ordenes` (`idordenes_tbl_ordenes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tbl_procesoprod`
--

LOCK TABLES `_tbl_procesoprod` WRITE;
/*!40000 ALTER TABLE `_tbl_procesoprod` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tbl_procesoprod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ordenes`
--

DROP TABLE IF EXISTS `tbl_ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ordenes` (
  `idordenes_tbl_ordenes` int NOT NULL,
  `idreceta_tbl_ordenes` int NOT NULL,
  `prioridad_tbl_ordenes` varchar(45) NOT NULL,
  `producto_fabricar_tbl_ordenes` varchar(45) DEFAULT NULL,
  `fechaini_tbl_ordenes` date DEFAULT NULL,
  `fechaent` date DEFAULT NULL,
  PRIMARY KEY (`idordenes_tbl_ordenes`),
  KEY `pkidreceta_idx` (`idreceta_tbl_ordenes`),
  CONSTRAINT `pkidreceta` FOREIGN KEY (`idreceta_tbl_ordenes`) REFERENCES `tbl_recetas` (`idrecetas_tbl_recetas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ordenes`
--

LOCK TABLES `tbl_ordenes` WRITE;
/*!40000 ALTER TABLE `tbl_ordenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_recetas`
--

DROP TABLE IF EXISTS `tbl_recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_recetas` (
  `idrecetas_tbl_recetas` int NOT NULL,
  `producto_tbl_recetas` varchar(45) NOT NULL,
  `nombre_material_tbl_recetas` varchar(100) NOT NULL,
  `cantidad_tbl_recetas` varchar(100) NOT NULL,
  PRIMARY KEY (`idrecetas_tbl_recetas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_recetas`
--

LOCK TABLES `tbl_recetas` WRITE;
/*!40000 ALTER TABLE `tbl_recetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'produccion'
--

--
-- Dumping routines for database 'produccion'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-13 20:20:17
