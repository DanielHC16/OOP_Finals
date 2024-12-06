CREATE TABLE oopfinals;
USE oopfinals;

-- DIMENSION TABLES **

-- 1. SCHOOL YEAR TABLE
CREATE TABLE finalsoop.schoolyear (
    syear VARCHAR(10) NOT NULL PRIMARY KEY
);
INSERT INTO finalsoop.schoolyear (syear) VALUES 
('2023-2024'),
('2024-2025');

-- 2. SEMESTER TABLE
CREATE TABLE finalsoop.semester (
    semester VARCHAR(1) NOT NULL PRIMARY KEY
);
INSERT INTO finalsoop.semester (semester) VALUES 
('1'),
('2'),
('3'),
('S');

-- 3. COLLEGE TABLE
CREATE TABLE finalsoop.college (
    college_code VARCHAR(10) NOT NULL PRIMARY KEY,
    description VARCHAR(255),
    date_opened DATE,
    date_closed DATE,
    status CHAR(1) DEFAULT 'A'
);
INSERT INTO finalsoop.college (college_code, description, date_opened, date_closed, status) VALUES 
('CET', 'College of Engineering and Technology', '1970-06-01', '9999-12-31', 'A'),
('CISTM', 'College of Information, Systems and Technology Management', '2024-09-01', '9999-12-31', 'A');

-- 4. COURSE TABLE
CREATE TABLE finalsoop.course (
    course_code VARCHAR(10) NOT NULL PRIMARY KEY,
    description VARCHAR(255),
    college_code VARCHAR(10) NOT NULL,
    date_opened DATE,
    date_closed DATE,
    status CHAR(1) DEFAULT 'A',
    CONSTRAINT course_college_fk FOREIGN KEY (college_code) REFERENCES finalsoop.college(college_code)
);
INSERT INTO finalsoop.course (course_code, description, college_code, date_opened, date_closed, status) VALUES 
('BSCS-CS', 'BSComputer Studies-Computer Science', 'CET', '2000-06-01', '9999-12-31', 'A'),
-- ('BSN', 'BSNursing', 'CN', '2000-06-01', '9999-12-31', 'A'),
('BSCS-IT', 'BSComputer Studies-Information Technology', 'CISTM', '2000-06-01', '9999-12-31', 'A');

-- 5. STUDENT TABLE
CREATE TABLE finalsoop.student (
    student_no VARCHAR(10) NOT NULL PRIMARY KEY,
    lastname VARCHAR(50),
    firstname VARCHAR(50),
    email VARCHAR(100),
    gender CHAR(1),
    course_code VARCHAR(10) NOT NULL,
    cp_num VARCHAR(20),
    address VARCHAR(255),
    bday DATE,
    status CHAR(1),
    date_started DATE,
    date_graduated DATE,
    CONSTRAINT student_course_fk FOREIGN KEY (course_code) REFERENCES finalsoop.course(course_code)
);
INSERT INTO finalsoop.student (student_no, lastname, firstname, email, gender, course_code, cp_num, address, bday, status, date_started, date_graduated) VALUES 
('12345', 'Atienza', 'Francis', 'fcatienza@yahoo.com', 'M', 'BSCS-CS', '0998123456', 'Cavite', '2000-01-12', 'I', '2020-09-01', '2024-07-31'),
('12346', 'Aquino', 'Kris', 'aquinok@yahoo.com', 'F', 'BSCS-CS', '0998654321', 'Tarlac', '2000-02-14', 'A', '2022-09-01', '9999-12-31');

-- 6. EMPLOYEE TABLE
CREATE TABLE finalsoop.employee (
    employee_id VARCHAR(10) NOT NULL PRIMARY KEY,
    lastname VARCHAR(50),
    firstname VARCHAR(50),
    email VARCHAR(100),
    gender CHAR(1),
    cp_num VARCHAR(20),
    address VARCHAR(255),
    bday DATE,
    status CHAR(1),
    date_started DATE,
    date_resigned DATE
);
INSERT INTO finalsoop.employee (employee_id, lastname, firstname, email, gender, cp_num, address, bday, status, date_started, date_resigned) VALUES 
('E001', 'Regala', 'Richard', 'rregala@yahoo.com', 'M', '09987654321', 'Manila', NULL, 'A', '1994-06-01', '9999-12-31'),
('E002', 'Santos', 'Rene', 'rsantos@yahoo.com', 'M', '09997654321', 'Manila', NULL, 'A', '2000-06-01', '9999-12-31');

