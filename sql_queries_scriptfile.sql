USE two_db;

SELECT * FROM STUDENT; 

SELECT first_name, last_name, major FROM STUDENT; 

SELECT student_id, first_name, SGPA
FROM STUDENT
WHERE SGPA > 9.0;

SELECT student_id, first_name, last_name
FROM STUDENT
WHERE major = 'Bioinformatics';

SELECT student_id, first_name, SGPA
FROM STUDENT
ORDER BY SGPA DESC;

SELECT student_id, first_name, SGPA
FROM STUDENT
ORDER BY SGPA DESC
LIMIT 3;

SELECT first_name, last_name, major, gender
FROM STUDENT
WHERE gender = 'F' AND major = 'Bioinformatics';

SELECT first_name, last_name, SGPA, major
FROM STUDENT
WHERE SGPA < 7.0 OR major = 'Law';

SELECT first_name, last_name, SGPA
FROM STUDENT
WHERE SGPA BETWEEN 8.0 AND 9.0;

SELECT first_name, last_name, course_id
FROM STUDENT
WHERE course_id IN (101, 104);

SELECT * FROM course;

SELECT course_id FROM course
WHERE course_name LIKE 'B%';

SELECT HOD_id FROM course 
ORDER BY course_id DESC;

SELECT * FROM hod;

SELECT first_name, last_name FROM hod
WHERE subject NOT IN ('Animal Tissue Culture', 'Food Science')
ORDER BY last_name DESC
LIMIT 2;

SELECT first_name AS 'This Teacher', subject AS 'Teaches' FROM hod
WHERE course_id <> 104;

SELECT * FROM hod
WHERE HOD_id = 1 OR HOD_id = 4

SELECT * FROM STUDENT
WHERE gender = 'F' AND course_id BETWEEN 101 AND 105 AND SGPA >9;
