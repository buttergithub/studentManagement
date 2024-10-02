# Student Management Database

This is a student management database aim to manage student data, including personal information, department assignments, and course enrollments.Secondly, Maintains academic record, allowing for easy tracking of students' progress and performance in various courses.Furthermore, Facilitates course registrations and keeps track of the many-to-many relationship between students and courses.Moreover, Simplifies administrative processes, such as updating student information, enrolling students in courses, and generating reports for academic departments. Therefore, This database solution will help educational institutions reduce manual errors, enhance data accuracy, and ensure timely access to up-to-date information for both staff and students.
## Tables
## Departments Table
```sql
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
```
## Students Table
```sql
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
```
## Course table
```sql
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);
```
## Student_Course Table ( this is a junction table)

```sql
CREATE TABLE Student_Courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
```
## Address table
```sql
CREATE TABLE Addresses (
    address_id INT PRIMARY KEY,
    student_id INT UNIQUE,
    street VARCHAR(100),
    city VARCHAR(100),
    postal_code VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
```

### Insert Departments records
```sql
INSERT INTO Departments (department_id, department_name)
VALUES (1, 'Computer Science');

INSERT INTO Departments (department_id, department_name)
VALUES (2, 'Mathematics');

INSERT INTO Departments (department_id, department_name)
VALUES (3, 'Software Engineering');

```
### Insert records into students

```sql
INSERT INTO Students (student_id, student_name, department_id)
VALUES (25344, 'John  Ndakora', 3);
INSERT INTO Students (student_id, student_name, department_id)
VALUES (25544, 'Ruben rooo', 2);
INSERT INTO Students (student_id, student_name, department_id)
VALUES (22224, 'Sandra Ngoga', 1);
```
### Insert into Courses
```sql
INSERT INTO Courses (course_id, course_name)
VALUES (1001, 'PL And SQL');
INSERT INTO Courses (course_id, course_name)
VALUES (1002, 'Multivariable');
INSERT INTO Courses (course_id, course_name)
VALUES (1004, 'Dot Net');
```
### Insert into student_course
```sql
INSERT INTO Student_Courses (student_id, course_id)
VALUES (22224, 1001);
INSERT INTO Student_Courses (student_id, course_id)
VALUES (25544, 1002);
INSERT INTO Student_Courses (student_id, course_id)
VALUES (25344, 1001);
INSERT INTO Student_Courses (student_id, course_id)
VALUES (2022, 1004);
```
### Inserting records of Addresses table
```sql
INSERT INTO Addresses (address_id, student_id, street, city, postal_code)
VALUES (4, 25344, '123 Main St', 'New York', '10001');
INSERT INTO Addresses (address_id, student_id, street, city, postal_code)
VALUES (5, 22224, '456 Elm St', 'Los Angeles', '90001');
INSERT INTO Addresses (address_id, student_id, street, city, postal_code)
VALUES (6, 25544, '222 Las Vegas Boulevard', 'Las Vegas', '90002');
INSERT INTO Addresses (address_id, student_id, street, city, postal_code)
VALUES (7, 2022, '352  Miami', 'Florida', '80003');
```