-- 7. SUBJECT TABLE
CREATE TABLE finalsoop.subject (
    subject_code VARCHAR(10) NOT NULL,
    description VARCHAR(200) NOT NULL,
    units INT DEFAULT 3,
    curriculum VARCHAR(10) DEFAULT '2000',
    college_code VARCHAR(10) NOT NULL,
    status CHAR(1) DEFAULT 'A',
    date_opened DATE,
    date_closed DATE,
    PRIMARY KEY (subject_code, college_code),
    CONSTRAINT subject_college_fk FOREIGN KEY (college_code) REFERENCES finalsoop.college(college_code)
);
INSERT INTO finalsoop.subject (subject_code, description, units, curriculum, college_code, status, date_opened, date_closed) VALUES 
-- ('MTH001', 'Mathematics in the Modern World', 3, '2019', 'CED', 'A', '1995-01-01', '9999-12-31'),
('OOP', 'Object Oriented Programming', 3, '2010', 'CISTM', 'A', '2024-09-01', '9999-12-31');


-- FACT TABLES **

-- 1. SUBJECT SCHEDULE TABLE
CREATE TABLE finalsoop.subject_schedule (
    syear VARCHAR(10) NOT NULL,
    semester VARCHAR(1) NOT NULL,
    college_code VARCHAR(10) NOT NULL,
    block_no VARCHAR(15) NOT NULL,
    subject_code VARCHAR(10) NOT NULL,
    day VARCHAR(10) NOT NULL,
    time VARCHAR(20) NOT NULL,
    room VARCHAR(10) NOT NULL,
    type VARCHAR(10) NOT NULL,
    sequence_no INT DEFAULT 1,
    employee_id VARCHAR(10) DEFAULT 'TBA',
    PRIMARY KEY (syear, semester, block_no, subject_code, sequence_no, college_code),
    CONSTRAINT syear_fk FOREIGN KEY (syear) REFERENCES finalsoop.schoolyear(syear),
    CONSTRAINT semester_fk FOREIGN KEY (semester) REFERENCES finalsoop.semester(semester),
    CONSTRAINT college_code_fk2 FOREIGN KEY (college_code) REFERENCES finalsoop.college(college_code),
    CONSTRAINT subject_code_fk FOREIGN KEY (subject_code) REFERENCES finalsoop.subject(subject_code),
    CONSTRAINT employee_id_fk FOREIGN KEY (employee_id) REFERENCES finalsoop.employee(employee_id)
);
INSERT INTO finalsoop.subject_schedule (syear, semester, college_code, block_no, subject_code, day, time, room, type, sequence_no, employee_id) VALUES 
('2023-2024', '1', 'CISTM', 'CS21', 'OOP', 'S', '8:00-10:00', 'GCA301', 'F2F', 1, 'E001');

-- 2. GRADES TABLE
CREATE TABLE finalsoop.grades (
    syear VARCHAR(10) NOT NULL,
    semester VARCHAR(1) NOT NULL,
    student_no VARCHAR(10) NOT NULL,
    subject_code VARCHAR(10) NOT NULL,
    block_no VARCHAR(15) NOT NULL,
    grade DECIMAL(5,2),
    PRIMARY KEY (syear, semester, student_no, subject_code, block_no),
    CONSTRAINT syear_fk1 FOREIGN KEY (syear) REFERENCES finalsoop.schoolyear(syear),
    CONSTRAINT semester_fk1 FOREIGN KEY (semester) REFERENCES finalsoop.semester(semester),
    CONSTRAINT student_no_fk FOREIGN KEY (student_no) REFERENCES finalsoop.student(student_no),
    CONSTRAINT subject_code_fk1 FOREIGN KEY (subject_code) REFERENCES finalsoop.subject(subject_code)
);
INSERT INTO finalsoop.grades (syear, semester, student_no, subject_code, block_no, grade) VALUES 
('2023-2024', '1', '12345', 'OOP', 'CS21', 3.00),
('2023-2024', '1', '12346', 'OOP', 'CS21', 2.75);

-- VIEWS
-- 1. SUBJECT SCHEDULE VIEW
CREATE OR REPLACE VIEW finalsoop.subject_schedule_view AS
SELECT
    ss.syear AS school_year,
    ss.semester,
    ss.college_code,
    ss.block_no,
    ss.subject_code,
    s.description AS subject_description,
    ss.day,
    ss.time,
    ss.room,
    ss.type,
    ss.sequence_no,
    ss.employee_id,
    CONCAT(e.lastname, ', ', e.firstname) AS faculty_name
FROM
    finalsoop.subject_schedule ss
JOIN
    finalsoop.subject s ON ss.subject_code = s.subject_code
JOIN
    finalsoop.employee e ON ss.employee_id = e.employee_id;
-- 2. GRADES TABLE VIEW
CREATE OR REPLACE VIEW finalsoop.student_grades_view AS
SELECT
    g.syear AS school_year,
    g.semester,
    g.student_no,
    CONCAT(s.lastname, ', ', s.firstname) AS student_name,
    g.subject_code,
    sub.description AS subject_description,
    g.grade
FROM
    finalsoop.grades g
JOIN
    finalsoop.student s ON g.student_no = s.student_no
JOIN
    finalsoop.subject sub ON g.subject_code = sub.subject_code;






