
CREATE DATABASE IF NOT EXISTS overseasProgramDB;

USE overseasProgramDB;

CREATE TABLE IF NOT EXISTS countries (
    countryCode char(2),
    countryName varchar(64),
    aciCountry enum ('A', 'N'),
    PRIMARY KEY (countryCode)
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
    gender enum ('Male', 'Female') not null,
    citizenshipStatus enum ('Singapore citizen', 'Permanent resident', 'International Student') not null,
    -- consider grouping singaporean and pr together for certain views
    stage tinyint not null,
    -- stage 1,2,3 is like year 1,2,3. the max number for stage is 3
    course char(6) not null,
    pemGroup char(6) not null,
    PRIMARY KEY (adminNo),
    FOREIGN KEY (course) REFERENCES course (courseCode),
    FOREIGN KEY (pemGroup) REFERENCES pemGroup (pemGroupId)
    );
CREATE TABLE IF NOT EXISTS overseasPrograms (
    programID char(9) NOT NULL,
    programName varchar(64),
    programType ENUM
    ('Overseas educational trip', 'Overseas internship program', 'Overseas immersion program', 
    'Overseas Competition/Exchange', 'Overseas Leadership Training', 'Overseas Leadership Training with Outward Bound',
    'Overseas Service Learning-Youth Expedition Programme'),
    startDate date,
    endDate date,
    countryCode char(2),
    city varchar(64),
    partnerName varchar(64),
    overseasPartnerType enum ('Company', 'Institution', 'Others'),
    PRIMARY KEY (programID, countryCode, city)
    FOREIGN KEY (countryCode) REFERENCES countries (countryCode),
);

-- Edge case: Trips that include multiple destinations
CREATE TABLE IF NOT EXISTS tripsDone (
    studAdmin char(7) not null,
    programID char(9) not null,
    comments text,
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

CREATE TABLE IF NOT EXISTS plannedTrips (
    tripID int AUTO_INCREMENT,
    programType ENUM
    ('Overseas educational trip', 'Overseas internship program', 'Overseas immersion program', 
    'Overseas Competition/Exchange', 'Overseas Leadership Training', 'Overseas Leadership Training with Outward Bound',
    'Overseas Service Learning-Youth Expedition Programme'),
    country char(2),
    city varchar(64),
    date varchar(64),
    tripLeaders varchar(512),
    EstNumStudents int NOT NULL,
    Approved ENUM('Yes','No'),
    PRIMARY KEY (tripID),//
    FOREIGN KEY (programID) REFERENCES overseasPrograms (programID)
);】



