/*Create a database named School and perform all the DDL commands(CREATE, ALTER, DROP, RENAME, TRUNCATE) for the table named STUDENT with fields: 
Roll_No
 Name 
 Marks 
 Grade 
 Create data on your own based on the given columns 
 (1) Use the select command to display the table.
 (2) Add a column named Contact to the STUDENT table.
 (3) Remove the Grade column from the Student table. 
 (4) Rename the table to CLASSTEN. 
 (5) Delete all rows from the table. 
(6) Remove the table from the database.*/

create database School;
use School;

create table Students (Roll_no int, Name_of_Student Char(30),Marks int,Grade char(2));

insert into Students (Roll_no, Name_of_Student,Marks,Grade)
values
(1, 'Aman Sharma', 85, 'A'),
(2, 'Neha Gupta', 92, 'A+'),
(3, 'Raj Patel', 76, 'B'),
(4, 'Simran Kaur', 89, 'A'),
(5, 'Priya Singh', 67, 'C'),
(6, 'Vikas Rao', 54, 'D'),
(7, 'Pooja Nair', 78, 'B'),
(8, 'Anil Kumar', 82, 'A'),
(9, 'Kiran Joshi', 91, 'A+'),
(10, 'Rahul Mehta', 60, 'C');

select * from students;

alter table students add column Contact varchar(15);

alter table students drop Grade;

alter table students rename to classten;

truncate classten;
select * from classten;

drop table classten;