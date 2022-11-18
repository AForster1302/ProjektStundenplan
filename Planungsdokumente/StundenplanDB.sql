USE master;
GO

IF DB_ID(N'StundenplanDB') IS NULL
    CREATE DATABASE StundenplanDB;
GO

USE StundenplanDB;
GO

-------------------------------------

DROP TABLE IF EXISTS Faecher;
DROP TABLE IF EXISTS Schultage;

CREATE TABLE Faecher(
	UserID INT Not Null Primary Key Identity(1,1),
	UserName VARCHAR(100) NOT NULL,
	HashPassword VARCHAR(100) NOT NULL,
	Salt VARCHAR(100) NOT NULL,
	
);

-------------------------------------

CREATE TABLE Schultage(
	ExerciseID INT Not Null Primary Key Identity(1,1),
	Category NVARCHAR(10),
	ExerciseName NVARCHAR(100),
	Difficulty NVARCHAR(20),
	Description TEXT,
	
);

-------------------------------------

CREATE TABLE Routine(
	RoutineID INT Not Null Primary Key Identity(1,1) ,
	RoutineName NVARCHAR(100),
	UserID INT
		Constraint Routine_Users Foreign Key (UserID) References Users(UserID),
);

-------------------------------------

CREATE TABLE RoutineExercises(
	RoutineExercisesID INT NOT NULL Primary Key Identity(1,1),
	Repetitions INT,
	Duration INT,
	BreakRoutine TIME,
	RoutineID INT not null,
    ExerciseID INT not null,
	CONSTRAINT fk_exercises FOREIGN KEY (ExerciseID) REFERENCES Exercise(ExerciseID),
	CONSTRAINT fk_routine FOREIGN KEY (RoutineID) REFERENCES Routine(RoutineID)
);

-------------------------------------

CREATE TABLE Reminders(
  ReminderID INT Not Null Primary Key Identity(1,1), 
  CalendarDate DATETIME,
	UserID INT,
		Constraint fk_User Foreign Key (UserID) References Users(UserID),
);

-------------------------------------

CREATE TABLE RoutineHistory(
	HistoryID INT Not Null Primary Key Identity(1,1),
	RoutineID INT not null,
	UserID INT,
	FOREIGN KEY (RoutineID) REFERENCES Routine(RoutineID),
	DateHistory Datetime,
	Constraint RoutineHistory_Users Foreign Key (UserID) References Users(UserID),
);

-------------------------------------

INSERT INTO Exercise VALUES ('Pause', 'Pause', '','Machen Sie eine Pause.');