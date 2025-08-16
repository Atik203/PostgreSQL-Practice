-- Active: 1755367954737@@127.0.0.1@3306@university
-- CREATE DATABASE university;
create Table
    student (
        student_id INT PRIMARY KEY AUTO_INCREMENT,
        first_name VARCHAR(255),
        last_name VARCHAR(255),
        gender ENUM ('M', 'F'),
        dob DATE,
        department_id INT REFERENCES department (department_id) ON DELETE CASCADE
    );

create Table
    department (
        department_id INT PRIMARY KEY AUTO_INCREMENT,
        dept_name VARCHAR(255)
    );

create Table
    course (
        course_id INT PRIMARY KEY AUTO_INCREMENT,
        course_name VARCHAR(255),
        credits INT,
        department_id INT REFERENCES department (department_id) ON DELETE CASCADE
    );

create table
    enrollment (
        enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
        student_id INT REFERENCES student (student_id) ON DELETE CASCADE,
        course_id INT REFERENCES course (course_id) ON DELETE CASCADE,
        semester VARCHAR(50),
        grade ENUM ('A', 'B', 'C', 'D', 'F')
    );

create table
    faculty (
        faculty_id INT PRIMARY KEY AUTO_INCREMENT,
        first_name VARCHAR(255),
        last_name VARCHAR(255),
        department_id INT REFERENCES department (department_id) ON DELETE CASCADE
    );

create table
    teacher (
        teacher_id INT PRIMARY KEY AUTO_INCREMENT,
        faculty_id INT REFERENCES faculty (faculty_id) ON DELETE CASCADE,
        course_id INT REFERENCES course (course_id) ON DELETE CASCADE,
        semester VARCHAR(50)
    );

-- Insert data
INSERT into
    department (dept_name)
values
    ('Computer Science'),
    ('Mathematics'),
    ('Physics'),
    ('Chemistry');

insert into
    student (first_name, last_name, gender, dob, department_id)
values
    ('John', 'Doe', 'M', '2000-01-01', 1),
    ('Jane', 'Smith', 'F', '2001-02-02', 2),
    ('Alice', 'Johnson', 'F', '2000-03-03', 3),
    ('Bob', 'Brown', 'M', '2001-04-04', 4);

INSERT INTO
    course (course_name, credits, department_id)
VALUES
    ('Data Structures', 3, 1),
    ('Calculus', 4, 2),
    ('Quantum Physics', 4, 3),
    ('Organic Chemistry', 4, 4);

INSERT INTO
    enrollment (student_id, course_id, semester, grade)
VALUES
    (1, 1, 'Fall 2020', 'A'),
    (1, 2, 'Spring 2021', 'B'),
    (2, 1, 'Fall 2020', 'A'),
    (2, 3, 'Spring 2021', 'C'),
    (3, 2, 'Fall 2020', 'B'),
    (3, 4, 'Spring 2021', 'A'),
    (4, 1, 'Fall 2020', 'C'),
    (4, 2, 'Spring 2021', 'B');

INSERT INTO
    faculty (first_name, last_name, department_id)
VALUES
    ('Dr. Alice', 'Williams', 1),
    ('Dr. Bob', 'Johnson', 2),
    ('Dr. Charlie', 'Brown', 3),
    ('Dr. David', 'Smith', 4);

INSERT INTO
    teacher (faculty_id, course_id, semester)
VALUES
    (1, 1, 'Fall 2020'),
    (1, 2, 'Spring 2021'),
    (2, 1, 'Fall 2020'),
    (2, 3, 'Spring 2021'),
    (3, 2, 'Fall 2020'),
    (3, 4, 'Spring 2021'),
    (4, 1, 'Fall 2020'),
    (4, 2, 'Spring 2021');