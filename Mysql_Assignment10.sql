/*
. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows. 
 2. Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative” if the salary inserted to the table is less than zero.
 3. Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, 
 timestamp to a table called teacher_log when a new entry gets inserted to the teacher table. tecaher_id -> column of teacher table, 
 action -> the trigger action, timestamp -> time at which the new row has got inserted. 
 4. Create a before delete trigger that will raise an error when you 
 try to delete a row that has experience greater than 10 years. 
 5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.
*/
CREATE TABLE teachers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10, 2)
);

INSERT INTO teachers (name, subject, experience, salary)
VALUES
    ('Alice', 'Math', 5, 50000),
    ('Bob', 'Science', 8, 60000),
    ('Charlie', 'History', 12, 70000),
    ('Dana', 'English', 2, 40000),
    ('Evan', 'Computer Science', 15, 90000),
    ('Fay', 'Art', 3, 45000),
    ('Grace', 'Physics', 9, 75000),
    ('Hank', 'Biology', 10, 80000);
    
SELECT * FROM teachers;
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------    
--  2. Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative” if the salary inserted to the table is less than zero.
DELIMITER $$
CREATE TRIGGER before_insert_teacher 
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
	if new.salary <0 then 
    signal sqlstate '45000' set message_text = 'salary cannot be negative' ;-- default signal sqlstate 45000
    end if;
    -- Block of code (trigger logic here)
END $$
DELIMITER ;

SHOW triggers;
INSERT INTO teachers (name, subject, experience, salary)
VALUES ('Ivy', 'Music', 4, -5000);
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------
/*  3. Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, 
 timestamp to a table called teacher_log when a new entry gets inserted to the teacher table. tecaher_id -> column of teacher table, 
 action -> the trigger action, timestamp -> time at which the new row has got inserted. */
 CREATE TABLE teacher_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT,
    action VARCHAR(50),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER $$
CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
	insert into teacher_log(teacher_id,action) values
    (new.id,'Teacher recently joined');
END $$
DELIMITER ;

INSERT INTO teachers (name, subject, experience, salary)
VALUES ('Ivy', 'Music', 4, 50000);

select * from teachers;
select * from teacher_log;
-- --------------------------------------------------------------------------------------------------------------------------------------------
/*
4. Create a before delete trigger that will raise an error when you 
 try to delete a row that has experience greater than 10 years. */

DELIMITER $$
CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF old.experience > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete a teacher with more than 10 years of experience';
    END IF;
END $$
DELIMITER ;

DELETE FROM teachers WHERE experience>10;

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.
DELIMITER $$
CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action)
    VALUES (OLD.id, 'DELETED');
END $$
DELIMITER ;

DELETE FROM teachers WHERE id=1;
SELECT * FROM teacher_log;

