create database employee_mgmt;
use employee_mgmt;
create table employees (
	employee_id int primary key,
    first_name varchar(50) not null,
    last_name varchar(50),
    email varchar(100) unique,
    gender enum('Male', 'Female', 'Other'),
    age int,
    hire_date date,
    salary int,
    manager_id int null,
    department varchar(100),
    phone_number varchar(20),
    constraint fk_manager
    foreign key (manager_id)
    references employees(employee_id)
    on delete set null
    on update cascade
);
insert into employees (employee_id, first_name, last_name, email, gender, age, hire_date, salary, manager_id, department, phone_number) values
(345, 'Nate', 'Henfre', 'nhenfre1@storify.com', 'Male', 47, '2023-09-11', 105492, null, 'Product Management', '843-37-5785'),
(750, 'Freeland', 'Spracklin', 'fspracklin4@cargocollective.com', 'Male', 21, '2024-04-10', 155204, null, 'R&D Manager', '104-82-6002'),
(296, 'Allina', 'Patmore', 'apatmore7@google.nl', 'Female', 40, '2024-08-31', 124350, null, 'HR Manager', '716-72-1407'),
(234, 'Robin', 'MacMenamy', 'rmacmenamy0@nsw.gov.au', 'Female', 22, '2025-04-06', 139111, 345, 'Research and Development', '616-58-5257'),
(674, 'Moses', 'Loughlin', 'moloughlin2@chron.com', 'Male', 50, '2024-04-20', 34920, 296, 'Support', '589-88-0014'),
(123, 'Shayla', 'Stove', 'sstove3@samsung.com', 'Female', 35, '2023-10-10', 67953, 296, 'Legal', '888-79-3482'),
(392, 'Gretel', 'Ivatts', 'givatts5@buzzfeed.com', 'Female', 32, '2023-10-26', 53768, 296, 'Human Resources', '171-52-565'),
(734, 'Allen', 'Twede', 'atwedee@eventbrite.com', 'Male', 28, '2024-01-26', 111625, 345, 'Engineering', '799-47-3972'),
(193, 'Elli', 'Sidon', 'esidon1f@istockphoto.com', 'Female', 43, '2023-08-23', 65276, 750, 'Business Development', '648-63-2852'),
(934, 'Alard', 'Clows', 'aclowsr@biglobe.ne.jp', 'Male', 26, '2025-06-02', 91279, 750, 'Business Development', '555-25-7477');

drop table employees;
select * from employees;

-- 4.1 Employee count by department
select department, count(*) as employee_count
from employees
group by department
order by employee_count;

-- 4.2 Average salary by department
select department, round(avg(salary),0) as avg_salary, count(*) as num_employees
from employees
group by department
order by avg_salary;

-- 4.3 Gender distribution (overall)
select gender, count(*) as count, round((count(*)/ (select count(*) from employees) * 100), 2) as pct
from employees
group by gender;

-- 4.4 Gender distribution among managers
SELECT e.gender, COUNT(DISTINCT e.employee_id) AS manager_count
FROM employees e
JOIN employees sub ON e.employee_id = sub.manager_id
GROUP BY e.gender;

-- 4.5 Employees with salary < 50000
SELECT employee_id, CONCAT(first_name, ' ', last_name) AS name, department, salary
FROM employees
WHERE salary < 50000
ORDER BY salary;

-- 4.6 Employees with salary > 100000
SELECT employee_id, CONCAT(first_name, ' ', last_name) AS name, department, salary
FROM employees
WHERE salary > 100000
ORDER BY salary DESC;

-- 4.7 Show manager name beside employee (self join)
SELECT emp.employee_id, CONCAT(emp.first_name,' ',emp.last_name) AS employee_name,
emp.department, emp.salary,
CONCAT(m.first_name,' ',m.last_name) AS manager_name
FROM employees emp
LEFT JOIN employees m ON emp.manager_id = m.employee_id
ORDER BY emp.department, emp.employee_id;

-- 4.8 Give a 10% salary increment to employees under 30 (example of conditional update)
UPDATE employees
SET salary = ROUND(salary * 1.10)
WHERE age < 30;

-- 4.9 After update: check those who were updated
SELECT employee_id, CONCAT(first_name,' ',last_name) AS name, age, salary
FROM employees
WHERE age < 30;