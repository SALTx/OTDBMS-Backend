SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'otdb';
-- If the database exists, drop it
DROP DATABASE IF EXISTS otdb;
-- create database otdb if it doesn't exist
CREATE DATABASE IF NOT EXISTS otdb;
USE otdb;
-- create students table
CREATE TABLE IF NOT EXISTS students (
    adminNo CHAR(7) NOT NULL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    birthday DATE NOT NULL,
    citizenshipStatus ENUM('Singapore citizen', 'Permanent resident', 'Foreigner') NOT NULL,
    countryOfOrigin CHAR (3),
    course CHAR(3),
    year tiny int NOT NULL,
    pemGroup CHAR(6),
    FOREIGN KEY (pemName) REFERENCES users(name)
    FOREIGN KEY (course) REFERENCES course(courseName)
    FOREIGN KEY (countryOfOrigin) REFERENCES countries(countryCode)
);
-- create table for Diploma accounts
CREATE TABLE IF NOT EXISTS course (
    courseCode CHAR(3) NOT NULL PRIMARY KEY,
    courseName VARCHAR(64),
    courseManager VARCHAR(64),
);

-- create overseasProgrammes table
CREATE TABLE IF NOT EXISTS overseasPrograms (
    programID CHAR(6) NOT NULL PRIMARY KEY,
    programName VARCHAR(64) NOT NULL,
    programType ENUM('Internship', 'Exchange program', 'Immersion program', 'Others') NOT NULL, 
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    countryCode CHAR(3) NOT NULL,
    organization VARCHAR(64),
    organizationType ENUM('School','Industrial','Others') NOT NULL,
    FOREIGN KEY (countryCode) REFERENCES countries(countryCode)
);
-- create table countries
CREATE TABLE IF NOT EXISTS countries (
    countryCode CHAR(3) NOT NULL PRIMARY KEY,
    countryName VARCHAR(64) NOT NULL,
    city VARCHAR(64) NOT NULL,
    aciCountry ENUM('Yes', 'No')
);
-- create table trips
CREATE TABLE IF NOT EXISTS trips (
    studentAdminNumber CHAR(7) NOT NULL,
    programID CHAR(6) NOT NULL,
    comments TEXT,
    PRIMARY KEY (studentAdminNumber, programID),
    FOREIGN KEY (studentAdminNumber) REFERENCES students(adminNumber),
    FOREIGN KEY (programID) REFERENCES overseasPrograms(programID)
);

-- create table for user accounts
CREATE TABLE IF NOT EXISTS users (
    username VARCHAR(64) NOT NULL PRIMARY KEY,
    password VARCHAR(64)  NOT NULL,
    accountType ENUM('Admin', 'Teacher', 'Guest'),
    name VARCHAR(64)  NOT NULL,
);



