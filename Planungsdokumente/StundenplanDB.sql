USE master;
GO

IF DB_ID(N'StundenplanDB') IS NULL
    CREATE DATABASE StundenplanDB;
GO

USE StundenplanDB;
GO

-------------------------------------

DROP TABLE IF EXISTS LehrerSchulstunde;
DROP TABLE IF EXISTS SchultagSchulstunde;
DROP TABLE IF EXISTS Lehrer;
DROP TABLE IF EXISTS Schulstunde;
DROP TABLE IF EXISTS Schultag;
DROP TABLE IF EXISTS Schulwoche;

------------------------------------

CREATE TABLE Lehrer(
	LehrerID INT Not Null Primary Key Identity(1,1),
	LehrerVorname VARCHAR(100) NOT NULL,
	LehrerNachname VARCHAR(100) NOT NULL,

);

-------------------------------------

CREATE TABLE Schulstunde(
	SchulstundeID INT Not Null Primary Key Identity(1,1),
	NameFach VARCHAR(100) NOT NULL,


);

-------------------------------------

CREATE TABLE Schultag(
	SchultagID INT Not Null Primary Key Identity(1,1),
	NameTag VARCHAR(100) NOT NULL,

);

-------------------------------------

CREATE TABLE LehrerSchulstunde(
	lehrer_id INT,
	schulstunde_id INT,
	PRIMARY KEY(lehrer_id, schulstunde_id),
		FOREIGN KEY (lehrer_id) REFERENCES Schulstunde(SchulstundeID),
		FOREIGN KEY (schulstunde_id) REFERENCES Lehrer(LehrerID)

);

-------------------------------------

CREATE TABLE SchultagSchulstunde(
	schultag_id INT,
	schulstunde_id INT,
	PRIMARY KEY(schultag_id, schulstunde_id),
		FOREIGN KEY (schultag_id) REFERENCES Schultag(SchultagID),
		FOREIGN KEY (schulstunde_id) REFERENCES Schulstunde(SchulstundeID)

);


-------------------------------------

CREATE TABLE Schulwoche(
	SchulwocheID INT Not Null Primary Key Identity(1,1),
	
);

-------------------------------------

INSERT INTO Schulstunde VALUES ('Deutsch');
INSERT INTO Schulstunde VALUES ('Mathematik');
INSERT INTO Schulstunde VALUES ('Englisch');
INSERT INTO Schulstunde VALUES ('Sport');
INSERT INTO Schulstunde VALUES ('Erdkunde');
INSERT INTO Schulstunde VALUES ('Kunst');
INSERT INTO Schulstunde VALUES ('Geschichte');
INSERT INTO Schulstunde VALUES ('Programmierung');
INSERT INTO Schulstunde VALUES ('Frei');

INSERT INTO Schultag VALUES ('Montag');
INSERT INTO Schultag VALUES ('Dienstag');
INSERT INTO Schultag VALUES ('Mittwoch');
INSERT INTO Schultag VALUES ('Donnerstag');
INSERT INTO Schultag VALUES ('Freitag');

INSERT INTO Lehrer VALUES ('Ulke','Schmidt');
INSERT INTO Lehrer VALUES ('Walter','Müller');
INSERT INTO Lehrer VALUES ('Frank','Fischer');
INSERT INTO Lehrer VALUES ('Yvonne','Becker');
INSERT INTO Lehrer VALUES ('Peter','Fuchs');
INSERT INTO Lehrer VALUES ('Rainer','Winkler');

INSERT INTO SchultagSchulstunde VALUES (1,1);
INSERT INTO SchultagSchulstunde VALUES (1,1);
INSERT INTO SchultagSchulstunde VALUES (1,2);
INSERT INTO SchultagSchulstunde VALUES (1,2);
INSERT INTO SchultagSchulstunde VALUES (1,2);

INSERT INTO SchultagSchulstunde VALUES (2,3);
INSERT INTO SchultagSchulstunde VALUES (2,3);
INSERT INTO SchultagSchulstunde VALUES (2,2);
INSERT INTO SchultagSchulstunde VALUES (2,5);
INSERT INTO SchultagSchulstunde VALUES (2,5);

INSERT INTO SchultagSchulstunde VALUES (3,9);
INSERT INTO SchultagSchulstunde VALUES (3,1);
INSERT INTO SchultagSchulstunde VALUES (3,9);
INSERT INTO SchultagSchulstunde VALUES (3,7);
INSERT INTO SchultagSchulstunde VALUES (3,7);

INSERT INTO SchultagSchulstunde VALUES (4,6);
INSERT INTO SchultagSchulstunde VALUES (4,7);
INSERT INTO SchultagSchulstunde VALUES (4,7);
INSERT INTO SchultagSchulstunde VALUES (4,7);
INSERT INTO SchultagSchulstunde VALUES (4,8);

INSERT INTO SchultagSchulstunde VALUES (5,5);
INSERT INTO SchultagSchulstunde VALUES (5,5);
INSERT INTO SchultagSchulstunde VALUES (5,5);
INSERT INTO SchultagSchulstunde VALUES (5,5);
INSERT INTO SchultagSchulstunde VALUES (5,5);

INSERT INTO LehrerSchulstunde VALUES (1,1);
INSERT INTO LehrerSchulstunde VALUES (1,2);
INSERT INTO LehrerSchulstunde VALUES (1,3);
INSERT INTO LehrerSchulstunde VALUES (2,4);
INSERT INTO LehrerSchulstunde VALUES (2,5);
INSERT INTO LehrerSchulstunde VALUES (3,6);
INSERT INTO LehrerSchulstunde VALUES (4,7);
INSERT INTO LehrerSchulstunde VALUES (5,8);
INSERT INTO LehrerSchulstunde VALUES (6,9);