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
-- Find all faculty members in the Computer Science department.
-- Show the names of students born after 2000-01-01.
-- Retrieve all departments.
-- Get all enrollments of student with student_id = 3.
-- List all female students.
-- Show all courses offered by department 2.
-- Display all faculty ordered by last name.
-- Count the total number of students.