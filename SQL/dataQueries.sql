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
('A345678', 'OP003', 'Can''t wait to experience Japanese culture!');
 
-- Sample data for users table
INSERT INTO users (username, password, accountType, name) VALUES
('admin', 'adminpass', 'Admin', 'John Admin'),
('teacher1', 'teacher1pass', 'Teacher', 'Jane Teacher'),
('guest1', 'guest1pass', 'Guest', 'Bob Guest');
