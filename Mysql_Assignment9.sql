/*Consider the Worker table with following fields: Worker_Id INT FirstName CHAR(25), LastName CHAR(25), Salary INT(15), JoiningDate DATETIME, Department CHAR(25)) */
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT(15),
    JoiningDate DATETIME,
    Department CHAR(25)
);
INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department) VALUES
(1, 'John', 'Doe', 60000, '2023-01-15 09:30:00', 'HR'),
(2, 'Jane', 'Smith', 75000, '2023-02-20 10:00:00', 'Finance'),
(3, 'Robert', 'Johnson', 80000, '2023-03-10 11:15:00', 'IT'),
(4, 'Michael', 'Brown', 65000, '2023-04-05 08:45:00', 'Marketing'),
(5, 'Emily', 'Davis', 70000, '2023-05-12 14:30:00', 'HR'),
(6, 'David', 'Miller', 72000, '2023-06-18 16:20:00', 'Finance'),
(7, 'Jessica', 'Wilson', 85000, '2023-07-22 12:00:00', 'IT'),
(8, 'Daniel', 'Moore', 78000, '2023-08-15 09:50:00', 'Operations'),
(9, 'Laura', 'Taylor', 73000, '2023-09-30 10:40:00', 'HR'),
(10, 'James', 'Anderson', 90000, '2023-10-25 11:55:00', 'Finance');

select * from Worker;

/*
1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table and then invokes the procedure call.*/
delimiter $$
create procedure add_record(in _Id INT ,in _FirstName CHAR(25),in _LastName CHAR(25),in _Salary INT(15),in _JoiningDate DATETIME,in _Department CHAR(25))
begin
  INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department) VALUES( _Id, _FirstName, _LastName, _Salary, _JoiningDate, _Department);
END $$
DELIMITER ;

call add_record(101, 'John', 'Doe', 70000, '2024-01-10 09:00:00', 'HR');
select * from Worker;

/* 2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the worker with the given ID and 
 returns it in the p_salary parameter. Then make the procedure call. */
 delimiter $$
 create procedure find_salary(in _id INT,out _salary INT(15))
 BEGIN
 select Salary into _salary from Worker where Worker_Id = _id;
 END $$
 delimiter ;
 
 set @sal=0;
 call find_salary(5,@sal);
 select @sal as Salary_of_Worker;
 
 /*
 3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. It should update the department of the worker with the given ID.
 Then make a procedure call.*/
 delimiter $$
 create procedure update_worker(in _id int, in _department char(25))
 begin
 update Worker set Department = _department where Worker_Id= _id;
 end $$
 delimiter ;
 
 call update_worker(101,'Operations');
 select Worker_Id,Department from Worker;
 
 /*4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve the number of
 workers in the given department and returns it in the p_workerCount parameter. Make procedure call. */
 delimiter $$
 create  procedure worker_count(in _department char(25),out p_workercount int)
 begin
 select count(*) into p_workercount from Worker where Department = _department;
 end $$
 delimiter ;
 
 set @workercount = 0;
 call Worker_count('HR',@workercount);
 select @workercount as No_Of_Workers;
 
 /*5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. 
It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.*/

delimiter $$
create procedure Average_Salary(in _department char(25),out p_avgsalary double)
begin
select avg(Salary) into p_avgsalary from Worker where Department = _department;
end $$
delimiter ;

set @avgsal=0;
call Average_Salary('HR',@avgsal);
select @avgsal as Average_Salary_Of_Workers;