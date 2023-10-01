use org1;

select first_name as worker_name from worker;

select upper(first_name) from worker;

select * from worker;

select distinct department from worker;
select department from worker group by department;

select first_name from worker;
select substr(first_name, 1, 3) from worker;

select * from worker where first_name = "Amitabh";
select instr(first_name, 'B') from worker where first_name = "Amitabh";

select rtrim(first_name) from worker;

select ltrim(first_name) from worker;

select distinct department, length(department) from worker;

select replace(first_name, 'a', 'A') from worker;

select concat(first_name, " ", last_name) as complete_name from worker;

select * from worker order by FIRST_NAME asc;

select * from worker order by first_name asc, department desc;

select * from worker where first_name in("Vipul", "Satish");

select * from worker where FIRST_NAME not in("Vipul", "Satish");

select * from worker where DEPARTMENT like "Admin%";

select * from worker where first_name like "%a%";

select * from worker where first_name like "%a";

select * from worker where first_name like "_____h"; 

select * from worker where SALARY between 100000 and 500000;

select * from worker where year(joining_date) = 2014 and month(joining_date) = 2;

-- Only gives count of Admin
select department, count(department) from worker where department = 'Admin';
-- 2nd method
select department, count(department) from worker group by department having department = 'Admin';

select concat(first_name, " ", last_name) from worker where salary between 50000 and 100000;


-- sytax of count:- count(expression), expression here means, the entity of which count is required;
select department, count(department) as no_of_worker from worker group by department order by count(department) desc;

-- worker.* prints only the columns of worker table. * prints columns of worker as well as title table.
select w1.* from worker as w1 inner join title as t where w1.worker_id = t.worker_ref_id and t.worker_title = 'manager';

select worker_title, count(worker_ref_id) as count from title group by worker_title having count(worker_ref_id) > 1;

select * from worker where MOD (worker_id, 2) != 0;

select * from worker where MOD (worker_id, 2) = 0;

create table clone_worker like worker;
insert into clone_worker select * from worker;
select * from clone_worker; 


-- INTERSECTION
select w1.* from worker as w1 inner join clone_worker as w2 using(worker_id);

-- MINUS 
SELECT w1.* FROM worker as w1 inner join clone_worker as w2 using(worker_id) where w2.worker_id is null;

select curdate();

select now();

select * from worker order by salary desc limit 5;

-- syntax of limit in this case limit start_row, no. of next rows. start_row is excluded.
select * from worker order by salary desc limit 4,1;

select * from worker as w1 where 5 = (select  count(distinct salary) from worker as w2 where w2.salary >= w1.salary);

select w1.* from worker as w1, worker as w2 where w1.salary = w2.salary and w1.worker_id != w2.worker_id;

select salary from worker as w1 where 2 = (select count(distinct salary) from worker as w2 where w2.salary >= w1.salary);

select * from worker 
UNION ALL 
select * from worker order by worker_id asc;

select worker_id from worker where worker_id not in(select worker_ref_id from bonus);

select * from worker where worker_id <= (select count(worker_id)/2 from worker);

select department, count(department) as dep_count from worker group by department having count(department) < 4;

select department, count(department) as dep_count from worker group by department;

select * from worker where worker_id = (select max(worker_id) from worker);

select * from worker where worker_id = (select min(worker_id) from worker);

(select * from worker order by worker_id desc limit 5) order by worker_id;

select w.department, w.first_name, w.salary from 
(select department, max(salary) as max_sal from worker group by department) as temp
inner join worker as w on temp.department = w.department and temp.max_sal = w.salary;

select distinct salary from worker as w1
 where 3 >= (select count(distinct salary) from worker w2 where w2.salary >= w1.salary) 
 order by w1.salary desc;
 
 
 -- Minimum Salaries
 select salary from (select distinct salary from worker order by salary limit 3) as temp order by salary desc;
 -- 2nd method
 select distinct salary from worker as w1
 where 3 >= (select count(distinct salary) from worker as w2 where w1.salary >= w2.salary) 
 order by w1.salary desc;
 
 select department, sum(salary) as total_sal from worker group by department order by total_sal desc;
 
 select concat(w.first_name, " ", w.last_name) as name, w.salary from (select department, max(salary) as max_sal from worker group by department order by max_sal desc) as temp
 left join worker as w on temp.department = w.department and temp.max_sal = w.salary;
 
 select concat(first_name, " ", last_name) as name, salary from worker where salary = (select max(salary) from worker);







