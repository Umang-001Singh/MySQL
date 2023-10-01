create database Project_Database;

use Project_Database;

create table Employee (
	emp_id int unique not null,
    fname varchar(255),
    lname varchar(255),
    age int,
    email varchar(255) unique,
    phone varchar(255) unique, 
    city varchar(255)
    );
    
create table Client (
	clt_id int unique not null,
    fname varchar(255),
    lname varchar(255),
    age int,
    email varchar(255) unique,
    phone varchar(255) unique,
    city varchar(255),
    emp_id int,
    foreign key(emp_id) references Employee(emp_id) on update cascade on delete set null
    );
    
create table project (
	prj_id int unique not null,
    emp_id int,
    name varchar(255),
    startdate date,
	clt_id int,
    foreign key(emp_id) references Employee(emp_id) on update cascade on delete set null,
    foreign key(clt_id) references Client(clt_id) on update cascade on delete set null
    );


insert into employee
values(1, "Aman", "Proto", 32, "aman@gmail.com", '898', "Delhi"),
	  (2, "Yagya", "Narayan", 44, "yagya@gmail.com", '222', 'Palam'),
      (3, "Rahul", "BD", 22, 'rahul@gmail.com', '444', 'Kolkata'),
      (4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', '666', 'Raipur'),
      (5, 'PK', 'Pandey', 21, 'pk@gmail.com', '555', 'Jaipur');
      
select * from employee;

insert into Client 
values(1, 'Mac', 'Rogers', 47, 'mac@hotmail.com', '333', 'Kolkata', 3),
	  (2, 'Max', 'Poirier', 27, 'max@gmail.com', '222', 'Kolkata', 3),
      (3, 'Peter', 'Jain', 24, 'peter@abc.com', '111', 'Delhi', 1),
      (4, 'Sushant', 'Aggarwal', 23, 'sushant@yahoo.com', '45454', 'Hyderabad', 5),
      (5, 'Pratap', 'Singh', 36, 'p@xyz.com', '77767', 'Mumbai', 2);
      
select * from client;

insert into Project 
values(1, 1, 'A', '2021-04-21', 3),
	  (2, 2, 'B', '2021-02-12', 1),
      (3, 3, 'C', '2021-01-16', 5),
      (4, 3, 'D', '2021-04-27', 2),
      (5, 5, 'E', '2021-05-01', 4);
      
select * from Project;

-- column names given after select will only be printed, INNER JOIN
select e.emp_id, e.fname, e.lname, p.prj_id, p.name from employee as e 
INNER JOIN project as p ON e.emp_id = p.emp_id;

-- LEFT JOIN
select e.*, p.* from employee as e LEFT JOIN project as p on e.emp_id = p.emp_id;

-- RIGHT JOIN
select e.*, p.* from employee as e RIGHT JOIN project as p ON e.emp_id = p.emp_id;

-- FULL JOIN not present inbuilt. It is implement using LEFT JOIN and RIGHT JOIN
select e.*, p.* from employee as e LEFT JOIN project as p ON e.emp_id = p.emp_id
UNION
SELECT e.*, p.* FROM employee AS e RIGHT JOIN project AS p ON e.emp_id = p.emp_id;

-- CROSS JOIN IS RARELY USED. NO INDUSTRIAL SIGNIFICANCE.

-- SELF JOIN, emulated as INNER JOIN, RARELY USED
select e1.emp_id, e2.emp_id, e1.fname, e1.lname from employee as e1 INNER JOIN employee as e2 ON e1.emp_id = e2.emp_id;

-- emulating JOIN operation without using JOIN KEYWORD
SELECT 
    *
FROM
    employee,
    project
WHERE
    employee.emp_id = project.emp_id;

-- SET OPERATIONS
-- creating two seperate tables for set operations as no. of columns in both the tables should be same.
create table dept1 (
	emp_id int unique not null,
    name varchar(255),
    role varchar(255)
    );
    
create table dept2 (
	emp_id int unique not null,
    name varchar(255),
    role varchar(255)
    );

insert into dept1
values(1, "A", 'engineer'),
	  (2, "B", 'salesman'),
      (3, "C", 'manager'),
      (4, "D", 'salesman'),
      (5, "E", 'engineer');
      
insert into dept2
values(3, "C", 'manager'),
	  (6, 'F', 'marketing'),
      (7, 'G', 'salesman');

-- UNION operation
select * from dept1 UNION select * from dept2;

-- INTERSECT operation
select dept1.name, dept1.emp_id, dept1.role from dept1 INNER JOIN dept2 using(emp_id);

-- MINUS operation
select dept1.emp_id, dept1.name, dept1.role from dept1 LEFT JOIN dept2 using(emp_id) where dept2.emp_id is null;


-- concept of INNER QUERY.
select emp_id, count(emp_id) from project group by emp_id having count(emp_id) > 1;

-- inner query should return only ONE COLUMN
select * from employee where emp_id in(select emp_id from project group by emp_id having count(emp_id) > 1);

-- CORELAYED QUERY. For each value of outer query the inner query will run exactly 1 time. The inner query counts the number of employees where 
-- the age is greater than equal to e1.age.

-- There is actually a loop running. The pointer will start from the top of the table and check if the number of employees having age greater
-- than the present employee is 3 or not. If it is three, then the query prints all the details of the present employee.
select * from employee as e1 where 3 = (select count(e2.age) from employee as e2 where e2.age >= e1.age);