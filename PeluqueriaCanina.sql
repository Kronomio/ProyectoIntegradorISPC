CREATE DATABASE  IF NOT EXISTS `peluqueriacanina` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `peluqueriacanina`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: peluqueriacanina
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Creo la tabla `dueno`
--

DROP TABLE IF EXISTS `dueno`;
CREATE TABLE `dueno` (
  `DNI` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(60) NOT NULL,
  `Telefono` bigint NOT NULL,
  `Direccion` varchar(60) NOT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Inserto datos en la tabla `dueno`
--
INSERT INTO `dueno` VALUES (32952933,'Alberto','Fernandez',333294295,'Altamirano 492'),(52632183,'Luciana','Bustamante',462925026,'Av. San Martin 1204'),(429482053,'Gustavo','Olivar',3828825,'Palomero 942');


--
-- Creo la tabla `historial`
--

DROP TABLE IF EXISTS `historial`;
CREATE TABLE `historial` (
  `ID_Historial` int NOT NULL,
  `Fecha` date NOT NULL,
  `Perro` int DEFAULT NULL,
  `Descripcion` varchar(80) DEFAULT NULL,
  `Monto` float NOT NULL,
  PRIMARY KEY (`ID_Historial`),
  KEY `FK_PerroID` (`Perro`),
  CONSTRAINT `FK_PerroID` FOREIGN KEY (`Perro`) REFERENCES `perro` (`ID_Perro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Inserto datos en la tabla `historial`
--


INSERT INTO `historial` VALUES (1,'2021-05-12',1,'Vacunacion',2450),(2,'2020-02-28',2,'Cirujia',12450),(3,'2022-10-12',3,'Vacunacion',2750);


--
-- Creo la tabla `perro`
--
-- 1) Realice la consulta correspondiente para crear la tabla Perro, teniendo en cuenta sus claves foráneas y primarias.


DROP TABLE IF EXISTS `perro`;
CREATE TABLE `perro` (
  `ID_Perro` int NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Fecha_nac` date NOT NULL,
  `Sexo` varchar(1) NOT NULL,
  `DNI_dueno` int DEFAULT NULL,
  PRIMARY KEY (`ID_Perro`),
  KEY `FK_DuenoDNI` (`DNI_dueno`),
  CONSTRAINT `FK_DuenoDNI` FOREIGN KEY (`DNI_dueno`) REFERENCES `dueno` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ingreso datos en la tabla `perro`
--
-- 2) Inserte en la tabla correspondiente un nuevo animal (perro) como paciente y el dueño asociado a ese animal.


INSERT INTO `perro` VALUES (1,'Lucas','2018-03-20','M',32952933),(2,'Nieve','2020-12-04','F',52632183),(3,'Lucas','2022-08-02','F',429482053);

-- Actividad 6) Obtener todos los perros que asistieron a la peluquería en 2022

select * from Historial where year(Fecha) = 2022; --Datos de los perros que asistieron a la peluqueria en 2022.


