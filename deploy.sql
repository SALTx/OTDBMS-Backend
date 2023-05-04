CREATE DATABASE IF NOT EXISTS `overseas-travel`;

USE `overseas-travel`;

CREATE TABLE
    IF NOT EXISTS `countries` (
        `countryCode` char(3),
        `countryName` varchar(64),
        `city` varchar(64),
        `aciCountry` enum ('Yes', 'No'),
        PRIMARY KEY (`countryCode`)
    );

CREATE TABLE
    IF NOT EXISTS `pemGroup` (
        `pemGroup` char(6) not null,
        `pemName` varchar(64),
        PRIMARY KEY (`pemGroup`)
    );

CREATE TABLE
    IF NOT EXISTS `course` (
        `courseCode` char(3) not null,
        `courseName` varchar(64),
        `courseManager` varchar(64),
        PRIMARY KEY (`courseCode`)
    );
    -- create script to populate course table with current NYP courses
    -- Edge case: Common programs which branch out to different courses

CREATE TABLE
    IF NOT EXISTS students (
        adminNo char(7) not null,
        name varchar(64) not null,
        gender enum ('Male', 'Female') not null,
        birthday date not null,
        -- rm (sensitive data)
        citizenshipStatus enum (
            'Singapore citizen',
            'Permanent resident',
            'Foreigner'
        ) not null,
        -- consider grouping singaporean and pr together for certain views
        countryOfOrigin char(3),
        -- rm (?)
        course char(3) not null,
        year tinyint not null,
        -- change to stage
        pemGroup char(6) not null,
        PRIMARY KEY (adminNo),
        FOREIGN KEY (countryOfOrigin) REFERENCES countries (countryCode),
        FOREIGN KEY (course) REFERENCES course (courseCode),
        FOREIGN KEY (pemGroup) REFERENCES pemGroup (pemGroup)
    );

CREATE TABLE
    IF NOT EXISTS overseasPrograms (
        -- cross reference with overseas program table
        -- OET - Overseas educational trip
        -- OITP - Overseas internship program
        -- OIMP - Overseas immersion program
        -- #TODO: add more if available
        programID char(6) not null,
        programName varchar(64),
        programType enum (
            'Internship',
            'Exchange program',
            'Immersion program',
            'Others'
        ),
        startDate date,
        endDate date,
        countryCode char(3),
        -- add city
        organization varchar(64),
        -- change to partnerName, overseasPartner (NULLABLE VAL)
        organizationType enum ('Company', 'College / University', 'Others'),
        -- change col name to overseasPartnerType
        -- change [1] to institution
        PRIMARY KEY (programID),
        FOREIGN KEY (countryCode) REFERENCES countries (countryCode)
    );
    -- Edge case: Trips that include multiple destinations

CREATE TABLE
    IF NOT EXISTS trips (
        studentAdminNo char(7) not null,
        programID char(6) not null,
        comments text,
        PRIMARY KEY (studentAdminNo, programID),
        FOREIGN KEY (studentAdminNo) REFERENCES students (adminNo),
        FOREIGN KEY (programID) REFERENCES overseasPrograms (programID)
    );

CREATE TABLE
    IF NOT EXISTS users (
        -- not fully implemented
        username varchar(64) not null,
        password varchar(64),
        accountType enum ('Admin', 'Teacher', 'Guest'),
        name varchar(64),
        PRIMARY KEY (username)
    );

-- Sample data for pemGroup table
INSERT INTO pemGroup (pemGroup, pemName) VALUES
('PEM001', 'PEM Group 1'),
('PEM002', 'PEM Group 2'),
('PEM003', 'PEM Group 3');

-- Sample data for course table
INSERT INTO course (courseCode, courseName, courseManager) VALUES
('CSE', 'Computer Science', 'John Doe'),
('ENG', 'English Literature', 'Jane Smith'),
('BIO', 'Biology', 'Alice Johnson');

-- Sample data for students table
INSERT INTO students (adminNo, name, gender, birthday, citizenshipStatus, countryOfOrigin, course, year, pemGroup) VALUES
('A123456', 'John Smith', 'Male', '2000-01-01', 'Singapore citizen', 'SGP', 'C75', 1, 'PEM001'),
('A234567', 'Jane Doe', 'Female', '2001-02-02', 'Permanent resident', 'MYS', 'ENG', 2, 'PEM002'),
('A345678', 'Bob Johnson', 'Male', '1999-03-03', 'Foreigner', 'USA', 'BIO', 3, 'PEM003');

-- Sample data for overseasPrograms table
INSERT INTO overseasPrograms (programID, programName, programType, startDate, endDate, countryCode, organization, organizationType) VALUES
('OP001', 'Summer Internship', 'Internship', '2023-06-01', '2023-08-31', 'USA', 'Google', 'Company'),
('OP002', 'Semester Exchange', 'Exchange program', '2024-01-01', '2024-05-31', 'AUS', 'University of Melbourne', 'College / University'),
('OP003', 'Cultural Immersion', 'Immersion program', '2022-09-01', '2022-12-15', 'JPN', 'Japan Foundation', 'Others');

-- Sample data for trips table
INSERT INTO trips (studentAdminNo, programID, comments) VALUES
('A123456', 'OP001', 'Excited to start my summer internship at Google!'),
('A234567', 'OP002', 'Looking forward to studying at University of Melbourne'),
('A345678', 'OP003', 'Can\'t wait to experience Japanese culture!');
 
-- Sample data for users table
INSERT INTO users (username, password, accountType, name) VALUES
('admin', 'adminpass', 'Admin', 'John Admin'),
('teacher1', 'teacher1pass', 'Teacher', 'Jane Teacher'),
('guest1', 'guest1pass', 'Guest', 'Bob Guest');
