-- create database otdb if it doesn't exist
CREATE DATABASE IF NOT EXISTS otdb;

-- create students table
CREATE TABLE IF NOT EXISTS students (
    adminNumber CHAR(7) NOT NULL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    admissionYear YEAR NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    birthday DATE NOT NULL,
    citizenshipStatus ENUM('Singapore citizen', 'Permanent resident', 'Foreigner') NOT NULL,
    diploma VARCHAR(64),
    pemName VARCHAR(64) NOT NULL
);

-- create overseasProgrammes table
CREATE TABLE IF NOT EXISTS overseasProgrammes (
    programmeId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    programmeName VARCHAR(64) NOT NULL,
    programmeType ENUM('Internship', 'Exchange program') NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    country VARCHAR(64) NOT NULL,
    -- aciCountry BOOLEAN GENERATED ALWAYS AS (country IN ('Singapore', 'Malaysia', 'Indonesia', 'Thailand', 'Philippines', 'Vietnam', 'China', 'India')) STORED
    aciCountry BOOLEAN GENERATED ALWAYS AS (country IN ('Brunei', 'Cambodia', 'Indonesia', 'Laos', 'Malaysia', 'Myanmar', 'Philippines', 'Singapore', 'Thailand', 'Vietnam', 'China', 'India')) STORED

);

-- create table trips
CREATE TABLE IF NOT EXISTS trips (
    tripId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    studentAdminNumber CHAR(7) NOT NULL,
    programmeId INT NOT NULL,
    FOREIGN KEY (studentAdminNumber) REFERENCES students(adminNumber),
    FOREIGN KEY (programmeId) REFERENCES overseasProgrammes(programmeId)
);

-- create table for user accounts
CREATE TABLE IF NOT EXISTS users (
    username VARCHAR(64) NOT NULL PRIMARY KEY,
    password VARCHAR(64) NOT NULL,
    userType ENUM('Admin', 'Default') NOT NULL
);

-- example students
INSERT INTO students VALUES ('123456A', 'John Doe', 12, 'Male', '2000-01-01', 'Singapore Citizen', 'Diploma in Computer Science', 'John Smith');
INSERT INTO students VALUES ('234567B', 'Jane Doe', 12, 'Female', '2000-01-01', 'Permanent resident', 'Diploma in Nursing', 'Megan Lee');
INSERT INTO students VALUES ('345678C', 'Dwayne Wayne', 13, 'Male', '2000-04-15', 'Foreigner', 'Diploma in Business', 'William Gates');

-- example overseas programme
INSERT INTO overseasProgrammes (programmeName, programmeType, startDate, endDate, country)
VALUES ('Bing Soon', 'Internship', '2023-04-15', '2023-04-18', 'Malaysia');
INSERT INTO overseasProgrammes (programmeName, programmeType, startDate, endDate, country)
VALUES ('Ramen Noodle', 'Exchange program', '2023-04-15', '2023-04-18', 'Japan');
INSERT INTO overseasProgrammes (programmeName, programmeType, startDate, endDate, country)
VALUES ('Walmart', 'Internship', '2023-04-15', '2023-04-18', 'USA');

-- example student overseas programme
INSERT INTO trips (studentAdminNumber, programmeId) VALUES ('123456A', 1);
INSERT INTO trips (studentAdminNumber, programmeId) VALUES ('123456A', 3);
INSERT INTO trips (studentAdminNumber, programmeId) VALUES ('234567B', 2);
INSERT INTO trips (studentAdminNumber, programmeId) VALUES ('234567B', 3);

-- example user accounts
INSERT INTO users VALUES ('admin', 'admin', 'Admin');
INSERT INTO users VALUES ('user', 'user', 'Default');