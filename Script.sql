#Script para generar Base de datos "Peluqueria Canina"
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema peluqueria_canina
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema peluqueria_canina
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `peluqueria_canina` DEFAULT CHARACTER SET utf8 ;
USE `peluqueria_canina` ;

-- -----------------------------------------------------
-- Table `peluqueria_canina`.`Dueno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peluqueria_canina`.`Dueno` (
  `DNI` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `Dirección` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `peluqueria_canina`.`Perro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peluqueria_canina`.`Perro` (
  `ID_Perro` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Fecha_nac` DATETIME NULL,
  `Sexo` VARCHAR(45) NULL,
  `DNI_Dueno` INT NOT NULL,
  PRIMARY KEY (`ID_Perro`),
   CONSTRAINT `fk_Perro_Dueno`
    FOREIGN KEY (`DNI_Dueno`)
    REFERENCES `Dueno` (`DNI`)
    );



-- -----------------------------------------------------
-- Table `peluqueria_canina`.`Historial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peluqueria_canina`.`Historial` (
  `ID_Historial` INT NOT NULL,
  `Fecha` DATETIME NULL,
  `Descripcion` VARCHAR(255) NULL,
  `Monto` DECIMAL NULL,
  `Perro` INT NOT NULL,
  PRIMARY KEY (`ID_Historial`),
  
  CONSTRAINT `fk_Historial_Perro1`
    FOREIGN KEY (`Perro`)
    REFERENCES `Perro` (`ID_Perro`)
    );
    

#Consulta 1: Realice la consulta correspondiente para crear la tabla Perro, teniendo en cuenta sus claves foráneas y primarias.
CREATE TABLE Perro (
	ID_Perro INTEGER PRIMARY KEY AUTO_INCREMENT,
    Nombre varchar(255),
    Fecha_nac datetime,
    Sexo varchar(25),
    CONSTRAINT fk_Dueno FOREIGN KEY (DNI_dueno) REFERENCES Dueno (DNI)
    );
  
  
    
# Consulta 2: Inserte en la tabla correspondiente un nuevo animal (perro) 
#como paciente y el dueño asociado a ese animal.

INSERT INTO Dueno VALUES (33270795, "Ramiro", "Garcia", 3541658798, "Juan B. Justo 1900");
INSERT INTO Perro VALUES (1, "Firulais", '2022-02-22', "Macho", 33270795);


# Consulta 11: Obtener todos los dueños que tengan perros de menos de 5 años de edad que no hayan visitado la peluquería en el año 2022.
SELECT d.* 
FROM Dueno d
INNER JOIN Perro p
	ON p.DNI_dueno=d.DNI
INNER JOIN (SELECT MAX(ID_Historial), Fecha, Perro FROM Historial GROUP BY Perro, Fecha) as h 
	ON h.Perro=p.ID_Perro 
WHERE 
	TIMESTAMPDIFF(YEAR,p.Fecha_nac,CURDATE())<5 
	AND YEAR(h.Fecha)!=2022 
GROUP BY d.DNI, d.Nombre, d.Apellido, d.Telefono, d.Dirección
