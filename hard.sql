--List students who are enrolled in all courses offered by their department.
SELECT
    s.first_name,
    s.last_name
FROM
    student s
WHERE
    NOT EXISTS (
        SELECT
            c.course_id
        FROM
            course c
        WHERE
            c.department_id = s.department_id
            AND NOT EXISTS (
                SELECT
                    e.course_id
                FROM
                    enrollment e
                WHERE
                    e.student_id = s.student_id
                    AND e.course_id = c.course_id
            )
    );

--Find faculty who teach courses outside their department.
SELECT
    f.first_name,
    f.last_name
FROM
    faculty f
WHERE
    EXISTS (
        SELECT
            c.course_id
        FROM
            course c
        WHERE
            c.faculty_id = f.faculty_id
            AND c.department_id != f.department_id
    );

--Show students who scored better than the average grade of their course.
SELECT
    s.first_name,
    s.last_name
FROM
    student s
WHERE
    EXISTS (
        SELECT
            1
        FROM
            enrollment e
            JOIN course c ON e.course_id = c.course_id
        WHERE
            e.student_id = s.student_id
            AND e.grade > (
                SELECT
                    AVG(grade)
                FROM
                    enrollment
                WHERE
                    course_id = c.course_id
            )
    );

--Display each department with the total number of students, faculty, and courses.
SELECT
    d.dept_name,
    COUNT(DISTINCT s.student_id) AS total_students,
    COUNT(DISTINCT f.faculty_id) AS total_faculty,
    COUNT(DISTINCT c.course_id) AS total_courses
FROM
    department d
    LEFT JOIN student s ON d.department_id = s.department_id
    LEFT JOIN faculty f ON d.department_id = f.department_id
    LEFT JOIN course c ON d.department_id = c.department_id
GROUP BY
    d.dept_name;

--Retrieve courses that have never been taught by any faculty.
SELECT
    c.course_name
FROM
    course c
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            faculty f
        WHERE
            f.faculty_id = c.faculty_id
    );

--Find students who have taken at least one course with every faculty in their department.
SELECT
    s.first_name,
    s.last_name
FROM
    student s
WHERE
    NOT EXISTS (
        SELECT
            f.faculty_id
        FROM
            faculty f
        WHERE
            f.department_id = s.department_id
            AND NOT EXISTS (
                SELECT
                    e.course_id
                FROM
                    enrollment e
                WHERE
                    e.student_id = s.student_id
                    AND e.course_id IN (
                        SELECT
                            c.course_id
                        FROM
                            course c
                        WHERE
                            c.faculty_id = f.faculty_id
                    )
            )
    );

--Show the faculty who teaches the maximum number of courses.
SELECT
    f.first_name,
    f.last_name
FROM
    faculty f
WHERE
    f.faculty_id = (
        SELECT
            c.faculty_id
        FROM
            course c
        GROUP BY
            c.faculty_id
        ORDER BY
            COUNT(*) DESC
        LIMIT
            1
    );

--Find students enrolled in more than 3 different semesters.
SELECT
    s.first_name,
    s.last_name
FROM
    student s
WHERE
    (
        SELECT
            COUNT(DISTINCT e.semester)
        FROM
            enrollment e
        WHERE
            e.student_id = s.student_id
    ) > 3;

--Retrieve the list of students who are not enrolled in any course but belong to a department that offers courses.
SELECT
    s.first_name,
    s.last_name
FROM
    student s
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            enrollment e
        WHERE
            e.student_id = s.student_id
    )
    AND EXISTS (
        SELECT
            1
        FROM
            course c
        WHERE
            c.department_id = s.department_id
    );

--Get the list of courses where the average grade is higher than the overall university average
SELECT
    c.course_name
FROM
    course c
WHERE
    (
        SELECT
            AVG(grade)
        FROM
            enrollment e
        WHERE
            e.course_id = c.course_id
    ) > (
        SELECT
            AVG(grade)
        FROM
            enrollment
    );