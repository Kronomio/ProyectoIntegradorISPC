#A. Crear Base de Datos y Tablas según Modelo Relacional.

CREATE DATABASE PeluqueriaCanina;

USE PeluqueriaCanina;

CREATE TABLE Dueno(
dni int,
nombre varchar(30),
apellido varchar(20),
telefono bigint,
direccion varchar (50),
constraint pk_dni primary key (dni)
);

INSERT INTO dueno values (36598625, "Pedro", "Martinez", 3516549865, "Avellaneda 1650");

#Realice la consulta correspondiente para crear la tabla Perro, 
#teniendo en cuenta sus claves foráneas y primarias.

CREATE TABLE Perro(
id_perro int auto_increment,
Nombre varchar(20),
Fecha_nac datetime,
Sexo varchar (1),
constraint pk_idp primary key (id_perro),
dni_dueno int,
constraint fk_dnid foreign key (dni_dueno) references Dueno (dni)
);

#Inserte en la tabla correspondiente un nuevo animal (perro) 
#como paciente y el dueño asociado a ese animal.

INSERT INTO Perro VALUES (1, "Capitan", "2016-05-20", "M", 36598625);

CREATE TABLE Historial(
id_historial int auto_increment,
Fecha datetime,
perro int,
descripcion varchar(500),
monto float,
constraint pk_idh primary key (id_historial),
constraint fk_p foreign key (perro) references perro (id_perro)
);

# 4. Actualice la fecha de nacimiento de algún animal (perro) que usted considere.

UPDATE perro SET Fecha_nac = "2016-04-15" WHERE id_perro = 1;