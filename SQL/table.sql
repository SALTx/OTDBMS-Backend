CREATE DATABASE IF NOT EXISTS test;

USE test;
CREATE TABLE IF NOT EXISTS countries (
    countryCode char(2), -- not used in reports
    countryName varchar(64),
    aciCountry enum ('A', 'N'),
    PRIMARY KEY (countryName)
);

CREATE TABLE IF NOT EXISTS pemGroup (
    pemGroupId char(6) not null,
    pemName varchar(64),
    PRIMARY KEY (pemGroupId)
);

CREATE TABLE IF NOT EXISTS course (
    courseCode char(6) not null,
    courseName varchar(64),
    courseManager varchar(64),
    PRIMARY KEY (courseCode)
);
-- Edge case: Common programs which branch out to different courses
CREATE TABLE IF NOT EXISTS students (
    adminNo char(7) not null,
    #--adminNo format: first 2 digit as enroll year,middle 4 random digit, last 1 random alphabet. 
    #--e.g. 191203G. 19 as enrolled in year 2019,the rest is all random generated
    name varchar(64) not null,
    citizenshipStatus enum ('Singapore citizen', 'Permanent resident', 'International Student') not null,
    stage tinyint not null,
    -- stage 1,2,3 is like year 1,2,3. the max number for stage is 3
    course char(6) not null,
    pemGroup char(6) not null,
    PRIMARY KEY (adminNo),
    FOREIGN KEY (course) REFERENCES course (courseCode),
    FOREIGN KEY (pemGroup) REFERENCES pemGroup (pemGroupId)
    );
CREATE TABLE IF NOT EXISTS overseasPrograms (
    programID CHAR(9) NOT NULL,
    programName VARCHAR(64),
    programType ENUM (
        'Overseas educational trip',
        'Overseas internship program',
        'Overseas immersion program',
        'Overseas Competition/Exchange',
        'Overseas Leadership Training',
        'Overseas Leadership Training with Outward Bound',
        'Overseas Service Learning-Youth Expedition Programme'
    ),
    startDate DATE,
    endDate DATE,
    ESTdate VARCHAR(64),
    countryName VARCHAR(64),    
    city VARCHAR(64),
    partnerName VARCHAR(64),
    overseasPartnerType ENUM ('Company', 'Institution', 'Others'),
    tripLeaders VARCHAR(512),
    EstNumStudents INT,
    Approved ENUM('Yes', 'No'),
    PRIMARY KEY (programID, countryName, city),
    FOREIGN KEY (countryName) REFERENCES countries (countryName)
);

-- group by quater(financial year)
-- Edge case: Trips that include multiple destinations
CREATE TABLE IF NOT EXISTS trips (
    studAdmin CHAR(7) NOT NULL,
    programID CHAR(9) NOT NULL,
    comments TEXT,
    PRIMARY KEY (studAdmin, programID),
    FOREIGN KEY (studAdmin) REFERENCES students (adminNo),
    FOREIGN KEY (programID) REFERENCES overseasPrograms (programID)
);


CREATE TABLE IF NOT EXISTS OIMPdetails (
    gsmCode varchar(20) not null,
    courseCode char(6) not null,
    studAdmin char(7) not null,
    gsmName varchar(50) not null,
    programID char(9) not null,
    PRIMARY KEY (studAdmin),
    FOREIGN KEY (courseCode) REFERENCES course (courseCode),
    FOREIGN KEY (studAdmin) REFERENCES students (adminNo)
);
CREATE TABLE IF NOT EXISTS users (
    -- not fully implemented
    username varchar(64) not null,
    password varchar(64),
    accountType enum ('Admin', 'Teacher', 'Guest'),
    name varchar(64),
    PRIMARY KEY (username)
);
CREATE TABLE auditTable (
    auditID INT AUTO_INCREMENT,
    tableName VARCHAR(100) NOT NULL,
    columnName VARCHAR(100) NOT NULL,
    oldValue TEXT,
    newValue TEXT,
    programID char(9),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (auditID)
);

/*
   quater 1 1st april - 31 june
   quater 2 1st july - 31 september
   quater 3 1st october - 31 december
   quater 4 1st january - 31 march
*/

