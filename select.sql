
-- SELECT statement to retrieve all columns from the table and can be used with other clauses like WHERE, ORDER BY, GROUP BY, etc.

CREATE TABLE student(
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT ,
    grade CHAR(2),
    course VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    dob DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO student(id, name, age, grade, course, email, dob)
VALUES 
    (1, 'John Doe', 20, 'A', 'Computer Science', 'johndoe@gmail.com', '2000-01-01'),
    (2, 'Jane Doe', 21, 'B', 'Mathematics', 'janedoe@gmail.com', '1999-02-02'),
    (3, 'Alice Smith', 22, 'A', 'Physics', 'alicesmith@gmail.com', '1998-03-03'),
    (4, 'Bob Johnson', 23, 'C', 'Chemistry', 'bobjohnson@gmail.com', '1997-04-04'),
    (5, 'Charlie Brown', 24, 'B', 'Biology', 'charliebrown@gmail.com', '1996-05-05'),
    (6, 'David Wilson', 25, 'A', 'Engineering', 'davidwilson@gmail.com', '1995-06-06'),
    (7, 'Eva Green', 26, 'B', 'Medicine', 'evagreen@gmail.com', '1994-07-07'),
    (8, 'Frank White', 27, 'C', 'Law', 'frankwhite@gmail.com', '1993-08-08'),
    (9, 'Grace Black', 28, 'A', 'Art', 'graceblack@gmail.com', '1992-09-09'),
    (10, 'Hank Blue', 29, 'B', 'Music', 'hankblue@gmail.com', '1991-10-10'),
    (11, 'Ivy Red', 30, 'C', 'Literature', 'ivyred@gmail.com', '1990-11-11'),
    (12, 'Jack Yellow', 31, 'A', 'Philosophy', 'jackyellow@gmail.com', '1989-12-12'),
    (13, 'Karen Pink', 32, 'B', 'Sociology', 'karenpink@gmail.com', '1988-01-13'),
    (14, 'Leo Orange', 33, 'C', 'Anthropology', 'leoorange@gmail.com', '1987-02-14'),
    (15, 'Mona Purple', 34, 'A', 'Psychology', 'monapurple@gmail.com', '1986-03-15'),
    (16, 'Nina Brown', 35, 'B', 'Economics', 'ninabrown@gmail.com', '1985-04-16');

SELECT name as "Student Name",age as "Student Age" FROM student;

SELECT * FROM student ORDER BY age ASC;

SELECT * FROM student ORDER BY dob ASC;

SELECT DISTINCT course from student ;

SELECT * FROM student WHERE age > 25;

SELECT * FROM student WHERE course = 'Computer Science' AND grade = 'A';

SELECT * FROM student WHERE course = 'Computer Science' OR course = 'Mathematics';

SELECT upper(name) FROM student as name_upper;

SELECT length(name) FROM student;

SELECT max(age) FROM student;

SELECT * from student WHERE NOT age > 25;

-- The COALESCE() function returns the first non-null value among its arguments.
SELECT COALESCE(grade, 'N/A') FROM student;

-- IN and NOT IN operators are used to specify multiple values in a WHERE clause.
SELECT * FROM student WHERE grade IN ('A','B');

SELECT * FROM student WHERE grade NOT IN ('A','B');


-- The BETWEEN operator is used to select values within a range.
SELECT * FROM student WHERE age BETWEEN 20 AND 25 ORDER BY age DESC

-- The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
SELECT * FROM student WHERE name LIKE 'J%';
SELECT * FROM student WHERE name LIKE '_a%';

-- The ILIKE operator is a case-insensitive version of the LIKE operator.
SELECT * FROM student WHERE name ILIKE 'j%';