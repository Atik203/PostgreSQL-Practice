-- List all student names (first and last).
SELECT
    first_name,
    last_name
FROM
    student;

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
    course;

-- Find all faculty members in the Computer Science department.
SELECT
    *
FROM
    faculty
WHERE
    department_id = (
        SELECT
            department_id
        FROM
            department
        WHERE
            dept_name = 'Computer Science'
    );

-- Show the names of students born after 2000-01-01.
SELECT
    first_name,
    last_name
FROM
    student
WHERE
    dob > '2000-01-01';

-- Retrieve all departments.
SELECT
    *
FROM
    department;

-- Get all enrollments of student with student_id = 3.
SELECT
    *
from
    enrollment
WHERE
    student_id = 3;

-- List all female students.
SELECT
    *
from
    student
WHERE
    gender = 'F';

-- Show all courses offered by department 2.
select
    *
from
    course
WHERE
    department_id = 2;

-- Display all faculty ordered by last name.
SELECT
    *
from
    faculty
ORDER BY
    last_name;

-- Count the total number of students.
SELECT
    COUNT(*) AS total_students
FROM
    student;