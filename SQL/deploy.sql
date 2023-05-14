DROP DATABASE IF EXISTS overseasProgrammeDB;
-- create database overseasProgrammeDB if it doesn't exist
CREATE DATABASE IF NOT EXISTS overseasProgrammeDB;

USE overseasProgrammeDB;

CREATE TABLE IF NOT EXISTS countries (
    countryCode char(3),
    countryName varchar(64),
    aciCountry enum ('Yes', 'No'),
    PRIMARY KEY (countryCode)
);

CREATE TABLE IF NOT EXISTS pemGroup (
    pemGroupId char(6) not null,
    pemName varchar(64),
    PRIMARY KEY (pemGroupId)
);

CREATE TABLE IF NOT EXISTS course (
    courseCode char(3) not null,
    courseName varchar(64),
    courseManager varchar(64),
    PRIMARY KEY (courseCode)
);
-- create script to populate course table with current NYP courses
-- Edge case: Common programs which branch out to different courses

CREATE TABLE IF NOT EXISTS students (
    adminNo char(7) not null,
    name varchar(64) not null,
    gender enum ('Male', 'Female') not null,
    citizenshipStatus enum ('Singapore citizen', 'Permanent resident', 'Foreigner') not null,
    -- consider grouping singaporean and pr together for certain views
    course char(3) not null,
    stage tinyint not null,
    pemGroup char(6) not null,
    PRIMARY KEY (adminNo),
    FOREIGN KEY (course) REFERENCES course (courseCode),
    FOREIGN KEY (pemGroup) REFERENCES pemGroup (pemGroupId)
);

CREATE TABLE IF NOT EXISTS overseasPrograms (
    -- cross reference with overseas program table
    -- OET - Overseas educational trip
    -- OITP - Overseas internship program
    -- OIMP - Overseas immersion program
    -- #TODO: add more if available
    programID char(6) not null,
    programName varchar(64),
    programType enum ('OET', 'OITP', 'OIMP', 'Others'),
    startDate date,
    endDate date,
    countryCode char(3),    
    city varchar(64),
    partnerName varchar(64),
    overseasPartnerType enum ('Company', 'Institution', 'Others'),
    PRIMARY KEY (programID),
    FOREIGN KEY (countryCode) REFERENCES countries (countryCode)
);

CREATE TABLE IF NOT EXISTS OIMPdetails (
    gsmCode varchar(20) not null,
    gsmName varchar(50) not null,
    programID char(6) not null,
    courseCode  char(3) not null,
    PRIMARY KEY (gsmCode),
    FOREIGN KEY (courseCode) REFERENCES course (courseCode),
    FOREIGN KEY (programID) REFERENCES overseasPrograms (programID)
);


-- Edge case: Trips that include multiple destinations

CREATE TABLE IF NOT EXISTS trips (
    studentAdminNo char(7) not null,
    programID char(6) not null,
    comments text,
    PRIMARY KEY (studentAdminNo, programID),
    FOREIGN KEY (studentAdminNo) REFERENCES students (adminNo),
    FOREIGN KEY (programID) REFERENCES overseasPrograms (programID)
);

CREATE TABLE IF NOT EXISTS users (
    -- not fully implemented
    username varchar(64) not null,
    password varchar(64),
    accountType enum ('Admin', 'Teacher', 'Guest'),
    name varchar(64),
    PRIMARY KEY (username)
);

-- Sample data for pemGroup table
INSERT INTO 'pemGroup' (pemGroupId, pemName) VALUES
('PEM001', 'Andy Lim'),
('PEM002', 'David Loo'),
('PEM003', 'Marry Lim');

-- Actual data for course table
INSERT INTO 'course' (courseCode, courseName, courseManager) VALUES
('C42', 'Common Engineering Programme', 'Siew Peng Shorn'),
('C62', 'Advanced & Digital Manufacturing', 'Kent Loo'),
('C51', 'Aeronautical & Aerospace Technology', 'Sneharaj Malankad'),
('C52', 'Aerospace Systems & Management', 'Gan An Zhi'),
('C31', 'AI & Data Engineering', 'Sophia Wei'),
('C71', 'Biomedical Engineering', 'Poh Kok Kiong'),
('C89', 'Electronic & Computer Engineering', 'Chang Wai Yee'),
('C41', 'Engineering with Business', 'Ang Wei Sin'),
('C75', 'Infocomm & Media Engineering', 'Cheng Yu Hui'),
('C50', 'Nanotechnology & Materials Science', 'Eunice Goh'),
('C87', 'Robotics & Mechatronics', 'David Poh');


-- Sample data for students table
INSERT INTO students (adminNo, name, gender, citizenshipStatus, course, stage, pemGroup) VALUES
('A123456', 'John Smith', 'Male', 'Singapore citizen', 'C75', 1, 'PEM001'),
('A234567', 'Jane Doe', 'Female', 'Permanent resident', 'ENG', 2, 'PEM002'),
('A345678', 'Bob Johnson', 'Male', 'Foreigner', 'BIO', 3, 'PEM003');

-- Sample data for overseasPrograms table
INSERT INTO overseasPrograms (programID, programName, programType, startDate, endDate, countryCode,city, partnerName, overseasPartnerType) VALUES
('OP001', 'Summer Internship', 'OITP', '2023-06-01', '2023-08-31', 'USA', 'New York','Google', 'Company'),
('OP002', 'Semester Exchange', 'OET', '2024-01-01', '2024-05-31', 'AUS','Melbourne', 'University of Melbourne', 'Institution'),
('OP003', 'Cultural Immersion', 'OIMP', '2022-09-01', '2022-12-15', 'JPN','Tokyo','Japan Foundation', 'Others');

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
