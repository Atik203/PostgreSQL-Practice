-- List all student names (first and last).
SELECT
    first_name,
    last_name
FROM
    student
    -- Show full name
SELECT
    CONCAT (first_name, ' ', last_name) AS full_name
FROM
    student;

-- Show all courses with their credits.
SELECT
    course_name,
    credits
FROM
    course

















    -- Find all faculty members in the Computer Science department.

-- store department_id Variables start with @ because they are user-defined variables
SET @cs_department_id = (SELECT department_id FROM department WHERE dept_name = 'Computer Science');

SELECT
    *
FROM
    faculty
WHERE
    department_id = @cs_department_id;






-- Show the names of students born after 2000-01-01.

SELECT first_name, last_name FROM student WHERE dob > '2000-01-01';






-- Retrieve all departments.

SELECT * FROM department;





-- Get all enrollments of student with student_id = 3.
SELECT * from enrollment WHERE student_id = 3;






-- List all female students.
-- Show all courses offered by department 2.
-- Display all faculty ordered by last name.
-- Count the total number of students.