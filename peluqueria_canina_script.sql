create database if not exists peluqueria_canina;
use peluqueria_canina;

create table if not exists Dueno (
DNI int not null,
Nombre varchar(60) not null,
Apellido varchar(60) not null,
Telefono int not null,
Dirección varchar(200) not null,

primary key(DNI)

);
insert into Dueno values ("39237508","Pedro","Riba","485123","San Nicolas 800"),("33267592","Graciana","Ferrero","365278","C Moyano 548"),
("43258799","Pedro","Cuenca","485216","Bv Oroño 908"),("43234386","Francisco","Chapela","211271","Caseros Sur 99"),("41233540","Lupe","Vélez Torres","985234","Alberti 178"),
("42318704","Cayetana","Llano","325154","Riobamba 672"),("39233147","Gisela","Ochoa","785145","Soberania Nacional 1638"),("29336595","Victor","Guillen","547364","Santa Fe 541"),
("43568133","Pedro","Mesa","375853","Montevideo 6307"),("42221907","María","Dolores Luna","547832","San Martin 375");

create table if not exists Perro (
ID_Perro int not null auto_increment,
DNI_dueno int not null,
Nombre varchar(60) not null,
Fecha_nac date not null,
Sexo char(1) not null,

Primary key(ID_Perro),
Foreign key (DNI_dueno) references Dueno(DNI)

);
insert into Perro (DNI_dueno, Nombre, Fecha_nac, Sexo) values ("39237508","Samy","2021-07-24","F"),("33267592","Leo","2019-08-01","M"),("43258799","Sara","2020-08-03","M"),("43234386","Roco","2022-02-05","M"),
("41233540","Ema","2022-05-06","F"),("42318704","Tita","2020-08-06","F"),("39233147","Negro","2021-08-09","M"),("29336595","Pipe","2012-08-12","M"),("43568133","Mancha","2022-01-15","F"),("42221907","Roco","2021-05-04","M");

Create table if not exists Historial (
ID_Historial int not null auto_increment,
Perro int not null,
Fecha date not null,
Descripcion varchar(500) not null,
Monto int not null,

primary key(ID_Historial),
foreign key(Perro) references Perro(ID_Perro)

);
insert into Historial (Perro, Fecha, Descripcion, Monto) values (1,"2022-08-04","Corte de pelo","1500"),(2,"2022-08-04","Corte de pelo","2000"),(3,"2022-08-05","Baño","1500"),
(4,"2022-08-05","Baño y corte de pelo","3000"),(5,"2022-08-06","corte de uñas","500"),(6,"2022-08-06","Baño","1500"),(7,"2022-08-07","corte de uñas, baño y corte","3000"),
(8,"2022-08-07","Baño","1500"),(9,"2022-08-07","corte de uñas","500"),(10,"2022-08-10","Baño","1000");

Select P.Nombre as Nombre_perro, D.Nombre as Nombre_dueno
from Perro P, Dueno D
where D.DNI = P.DNI_dueno and (D.Nombre="Pedro");