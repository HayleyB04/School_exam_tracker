-- CREATE DATABASE school;

-- USE school;

-- -- This database allows a school to track its students and their exam results for each subject
-- -- The average of all exam results are calculated to generate an overall grade for each student


-- -- CREATE TABLES

-- CREATE TABLE students(
-- student_id INTEGER NOT NULL,
-- first_name VARCHAR(50) NOT NULL,
-- last_name VARCHAR(50) NOT NULL,
-- date_of_birth DATE,
-- email_address VARCHAR(50),
-- overall_grade DECIMAL(5,4),
-- CONSTRAINT PK_student PRIMARY KEY (student_id)
-- );

-- CREATE TABLE subjects(
-- subject_id INTEGER NOT NULL,
-- subject_name VARCHAR(50) NOT NULL,
-- subject_credits INTEGER,
-- no_of_students INTEGER,
-- CONSTRAINT PK_subject PRIMARY KEY (subject_id)
-- );

-- CREATE TABLE exams(
-- student_id INTEGER NOT NULL,
-- subject_id INTEGER NOT NULL,
-- exam_id INTEGER NOT NULL,
-- exam_date DATE,
-- exam_result DECIMAL(5,4),
-- CONSTRAINT PK_grade PRIMARY KEY (exam_id)
-- );

-- -- POPULATE TABLES WITH INITIAL DATA

-- INSERT INTO students
-- (student_id, first_name, last_name, date_of_birth, email_address, overall_grade)
-- VALUES
-- (1, 'Ellie', 'May', '1999-05-28', 'emay23@mail.com', NULL),
-- (2, 'Ben', 'Smith', '2001-02-04', 'lfc2345@mail.com', NULL),
-- (3, 'Harry', 'Knowsley', '2003-12-20', 'harryk@mail.com', NULL),
-- (4, 'Sian', 'Carr', '2000-02-28', 'siansian@mail.com', NULL),
-- (5, 'Sophie', 'Baxter', '2001-10-05', 'sbaxters@mail.com', NULL),
-- (6, 'Sam', 'Baxter', '2001-10-05', 'sambax34@mail.com', NULL),
-- (7, 'Ella', 'Walker', '2000-01-19', 'e.walker@mail.com', NULL),
-- (8, 'Joey', 'Simons', '1999-11-21', 'joey456@mail.com', NULL),
-- (9, 'Amy', 'Wildings', '2001-05-01', 'a.wildings@mail.com', NULL),
-- (10, 'Rocky', 'Lhen', '2002-03-10', 'rocky45@mail.com', NULL);

-- INSERT INTO subjects
-- (subject_id, subject_name, subject_credits, no_of_students)
-- VALUES
-- (1000, 'English', 100, 3),
-- (2000, 'Maths', 100, 3),
-- (3000, 'Science', 100, 3),
-- (4000, 'Technology', 100, 3),
-- (1345, 'French', 50, 3),
-- (3563, 'Art', 50, 4),
-- (8534, 'Music', 50, 2),
-- (1367, 'Spanish', 50, 2);

-- INSERT INTO exams
-- (student_id, subject_id, exam_id, exam_date, exam_result)
-- VALUES
-- (1, 1000, 1001, '2024-06-01', 0),
-- (2, 1000, 1002, '2024-06-01', 0),
-- (3, 1000, 1003, '2024-06-01', 0),
-- (1, 2000, 2001, '2024-06-02', 0),
-- (4, 2000, 2004, '2024-06-02', 0),
-- (5, 2000, 2005, '2024-06-02', 0),
-- (6, 3000, 3006, '2024-06-03', 0),
-- (9, 3000, 3009, '2024-06-03', 0),
-- (10, 3000, 3010, '2024-06-03', 0),
-- (8, 4000, 4008, '2024-06-04', 0),
-- (9, 4000, 4009, '2024-06-04', 0),
-- (10, 4000, 4010, '2024-06-04', 0),
-- (5, 1345, 1345, '2024-06-08', 0),
-- (3, 1345, 1343, '2024-06-08', 0),
-- (6, 1345, 1346, '2024-06-08', 0),
-- (5, 3563, 3565, '2024-06-06', 0),
-- (1, 3563, 3561, '2024-06-06', 0),
-- (2, 3563, 3562, '2024-06-06', 0),
-- (10, 3563, 3510, '2024-06-06', 0),
-- (8, 8534, 8538, '2024-06-10', 0),
-- (3, 8534, 8533, '2024-06-10', 0),
-- (1, 1367, 1361, '2024-06-08', 0),
-- (2, 1367, 1362, '2024-06-08', 0);

-- -- VIEW ALL THE DATA IN EACH TABLE

-- SELECT * FROM students
-- ORDER BY student_id ASC;

-- SELECT * FROM subjects
-- ORDER BY subject_credits DESC;

-- SELECT * FROM exams
-- ORDER BY student_id ASC;

-- -- FIX DECIMAL PLACE ISSUE

-- ALTER TABLE exams
-- MODIFY exam_result DECIMAL(10,2);

-- ALTER TABLE students
-- MODIFY overall_grade DECIMAL(10,2);

-- -- ADD CONSTRAINTS

-- ALTER TABLE exams
-- ADD CONSTRAINT FK_student_id
-- FOREIGN KEY (student_id) REFERENCES students(student_id);

-- ALTER TABLE exams
-- ADD CONSTRAINT FK_subject_id
-- FOREIGN KEY (subject_id) REFERENCES subjects(subject_id);

