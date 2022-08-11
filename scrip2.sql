#Consulta 1: Realice la consulta correspondiente para crear la tabla Perro, teniendo en cuenta sus claves foráneas y primarias.

CREATE TABLE Perro(
id_perro int,
nombre  varchar(45),
fecha_nacimiento DATETIME,
sexo varchar(45),
dni_dueño int,
PRIMARY KEY (id_perro));

# Consulta 2: Inserte en la tabla correspondiente un nuevo animal (perro) 
#como paciente y el dueño asociado a ese animal.

INSERT INTO dueno VALUES (233337686,"Jose", "Romero", 3664648818, "AV, COLON 1445");
INSERT INTO Perro VALUES (4, "PEPE",'2022-07-7',"Macho", 233337686);





# consulta 7:Obtener los ingresos percibidos en Julio del 2022
INSERT INTO HISTORIAL
VALUES (4,'2022-07-07','','caniche',2500);
