CREATE OR REPLACE VIEW empvu80
AS SELECT employee_id, last_name, salary
FROM employees
WHERE department_id = 80;

SELECT * from EMPLOYEES;

SELECT * from empvu80;

SELECT salary, last_name from empvu80;

DESCRIBE empvu80

CREATE OR REPLACE VIEW empvu80
  (id_number, name, sal, department_id)
AS SELECT employee_id, first_name || ' ' || last_name, salary, department_id
FROM employees
WHERE department_id = 80;

SELECT * from empvu80;

CREATE OR REPLACE VIEW dept_sum_vu
(name, minsal, maxsal, avgsal)
AS SELECT d.department_name, MIN(e.salary),
MAX(e.salary),ROUND(AVG(e.salary),2)
FROM employees e JOIN departments d
ON (e.department_id = d.department_id)
GROUP BY d.department_name;

select * from dept_sum_vu;

SELECT view_name, text from user_views;

