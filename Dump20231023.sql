CREATE DATABASE  IF NOT EXISTS `bicicentro` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bicicentro`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: bicicentro
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `idinventario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `idtipo` int NOT NULL,
  `numeroserie` varchar(45) DEFAULT NULL,
  `idsede` int NOT NULL,
  `idmarca` int NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idinventario`),
  KEY `fk_inventario_tipoEquipo_idx` (`idtipo`),
  KEY `fk_inventario_sedes1_idx` (`idsede`),
  KEY `fk_inventario_marcas1_idx` (`idmarca`),
  CONSTRAINT `fk_inventario_marcas1` FOREIGN KEY (`idmarca`) REFERENCES `marcas` (`idmarca`),
  CONSTRAINT `fk_inventario_sedes1` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`idsede`),
  CONSTRAINT `fk_inventario_tipoEquipo` FOREIGN KEY (`idtipo`) REFERENCES `tipos` (`idtipo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` (`idinventario`, `nombre`, `idtipo`, `numeroserie`, `idsede`, `idmarca`, `estado`) VALUES (1,'RockHopper 29',3,'AN5812',3,3,'almacen'),(4,' Marlin 5',2,'GT1212',3,2,'Almacen'),(9,'Anza 12',3,'AN5898',1,3,'Pedido');
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `idmarca` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmarca`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` (`idmarca`, `nombre`) VALUES (1,'Speciallizede'),(2,'Trinx'),(3,'Shimano'),(12,'Trek');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `idpedido` int NOT NULL AUTO_INCREMENT,
  `codigoOrden` varchar(45) DEFAULT NULL,
  `nombreCliente` varchar(45) DEFAULT NULL,
  `dniCliente` varchar(45) DEFAULT NULL,
  `apellidoCliente` varchar(45) DEFAULT NULL,
  `id_inventario` int NOT NULL,
  PRIMARY KEY (`idpedido`),
  KEY `fk_pedido_inventario1_idx` (`id_inventario`),
  CONSTRAINT `fk_pedido_inventario1` FOREIGN KEY (`id_inventario`) REFERENCES `inventario` (`idinventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sedes`
--

DROP TABLE IF EXISTS `sedes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sedes` (
  `idsede` int NOT NULL AUTO_INCREMENT,
  `nombreSede` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idsede`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sedes`
--

LOCK TABLES `sedes` WRITE;
/*!40000 ALTER TABLE `sedes` DISABLE KEYS */;
INSERT INTO `sedes` (`idsede`, `nombreSede`, `direccion`) VALUES (1,'Pueblo Libre','Av Universitaria '),(2,'Miraflores','Av Larco 123'),(3,'Los Olivos','Av Marañon 123'),(12,'San Isidros','Calle Sanchez Pinillos 440');
/*!40000 ALTER TABLE `sedes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos`
--

DROP TABLE IF EXISTS `tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos` (
  `idtipo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos`
--

LOCK TABLES `tipos` WRITE;
/*!40000 ALTER TABLE `tipos` DISABLE KEYS */;
INSERT INTO `tipos` (`idtipo`, `nombre`) VALUES (1,'Marco'),(2,'Timón'),(3,'Frenos');
/*!40000 ALTER TABLE `tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajadores`
--

DROP TABLE IF EXISTS `trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajadores` (
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `dni` varchar(45) NOT NULL,
  `idsede` int NOT NULL,
  PRIMARY KEY (`dni`),
  KEY `fk_trabajadores_sedes1_idx` (`idsede`),
  CONSTRAINT `fk_trabajadores_sedes1` FOREIGN KEY (`idsede`) REFERENCES `sedes` (`idsede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajadores`
--

LOCK TABLES `trabajadores` WRITE;
/*!40000 ALTER TABLE `trabajadores` DISABLE KEYS */;
INSERT INTO `trabajadores` (`nombres`, `apellidos`, `correo`, `dni`, `idsede`) VALUES ('Roberto','Ibarra','roberto@gmail.com','12313212',1),('Henry','Gamboa','henry@bicicentro.com','41250222',1),('Marco','Olacua','marco@bicicentro.com','41950285',1),('Rodrigo','Poma','rodrigo.poma@ipt.pe','71624695',3),('Jesús','Chávez','jchavezs@pucp.pe','71717171',1);
/*!40000 ALTER TABLE `trabajadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `idventa` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `id_inventario` int NOT NULL,
  `dniTrabajador` varchar(45) NOT NULL,
  PRIMARY KEY (`idventa`,`dniTrabajador`),
  UNIQUE KEY `id_venta_UNIQUE` (`idventa`),
  KEY `fk_ventas_inventario1_idx` (`id_inventario`),
  KEY `fk_ventas_trabajadores1_idx` (`dniTrabajador`),
  CONSTRAINT `fk_ventas_inventario1` FOREIGN KEY (`id_inventario`) REFERENCES `inventario` (`idinventario`),
  CONSTRAINT `fk_ventas_trabajadores1` FOREIGN KEY (`dniTrabajador`) REFERENCES `trabajadores` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bicicentro'
--

--
-- Dumping routines for database 'bicicentro'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-23 19:09:07
