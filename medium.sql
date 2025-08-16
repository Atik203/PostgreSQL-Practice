-- Find the number of students in each department.
SELECT
    d.dept_name,
    COUNT(s.student_id) AS student_count
FROM
    department d
    LEFT JOIN student s ON d.department_id = s.department_id
GROUP BY
    d.dept_name;

-- List the courses with more than 3 credits.
SELECT
    *
FROM
    course
WHERE
    credits > 3;

--  Retrieve all students enrolled in the course Database Systems.
SELECT
    s.*
FROM
    student s
    JOIN enrollment e ON s.student_id = e.student_id
    JOIN course c ON e.course_id = c.course_id
WHERE
    c.course_name = 'Database Systems';

-- Show student names along with their enrolled courses (JOIN).
SELECT
    s.first_name,
    s.last_name,
    c.course_name
FROM
    student s
    JOIN enrollment e ON s.student_id = e.student_id
    JOIN course c ON e.course_id = c.course_id;

-- Find the average credits of courses per department.
SELECT
    d.dept_name,
    AVG(c.credits) AS average_credits
FROM
    department d
    JOIN course c ON d.department_id = c.department_id
GROUP BY
    d.dept_name;

-- Display the names of faculty members teaching in the Fall 2024 semester.
SELECT
    f.first_name,
    f.last_name
FROM
    faculty f
    JOIN course c ON f.faculty_id = c.faculty_id
WHERE
    c.semester = 'Fall 2024';

-- Find the oldest student in the university.
SELECT
    first_name,
    last_name,
    dob
FROM
    student
ORDER BY
    dob ASC
LIMIT
    1;

-- List students who have not enrolled in any course.
SELECT
    s.first_name,
    s.last_name
FROM
    student s
    LEFT JOIN enrollment e ON s.student_id = e.student_id
WHERE
    e.course_id IS NULL;

-- Show the top 3 students with the most enrollments.
SELECT
    s.first_name,
    s.last_name,
    COUNT(e.course_id) AS enrollment_count
FROM
    student s
    JOIN enrollment e ON s.student_id = e.student_id
GROUP BY
    s.student_id,
    s.first_name,
    s.last_name
ORDER BY
    enrollment_count DESC
LIMIT
    3;

-- Find departments with more than 2 faculty members.
SELECT
    d.dept_name,
    COUNT(f.faculty_id) AS faculty_count
FROM
    department d
    JOIN faculty f ON d.department_id = f.department_id
GROUP BY
    d.dept_name
HAVING
    faculty_count > 2;