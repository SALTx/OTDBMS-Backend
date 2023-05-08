DROP DATABASE IF EXISTS otdb;
-- create database otdb if it doesn't exist
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
        citizenshipStatus enum (
            'Singapore citizen',
            'Permanent resident',
            'Foreigner'
        ) not null,
        -- consider grouping singaporean and pr together for certain views
        course char(3) not null,
        stage tinyint not null,
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
            'OET',
            'OITP',
            'IMP',
            'Others'
        ),
        startDate date,
        endDate date,
        countryCode char(3),
        city varchar(64),
        -- add city
        partnerName NULL varchar(64),
        -- change to partnerName, overseasPartner (NULLABLE VAL)
        overseasPartnerType enum ('Company', 'Institution', 'Others'),
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




