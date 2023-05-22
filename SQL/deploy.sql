
CREATE DATABASE IF NOT EXISTS overseasProgramDB;

USE overseasProgramDB;

CREATE TABLE IF NOT EXISTS countries (
    countryCode char(2),
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

-- Edge case: Common programs which branch out to different courses

CREATE TABLE IF NOT EXISTS students (
    adminNo char(7) not null,
    name varchar(64) not null,
    gender enum ('Male', 'Female') not null,
    citizenshipStatus enum ('Singapore citizen', 'Permanent resident', 'Foreigner') not null,
    -- consider grouping singaporean and pr together for certain views
    stage tinyint not null,
    course char(3) not null,
    pemGroup char(6) not null,
    PRIMARY KEY (adminNo),
    FOREIGN KEY (course) REFERENCES course (courseCode),
    FOREIGN KEY (pemGroup) REFERENCES pemGroup (pemGroupId)
);
    -- cross reference with overseas program table
    -- OET - Overseas educational trip
    -- OITP - Overseas internship program
    -- OIMP - Overseas immersion program
    -- #TODO: add more if available
CREATE TABLE IF NOT EXISTS overseasPrograms (
    programID char(6) NOT NULL,
    programName varchar(64),
    programType enum ('OET', 'OITP', 'OIMP', 'Others'),
    startDate date,
    endDate date,
    countryCode char(2),
    city varchar(64),
    partnerName varchar(64),
    overseasPartnerType enum ('Company', 'Institution', 'Others'),
    PRIMARY KEY (programID, countryCode, city)
);


CREATE TABLE IF NOT EXISTS OIMPdetails (
    gsmCode varchar(20) not null,
    courseCode char(3) not null,
    studAdmin char(7) not null,
    gsmName varchar(50) not null,
    programID char(6) not null,
    PRIMARY KEY (gsmCode),
    FOREIGN KEY (courseCode) REFERENCES course (courseCode),
    FOREIGN KEY (studAdmin) REFERENCES students (adminNo)
);

-- Edge case: Trips that include multiple destinations
CREATE TABLE IF NOT EXISTS trips (
    studAdmin char(7) not null,
    programID char(6) not null,
    comments text,
    PRIMARY KEY (studAdmin, programID),
    FOREIGN KEY (studAdmin) REFERENCES students (adminNo),
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
('A123456', 'John Smith', 'Male', 'Singapore citizen', 'C75', 3, 'PEM001'),
('A123457', 'Jane Doe', 'Female', 'Permanent resident', 'C42', 3, 'PEM002'),
('A123458', 'Bob Johnson', 'Male', 'Foreigner', 'C71', 3, 'PEM003'),
('A123459', 'Emily Lee', 'Female', 'Singapore citizen', 'C42', 3, 'PEM002');



-- Sample data for overseasPrograms table
INSERT INTO overseasPrograms (programID, programName, programType, startDate, endDate, countryCode, city, partnerName, overseasPartnerType) VALUES
('OP001', 'Summer Internship', 'OITP', '2023-06-01', '2023-08-31', 'SG', 'Singapore', 'ASEAN Company', 'Company'),
('OP002', 'Semester Exchange', 'OET', '2024-01-01', '2024-05-31', 'IN', 'Mumbai', 'Indian University', 'Institution'),
('OP003', 'Cultural Immersion', 'OIMP', '2022-09-01', '2022-09-15', 'CN', 'Beijing', 'Chinese Institution', 'Institution'),
('OP003', 'Cultural Immersion', 'OIMP', '2022-09-15', '2022-10-01', 'CN', 'Shanghai', 'Shanghai Institution', 'Institution'),
('OP003', 'Cultural Immersion', 'OIMP', '2022-10-01', '2022-10-15', 'VN', 'Ho Chi Minh', 'Bach Khoa University', 'Institution'),
('OP004', 'Educational Trip', 'OET', '2022-07-01', '2022-07-10', 'MY', 'Kuala Lumpur', 'ASEAN Education Tours', 'Company');



INSERT INTO OIMPdetails (gsmCode, courseCode, studAdmin, gsmName, programID) VALUES
('sampledata1', 'C42', 'A123459', 'sampledata1', 'OP003');

-- Sample data for users table
INSERT INTO users (username, password, accountType, name) VALUES
('admin', 'adminpass', 'Admin', 'John Admin'),
('teacher1', 'teacher1pass', 'Teacher', 'Jane Teacher'),
('guest1', 'guest1pass', 'Guest', 'Bob Guest');

-- Sample data for trips table
INSERT INTO trips (studAdmin, programID, comments) VALUES
('A123456', 'OP001', 'Excited to start my summer internship at xxx!'),
('A123457', 'OP002', 'Looking forward to studying at University of India'),
('A123459', 'OP003', 'Happy to experience Chinese culture!'),
('A123458', 'OP004', 'Happy to experience Malaysian culture!');


