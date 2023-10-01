use project_database;

select city, count(city) from employee group by city;
select city, count(city) from client group by city having count(city) > 1;
select city, avg(age) from client group by city;

select city, count(emp_id) from client group by city having count(emp_id) > 1;

-- to find the details of the customer who is linked emplyee 3;
select * from client where emp_id = 3;

-- to find the details of the customer who has email id as gmail
select * from client where email like "%@gmail%";

select * from employee where email like "%@gmail%";

select * from employee where age > 32;

select * from client where city = 'Kolkata';

-- adding new column to employee table
alter table employee add pincode varchar(255);

-- changing data type of pincode column
alter table employee modify pincode int;

-- changing name of column pincode to pin
alter table employee change column pincode pin varchar(255);

-- deleting pin column from employee table
alter table employee drop column pin;