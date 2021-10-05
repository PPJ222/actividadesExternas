drop database if exists ActividadesExternas;
CREATE DATABASE ActividadesExternas;
use ActividadesExternas;

CREATE TABLE Departamento(
	Nombre VARCHAR(255) NOT NULL,
    PRIMARY KEY(Nombre)
);
INSERT INTO Departamento(Nombre)
	VALUE ("Geografia");
INSERT INTO Departamento(Nombre)
	VALUE ("Lengua");
INSERT INTO Departamento(Nombre)
	VALUE ("Matematicas");
INSERT INTO Departamento(Nombre)
	VALUE ("Informatica");
INSERT INTO Departamento(Nombre)
	VALUE ("Religion");
    

CREATE TABLE DatosProfesorado(
	DNI VARCHAR(9) NOT NULL,
    Nombre VARCHAR(255) NOT NULL,
    NRP INTEGER(6) NULL,
    Domicilio VARCHAR(255) NULL,
    Telf INTEGER NOT NULL,
    Departamento VARCHAR(255) NOT NULL,
    ActividadEscolares VARCHAR(255) NOT NULL,
    PRIMARY KEY(DNI),
    FOREIGN KEY (Departamento) REFERENCES Departamento(Nombre)
);
INSERT INTO DatosProfesorado(DNI,Nombre,NRP,Domicilio,Telf,Departamento,ActividadEscolares) 
	VALUES ("12345678A", "Jose Juarez Diaz", 123456, "C/Conquistador n34", 678625319, 
		(SELECT Nombre FROM Departamento WHERE Nombre="Geografia"),"Excursion a Monfrague");        
INSERT INTO DatosProfesorado(DNI,Nombre,NRP,Domicilio,Telf,Departamento,ActividadEscolares) 
	VALUES ("12345678B", "Maria Lopez Sanchez", 234567, "C/Juan Carlos XI n5 2ºB", 678625319, 
		(SELECT Nombre FROM Departamento WHERE Nombre="Informatica"),"Excursion GOOGLE/Irlanda");        
INSERT INTO DatosProfesorado(DNI,Nombre,NRP,Domicilio,Telf,Departamento,ActividadEscolares) 
	VALUES ("12345678C", "Felipe Durán", 345678, "C/Felipe II n82 4ºC", 678625319, 
		(SELECT Nombre FROM Departamento WHERE Nombre="Religion"),"Visita a monasterio romano");        
INSERT INTO DatosProfesorado(DNI,Nombre,NRP,Domicilio,Telf,Departamento,ActividadEscolares) 
	VALUES ("12345678D", "Ana Maria Gonzalez", 456789, "C/Guadalupe n3", 678625319, 
		(SELECT Nombre FROM Departamento WHERE Nombre="Lengua"),"Visita biblioteca");        
INSERT INTO DatosProfesorado(DNI,Nombre,NRP,Domicilio,Telf,Departamento,ActividadEscolares) 
	VALUES ("12345678E", "Luis Sanchez Merino", 567890, "C/Maria de los Dolores n4 5ºA", 678625319, 
		(SELECT Nombre FROM Departamento WHERE Nombre="Matematicas"),"Talleres matematicos externos");
        
        
CREATE TABLE Solicitud(
	cod INTEGER AUTO_INCREMENT NOT NULL,
    DNI VARCHAR(9) NOT NULL,
    Fecha DATE NOT NULL,
    DC BOOLEAN NOT NULL,
    Diurno BOOLEAN NOT NULL,
    Nocturno BOOLEAN NOT NULL,
    PRIMARY KEY (cod),
		FOREIGN KEY (DNI) REFERENCES DatosProfesorado(DNI)    
);
INSERT INTO Solicitud(cod,DNI,Fecha,DC,Diurno,Nocturno) 
	VALUES(NULL,(SELECT DNI FROM DatosProfesorado WHERE DNI="12345678A"), '2020-03-20', true, false, true);
INSERT INTO Solicitud(cod,DNI,Fecha,DC,Diurno,Nocturno) 
	VALUES(NULL,(SELECT DNI FROM DatosProfesorado WHERE DNI="12345678B"), '2021-10-02', true, true, false);
INSERT INTO Solicitud(cod,DNI,Fecha,DC,Diurno,Nocturno) 
	VALUES(NULL,(SELECT DNI FROM DatosProfesorado WHERE DNI="12345678C"), '2020-03-20', false, false, true);
INSERT INTO Solicitud(cod,DNI,Fecha,DC,Diurno,Nocturno) 
	VALUES(NULL,(SELECT DNI FROM DatosProfesorado WHERE DNI="12345678D"), '2020-03-20', true, true, true);
INSERT INTO Solicitud(cod,DNI,Fecha,DC,Diurno,Nocturno) 
	VALUES(NULL,(SELECT DNI FROM DatosProfesorado WHERE DNI="12345678E"), '2020-03-20', true, false, true);


CREATE TABLE Horario(
	cod INTEGER AUTO_INCREMENT NOT NULL,
    Hora VARCHAR(255) NOT NULL,
    Curso VARCHAR(255) NOT NULL,
    Solicitud INTEGER NOT NULL,
    PRIMARY KEY(cod),
		FOREIGN KEY(Solicitud) REFERENCES Solicitud(cod)
);
INSERT INTO Horario(cod,Hora,Curso,Solicitud)
	VALUES(NULL, "1ºhora", "1ºDAW", (SELECT cod FROM Solicitud WHERE cod="1"));
INSERT INTO Horario(cod,Hora,Curso,Solicitud)
	VALUES(NULL, "2ºhora", "1ºDAW", (SELECT cod FROM Solicitud WHERE cod="3"));
INSERT INTO Horario(cod,Hora,Curso,Solicitud)
	VALUES(NULL, "3ºhora", "1ºDAW", (SELECT cod FROM Solicitud WHERE cod="2"));
INSERT INTO Horario(cod,Hora,Curso,Solicitud)
	VALUES(NULL, "Recreo", "1ºDAW", (SELECT cod FROM Solicitud WHERE cod="3"));
INSERT INTO Horario(cod,Hora,Curso,Solicitud)
	VALUES(NULL, "4ºhora", "1ºDAW", (SELECT cod FROM Solicitud WHERE cod="5"));
INSERT INTO Horario(cod,Hora,Curso,Solicitud)
	VALUES(NULL, "5ºhora", "1ºDAW", (SELECT cod FROM Solicitud WHERE cod="4"));
INSERT INTO Horario(cod,Hora,Curso,Solicitud)
	VALUES(NULL, "6ºhora", "1ºDAW", (SELECT cod FROM Solicitud WHERE cod="2"));

