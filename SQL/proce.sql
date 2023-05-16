DELIMITER //

CREATE PROCEDURE AddNewStudent(
  IN p_adminNo CHAR(7),
  IN p_name VARCHAR(64),
  IN p_gender ENUM('Male', 'Female'),
  IN p_citizenshipStatus ENUM('Singapore citizen', 'Permanent resident', 'Foreigner'),
  IN p_course CHAR(3),
  IN p_stage TINYINT,
  IN p_pemGroup CHAR(6)
)
BEGIN
  INSERT INTO students (adminNo, name, gender, citizenshipStatus, course, stage, pemGroup)
  VALUES (p_adminNo, p_name, p_gender, p_citizenshipStatus, p_course, p_stage, p_pemGroup);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE UpdateProgramDates(
  IN p_programID CHAR(6),
  IN p_startDate DATE,
  IN p_endDate DATE
)
BEGIN
  UPDATE overseasPrograms
  SET startDate = p_startDate, endDate = p_endDate
  WHERE programID = p_programID;
END //

DELIMITER ;