-- ALTER TABLE students
-- ADD CONSTRAINT UC_student UNIQUE (email_address);

-- ALTER TABLE exams
-- ADD CONSTRAINT CHK_exam_result CHECK (exam_result >=0 AND exam_result <=100);

-- -- INSERT EXAM RESULT DATA FOR STUDENT 1 INTO EXAMS

-- UPDATE exams 
-- SET exam_result = 80.00
-- WHERE student_id = 1 AND exam_id = 1001;

-- UPDATE exams 
-- SET exam_result = 100.00
-- WHERE student_id = 1 AND exam_id = 2001;

-- UPDATE exams 
-- SET exam_result = 90.00
-- WHERE student_id = 1 AND exam_id = 3561;

-- UPDATE exams 
-- SET exam_result = 72.00
-- WHERE student_id = 1 AND exam_id = 1361;

-- -- JOIN TABLES TO SEE ALL OF PUPIL 1's EXAM RESULTS TOGETHER

-- SELECT exams.subject_id, exam_date, exam_result
-- FROM exams
-- INNER JOIN subjects ON exams.subject_id = subjects.subject_id
-- WHERE student_id = 1;

-- -- USING SUM TO GET A STUDENTS TOTAL SCORE FROM ALL EXAMS

-- SELECT SUM(exam_result) AS total_score FROM exams
-- WHERE student_id = 1;

-- -- GET THE STUDENTS AVERAGE GRADE BASED ON ALL EXAM RESULTS

-- SELECT AVG(exam_result) AS average_grade
-- FROM exams
-- WHERE student_id = 1;

-- -- UPDATE THE OVERALL GRADE BASED ON THE EXAM AVERAGE IN THE STUDENTS TABLE

-- UPDATE students
-- SET overall_grade = (SELECT AVG(exam_result) FROM exams WHERE student_id = 1)
-- WHERE student_id = 1;

-- -- SHOW HOW TO DELETE DATA IF NEEDED

-- DELETE FROM exams WHERE exam_id = '1362';

-- -- UPDATE MORE EXAM DATA

-- UPDATE exams 
-- SET exam_result = 30.00
-- WHERE student_id = 2;

-- UPDATE exams 
-- SET exam_result = 97.00
-- WHERE student_id = 3 AND exam_id = 1003;

-- UPDATE exams 
-- SET exam_result = 90.00
-- WHERE student_id = 3 AND exam_id = 1343;

-- UPDATE exams 
-- SET exam_result = 99.00
-- WHERE student_id = 3 AND exam_id = 8533;

-- UPDATE exams 
-- SET exam_result = 44.00
-- WHERE student_id = 4;

-- UPDATE exams 
-- SET exam_result = 60.00
-- WHERE student_id = 5 AND exam_id = 2005;

-- UPDATE exams 
-- SET exam_result = 62.00
-- WHERE student_id = 5 AND exam_id = 1345;

-- UPDATE exams 
-- SET exam_result = 55.00
-- WHERE student_id = 5 AND exam_id = 3565;

-- UPDATE students
-- SET overall_grade = (SELECT AVG(exam_result) FROM exams WHERE student_id = 2)
-- WHERE student_id = 2;

-- UPDATE students
-- SET overall_grade = (SELECT AVG(exam_result) FROM exams WHERE student_id = 3)
-- WHERE student_id = 3;

-- UPDATE students
-- SET overall_grade = (SELECT AVG(exam_result) FROM exams WHERE student_id = 4)
-- WHERE student_id = 4;

-- UPDATE students
-- SET overall_grade = (SELECT AVG(exam_result) FROM exams WHERE student_id = 5)
-- WHERE student_id = 5;

-- -- SEE HOW MANY DAYS THERE WILL BE EXAMS FOR

-- SELECT COUNT(DISTINCT exam_date) FROM exams;

-- -- ONLY VIEW STUDENTS WHOSE EXAM RESULTS HAVE BEEN INPUTTED AND SORT THE DATA

-- SELECT * FROM students
-- WHERE overall_grade >0
-- ORDER BY overall_grade DESC;

-- -- TURN THE ABOVE INTO A STORED PROCEDURE SO THIS CAN BE REPEATED EASILY AS EXAM RESULTS ARE UPDATED

-- DELIMITER //

-- CREATE PROCEDURE GetAllGrades()
-- BEGIN
-- 	SELECT *  FROM students
--     WHERE overall_grade >0
--     ORDER BY overall_grade DESC;
-- END //

-- DELIMITER ;

-- CALL GetAllGrades();

-- -- FIND THE STUDENT WITH THE HIGHEST OVERALL GRADE

-- SELECT MAX(overall_grade)
-- FROM students;

-- -- USING A LEFT JOIN TO FIND EACH STUDENTS INDIVIDUAL EXAM RESULTS BY FIRST NAME

-- SELECT students.first_name, exams.exam_result
-- FROM students
-- LEFT JOIN exams ON exams.student_id = students.student_id;

-- -- IF YOU WANTED TO ANALYSE REASONS WHY SOME EXAMS HAD A HIGHER RESULT THAN OTHERS, MAYBE THE DAY OF THE WEEK IMPACTED RESULTS?
-- -- USE THE DATE OF THE EXAM TO FIND THE DAY OF THE WEEK

-- SELECT DAYNAME('2024-06-01');
