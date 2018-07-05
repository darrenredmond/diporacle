
INSERT INTO departments(department_id,
    department_name, manager_id, location_id)
VALUES (71, 'Public Relations', 100, 1700);

SELECT * FROM departments WHERE department_id = 71;

INSERT INTO departments
VALUES (72, 'Public Relations', 100, 1700);

INSERT INTO departments(department_id, department_name)
VALUES (73, 'Public Relations');

INSERT INTO departments
VALUES (74, 'Public Relations', null, null);

INSERT INTO departments(department_id, manager_id, location_id,
   department_name)
VALUES (75, 100, 1700, 'PR');

INSERT INTO employees (employee_id, first_name, last_name,
    email, phone_number, hire_date, job_id, salary, commission_pct, manager_id,
    department_id)
VALUES (334, 'Iouis', 'Popp',
    'IPOPP', '515.124.4567', SYSDATE, 'AC_ACCOUNT', 6900, NULL, 205,
    110);
    
SELECT * from employees where lower(last_name) = 'popp';

INSERT INTO departments(department_id, department_name, location_id)
VALUES (&department_id, '&department_name', &location);

UPDATE employees
SET department_id = 50
WHERE employee_id = 113;

UPDATE employees
SET department_id = 50, last_name = 'Pipp'
WHERE employee_id = 113;

UPDATE employees
SET (job_id,salary) = (SELECT job_id,salary FROM employees WHERE employee_id = 205)
WHERE employee_id = 113;

UPDATE employees
SET job_id = (SELECT job_id FROM employees WHERE employee_id = 205),
    salary = (SELECT salary FROM employees WHERE employee_id = 205)
WHERE employee_id = 113;

DELETE FROM departments
WHERE department_id = 71;

DELETE FROM employees
WHERE department_id IN
(SELECT department_id
FROM departments
WHERE department_name LIKE '%Public%' and department_id != 70);

SELECT * from employees where department_id in (SELECT department_id
FROM departments
WHERE department_name
LIKE '%Public%');

SET AUTOCOMMIT OFF

DELETE FROM COUNTRIES;

DELETE FROM LOCATIONS;

DELETE FROM DEPARTMENTS;

DELETE FROM EMPLOYEES;

DELETE FROM JOB_HISTORY;

SELECT * from JOB_HISTORY;

ROLLBACK

CREATE TABLE dept12
    (deptno NUMBER(2),
     dname VARCHAR2(14),
     loc VARCHAR2(13),
     create_date DATE DEFAULT SYSDATE);
     
DESCRIBE dept12

