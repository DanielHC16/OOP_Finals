USE finalsoop;

-- DIMENSION TABLES **

-- 1. SCHOOL YEAR TABLE
CREATE TABLE finalsoop.schoolyear (
    syear VARCHAR(10) NOT NULL PRIMARY KEY
);
INSERT INTO finalsoop.schoolyear (syear) VALUES 
('2020-2021'),
('2021-2022'), 
('2022-2023'),
('2023-2024'),
('2024-2025'),
('2025-2026');

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
-- ('OOP', 'Object Oriented Programming', 3, '2010', 'CISTM', 'A', '2024-09-01', '9999-12-31'); -- Inaccurate OOP
-- 1st Year 1st Sem
('ICC 0101', 'Introduction to Computing (Lec)', '2', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('ICC 0101.1', 'Introduction to Computing (Lab)', '1', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('ICC 0102', 'Fundamentals of Programming (Lec)', '2', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('ICC 0102.1', 'Fundamentals of Programming (Lab)', '1', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('CSC 0102', 'Discrete Structures 1', '3', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('MMW 0001', 'Mathematics in the Modern World', '3', '2010', 'CS', 'A', '2024-08-01', '9999-12-31'),
('PCM 0006', 'Purposive Communication', '3', '2010', 'CHASS', 'A', '2024-08-01', '9999-12-31'),
('FIL 0010', 'Interdisiplinaryong Pagbasa at Pagsulat sa mga Diskurso ng Pagpapahayag', '2', '2010', 'CHASS', 'A', '2024-08-01', '9999-12-31'),
('PATHFIT 1', 'Foundation of Physical Activities', '2', '2010', 'CPT', 'A', '2024-08-01', '9999-12-31'),
('NSTP 1', 'National Service Training Program - ROTC 1 / CWTS 1', '3', '2010', 'CHASS', 'A', '2024-08-01', '9999-12-31'); -- NOTE: NSTP units should be (3) 

INSERT INTO finalsoop.subject (subject_code, description, units, curriculum, college_code, status, date_opened, date_closed) VALUES 
-- 1st Year 2nd Sem
('ICC 0103', 'Intermediate Programming (Lec)', '2', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('ICC 0103.1', 'Intermediate Programming (Lab)', '1', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('ICC 0104', 'Data Structures and Algorithms (Lec)', '2', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('ICC 0104.1', 'Data Structures and Algorithms (Lab)', '1', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('CSC 0211', 'Discrete Structures 2', '3', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('CSC 0223', 'Human Computer Interaction', '3', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('TCW 0005', 'The Contemporary World', '3', '2010', 'CHASS', 'A', '2024-08-01', '9999-12-31'),
('RPH 0004', 'Readings in Philippine History', '3', '2010', 'CHASS', 'A', '2024-08-01', '9999-12-31'),
('LWR 0009', 'Life and Works of Rizal', '3', '2010', 'CHASS', 'A', '2024-08-01', '9999-12-31'),
('RPH 0004', 'PE Elective (12, 13, or 14)', '2', '2010', 'CPT', 'A', '2024-08-01', '9999-12-31'),
('NSTP 2', 'National Service Training Program - ROTC 2 / CWTS 2', '3', '2010', 'CHASS', 'A', '2024-08-01', '9999-12-31');

UPDATE finalsoop.subject -- oops, typo hehe
SET subject_code = 'PATHFIT 2'
WHERE subject_code = 'RPH 0004' AND description = 'PE Elective (12, 13, or 14)';


INSERT INTO finalsoop.subject (subject_code, description, units, curriculum, college_code, status, date_opened, date_closed) VALUES 
-- 2nd Year 1st Sem
('CSC 0213', 'Logic Design and Digital Computer Circuits (Lec)', '2', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('CSC 0213.1', 'Logic Design and Digital Computer Circuits (Lab)', '1', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('CSC 0212', 'Object Oriented Programming (Lec)', '2', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('CSC 0212.1', 'Object Oriented Programming (Lab)', '1', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('CSC 0224', 'Operation Research', '3', '2010', 'CS', 'A', '2024-08-01', '9999-12-31'),
('ICC 0105', 'Information Management (Lec)', '2', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('ICC 0105.1', 'Information Management (Lab)', '1', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('ITE 0001', 'Living in the IT Era', '3', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('ETH 0008', 'Ethics', '3', '2010', 'CHASS', 'A', '2024-08-01', '9999-12-31'),
('UTS 0003', 'Understanding the Self', '3', '2010', 'CHASS', 'A', '2024-08-01', '9999-12-31'),
('PATHFIT 3', 'PE Elective (12, 13, 14)', '2', '2010', 'CPT', 'A', '2024-08-01', '9999-12-31');

-- 2nd Year 2nd Sem
INSERT INTO finalsoop.subject (subject_code, description, units, curriculum, college_code, status, date_opened, date_closed) VALUES 
('CSC 0221', 'Algorithm and Complexity', '3', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('CSC 0222', 'Architecture and Organization (Lec)', '2', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('CSC 0222.1', 'Architecture and Organization (Lab)', '1', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('ICC 0106', 'Applications Development and Emerging Technologies (Lec)', '2', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('ICC 0106.1', 'Applications Development and Emerging Technologies (Lab)', '1', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('CSC 0316', 'Information Assurance Security', '3', '2010', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('CBM 0016', 'The Entrepreneural Mind', '3', '2010', 'CHASS', 'A', '2024-08-01', '9999-12-31'),
('GES 0013', 'Environmental Science', '3', '2010', 'CS', 'A', '2024-08-01', '9999-12-31'),
('AAP 0007', 'Art Appreciation', '3', '2010', 'CHASS', 'A', '2024-08-01', '9999-12-31'),
('PATHFIT 4', 'PE Elective (12, 13, or 14)', '2', '2010', 'CPT', 'A', '2024-08-01', '9999-12-31');

-- 1st Year 1st Sem BS IT

-- INSERT INTO finalsoop.subject (subject_code, description, units, curriculum, college_code, status, date_opened, date_closed) VALUES
-- ('STS 0002', 'Science, Technology and Society', '3', '2011', 'CS', 'A', '2024-08-01', '9999-12-31'), 
-- ('AAP 0007', 'Art Appreciation', '3', '2011', 'CHASS', 'A', '2024-08-01', '9999-12-31'), 
-- ('PCM 0006', 'Purposive Communications', '3', '2011', 'CHASS', 'A', '2024-08-01', '9999-12-31'),
-- ('MMW 0001', 'Mathematics in the Modern World', '3', '2011', 'CEd', 'A', '2024-08-01', '9999-12-31'),
-- ('IPP 0010', 'Interdisiplinaryong Pagbasa at Pagsulat sa mga Diskurso ng Pagpapahayag', '3', '2011', 'CHASS', 'A', '2024-08-01', '9999-12-31'),
-- ('ICC 0101', 'Introduction to Computing (Lec)', '2', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
-- ('ICC 0101.1', 'Introduction to Computing (Lab) (Office and Multimedia)', '1', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
-- ('ICC 0102', 'Fundamentals of Programming (Lec)', '2', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'), 
-- ('ICC 0102.1', 'Fundamentals of Programming (Lab)', '1', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
-- ('PED 0001', 'Foundation of Physical Activities', '2', '2011', 'CPT', 'A', '2024-08-01', '9999-12-31'),
-- ('NSTP 1', 'National Service Training Program - ROTC 1/CWTS 1', '2', '2011', 'CPA', 'A', '2024-08-01', '9999-12-31');

-- 1st Year 2nd Sem BS IT
INSERT INTO finalsoop.subject (subject_code, description, units, curriculum, college_code, status, date_opened, date_closed) VALUES 
('CET 0111', 'Calculus 1', '3', '2011', 'CS', 'A', '2024-08-01', '9999-12-31'),
('CET 0114', 'General Chemistry (Lec)', '3', '2011', 'CS', 'A', '2024-08-01', '9999-12-31'),
('CET 0114.1', 'General Chemistry (Lab)', '1', '2011', 'CS', 'A', '2024-08-01', '9999-12-31'),
('EIT 0121', 'Introduction to Computer Human Interaction (Lec)', '2', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'), 
('EIT 0121.1', 'Introduction to Computer Human Interaction (Lab)', '1', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('EIT 0122', 'Discrete Mathematics', '3', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('EIT 0123', 'Web Systems Technology (Lec)', '2', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'), 
('EIT 0123.1', 'Web Systems Technology (Lab)', '1', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
-- ('ICC 0103', 'Intermediate Programming (Lec)', '2', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
-- ('ICC 0103.1', 'Intermediate Programming (Lab)', '1', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('GTB121', 'Great Books', '3', '2011', 'CPT', 'A', '2024-08-01', '9999-12-31');
-- ('PED', 'PE Elective (12, 13, or 14)', '2', '2011', 'CPT', 'A', '2024-08-01', '9999-12-31'),
-- ('NSTP 2', 'National Service Training Program - ROTC 2/CTWS 2', '3', '2011', 'CPA', 'A', '2024-08-01', '9999-12-31');

-- 2nd Year 1st Sem BS IT 
INSERT INTO finalsoop.subject (subject_code, description, units, curriculum, college_code, status, date_opened, date_closed) VALUES
('CET 0121', 'Calculus 2', '3', '2011', 'CS', 'A', '2024-08-01', '9999-12-31'),
('CET 0225', 'Physics for IT (Lec)', '3', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('CET 0225.1', 'Physics for IT (Lab)', '1', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
-- ('TCW 0005', 'The Contemporary World', '3', '2011', 'CHASS', 'A', '2024-08-01', '9999-12-31'),
-- ('ICC 0104', 'Data Structures (Lec)', '2', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'), -- Duplicate for CS 
-- ('ICC 0104.1', 'Data Structures (Lab)', '1', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'), 
('EIT 0211', 'Object Oriented Programming (Lec)', '2', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('EIT 0211.1', 'Object Oriented Programming (Lab)', '1', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'), 
('PPC 121', 'Philippine Popular Culture', '3', '2011', 'CHASS', 'A', '2024-08-01', '9999-12-31');
-- ('EIT Elective 1', 'Professional Elective 1', '3', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'); -- Data too long for CLASS CODE
-- ('PED', 'PE Elective (12, 13, or 14)', '2', '2011', 'CPT', 'A', '2024-08-01', '9999-12-31')

-- 2nd Year 2nd Sem
INSERT INTO finalsoop.subject (subject_code, description, units, curriculum, college_code, status, date_opened, date_closed) VALUES
-- ('UTS 0003', 'Understanding the Self', '3', '2011', 'CS', 'A', '2024-08-01', '9999-12-31'),
-- ('RPH 0004', 'Readings in Philippine History', '3', '2011', 'CHASS', 'A', '2024-08-01', '9999-12-31'),
('EIT 0212', 'Platform Technology', '3', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
-- ('ICC 0105', 'Information Management (Lec)', '2', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'), 
-- ('ICC 0105.1', 'Information Management (Lab)', '1', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('EIT 0221', 'Quantitative Methods', '3', '2011', 'CS', 'A', '2024-08-01', '9999-12-31'),
('EIT 0222', 'Networking 1 (Lec)', '2', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31'),
('EIT 0222.1', 'Networking 1 (Lab)', '1', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31');
-- ('GES 0013', 'Environmental Science', '3', '2011', 'CS', 'A', '2024-08-01', '9999-12-31'),
-- ('EIT Elective 2', 'Professional Elective 2', '3', '2011', 'CISTM', 'A', '2024-08-01', '9999-12-31') -- DATA TOO LONG
-- ('PED', 'PE Elective (12, 13, or 14)', '2', '2011', 'CPT', 'A', '2024-08-01', '9999-12-31');


-- 8. BUILDING TABLE
CREATE TABLE finalsoop.building (
    room VARCHAR(10) NOT NULL,
    building_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (room)
);

INSERT INTO finalsoop.building (room, building_name)
VALUES 
    ('GCA301', 'GCA'),
    ('GCA302', 'GCA'),
    ('GCA303', 'GCA'),
    ('GCA304', 'GCA'),
    ('GCA305', 'GCA'),
    ('GCA306', 'GCA'),
    ('GCA307', 'GCA');


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

-- BUILDING TABLE UPDATE
ALTER TABLE finalsoop.subject_schedule
ADD CONSTRAINT room_fk FOREIGN KEY (room) REFERENCES finalsoop.building(room);

INSERT INTO finalsoop.subject_schedule ( syear, semester, college_code, block_no, subject_code, day, time, room, type, sequence_no, employee_id) VALUES 
('2024-2025', '1', 'CISTM', '1', 'CSC 0211', 'M', '8:00-9:30', 'GCA307', 'Lecture', 1, 'E004');






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
-- ('2023-2024', '1', '12345', 'OOP', 'CS21', 3.00),
-- ('2023-2024', '1', '12346', 'OOP', 'CS21', 2.75);
('2023-2024', '1', '12345', 'CSC 0212', 'CS21', 3.00),
('2023-2024', '1', '12346', 'CSC 0212', 'CS21', 2.75);

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

-- Populating Tables **

-- COLLEGE TABLE 
INSERT INTO finalsoop.college (college_code, description, date_opened, date_closed, status) VALUES 
	-- ('CASBE', 'College of Architecture and Sustainable Built Environments', '1970-01-01', '9999-12-31', 'A'), -- NOTE: DATE FORMAT = YYYY/MM/DD
    ('CA', 'College of Accountancy', '1970-01-01', '9999-12-31', 'A'),
    ('CBA', 'College of Business Administration', '1970-01-01', '9999-12-21', 'A'),
    -- ('CEng', 'College of Engineering', '1970-08-01', '9999-12-31', 'A'),
    ('CHASS', 'College of Humanities, Arts and Social Sciences', '1970-01-01', '9999-12-31', 'A'),
    ('CN', 'College of Nursing', '1970-01-01', '9999-12-31', 'A'),
    ('CPT', 'College of Physial Therapy', '1970-01-01', '9999-12-31', 'A'),
    ('CS', 'College of Science', '1970-01-01', '9999-12-31', 'A'),
    ('CED', 'College of Education', '1970-01-01', '9999-12-31', 'A'),
    ('CEng', 'College of Engineering', '1970-01-01', '9999-12-31', 'A'),
    ('CPA', 'College of Public Administration', '1970-01-01', '9999-12-31', 'A');
	-- ('CET', 'College of Engineering and Technology', '1970-06-01', '9999-12-31', 'A'),
	-- ('CISTM', 'College of Information, Systems and Technology Management', '2024-09-01', '9999-12-31', 'A');
    
ALTER TABLE finalsoop.course
MODIFY COLUMN course_code VARCHAR(30);


-- COURSE TABLE
INSERT INTO finalsoop.course (course_code, description, college_code, date_opened, date_closed, status) VALUES 
   -- ('BS Arch', 'Bachelor of Science in Architecture', 'CASBE', '2000-01-01', '9999-12-31', 'A'),
    ('BSA', 'Bachelor of Science in Accountancy', 'CA', '2000-01-01', '9999-12-31', 'A'),
    ('BS BA-FM', 'Bachelor of Science in Business Administration major in Financial Management', 'CBA', '2000-01-01', '9999-12-31', 'A'),
    ('BS BA-MM', 'Bachelor of Science in Business Administration major in Marketing Management', 'CBA', '2000-01-01', '9999-12-31', 'A'),
    ('BS BA-BE', 'Bachelor of Science in Business Administration major in Business Economics', 'CBA', '2000-01-01', '9999-12-31', 'A'),
    ('BS Entrep', 'Bachelor of Science in Entrepreneurship', 'CBA', '2000-01-01', '9999-12-31', 'A'),
    ('BS HM', 'Bachelor of Science in Hospitality Management', 'CBA', '2000-01-01', '9999-12-31', 'A'),
    ('BS REM', 'Bachelor of Science in Real Estate Management', 'CBA', '2000-01-01', '9999-12-31', 'A'),
    ('BS TM', 'Bachelor of Science in Tourism Management', 'CBA', '2000-01-01', '9999-12-31', 'A'),
    ('BS CHE', 'Bachelor of Science in Chemical Engineering', 'CEng', '2000-01-01', '9999-12-31', 'A'),
    ('BS CE', 'Bachelor of Science in Civil Engineering', 'CEng', '2000-01-01', '9999-12-31', 'A'),
    ('BS CpE', 'Bachelor of Science in Computer Engineering', 'CEng', '2000-01-01', '9999-12-31', 'A'),
    ('BS EE', 'Bachelor of Science in Electrical Engineering', 'CEng', '2000-01-01', '9999-12-31', 'A'),
    ('BS ECE', 'Bachelor of Science in Electronics Engineering', 'CEng', '2000-01-01', '9999-12-31', 'A'),
    ('BS ME', 'Bachelor of Science in Mechanical Engineering', 'CEng', '2000-01-01', '9999-12-31', 'A'),
    ('BS MfgE', 'Bachelor of Science in Manufacturing Engineering', 'CEng', '2000-01-01', '9999-12-31', 'A'),
   -- ('BS CS', 'Bachelor of Science in Computer Science', 'CISTM', '2000-01-01', '9999-12-31', 'A'),
   -- ('BS IT', 'Bachelor of Science in Information Technology', 'CISTM', '2000-01-01', '9999-12-31', 'A'),
    ('BAC', 'Bachelor of Science in Communication', 'CHASS', '2000-01-01', '9999-12-31', 'A'),
    ('BAC-PR', 'Bachelor of Science Communication major in Public Relations', 'CHASS', '2000-01-01', '9999-12-31', 'A'),
    ('BMMP', 'Bachelor of Music in Music Performance', 'CHASS', '2000-01-01', '9999-12-31', 'A'),
    ('BS SW', 'Bachelor of Science in Social Work', 'CHASS', '2000-01-01', '9999-12-31', 'A'),
    ('BSN', 'Bachelor of Science in Nursing', 'CN', '2000-01-01', '9999-12-31', 'A'),
    ('BS PT', 'Bachelor of Science in Physical Therapy', 'CPT', '2000-01-01', '9999-12-31', 'A'),
    ('BS Bio', 'Bachelor of Science in Biology', 'CS', '2000-01-01', '9999-12-31', 'A'),
    ('BS Math', 'Bachelor of Science in Mathematics', 'CS', '2000-01-01', '9999-12-31', 'A'),
    ('BS Chem', 'Bachelor of Science in Chemistry', 'CS', '2000-01-01', '9999-12-31', 'A'),
    ('BS Psy', 'Bachelor of Science in Psychology', 'CS', '2000-01-01', '9999-12-31', 'A'),
    ('BEEd', 'Bachelor of Elementary Education', 'CED', '2000-01-01', '9999-12-31', 'A'),
    ('BECED', 'Bachelor of Early Childhood Education', 'CED', '2000-01-01', '9999-12-31', 'A'),
    ('BSNED Generalist', 'Bachelor of Special Needs Education', 'CED', '2000-01-01', '9999-12-31', 'A'),
    ('BPEd', 'Bachelor of Physical Education', 'CED', '2000-01-01', '9999-12-31', 'A'),
    ('BSEd-Eng', 'Bachelor of Secondary Education with Specialization in English', 'CED', '2000-01-01', '9999-12-31', 'A'),
    ('BSEd-Fil', 'Bachelor of Secondary Education with Specialization in Filipino', 'CED', '2000-01-01', '9999-12-31', 'A'),
    ('BSEd-Math', 'Bachelor of Secondary Education with Specialization in Mathematics', 'CED', '2000-01-01', '9999-12-31', 'A'),
    ('BSEd-Sci', 'Bachelor of Secondary Education with Specialization in Science', 'CED', '2000-01-01', '9999-12-31', 'A'),
    ('BSEd-SS', 'Bachelor of Secondary Education with Specialization in Social Studies', 'CED', '2000-01-01', '9999-12-31', 'A'),
    ('BPA', 'Bachelor of Public Administration', 'CPA', '2000-01-01', '9999-12-31', 'A');
-- ('BSCS-CS', 'BSComputer Studies-Computer Science', 'CET', '2000-06-01', '9999-12-31', 'A'),
-- ('BSCS-IT', 'BSComputer Studies-Information Technology', 'CISTM', '2000-06-01', '9999-12-31', 'A');


-- STUDENT TABLE
INSERT INTO finalsoop.student (student_no, lastname, firstname, email, gender, course_code, cp_num, address, bday, status, date_started, date_graduated) VALUES 
    ('2023-34017', 'Balboa', 'Marc Jerome', 'mcbalboa@gmail.com', 'M', 'BS CS', '09321722905', 'Tondo', '2004-07-26', 'A', '2023-08-01', '2027-08-01'),
    ('2023-34033', 'Camacho', 'Daniel Hardy', 'dccamacho@gmail.com', 'M', 'BS CS', '09567434580', 'Sta. Mesa', '2004-09-16', 'A', '2023-08-01', '2027-08-01'),
    ('2023-34026', 'Magbag', 'Dave', 'dmagbag@gmail.com', 'M', 'BS CS', '09994110531', 'Abad Santos', '2005-05-07', 'A', '2023-08-01', '2027-08-01'),
	('2024-535', 'Flowers', 'Ramona', 'ramona.flowers@scanner.com', 'F', 'BS CS', '09171234567', 'Brooklyn', '1990-10-04', 'A', '2023-08-01', '2027-08-01'),
	-- ('12345', 'Atienza', 'Francis', 'fcatienza@yahoo.com', 'M', 'BS CS', '0998123456', 'Cavite', '2000-01-12', 'I', '2020-09-01', '2024-07-31'),
	-- ('12346', 'Aquino', 'Kris', 'aquinok@yahoo.com', 'F', 'BS CS', '0998654321', 'Tarlac', '2000-02-14', 'A', '2022-09-01', '9999-12-31'),
    ('77777', 'Miller', 'George', 'joji@gmail.com', 'M', 'BS IT', '099342123', 'Japan', '2000-02-14', 'A', '2020-09-01', '9999-12-31');
 INSERT INTO finalsoop.student (student_no, lastname, firstname, email, gender, course_code, cp_num, address, bday, status, date_started, date_graduated) VALUES 
	('007', 'Pilgrim', 'Scott', 'vstheworld@yahoo.com', 'M', 'BS CHE', '09767676', 'Toronto', '2002-01-01', 'I', '2019-09-01', '9999-12-31'),
	('420', 'Lee', 'Stan', 'stanlee@marvel.com', 'M', 'BS BA-FM', '09123456789', 'Marvel Mansion, NY', '1922-12-28', 'A', '2020-09-01', '2024-12-31'),
	('1989', 'Wayne', 'Bruce', 'batman@justiceleague.com', 'M', 'BS EE', '09123456789', 'Wayne Manor, Gotham', '1939-05-27', 'A', '2019-09-01', '2024-12-31'),
	('616', 'Parker', 'Peter', 'peterparker@webmail.com', 'M', 'BS CS', '09123456789', 'Queens, NY', '1995-08-10', 'A', '2020-09-01', '2024-12-31'),
	('13', 'Gomez', 'Wednesday', 'wednesdaygomez@addams.com', 'F', 'BS Psy', '09123456789', 'Addams Family Mansion', '2000-09-21', 'A', '2020-09-01', '2024-12-31'),
	('25', 'Kardashian', 'Kim', 'kim@kimkardashian.com', 'F', 'BS BA-MM', '09123456789', 'Los Angeles, CA', '1980-10-21', 'A', '2020-09-01', '2024-12-31'),
	('00', 'Gates', 'Bill', 'billgates@microsoft.com', 'M', 'BS IT', '09123456789', 'Medina, WA', '1955-10-28', 'A', '2020-09-01', '2024-12-31'),
	('16', 'Doge', 'Shiba Inu', 'dogecoin@shibatoken.com', 'M', 'BS BA-BE', '09123456789', 'Shiba Land, Japan', '2013-12-06', 'A', '2020-09-01', '2024-12-31'),
	('777', 'Reeves', 'Keanu', 'keanu@keanuisgod.com', 'M', 'BS CHE', '09123456789', 'Hollywood, CA', '1964-09-02', 'A', '2020-09-01', '2024-12-31'),
	('100', 'Lizzo', 'Melissa', 'lizzo@music.com', 'F', 'BS BA-FM', '09123456789', 'Detroit, MI', '1988-04-27', 'A', '2020-09-01', '2024-12-31'),
	('21', 'Jack', 'Jack', 'blackjack@meme.com', 'M', 'BS TM', '09123456789', 'Meme Town', '2005-03-14', 'A', '2020-09-01', '2024-12-31');


    

-- TRUNCATE TABLE finalsoop.student;

-- EMPLOYEE TABLE
INSERT INTO finalsoop.employee (employee_id, lastname, firstname, email, gender, cp_num, address, bday, status, date_started, date_resigned) VALUES 
	('E003', 'Pascual', 'Elsa', 'epasaual@yahoo.com', 'F', '091234567', 'Manila', NULL, 'A', '2001-09-16', '9999-12-31'),
    ('E004', 'Demegillo', 'Shiela', 'sdemegillo@yahoo.com', 'F', '09987654', 'Rizal', NULL, 'A', '2016-09-12', '9999-12-31'),
	('E005', 'Foe', 'Jonathan', 'jfoe@yahoo.com', 'M', '09675931', 'Chicago', NULL, 'A', '2000-12-23', '9999-12-31');
    
-- ('E001', 'Regala', 'Richard', 'rregala@yahoo.com', 'M', '09987654321', 'Manila', NULL, 'A', '1994-06-01', '9999-12-31'),
-- ('E002', 'Santos', 'Rene', 'rsantos@yahoo.com', 'M', '09997654321', 'Manila', NULL, 'A', '2000-06-01', '9999-12-31');


-- USED FOR UPDATING CS/IT COURSE CODES **
-- NOTE: Truncate Students Table then Re-insert with updated queries
-- Step 1: Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Step 2: Delete the old course records
DELETE FROM finalsoop.course
WHERE course_code IN ('BSCS-CS', 'BSCS-IT');

-- Step 3: Insert the new course records
INSERT INTO finalsoop.course (course_code, description, college_code, date_opened, date_closed, status) VALUES
('BS CS', 'Bachelor of Science in Computer Science', 'CISTM', '2000-06-01', '9999-12-31', 'A'),
('BS IT', 'Bachelor of Science in Information Technology', 'CISTM', '2000-06-01', '9999-12-31', 'A');

-- Step 4: Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;



SELECT college_code FROM finalsoop.college;
DESCRIBE finalsoop.course;
DESCRIBE finalsoop.college;



