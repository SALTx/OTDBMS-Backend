
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
CREATE TABLE IF NOT EXISTS overseasPrograms (
    programID char(6) NOT NULL,
    programName varchar(64),
    programType ENUM('Overseas educational trip', 'Overseas internship program', 'Overseas immersion program', 
    'Overseas Competition/Exchange', 'Overseas Leadership Training', 'Overseas Leadership Training with Outward Bound',
     'Overseas Service Learning-Youth Expedition Programme')
    --programType enum ('OET', 'OITP', 'OIMP', 'Others'),
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
INSERT INTO `countries` (`countryCode`, `countryName`, `aciCountry`) VALUES ('AF', 'Afghanistan', 'No'),
('AX', 'Åland Islands', 'No'),
('AL', 'Albania', 'No'),
('DZ', 'Algeria', 'No'),
('AS', 'American Samoa', 'No'),
('AD', 'AndorrA', 'No'),
('AO', 'Angola', 'No'),
('AI', 'Anguilla', 'No'),
('AQ', 'Antarctica', 'No'),
('AG', 'Antigua and Barbuda', 'No'),
('AR', 'Argentina', 'No'),
('AM', 'Armenia', 'No'),
('AW', 'Aruba', 'No'),
('AU', 'Australia', 'No'),
('AT', 'Austria', 'No'),
('AZ', 'Azerbaijan', 'No'),
('BS', 'Bahamas', 'No'),
('BH', 'Bahrain', 'No'),
('BD', 'Bangladesh', 'No'),
('BB', 'Barbados', 'No'),
('BY', 'Belarus', 'No'),
('BE', 'Belgium', 'No'),
('BZ', 'Belize', 'No'),
('BJ', 'Benin', 'No'),
('BM', 'Bermuda', 'No'),
('BT', 'Bhutan', 'No'),
('BO', 'Bolivia', 'No'),
('BA', 'Bosnia and Herzegovina', 'No'),
('BW', 'Botswana', 'No'),
('BV', 'Bouvet Island', 'No'),
('BR', 'Brazil', 'No'),
('IO', 'British Indian Ocean Territory', 'No'),
('BN', 'Brunei Darussalam', 'Yes'),
('BG', 'Bulgaria', 'No'),
('BF', 'Burkina Faso', 'No'),
('BI', 'Burundi', 'No'),
('KH', 'Cambodia', 'Yes'),
('CM', 'Cameroon', 'No'),
('CA', 'Canada', 'No'),
('CV', 'Cape Verde', 'No'),
('KY', 'Cayman Islands', 'No'),
('CF', 'Central African Republic', 'No'),
('TD', 'Chad', 'No'),
('CL', 'Chile', 'No'),
('CN', 'China', 'Yes'),
('CX', 'Christmas Island', 'No'),
('CC', 'Cocos (Keeling) Islands', 'No'),
('CO', 'Colombia', 'No'),
('KM', 'Comoros', 'No'),
('CG', 'Congo', 'No'),
('CD', 'Congo, The Democratic Republic of the', 'No'),
('CK', 'Cook Islands', 'No'),
('CR', 'Costa Rica', 'No'),
('CI', 'Cote D"Ivoire', 'No'),
('HR', 'Croatia', 'No'),
('CU', 'Cuba', 'No'),
('CY', 'Cyprus', 'No'),
('CZ', 'Czech Republic', 'No'),
('DK', 'Denmark', 'No'),
('DJ', 'Djibouti', 'No'),
('DM', 'Dominica', 'No'),
('DO', 'Dominican Republic', 'No'),
('EC', 'Ecuador', 'No'),
('EG', 'Egypt', 'No'),
('SV', 'El Salvador', 'No'),
('GQ', 'Equatorial Guinea', 'No'),
('ER', 'Eritrea', 'No'),
('EE', 'Estonia', 'No'),
('ET', 'Ethiopia', 'No'),
('FK', 'Falkland Islands (Malvinas)', 'No'),
('FO', 'Faroe Islands', 'No'),
('FJ', 'Fiji', 'No'),
('FI', 'Finland', 'No'),
('FR', 'France', 'No'),
('GF', 'French Guiana', 'No'),
('PF', 'French Polynesia', 'No'),
('TF', 'French Southern Territories', 'No'),
('GA', 'Gabon', 'No'),
('GM', 'Gambia', 'No'),
('GE', 'Georgia', 'No'),
('DE', 'Germany', 'No'),
('GH', 'Ghana', 'No'),
('GI', 'Gibraltar', 'No'),
('GR', 'Greece', 'No'),
('GL', 'Greenland', 'No'),
('GD', 'Grenada', 'No'),
('GP', 'Guadeloupe', 'No'),
('GU', 'Guam', 'No'),
('GT', 'Guatemala', 'No'),
('GG', 'Guernsey', 'No'),
('GN', 'Guinea', 'No'),
('GW', 'Guinea-Bissau', 'No'),
('GY', 'Guyana', 'No'),
('HT', 'Haiti', 'No'),
('HM', 'Heard Island and Mcdonald Islands', 'No'),
('VA', 'Holy See (Vatican City State)', 'No'),
('HN', 'Honduras', 'No'),
('HK', 'Hong Kong', 'Yes'),
('HU', 'Hungary', 'No'),
('IS', 'Iceland', 'No'),
('IN', 'India', 'Yes'),
('ID', 'Indonesia', 'Yes'),
('IR', 'Iran, Islamic Republic Of', 'No'),
('IQ', 'Iraq', 'No'),
('IE', 'Ireland', 'No'),
('IM', 'Isle of Man', 'No'),
('IL', 'Israel', 'No'),
('IT', 'Italy', 'No'),
('JM', 'Jamaica', 'No'),
('JP', 'Japan', 'No'),
('JE', 'Jersey', 'No'),
('JO', 'Jordan', 'No'),
('KZ', 'Kazakhstan', 'No'),
('KE', 'Kenya', 'No'),
('KI', 'Kiribati', 'No'),
('KP', 'Korea, Democratic People"S Republic of', 'No'),
('KR', 'Korea, Republic of', 'No'),
('KW', 'Kuwait', 'No'),
('KG', 'Kyrgyzstan', 'No'),
('LA', 'Lao People"S Democratic Republic', 'Yes'),
('LV', 'Latvia', 'No'),
('LB', 'Lebanon', 'No'),
('LS', 'Lesotho', 'No'),
('LR', 'Liberia', 'No'),
('LY', 'Libyan Arab Jamahiriya', 'No'),
('LI', 'Liechtenstein', 'No'),
('LT', 'Lithuania', 'No'),
('LU', 'Luxembourg', 'No'),
('MO', 'Macao', 'No'),
('MK', 'Macedonia, The Former Yugoslav Republic of', 'No'),
('MG', 'Madagascar', 'No'),
('MW', 'Malawi', 'No'),
('MY', 'Malaysia', 'Yes'),
('MV', 'Maldives', 'No'),
('ML', 'Mali', 'No'),
('MT', 'Malta', 'No'),
('MH', 'Marshall Islands', 'No'),
('MQ', 'Martinique', 'No'),
('MR', 'Mauritania', 'No'),
('MU', 'Mauritius', 'No'),
('YT', 'Mayotte', 'No'),
('MX', 'Mexico', 'No'),
('FM', 'Micronesia, Federated States of', 'No'),
('MD', 'Moldova, Republic of', 'No'),
('MC', 'Monaco', 'No'),
('MN', 'Mongolia', 'No'),
('MS', 'Montserrat', 'No'),
('MA', 'Morocco', 'No'),
('MZ', 'Mozambique', 'No'),
('MM', 'Myanmar', 'Yes'),
('NA', 'Namibia', 'No'),
('NR', 'Nauru', 'No'),
('NP', 'Nepal', 'No'),
('NL', 'Netherlands', 'No'),
('AN', 'Netherlands Antilles', 'No'),
('NC', 'New Caledonia', 'No'),
('NZ', 'New Zealand', 'No'),
('NI', 'Nicaragua', 'No'),
('NE', 'Niger', 'No'),
('NG', 'Nigeria', 'No'),
('NU', 'Niue', 'No'),
('NF', 'Norfolk Island', 'No'),
('MP', 'Northern Mariana Islands', 'No'),
('NO', 'Norway', 'No'),
('OM', 'Oman', 'No'),
('PK', 'Pakistan', 'No'),
('PW', 'Palau', 'No'),
('PS', 'Palestinian Territory, Occupied', 'No'),
('PA', 'Panama', 'No'),
('PG', 'Papua New Guinea', 'No'),
('PY', 'Paraguay', 'No'),
('PE', 'Peru', 'No'),
('PH', 'Philippines', 'Yes'),
('PN', 'Pitcairn', 'No'),
('PL', 'Poland', 'No'),
('PT', 'Portugal', 'No'),
('PR', 'Puerto Rico', 'No'),
('QA', 'Qatar', 'No'),
('RE', 'Reunion', 'No'),
('RO', 'Romania', 'No'),
('RU', 'Russian Federation', 'No'),
('RW', 'RWANDA', 'No'),
('SH', 'Saint Helena', 'No'),
('KN', 'Saint Kitts and Nevis', 'No'),
('LC', 'Saint Lucia', 'No'),
('PM', 'Saint Pierre and Miquelon', 'No'),
('VC', 'Saint Vincent and the Grenadines', 'No'),
('WS', 'Samoa', 'No'),
('SM', 'San Marino', 'No'),
('ST', 'Sao Tome and Principe', 'No'),
('SA', 'Saudi Arabia', 'No'),
('SN', 'Senegal', 'No'),
('CS', 'Serbia and Montenegro', 'No'),
('SC', 'Seychelles', 'No'),
('SL', 'Sierra Leone', 'No'),
('SG', 'Singapore', 'Yes'),
('SK', 'Slovakia', 'No'),
('SI', 'Slovenia', 'No'),
('SB', 'Solomon Islands', 'No'),
('SO', 'Somalia', 'No'),
('ZA', 'South Africa', 'No'),
('GS', 'South Georgia and the South Sandwich Islands', 'No'),
('ES', 'Spain', 'No'),
('LK', 'Sri Lanka', 'No'),
('SD', 'Sudan', 'No'),
('SR', 'Suri"name', 'No'),
('SJ', 'Svalbard and Jan Mayen', 'No'),
('SZ', 'Swaziland', 'No'),
('SE', 'Sweden', 'No'),
('CH', 'Switzerland', 'No'),
('SY', 'Syrian Arab Republic', 'No'),
('TW', 'Taiwan, Province of China', 'Yes'),
('TJ', 'Tajikistan', 'No'),
('TZ', 'Tanzania, United Republic of', 'No'),
('TH', 'Thailand', 'Yes'),
('TL', 'Timor-Leste', 'No'),
('TG', 'Togo', 'No'),
('TK', 'Tokelau', 'No'),
('TO', 'Tonga', 'No'),
('TT', 'Trinidad and Tobago', 'No'),
('TN', 'Tunisia', 'No'),
('TR', 'Turkey', 'No'),
('TM', 'Turkmenistan', 'No'),
('TC', 'Turks and Caicos Islands', 'No'),
('TV', 'Tuvalu', 'No'),
('UG', 'Uganda', 'No'),
('UA', 'Ukraine', 'No'),
('AE', 'United Arab Emirates', 'No'),
('GB', 'United Kingdom', 'No'),
('US', 'United States', 'No'),
('UM', 'United States Minor Outlying Islands', 'No'),
('UY', 'Uruguay', 'No'),
('UZ', 'Uzbekistan', 'No'),
('VU', 'Vanuatu', 'No'),
('VE', 'Venezuela', 'No'),
('VN', 'Viet Nam', 'Yes'),
('VG', 'Virgin Islands, British', 'No'),
('VI', 'Virgin Islands, U.S.', 'No'),
('WF', 'Wallis and Futuna', 'No'),
('EH', 'Western Sahara', 'No'),
('YE', 'Yemen', 'No'),
('ZM', 'Zambia', 'No'),
('ZW', 'Zimbabwe', 'No');

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
('OP001', 'Summer Internship', 'Overseas internship program', '2023-06-01', '2023-08-31', 'SG', 'Singapore', 'ASEAN Company', 'Company'),
('OP002', 'Semester Exchange', 'Overseas educational trip', '2024-01-01', '2024-05-31', 'IN', 'Mumbai', 'Indian University', 'Institution'),
('OP003', 'Cultural Immersion', 'Overseas immersion program', '2022-09-01', '2022-09-15', 'CN', 'Beijing', 'Chinese Institution', 'Institution'),
('OP003', 'Cultural Immersion', 'Overseas immersion program', '2022-09-15', '2022-10-01', 'CN', 'Shanghai', 'Shanghai Institution', 'Institution'),
('OP003', 'Cultural Immersion', 'Overseas immersion program', '2022-10-01', '2022-10-15', 'VN', 'Ho Chi Minh', 'Bach Khoa University', 'Institution'),
('OP004', 'Educational Trip', 'Overseas educational trip', '2022-07-01', '2022-07-10', 'MY', 'Kuala Lumpur', 'ASEAN Education Tours', 'Company');

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


CREATE VIEW KPI1OverseasStudCount AS
SELECT COUNT(DISTINCT studAdmin) AS StudentCount
FROM trips;

CREATE VIEW KPI2ACIcount AS
SELECT COUNT(DISTINCT t.studAdmin) AS StudentCount
FROM trips t
JOIN overseasPrograms op ON t.programID = op.programID
JOIN countries c ON op.countryCode = c.countryCode
WHERE c.aciCountry = 'Yes';

CREATE VIEW KPI3ACIoitp AS
SELECT COUNT(DISTINCT t.studAdmin) AS StudentCount
FROM trips t
JOIN overseasPrograms op ON t.programID = op.programID
JOIN countries c ON op.countryCode = c.countryCode
WHERE c.aciCountry = 'Yes' AND op.programType = 'Overseas internship program';

CREATE VIEW OIMPdetailsView AS
SELECT 
    t.studAdmin, 
    t.programID, 
    op.programName,
    op.city,
    op.partnerName,
    s.course,
    od.gsmCode,
    od.courseCode,
    od.gsmName
FROM trips t
JOIN overseasPrograms op ON t.programID = op.programID
JOIN students s ON t.studAdmin = s.adminNo
JOIN OIMPdetails od ON t.studAdmin = od.studAdmin AND t.programID = od.programID;


DELIMITER //

CREATE PROCEDURE InsertCountry(IN p_countryCode CHAR(2), IN p_countryName VARCHAR(64), IN p_aciCountry ENUM('Yes', 'No'))
BEGIN
    INSERT INTO countries (countryCode, countryName, aciCountry) VALUES (p_countryCode, p_countryName, p_aciCountry);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteCountry(IN p_countryCode CHAR(2))
BEGIN
    DELETE FROM countries WHERE countryCode = p_countryCode;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateStudentStage(IN p_adminNo CHAR(7), IN p_stage TINYINT)
BEGIN
    UPDATE students SET stage = p_stage WHERE adminNo = p_adminNo;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateStudentCitizenshipStatus(IN p_adminNo CHAR(7), IN p_citizenshipStatus ENUM('Singapore citizen', 'Permanent resident', 'Foreigner'))
BEGIN
    UPDATE students SET citizenshipStatus = p_citizenshipStatus WHERE adminNo = p_adminNo;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateStudentCourse(IN p_adminNo CHAR(7), IN p_course CHAR(3))
BEGIN
    UPDATE students SET course = p_course WHERE adminNo = p_adminNo;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertStudent(IN p_adminNo CHAR(7), IN p_name VARCHAR(64), IN p_gender ENUM('Male', 'Female'), IN p_citizenshipStatus ENUM('Singapore citizen', 'Permanent resident', 'Foreigner'), IN p_stage TINYINT, IN p_course CHAR(3), IN p_pemGroup CHAR(6))
BEGIN
    INSERT INTO students (adminNo, name, gender, citizenshipStatus, stage, course, pemGroup) VALUES (p_adminNo, p_name, p_gender, p_citizenshipStatus, p_stage, p_course, p_pemGroup);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeletePemGroup(IN p_pemGroupId CHAR(6))
BEGIN
    DELETE FROM pemGroup WHERE pemGroupId = p_pemGroupId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertPemGroup(IN p_pemGroupId CHAR(6), IN p_pemName VARCHAR(64))
BEGIN
    INSERT INTO pemGroup (pemGroupId, pemName) VALUES (p_pemGroupId, p_pemName);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteCourse(IN p_courseCode CHAR(3))
BEGIN
    DELETE FROM course WHERE courseCode = p_courseCode;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertCourse(IN p_courseCode CHAR(3), IN p_courseName VARCHAR(64), IN p_courseManager VARCHAR(64))
BEGIN
    INSERT INTO course (courseCode, courseName, courseManager) VALUES (p_courseCode, p_courseName, p_courseManager);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateCourseManager(IN p_courseCode CHAR(3), IN p_courseManager VARCHAR(64))
BEGIN
    UPDATE course SET courseManager = p_courseManager WHERE courseCode = p_courseCode;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertOverseasProgram(IN p_programID CHAR(6), IN p_programName VARCHAR(64), IN p_programType ENUM('OET', 'OITP', 'OIMP', 'Others'), IN p_startDate DATE, IN p_endDate DATE, IN p_countryCode CHAR(2), IN p_city VARCHAR(64), IN p_partnerName VARCHAR(64), IN p_overseasPartnerType ENUM('Company', 'Institution', 'Others'))
BEGIN
    INSERT INTO overseasPrograms (programID, programName, programType, startDate, endDate, countryCode, city, partnerName, overseasPartnerType) VALUES (p_programID, p_programName, p_programType, p_startDate, p_endDate, p_countryCode, p_city, p_partnerName, p_overseasPartnerType);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertOIMPdetails(IN p_gsmCode VARCHAR(20), IN p_courseCode CHAR(3), IN p_studAdmin CHAR(7), IN p_gsmName VARCHAR(50), IN p_programID CHAR(6))
BEGIN
    INSERT INTO OIMPdetails (gsmCode, courseCode, studAdmin, gsmName, programID) VALUES (p_gsmCode, p_courseCode, p_studAdmin, p_gsmName, p_programID);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertTrips(IN p_studAdmin CHAR(7), IN p_programID CHAR(6), IN p_comments TEXT)
BEGIN
    INSERT INTO trips (studAdmin, programID, comments) VALUES (p_studAdmin, p_programID, p_comments);
END //
DELIMITER ;



