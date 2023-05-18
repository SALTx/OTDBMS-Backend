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
    PRIMARY KEY (gsmCode)
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
INSERT INTO pemGroup (pemGroupId, pemName) VALUES
('PEM001', 'Andy Lim'),
('PEM002', 'David Loo'),
('PEM003', 'Marry Lim');


-- Actual data for course table
INSERT INTO course (courseCode, courseName, courseManager) VALUES
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
('A345678', 'Bob Johnson', 'Male', 'Foreigner', 'BIO', 3, 'PEM003'),
('A456789', 'Emily Lee', 'Female', 'Singapore citizen', 'C42', 2, 'PEM002'),
('A567890', 'Michael Tan', 'Male', 'Permanent resident', 'C71', 1, 'PEM001'),
('A678901', 'Jessica Wong', 'Female', 'Foreigner', 'C89', 3, 'PEM003'),
('A789012', 'William Chen', 'Male', 'Singapore citizen', 'C52', 2, 'PEM001'),
('A890123', 'Sophia Lim', 'Female', 'Permanent resident', 'C41', 3, 'PEM003'),
('A901234', 'Daniel Ng', 'Male', 'Foreigner', 'C87', 1, 'PEM002'),
('A012345', 'Olivia Tan', 'Female', 'Singapore citizen', 'C50', 2, 'PEM001'),
('A123450', 'Ryan Goh', 'Male', 'Permanent resident', 'C62', 3, 'PEM003'),
('A234501', 'Isabella Lee', 'Female', 'Foreigner', 'C31', 1, 'PEM002'),
('A345012', 'Ethan Tan', 'Male', 'Singapore citizen', 'C75', 2, 'PEM001'),
('A456012', 'Sophie Chen', 'Female', 'Foreigner', 'C71', 1, 'PEM003'),
('A567123', 'Matthew Lim', 'Male', 'Singapore citizen', 'C50', 2, 'PEM001'),
('A678234', 'Emma Ng', 'Female', 'Permanent resident', 'C89', 3, 'PEM003'),
('A789345', 'David Wong', 'Male', 'Foreigner', 'C31', 1, 'PEM002'),
('A890456', 'Grace Tan', 'Female', 'Singapore citizen', 'C87', 1, 'PEM002'),
('A901567', 'Lucas Lee', 'Male', 'Permanent resident', 'C41', 3, 'PEM003'),
('A012678', 'Lily Chen', 'Female', 'Foreigner', 'C52', 2, 'PEM001');



-- Sample data for overseasPrograms table
INSERT INTO overseasPrograms (programID, programName, programType, startDate, endDate, countryCode, city, partnerName, overseasPartnerType) VALUES
('OP001', 'Summer Internship', 'OITP', '2023-06-01', '2023-08-31', 'USA', 'New York', 'Google', 'Company'),
('OP002', 'Semester Exchange', 'OET', '2024-01-01', '2024-05-31', 'AUS', 'Melbourne', 'University of Melbourne', 'Institution'),
('OP003', 'Cultural Immersion', 'OIMP', '2022-09-01', '2022-12-15', 'JPN', 'Tokyo', 'Japan Foundation', 'Others'),
('OP004', 'Educational Trip', 'OET', '2022-07-01', '2022-07-10', 'FRA', 'Paris', 'French Education Tours', 'Company'),
('OP005', 'Internship Program', 'OITP', '2023-02-15', '2023-05-15', 'CAN', 'Toronto', 'Tech Innovators', 'Company'),
('OP006', 'Language Exchange', 'OIMP', '2023-03-01', '2023-06-30', 'ESP', 'Barcelona', 'Universitat Autonoma de Barcelona', 'Institution'),
('OP007', 'Cultural Exploration', 'OET', '2023-10-01', '2023-10-15', 'THA', 'Bangkok', 'Thailand Cultural Exchange', 'Institution'),
('OP008', 'Industry Internship', 'OITP', '2023-07-01', '2023-09-30', 'GER', 'Berlin', 'Tech Solutions GmbH', 'Company'),
('OP009', 'Language Immersion', 'OIMP', '2023-09-01', '2023-12-15', 'ITA', 'Rome', 'Italian Language Institute', 'Institution'),
('OP010', 'Environmental Study', 'OET', '2023-05-01', '2023-05-10', 'BRA', 'Rio de Janeiro', 'Amazon Rainforest Institute', 'Institution');



INSERT INTO OIMPdetails (gsmCode, gsmName, programID) VALUES
('sampledata1', 'sampledata1', 'OP003'),
('sampledata2', 'sampledata2', 'OP006'),
('sampledata3', 'sampledata3', 'OP009');


 -- Sample data for users table
INSERT INTO users (username, password, accountType, name) VALUES
('admin', 'adminpass', 'Admin', 'John Admin'),
('teacher1', 'teacher1pass', 'Teacher', 'Jane Teacher'),
('guest1', 'guest1pass', 'Guest', 'Bob Guest');

-- Sample data for trips table
INSERT INTO trips (studentAdminNo, programID, comments) VALUES
('A123456', 'OP001', 'Excited to start my summer internship at Google!'),
('A234567', 'OP002', 'Looking forward to studying at University of Melbourne'),
('A345678', 'OP003', 'Can\'t wait to experience Japanese culture!'),
('A456789', 'OP004', 'Ready for an educational trip to Paris'),
('A567890', 'OP005', 'Thrilled to participate in an internship program in Toronto'),
('A678901', 'OP006', 'Excited for a language exchange program in Barcelona'),
('A789012', 'OP007', 'Eager to explore Thai culture in Bangkok'),
('A890123', 'OP008', 'Looking forward to an industry internship in Berlin'),
('A901234', 'OP009', 'Ready to immerse in the language in Rome'),
('A012345', 'OP010', 'Excited for an environmental study program in Rio de Janeiro');




