create database PI01;
alter database PI01
	character set = utf8mb4 collate = utf8mb4_spanish_ci;
use PI01;
SELECT @@global.secure_file_priv; -- en esta carpeta se guardan los archivos que uno desea importar directamente in file
SHOW VARIABLES LIKE "secure_file_priv";

drop table Circuitos;
create table Circuitos (
	Circuito_ID varchar(20),
    Ref_Circuito varchar(50),
    Nombre_Circuito varchar(70),
    Localidad varchar(50),
    Pais varchar(50),
    Latitud varchar(40),
    Longitud varchar(40),
    Altura varchar(40),
    URL varchar(255)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Importo los datos con el Table Import Wizard

drop table Carreras;
create table Carreras (
	Carrera_ID varchar(10),
    Año varchar(10),
    Ronda varchar(10),
    Circuito_ID varchar(20),
    Nombre_GP varchar(70),
    Fecha varchar(50),
    Hora varchar(50),
    URL varchar(255)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
    
-- Importo los datos con el Table Import Wizard

drop table Constructores;
-- Importo los datos con el Table Import Wizard a una nueva tabla Constructores
select * from Constructores;

drop table Pilotos;
-- Importo los datos con el Table Import Wizard a una nueva tabla Pilotos
select * from Pilotos;

drop table Resultados;
-- Importo los datos con el Table Import Wizard a una nueva tabla Resultados
select * from Resultados;

select * from Circuitos;
DESC Circuitos;
-- cambiamos los tipos de datos en Circuitos y agregamos la Primarykey
ALTER TABLE Circuitos MODIFY COLUMN Circuito_ID int;
ALTER TABLE Circuitos ADD PRIMARY KEY (Circuito_ID);

select * from Carreras;
DESC Carreras;
-- cambiamos los tipos de datos en Carreras y agregamos la Primarykey y Foreing key
ALTER TABLE Carreras MODIFY COLUMN Circuito_ID int;
ALTER TABLE Carreras MODIFY COLUMN Carrera_ID int;
ALTER TABLE Carreras MODIFY COLUMN Año int;
ALTER TABLE Carreras MODIFY COLUMN Fecha Date;
ALTER TABLE Carreras ADD PRIMARY KEY (Carrera_ID);
ALTER TABLE Carreras ADD FOREIGN KEY (Circuito_ID) REFERENCES Circuitos(Circuito_ID);

select * from Constructores;
DESC Constructores;
-- agregamos la primary key a constructores y cambiamos el nombre de la columna ID
ALTER TABLE Constructores CHANGE COLUMN constructorId Constructor_ID int;
ALTER TABLE Constructores ADD PRIMARY KEY (Constructor_ID);

select * from Pilotos;
DESC Pilotos;
-- agregamos la primary key a Pilotos
ALTER TABLE Pilotos CHANGE COLUMN driverId Piloto_ID int;
ALTER TABLE Pilotos ADD PRIMARY KEY (Piloto_ID);

select * from Resultados;
DESC Resultados;
-- agregamos la primary key y foreing key a Resultados
ALTER TABLE Resultados CHANGE COLUMN resultId Resultado_ID int;
ALTER TABLE Resultados ADD PRIMARY KEY (Resultado_ID);
ALTER TABLE Resultados CHANGE COLUMN raceId Carrera_ID int;
ALTER TABLE Resultados ADD FOREIGN KEY (Carrera_ID) REFERENCES Carreras(Carrera_ID);
ALTER TABLE Resultados CHANGE COLUMN driverId Piloto_ID int;
ALTER TABLE Resultados ADD FOREIGN KEY (Piloto_ID) REFERENCES Pilotos(Piloto_ID);
ALTER TABLE Resultados CHANGE COLUMN constructorId Constructor_ID int;
ALTER TABLE Resultados ADD FOREIGN KEY (Constructor_ID) REFERENCES Constructores(Constructor_ID);
ALTER TABLE Resultados CHANGE COLUMN positionOrder Posicion int;
ALTER TABLE Resultados CHANGE COLUMN points Puntos int;


-- Año con mayor cantidad de carreras:
Select Año, count(*) as Cant_de_Carreras from Carreras group by Año order by Cant_de_Carreras desc limit 1;
-- Piloto con mayor cantidad de primeros puestos:"$.surname"
select concat(JSON_UNQUOTE(P.`name`->"$.forename")," ", JSON_UNQUOTE(P.`name`->"$.surname")) as Nombre_y_Apellido, count(*) as Cant_Primer_Lugar from Resultados R
Join Pilotos P on (R.Piloto_ID=P.Piloto_ID) where R.Posicion =1 group by R.Piloto_ID order by Cant_Primer_Lugar desc limit 1; 
-- circuito mas corrido
select I.Nombre_Circuito, C.Nombre_GP, count(*) as Cant_de_Carreras from Carreras C inner join Circuitos I on (C.Circuito_ID=I.Circuito_ID)
group by C.Circuito_ID order by Cant_de_Carreras desc limit 1;
-- Piloto con mayor cantidad de puntos en total, cuyo constructor sea de nacionalidad sea American o British
select concat(JSON_UNQUOTE(P.`name`->"$.forename")," ", JSON_UNQUOTE(P.`name`->"$.surname")) as Nombre_y_Apellido, sum(R.puntos) as Total_Puntos ,
C.`name` as Nombre, C.nationality as Pais 
from Resultados R Join Pilotos P on (R.Piloto_ID=P.Piloto_ID) join Constructores C on (R.Constructor_ID=C.Constructor_ID)
where C.nationality like "British" or C.nationality like "American"
group by R.Piloto_ID order by Total_Puntos desc limit 1;

