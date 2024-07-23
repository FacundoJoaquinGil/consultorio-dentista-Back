DROP DATABASE IF EXISTS Dentista;

CREATE DATABASE Dentista;

USE dentista;


CREATE TABLE Login(
id_User INT AUTO_INCREMENT PRIMARY KEY,
usuario varchar(25),
contraseña varchar(25)
);

SELECT * FROM login;

SELECT * FROM login WHERE id_User = id;

INSERT INTO login (usuario, contraseña) values(?,?);

UPDATE login SET usuario = usuario,
                          contraseña = contraseña
                          WHERE id_User = id_User;
                          
DELETE FROM login WHERE id_User = id_User;

CREATE TABLE Pacientes(
id_Pacientes int AUTO_INCREMENT PRIMARY KEY,
nombre varchar(25),
apellido varchar(25),
dni int,
sexo varchar(20),
domicilio varchar(25),
fechaNacimiento date,
edad int,
idHistorialClinico int
);

SELECT * FROM pacientes p INNER JOIN historialclinico h ON p.idHistorialClinico = h.id_HistorialClinico;

SELECT * FROM pacientes p INNER JOIN turnos t ON p.id_Pacientes = t.idPaciente INNER JOIN dentista d ON t.idDentista = d.id_Dentista;

SELECT * FROM pacientes;

SELECT * FROM pacientes WHERE id_Pacientes = id;

INSERT INTO Pacientes (nombre, apellido, dni, sexo, domicilio, fechaNacimiento, edad, idHistorialClinico) values(?,?,?,?,?,?,?,?);

UPDATE pacientes SET nombre = nombre,
                          apellido = apellido, 
                          dni = dni, 
                          sexo = sexo, 
                          domicilio = domicilio, 
                          fechaNacimiento = fechaNacimiento, 
                          edad = edad, 
                          idHistorialClinico = idHistorialClinico
                          WHERE id_Pacientes= id;
                          
DELETE FROM pacientes WHERE id_Pacientes = id_Pacientes;

ALTER TABLE pacientes 
ADD CONSTRAINT idHistorialClinico
FOREIGN KEY (idHistorialClinico)
REFERENCES historialclinico (id_HistorialClinico)
ON DELETE NO ACTION
ON UPDATE NO ACTION;




CREATE TABLE Dentista(
id_Dentista int AUTO_INCREMENT PRIMARY KEY,
nombreDent varchar(25),
apellidoDent varchar(25),
dniDent int,
matricula int,
sexo varchar(20),
turno varchar(25)
);

SELECT * FROM dentista;

SELECT * FROM dentista WHERE id_Dentista = id;

INSERT INTO dentista (nombreDent, apellidoDent, dniDent ,matricula, sexo, turno) values(?,?,?,?,?,?);

UPDATE dentista SET nombreDent = nombre,
                            apellidoDent = apellido, 
                            dniDent = dni, 
                            matricula = matricula, 
                            sexo = sexo, 
                            turno = turno
                            WHERE id_Dentista= id_Dentista;
                            
DELETE FROM dentista WHERE id_Dentista = id_Dentista;
                            
                            

CREATE TABLE Turnos(
id_Turnos int AUTO_INCREMENT PRIMARY KEY,
fechaTurno date,
numOrden int,
idPacientes int,
idDentista int
);

SELECT * FROM turnos;

SELECT * FROM turnos WHERE id_Turnos = id;

INSERT INTO turnos ( fechaTurno, idPaciente, numOrden, idDentista) values(?,?,?,?);

UPDATE turnos SET idPaciente = idPaciente,
                          fechaTurno = fechaTurno, 
                          numOrden = numOrden,
                          idDentista = idDentista
                          WHERE id_Turnos= id;

ALTER TABLE turnos 
ADD CONSTRAINT FK_IdPacientes
FOREIGN KEY (idPacientes)
REFERENCES pacientes (id_Pacientes)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

CREATE TABLE HistorialClinico(
id_HistorialClinico int AUTO_INCREMENT PRIMARY KEY,
fecha date,
diagnostico varchar(100),
observaciones varchar(100)
);

SELECT * FROM historialclinico;

SELECT * FROM historialclinico WHERE id_HistorialClinico = id;

INSERT INTO historialclinico (fecha, diagnostico, observaciones) values(?,?,?);

UPDATE historialclinico SET fecha = fecha,
                           diagnostico =diagnostico, 
                            observaciones = observaciones
                            WHERE id_HistorialClinico= id_HistorialClinico;
                            
DELETE FROM historialclinico WHERE id_HistorialClinico = id_HistorialClinico;

SELECT * FROM pacientes p INNER JOIN historialclinico h ON p.idHistorialClinico = h.id_HistorialClinico;


                            