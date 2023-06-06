-- Sample data for pemGroup table
INSERT INTO pemGroup (pemGroupId, pemName) VALUES
('PEM001', 'Andy Lim'),
('PEM002', 'David Loo'),
('PEM003', 'Marry Lim');



-- Actual data for course table
INSERT INTO course (courseCode, courseName, courseManager) VALUES
('EGDF94', 'Common Engineering Programme', 'Siew Peng Shorn'),
('EGDF22', 'Advanced & Digital Manufacturing', 'Kent Loo'),
('EGDF11', 'Aeronautical & Aerospace Technology', 'Sneharaj Malankad'),
('EGDF12', 'Aerospace Systems & Management', 'Gan An Zhi'),
('EGDFPA', 'AI & Data Engineering', 'Sophia Wei'),
('EGDF09', 'Biomedical Engineering', 'Poh Kok Kiong'),
('EGDF20', 'Electronic & Computer Engineering', 'Chang Wai Yee'),
('EGDF17', 'Engineering with Business', 'Ang Wei Sin'),
('EGDF21', 'Infocomm & Media Engineering', 'Cheng Yu Hui'),
('EGDF13', 'Nanotechnology & Materials Science', 'Eunice Goh'),
('EGDF19', 'Robotics & Mechatronics', 'David Poh');


-- Sample data for users table
INSERT INTO users (username, password, accountType, name) VALUES
('admin', 'adminpass', 'Admin', 'John Admin'),
('teacher1', 'teacher1pass', 'Teacher', 'Jane Teacher'),
('guest1', 'guest1pass', 'Guest', 'Bob Guest');

