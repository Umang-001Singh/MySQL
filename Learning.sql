CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO Worker
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
        (002, 'Niharika', 'Verma', 90000, '14-06-11 09.00.00', 'Admin'),
        (003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
        (004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
        (005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
        (006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
        (007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
        (008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
SELECT * FROM WORKER;
        
CREATE TABLE Bonus (
 WORKER_REF_ID INT,
 BONUS_AMOUNT INT(10),
 BONUS_DATE DATETIME,
 FOREIGN KEY (WORKER_REF_ID)
	REFERENCES Worker(WORKER_ID)
    ON DELETE CASCADE
);

INSERT INTO Bonus
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
        (002, 3000, '16-06-11'),
        (003, 4000, '16-02-20'),
        (004, 4500, '16-02-20'),
        (005, 3500, '16-06-11');

CREATE TABLE Title (
	WORKER_REF_ID INT, 
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
	);
    
INSERT INTO Title
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
    (001, 'Manager', '2016-02-20 00.00.00'),
    (002, 'Executive', '2016-06-11 00.00.00'),
    (008, 'Executive', '2016-06-11 00.00.00'),
    (005, 'Manager', '2016-06-11 00.00.00'),
    (004, 'Asst. Manager', '2016-06-11 00.00.00'),
    (007, 'Executive', '2016-06-11 00.00.00'),
    (006, 'Lead', '2016-06-11 00.00.00'),
    (003, 'Lead', '2016-06-11 00.00.00');

SELECT * FROM Bonus;

SELECT FIRST_NAME, SALARY FROM Worker;

SELECT * FROM Worker;

SELECT * FROM Worker WHERE SALARY > 100000;

SELECT * FROM Worker WHERE DEPARTMENT = 'HR';

select * from Worker where salary between 100000 and 500000;

-- resolving OR condition

select * from Worker where department in('HR', 'Admin');

select * from worker where department not in('HR');

create database temp;

use temp;

create table customer (
	id integer primary key,
    cname varchar(225),
    addresss varchar(225),
    gender char(2),
    city varchar(225),
    pincode integer
    );
    
insert into customer
values ( 1251, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002),
		(1300, 'Shayam Singh', 'Ludhiana H.O', 'M', 'Ludhiana', 141001),
        (245, 'Neelabh Shukla', 'Ashok Nagar', 'M', 'Jalandhar', 142001),
        (210, 'Barkha Singh', 'Dilbagh Nagar', 'F', 'Jalandhar', 143001),
        (500, 'Rohan Arora', 'Ludhiana H.O', 'M', "Ludhiana", 145001);
        
insert into customer 
value (1500, 'Ram', 'Dilbagh Nagar', 'M', 'Jalandhar', null);


select * from customer where pincode is null;

use org;

select * from worker where first_name like '%i%';

-- finding distinct departments

select DISTINCT department from worker;

-- group by
select department, count(department) from worker group by department;

-- avg salary
select department, avg(salary) from worker group by department;

-- min salary
select department, min(salary) from worker group by department;

-- max salary
select department, max(salary) from worker group by department;

-- max salary from whole tabel
select max(salary) from worker;

-- sum of salary
select department, sum(salary) from worker group by department;

-- group by having
select department, count(department) from worker group by department having count(department) >= 2;

select * from worker;










