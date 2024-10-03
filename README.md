# Student Management Database

This is a student management database aim to manage student data, including personal information, department assignments, and course enrollments.Secondly, Maintains academic record, allowing for easy tracking of students' progress and performance in various courses.Furthermore, Facilitates course registrations and keeps track of the many-to-many relationship between students and courses.Moreover, Simplifies administrative processes, such as updating student information, enrolling students in courses, and generating reports for academic departments. Therefore, This database solution will help educational institutions reduce manual errors, enhance data accuracy, and ensure timely access to up-to-date information for both staff and students.
## Tables
## Departments Table
```sql
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,                                    -- This is a unique key of each department
    department_name VARCHAR(100)                                      -- name of the department
);
```
## Students Table
```sql
CREATE TABLE Students (
    student_id INT PRIMARY KEY,                                        -- This is a unique identifier of each student
    student_name VARCHAR(100),                                         -- name of the student
    department_id INT,                                                 -- Foreign key referencing the table of department
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)  -- Initiating the relationship with the table of the department
);
```
## Course table
```sql
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,                                         --A unique identifier of each course
    course_name VARCHAR(100)                                           -- Name of the course
);
```
## Student_Course Table ( this is a junction table)

```sql
CREATE TABLE Student_Courses (
    student_id INT,                                                    -- This is the junction table so it includes student unique key and course unique key
    course_id INT,                                                     -- Foreign key referencing course table and student table
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),          -- Initiating the relationship with the table student
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)              -- Initiating the relationship with the table course
);
```
## Address table
```sql
CREATE TABLE Addresses (
    address_id INT PRIMARY KEY,                                        --Unique identifier of each address table
    student_id INT UNIQUE,                                             -- Foreign key referencing student table
    street VARCHAR(100),                                               -- name of the street 
    city VARCHAR(100),                                                 -- name of the city
    postal_code VARCHAR(20),                                           -- the postal code of that city
    FOREIGN KEY (student_id) REFERENCES Students(student_id)           -- Initiating the relationship with the table of student
);
```

### Insert Departments records
```sql
INSERT INTO Departments (department_id, department_name)               -- Inserting Computer science department
VALUES (1, 'Computer Science');

INSERT INTO Departments (department_id, department_name)               -- Inserting Mathematics department
VALUES (2, 'Mathematics');

INSERT INTO Departments (department_id, department_name)               -- Inserting Software Engineering department
VALUES (3, 'Software Engineering');

```
### Insert records into students

```sql
INSERT INTO Students (student_id, student_name, department_id)          -- Inserting John
VALUES (25344, 'John  Ndakora', 3);
INSERT INTO Students (student_id, student_name, department_id)          -- Inserting Ruben
VALUES (25544, 'Ruben rooo', 2);
INSERT INTO Students (student_id, student_name, department_id)          -- Inserting Sandra as a student
VALUES (22224, 'Sandra Ngoga', 1);
```
### Insert into Courses
```sql
INSERT INTO Courses (course_id, course_name)                            -- Inserting PL AND SQL course
VALUES (1001, 'PL And SQL');
INSERT INTO Courses (course_id, course_name)                            -- Inserting Multivariable
VALUES (1002, 'Multivariable');
INSERT INTO Courses (course_id, course_name)                            -- Inserting Dot net course
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
INSERT INTO Addresses (address_id, student_id, street, city, postal_code)                   --Inserting the address of a student called John
VALUES (4, 25344, '123 Main St', 'New York', '10001');
INSERT INTO Addresses (address_id, student_id, street, city, postal_code)                   -- Inserting the address of Sandra
VALUES (5, 22224, '456 Elm St', 'Los Angeles', '90001');
INSERT INTO Addresses (address_id, student_id, street, city, postal_code)                   -- Inserting the address of Ruben
VALUES (6, 25544, '222 Las Vegas Boulevard', 'Las Vegas', '90002');
INSERT INTO Addresses (address_id, student_id, street, city, postal_code)                   --Inserting the address of Ndakora
VALUES (7, 2022, '352  Miami', 'Florida', '80003');
```
### screenshots of  SQL queries, results, and  conceptual diagram
![conceptual diagram](https://github.com/user-attachments/assets/42b1855e-1e0e-46b4-ab87-655b80ec3890)
![table students](https://github.com/user-attachments/assets/f7d1c849-9208-46c1-80ff-a7cf4b2df57b)
![table Departments](https://github.com/user-attachments/assets/cfb9097d-beda-4871-a41e-187dca008e69)
![table courses](https://github.com/user-attachments/assets/cc4928f4-85e3-4313-8b9a-feedcb792733)
![2022student_id  deleted](https://github.com/user-attachments/assets/7904295a-b1ef-4c6d-99ad-b5a5f99fb8e2)
![student updated](https://github.com/user-attachments/assets/e5e54baf-0af1-4bcf-b07f-cb8eb99dd6d3)
![DCL](https://github.com/user-attachments/assets/19c6f8b6-7954-4c6a-8684-3e1ce76bdf6f)
![alter table](https://github.com/user-attachments/assets/20ba4ac3-e67a-4de7-b4fe-391df5a60c86)
![Inner Join](https://github.com/user-attachments/assets/7349d4bf-716d-4b7b-a46e-6fbc65c277e9)
![Join for many to many](https://github.com/user-attachments/assets/ba713149-13c7-4d5c-b886-e44a010c7da8)
![left Join](https://github.com/user-attachments/assets/26484b4a-97d9-4021-8d6d-784c84254c84)
![subquery](https://github.com/user-attachments/assets/3ccf477c-26f2-4f25-a76b-9215a7b4e4dd)
![using SQL transanction in Oracle](https://github.com/user-attachments/assets/a0d3a6c1-aa02-485b-9466-4305248270f4)

### Explanation about the transaction

##Find student who belong to the 'Mathematics ' department
```sql
select student_name from Students where department_id = (select department_id from Departments where department_name = 'Mathematics');
```
## Insert a new student
```sql
insert into Students(student_id,student_name,department_id) values (103, 'Alice Johnson',2);
```
## Commit the transaction if everything is fine
```sql
commit;
```
## License

This project is licensed under the [MIT license](https://opensource.org/licenses/MIT). You can freely use, copy, modify, and distribute this software, but please include a copy of this license in any distributions.


