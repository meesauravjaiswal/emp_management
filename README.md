# emp_management

## Overview

This project demonstrates the design and implementation of a **simple Employee Management Database System using MySQL**.
It focuses on relational database concepts such as **table creation, constraints, self-referencing foreign keys, data insertion, and analytical queries**.

The project simulates a company environment where employees belong to departments and may report to managers.

The SQL implementation can be found in the project file:
**emp_management.sql** 

---

## Database Design

### Database

```
employee_mgmt
```

### Table

```
employees
```

### Table Structure

| Column       | Type    | Description                               |
| ------------ | ------- | ----------------------------------------- |
| employee_id  | INT     | Unique ID for each employee (Primary Key) |
| first_name   | VARCHAR | Employee first name                       |
| last_name    | VARCHAR | Employee last name                        |
| email        | VARCHAR | Unique email address                      |
| gender       | ENUM    | Male / Female / Other                     |
| age          | INT     | Employee age                              |
| hire_date    | DATE    | Date of joining                           |
| salary       | INT     | Employee salary                           |
| manager_id   | INT     | Manager reference (Self Foreign Key)      |
| department   | VARCHAR | Employee department                       |
| phone_number | VARCHAR | Contact number                            |

---

## Key Concepts Demonstrated

* Relational Database Design
* Primary Keys
* Unique Constraints
* ENUM Data Types
* Self Referencing Foreign Keys
* SQL Joins
* Aggregate Functions
* Conditional Updates
* Data Analysis Queries

---

## Manager–Employee Relationship

The table implements a **self-referencing foreign key**:

```
manager_id → employees.employee_id
```

This models a hierarchy where employees can report to other employees who act as managers.

Example:

```
Employee → Manager
Robin MacMenamy → Nate Henfre
```

---

## Implemented SQL Queries

### 1. Employee Count by Department

Counts employees working in each department.

### 2. Average Salary by Department

Calculates the average salary of employees in each department.

### 3. Gender Distribution

Shows the percentage of employees by gender.

### 4. Gender Distribution Among Managers

Analyzes gender distribution specifically among managers.

### 5. Low Salary Employees

Finds employees earning less than 50,000.

### 6. High Salary Employees

Finds employees earning more than 100,000.

### 7. Employee–Manager Mapping

Uses **self join** to display each employee with their manager name.

### 8. Conditional Salary Update

Applies a **10% salary increment** to employees younger than 30.

### 9. Verification Query

Displays employees whose salary was updated.

---

## Example Query

```sql
SELECT emp.employee_id,
CONCAT(emp.first_name,' ',emp.last_name) AS employee_name,
emp.department,
emp.salary,
CONCAT(m.first_name,' ',m.last_name) AS manager_name
FROM employees emp
LEFT JOIN employees m
ON emp.manager_id = m.employee_id;
```

---

## How to Run the Project

### Step 1

Open **MySQL Workbench** or **MySQL CLI**

### Step 2

Import the SQL file

```
emp_management.sql
```

### Step 3

Execute the script

```
Run → Execute All Queries
```

The database and table will be created automatically.

---

## Technologies Used

* MySQL
* SQL
* Git
* GitHub

---

## Project Purpose

This project is designed for:

* Learning relational database design
* Practicing SQL queries
* Demonstrating database skills in portfolios
* Understanding hierarchical relationships in databases

---

## Author

Saurav Jaiswal

GitHub:
https://github.com/meesauravjaiswal
