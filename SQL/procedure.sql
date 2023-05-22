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
