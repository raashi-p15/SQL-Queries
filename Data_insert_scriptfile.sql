CREATE DATABASE two_db;
USE two_db;

CREATE TABLE STUDENT (
student_id INT,
first_name VARCHAR(50),
last_name VARCHAR(50),
course VARCHAR(50),
major VARCHAR(100),
constraint pk_student
  PRIMARY KEY (student_id)
);

CREATE TABLE COURSE (
course_id INT,
course_name VARCHAR(50),
teacher VARCHAR(200),
constraint pk_course
  PRIMARY KEY (course_id)
);

CREATE TABLE TEACHER (
teacher_id INT,
teacher_name VARCHAR(200),
subject VARCHAR(50),
constraint pk_teacher
   PRIMARY KEY (teacher_id)
);

ALTER TABLE STUDENT
DROP COLUMN course;

ALTER TABLE STUDENT
ADD COLUMN course_id INT;
ALTER TABLE STUDENT
ADD constraint fk_stud_course FOREIGN KEY (course_id) references COURSE (course_id);

ALTER TABLE COURSE
DROP COLUMN teacher;
USE two_db;
ALTER TABLE COURSE
ADD COLUMN teacher_id INT;
ALTER TABLE COURSE
ADD constraint fk_course_teacher FOREIGN KEY (teacher_id) references TEACHER (teacher_id);

ALTER TABLE STUDENT
MODIFY COLUMN first_name VARCHAR(50) NOT NULL;

ALTER TABLE STUDENT
DROP FOREIGN KEY fk_stud_course;

INSERT INTO STUDENT (student_id, first_name, last_name, course_id, major) VALUES
(1, 'Raashi', 'Parashar', 101, 'Bioinformatics'),
(2, 'Gladson', 'Mathew', 106, 'Law'),
(3, 'Ankita', NULL, 102, 'Biotechnology'),
(4, 'Ragini', 'Pewekar', 101, 'Bioinformatics'),
(5, 'Namruta', NULL, 104, 'Data Science'),
(6, 'Siddhi', 'Bandgar', 103, NULL),
(7, 'Shruti', 'Shivankar', 101, 'Bioinformatics');

ALTER TABLE COURSE
DROP FOREIGN KEY fk_course_teacher;

ALTER TABLE COURSE
RENAME COLUMN teacher_id TO HOD_id;

INSERT INTO COURSE (course_id, course_name, HOD_id) VALUES
(101, 'BTech', 1),
(102, 'BE', 2),
(103, 'MSc', 3),
(104, 'BSc', 4),
(105, 'MTech', 5),
(106, 'LLB', 6);

ALTER TABLE STUDENT
ADD constraint fk_stud_course FOREIGN KEY (course_id) references COURSE (course_id);

DROP TABLE TEACHER;
CREATE TABLE HOD (
HOD_id int, 
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50),
subject VARCHAR(50),
course_id int,
constraint pk_hod
   PRIMARY KEY (HOD_id),
constraint fk_hod_course FOREIGN KEY (course_id) references COURSE (course_id)
);

ALTER TABLE HOD
MODIFY COLUMN subject VARCHAR(50) NOT NULL;

UPDATE STUDENT
SET course_id = 101
WHERE first_name = 'Siddhi';

INSERT INTO HOD (HOD_id, first_name, last_name, subject, course_id) VALUES
(1, 'Selvaa', 'Kumar', 'Clinical Enzymology', 101),
(2, 'Mala', 'Parab', 'Animal Tissue Culture', 102),
(3, 'Arpita','Gupte', 'Food Science', 103),
(4, 'Mrunal', 'Gokhale', 'Python for Bioinformatics', 104),
(5, 'Shine','Deavarajan', 'Phyloinformatics', 105),
(6, 'Mahima', 'Shetty', 'IPC and Taxation', 106);

UPDATE STUDENT
SET last_name = 'Bardhan'
WHERE first_name = 'Ankita';

UPDATE STUDENT
SET last_name = 'Shirodkar'
WHERE first_name = 'Namruta';

UPDATE STUDENT
SET major = 'Food Technology'
WHERE first_name = 'Siddhi';

ALTER TABLE STUDENT
ADD COLUMN gender CHAR;

UPDATE STUDENT
SET gender = 'M' 
WHERE student_id = 2;

UPDATE STUDENT 
SET gender = 'F'
WHERE student_id NOT IN (2);

ALTER TABLE STUDENT 
ADD COLUMN email VARCHAR(50);

UPDATE STUDENT
SET email = 'raa.par.bt23@dypatil.edu'
WHERE student_id = 1;

UPDATE STUDENT
SET email = 'gla.mat.bt20@dypatil.edu'
WHERE student_id = 2;

UPDATE STUDENT
SET email = 'ank.bar.bt23@dypatil.edu'
WHERE student_id = 3;

UPDATE STUDENT
SET email = 'rag.pew.bt23@dypatil.edu'
WHERE student_id= 4;

UPDATE STUDENT
SET email = 'nam.shi.bt04@dypatil.edu'
WHERE student_id = 5;

UPDATE STUDENT
SET email = 'sid.ban.bt23@dypatil.edu'
WHERE student_id = 6;

UPDATE STUDENT
SET email = 'shr.shi.bt23@dypatil.edu'
WHERE student_id = 7;

ALTER TABLE STUDENT
ADD COLUMN SGPA DECIMAL(1,1) default 0.0;

ALTER TABLE STUDENT
MODIFY COLUMN SGPA DECIMAL(3,1);

UPDATE STUDENT
SET SGPA = 10.0
WHERE student_id = 1;

UPDATE STUDENT
SET SGPA = 7.4
WHERE student_id = 2;

UPDATE STUDENT
SET SGPA = 8.1
WHERE student_id = 3;

UPDATE STUDENT
SET SGPA = 8.5
WHERE student_id = 4;

UPDATE STUDENT
SET SGPA = 9.6
WHERE student_id = 5;

UPDATE STUDENT
SET SGPA = 6.4
WHERE student_id = 6;

UPDATE STUDENT
SET SGPA = 9.8
WHERE student_id = 7;

DELETE FROM STUDENT
WHERE student_id = 6;

SELECT * FROM STUDENT;

UPDATE STUDENT
SET SGPA = 6.3
WHERE student_id = 5;

SELECT * FROM STUDENT
JOIN COURSE ON STUDENT.course_id = COURSE.course_id
JOIN HOD ON COURSE.HOD_id = HOD.HOD_id;
