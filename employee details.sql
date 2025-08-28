create table employee(
emp_id SERIAL PRIMARY KEY,
fname VARCHAR(100) NOT NULL,
lname VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
dept VARCHAR(100),
salary DECIMAL(10,2) DEFAULT 30000.00,
hire_date DATE NOT NULL DEFAULT CURRENT_DATE
);

select*from employee

INSERT INTO employee (emp_id, fname, lname, email, dept, salary, hire_date)
VALUES(10,'Vijay','Nair','vijay.nair@gmail.com','Marketing',50000.00,'2020-04-13');


select * from employee
where dept = 'HR' or dept = 'Finance';

select * from employee
where dept = 'IT' and salary <= 50000;


select * from employee
where salary != 60000;

select * from employee
where dept in ('IT','Finance', 'HR');

select * from employee
where dept not in ('IT','Finance', 'HR');

-- find employee whose salary is more than 40k and less than 65k
select * from employee
where
salary between 50000 and 60000;

-- distinct
select distinct dept from employee;

-- order by
select * from employee order by emp_id desc ;

-- limit
select * from employee limit 3;

-- starts with 'A' 
select * from employee where fname like 'P%'

-- Ends with 'a' 
select * from employee where fname like '%a'

-- Contains "I"
select * from employee where fname like '%i%'

-- second character A 
select * from employee where fname like '_a%'

-- This query retrieves all rows from the employee table where the fname (first name) column matches exactly five characters.

select * from employee where fname like '_____';

-- second character A & last character L
select * from employee where fname like '_a__l%';

-- how to find total number of employees
select count(emp_id) from employee; 

-- sum of all the salaries 
select sum(salary) from employee;  

-- average 
select avg(salary) from employee;

--minimum
select min(salary) from employee;

--maximum
select max(salary) from employee;

-- group by
select dept from employee
 group by dept;

-- this will show us how many people are working in each group
select dept,count(emp_id) from employee
 group by dept;

-- this will show us the salary given by each department
select dept,sum(salary),count(emp_id) from employee
 group by dept;


-- TASKS 
-- Find all employees who work in the Marketing department and have a salary greater than 45,000.
select * from employee 
where dept = 'Marketing' and salary > 45000

--Retrieve employees whose last name ends with "r".
select * from employee
where lname like'%r'

-- Show all employees who were hired before 2019-01-01.
select * from employee
where hire_date < '2019-01-01';

--List employees whose salaries are between 40,000 and 70,000, but not equal to 50,000
select * from employee 
where salary between 40000 and 70000
and salary <> 50000;

-- Average salary per department
select dept,avg(salary) from employee 
group by dept;

-- top 2 highest-paid employees
select* from employee
order by salary desc
limit 2;

--Count employees in Finance
select count(emp_id) from employee
where dept = 'Finance'


-- First name has 6 characters and starts with A
select * from employee 
where fname like 'A____';


-- Duplicate email IDs (if any)

select email, count (*)
from employee
group by email
having count(*)>1

select fname, count (*)
from employee
group by fname
having count(*)>1

-- Concat
select emp_id, concat (fname, ' ',lname)as full_name, dept from employee
-- Concat with seperator
select emp_id, concat_ws ('-',fname,lname,salary)as full_name, dept from employee


-- Substring 
select * from employee 

select replace(dept,'IT','TECH')from employee;

-- Reverse 
select reverse (fname) from employee;


-- Length
select length('charan');
select length (fname) from employee;

-- find the alphabet's greater than 5 
select * from employee 
where length (fname)>5;

-- find the email id greater than 25 characters 
select * from employee 
where length (email)>25;

-- upper & lower
select upper(fname) from employee
select lower(fname) from employee

-- left , right
select left ('hello world',2); -- he
select right ('hello world',5);-- world

--  Trim & position 
select length ('    alrigth    ')
select length(trim ('    alrigth    '));

select position ('ra' in 'charan')
select position('om' in 'thomas')