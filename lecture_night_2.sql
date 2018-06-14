SELECT * FROM departments;

SELECT department_id, location_id
  FROM departments
  WHERE location_id = 1700;

SELECT last_name, salary, salary + 300
FROM employees;

SELECT 6*7 FROM dual;

SELECT employee_id, last_name, job_id, salary, commission_pct
FROM employees;

SELECT employee_id, last_name, 12*salary*commission_pct AS "Comm Percent"
FROM employees;

SELECT last_name || job_id AS "Employees"
FROM employees;

SELECT last_name || ' is a ' || job_id AS "Employees"
FROM employees;

SELECT department_id || q'[ Department's Manager: ]' || manager_id AS "Dept Details"
FROM departments;

SELECT department_id FROM employees;

SELECT DISTINCT department_id FROM employees;

DESC departments
DESCRIBE departments

SELECT last_name, job_id, department_id
FROM EMPLOYEES
WHERE department_id = 90;

SELECT last_name, job_id, department_id
FROM EMPLOYEES
WHERE last_name = 'Whalen';

SELECT last_name, job_id, department_id
FROM EMPLOYEES
WHERE lower(last_name) = 'whalen';

SELECT last_name, job_id, department_id
FROM EMPLOYEES
WHERE upper(last_name) = 'WHALEN';

SELECT last_name, job_id, hire_date, department_id
FROM EMPLOYEES
WHERE hire_date <> '17-OCT-03';

SELECT last_name, job_id, hire_date, department_id
FROM EMPLOYEES
WHERE hire_date BETWEEN '17-OCT-03' AND '31-OCT-03';

SELECT last_name, job_id, hire_date, department_id
FROM EMPLOYEES
WHERE hire_date > '17-OCT-03' AND hire_date < '31-OCT-03';

SELECT last_name, job_id, department_id
FROM EMPLOYEES
WHERE last_name = 'Whalen'
  OR last_name = 'King'
  OR last_name = 'Kocchar';

SELECT last_name, job_id, department_id
FROM EMPLOYEES
WHERE last_name IN ('Whalen', 'King', 'Kochhar');

SELECT last_name, job_id, department_id
FROM EMPLOYEES
WHERE last_name NOT IN ('Whalen', 'King', 'Kochhar');

SELECT last_name, job_id, department_id
FROM EMPLOYEES
WHERE last_name LIKE 'W%';

SELECT last_name, job_id, department_id
FROM EMPLOYEES
WHERE lower(last_name) LIKE '%e%';

SELECT last_name, job_id, department_id
FROM EMPLOYEES
WHERE lower(last_name) LIKE '%e__';

SELECT last_name, job_id, department_id
FROM EMPLOYEES
WHERE commission_pct IS NOT NULL
OR lower(last_name) LIKE '%e%';

SELECT employee_id, last_name, job_id
FROM employees WHERE job_id LIKE '%SA\_%' ESCAPE '\';

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 10000
AND job_id LIKE '%MAN%' ;
