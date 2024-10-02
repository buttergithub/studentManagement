CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE Student_Courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Addresses (
    address_id INT PRIMARY KEY,
    student_id INT UNIQUE,
    street VARCHAR(100),
    city VARCHAR(100),
    postal_code VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
--  data into Departments table
INSERT INTO Departments (department_id, department_name)
VALUES (1, 'Computer Science');

INSERT INTO Departments (department_id, department_name)
VALUES (2, 'Mathematics');

INSERT INTO Departments (department_id, department_name)
VALUES (3, 'Software Engineering');

-- insert data into students table
INSERT INTO Students (student_id, student_name, department_id)
VALUES (25344, 'John  Ndakora', 3);
INSERT INTO Students (student_id, student_name, department_id)
VALUES (25544, 'Ruben rooo', 2);
INSERT INTO Students (student_id, student_name, department_id)
VALUES (22224, 'Sandra Ngoga', 1);

--insert into courses table
INSERT INTO Courses (course_id, course_name)
VALUES (1001, 'PL And SQL');
INSERT INTO Courses (course_id, course_name)
VALUES (1002, 'Multivariable');
INSERT INTO Courses (course_id, course_name)
VALUES (1004, 'Dot Net');

-- insert into student-course table(junction table)
INSERT INTO Student_Courses (student_id, course_id)
VALUES (22224, 1001);
INSERT INTO Student_Courses (student_id, course_id)
VALUES (25544, 1002);
INSERT INTO Student_Courses (student_id, course_id)
VALUES (25344, 1001);
INSERT INTO Student_Courses (student_id, course_id)
VALUES (2022, 1004);

SELECT * FROM Students WHERE student_id = 25344;

UPDATE Students
SET student_name = 'John Ndakora', department_id = 3
WHERE student_id = 25344;

INSERT INTO Students (student_id, student_name, department_id)
VALUES (2022, 'John Ndakora', 3);

SELECT * FROM Students WHERE student_id = 25344;
SELECT * FROM Students;
SELECT * FROM Student_Courses;
SELECT * FROM Courses;
SELECT * FROM Departments;

-- Insert data into Addresses table (One-to-One)
INSERT INTO Addresses (address_id, student_id, street, city, postal_code)
VALUES (4, 25344, '123 Main St', 'New York', '10001');
INSERT INTO Addresses (address_id, student_id, street, city, postal_code)
VALUES (5, 22224, '456 Elm St', 'Los Angeles', '90001');
INSERT INTO Addresses (address_id, student_id, street, city, postal_code)
VALUES (6, 25544, '222 Las Vegas Boulevard', 'Las Vegas', '90002');
INSERT INTO Addresses (address_id, student_id, street, city, postal_code)
VALUES (7, 2022, '352  Miami', 'Florida', '80003');

--Update student department (to change to the software depart)
UPDATE Students
SET department_id = 3
WHERE student_id = 22224;

SELECT * FROM Students where student_id = 22224;

-- Delete student with student_id 2022 (John Ndakora)
DELETE FROM Students WHERE student_id = 2022;
-- Deleting the correspondance record in Student_Courses
DELETE FROM Student_Courses WHERE student_id = 2022;
-- Delete the corresponding entry in Addresses
DELETE FROM Addresses WHERE student_id = 2022;

select* from Students;

-- Retrieve students with their department names
SELECT s.student_name, d.department_name
FROM Students s
INNER JOIN Departments d ON s.department_id = d.department_id;

-- Retrieve student names and the courses they are enrolled in
SELECT s.student_name, c.course_name
FROM Students s
INNER JOIN Student_Courses sc ON s.student_id = sc.student_id
INNER JOIN Courses c ON sc.course_id = c.course_id;

-- Retrieve students and their addresses (if available)
SELECT s.student_name, a.street, a.city, a.postal_code
FROM Students s
LEFT JOIN Addresses a ON s.student_id = a.student_id;


-- Add a new column 'phone_number' to the Students table
ALTER TABLE Students ADD phone_number VARCHAR(20);

-- DCL(Data Control Language)
CREATE USER username IDENTIFIED BY password;
-- Grant SELECT permission to a user
GRANT SELECT ON Students TO username;
-- Revoke permission
REVOKE SELECT ON Students FROM username;

-- Find students who belong to the 'Computer Science' department
SELECT student_name
FROM Students
WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'Mathematics');


