# School_exam_tracker

I have created a database that could be used by teachers to track students progress during exam season. They could use the data in many ways, including generating an average overall grade, seeing who is the highest/lowest achiever, checking the day of an exam, which students are taking each exam, etc. I have demonstrated some of these uses within my database and added extra comments to explain what is happening. Below are the skills used:

- A database has been created with three tables(students, subjects, exams). Each table includes several columns.
- Each table has a primary key (student_id, subject_id, exam_id). The exams table also uses two foreign keys(student_id, subject_id) to ensure that invalid data is not inserted into these which would cause issues in the parent table.
- At least 3 different data types were used when creating the tables(Integer, Varchar, Date, Decimal)
- At least 2 constraints were used(not null, unique, check)
- Data was inserted with INSERT INTO queries and could be updated with UPDATE
- Data was retrieved in various ways including SELECT *, SELECT COUNT(DISTINCT), SELECT FROM, SELECT SUM, SELECT AVG. -DELETE FROM was used to delete data
- Aggregate functions used included MAX() and SUM()
- An inner join and a left join were used
- Additional in-built functions were used, inlcuding AVG() and DAYNAME()
- ORDER BY was used to demonstrate data sorting with each table
- A stored procedure was created so that overall grades could be listed in order whenever the teachers want to see updated data based on new exam result inputs, this can be used with CALL GetAllGrades()
- The database was normalised where possible to reduce the chance of duplicate data
