-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: harrier
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `IDCategoria` int NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IDCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'urbano'),(2,'fiesta'),(3,'casual'),(4,'casual');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `CodCliente` int NOT NULL AUTO_INCREMENT,
  `CodUsuario` int NOT NULL,
  `DNI` int NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Apellido` varchar(20) NOT NULL,
  `FecNacimiento` datetime NOT NULL,
  `DireccionCalle` varchar(45) NOT NULL,
  `DireccionCodPostal` int NOT NULL,
  `DireccionExtra` varchar(100) DEFAULT NULL,
  `TarjetaNumero` bigint DEFAULT NULL,
  `TarjetaFecVencimiento` varchar(10) DEFAULT NULL,
  `TarjetaNombTitular` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`CodCliente`,`CodUsuario`),
  UNIQUE KEY `DNI_UNIQUE` (`DNI`),
  KEY `CodUsuario_idx` (`CodUsuario`),
  CONSTRAINT `CodUsuario` FOREIGN KEY (`CodUsuario`) REFERENCES `usuario` (`CodUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,1,41526374,'Lautaro','Fernandez','2000-06-16 00:00:00','white',1407,NULL,1532789067541760,'ene-30','Lautaro Fernandez'),(2,2,32435465,'Melany','Brajus','2002-02-02 00:00:00','cardenas',1407,NULL,5632890245679256,'oct-31','Melany Brajus'),(3,3,21436587,'Lucas','Maidana','1991-07-19 00:00:00','olivera',1234,'PH',4567987643258476,'jul-30','Lucas Maidana'),(4,4,12345678,'Luciano','Franqueira','1989-10-17 00:00:00','basualdo',1325,'no tocar timbre por perro',NULL,NULL,NULL),(5,5,47168095,'Claudio','Martin','2004-04-15 00:00:00','las heras',1275,NULL,4968845613580090,'may-31','Claudio Martin'),(6,6,87654321,'Marcos','Bejarano','1995-12-31 00:00:00','la serena',1109,'llamar, no funciona el timbre',9900726787638989,'mar-33','Marcos Bejerano');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ropa`
--

DROP TABLE IF EXISTS `ropa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ropa` (
  `CodRopa` int NOT NULL AUTO_INCREMENT,
  `IDCategoria` int NOT NULL,
  `CodCliente` int NOT NULL,
  `CodUsuario` int NOT NULL,
  `Precio` decimal(8,0) NOT NULL,
  `Descripcion` varchar(70) DEFAULT NULL,
  `Genero` varchar(1) NOT NULL,
  `Color` varchar(15) NOT NULL,
  `TipoPrenda` varchar(25) NOT NULL,
  `Talle` varchar(4) NOT NULL,
  PRIMARY KEY (`CodRopa`,`IDCategoria`,`CodCliente`,`CodUsuario`),
  KEY `CodCliente_idx` (`CodCliente`),
  KEY `CodUsuario_idx` (`CodUsuario`),
  CONSTRAINT `Cod_Usuario` FOREIGN KEY (`CodUsuario`) REFERENCES `usuario` (`CodUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CodCliente` FOREIGN KEY (`CodCliente`) REFERENCES `cliente` (`CodCliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ropa`
--

LOCK TABLES `ropa` WRITE;
/*!40000 ALTER TABLE `ropa` DISABLE KEYS */;
INSERT INTO `ropa` VALUES (1,1,1,1,15000,'Remera oversize','M','Rojo','Remera','XL'),(2,2,2,2,10000,NULL,'F','Azul','Top','S'),(3,3,4,4,24000,'jean cargo','M','Azul','Jean','M'),(4,4,5,5,40000,'zapatillas nike','M','Negro','Zapatilla','42');
/*!40000 ALTER TABLE `ropa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ropa-categoria`
--

DROP TABLE IF EXISTS `ropa-categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ropa-categoria` (
  `CodRopa` int NOT NULL,
  `IDCategoria` int NOT NULL,
  PRIMARY KEY (`CodRopa`,`IDCategoria`),
  KEY `IDCategoria_idx` (`IDCategoria`),
  CONSTRAINT `CodRopa` FOREIGN KEY (`CodRopa`) REFERENCES `ropa` (`CodRopa`),
  CONSTRAINT `IDCategoria` FOREIGN KEY (`IDCategoria`) REFERENCES `categoria` (`IDCategoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ropa-categoria`
--

LOCK TABLES `ropa-categoria` WRITE;
/*!40000 ALTER TABLE `ropa-categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `ropa-categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `CodUsuario` int NOT NULL AUTO_INCREMENT,
  `NombreUsuario` varchar(15) NOT NULL,
  `Correo` varchar(30) NOT NULL,
  `Contrasenia` varchar(15) NOT NULL,
  PRIMARY KEY (`CodUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Lautaro','lautaroF@gmail.com','12345'),(2,'Melany','melanyB@gmail.com','abcde'),(3,'Lucas','LucasM@gmail.com','abe435'),(4,'Luciano','LucianoF@gmail.com','msj1236'),(5,'Claudio','ClaudioM@gmail.com','472680'),(6,'Marcos','marcosB@gmail.com','tucuman22');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-08 19:01:38
