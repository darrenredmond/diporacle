SELECT sum(salary), avg(salary), max(salary), min(salary)
FROM employees
WHERE job_id like '%REP%';

SELECT count(*) FROM employees WHERE department_id = 50;
SELECT count(commission_pct) FROM employees WHERE department_id = 50;

SELECT count(department_id) FROM employees;
SELECT count(DISTINCT department_id) FROM employees;

SELECT avg(commission_pct) FROM employees;
SELECT avg(nvl(commission_pct,0)) FROM employees;


SELECT department_id as department, round(avg(salary),0) Average
FROM employees
GROUP BY department_id
ORDER BY Average desc;

SELECT department_id as department, round(avg(salary),0) Average, min(last_name)
FROM employees
GROUP BY department_id
ORDER BY Average desc;

SELECT department_id, job_id, round(avg(salary),0) Average
FROM employees
GROUP BY department_id, job_id
ORDER BY Average desc;

SELECT department_id, job_id, round(avg(salary),0) Average
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id asc, job_id asc;

SELECT department_id, job_id, round(avg(salary),0) Average
FROM employees
GROUP BY department_id, job_id
HAVING avg(salary) > 8000
ORDER BY department_id asc, job_id asc;

SELECT max(round(avg(salary),0)) as "Max Average"
FROM employees
GROUP BY department_id;


SELECT round(max(salary)) Maximum, round(min(salary)) Minimum, round(sum(salary)) Sum, round(avg(salary)) Average
FROM employees;

SELECT job_id, round(max(salary)) Maximum, round(min(salary)) Minimum, round(sum(salary)) Sum, round(avg(salary)) Average
FROM employees
GROUP BY job_id
ORDER BY job_id;

SELECT job_id, count(*) Employees
FROM employees
GROUP BY job_id
ORDER BY Employees DESC;

SELECT job_id, count(*) Employees
FROM employees
WHERE lower(job_id) = lower('&job_id')
GROUP BY job_id
ORDER BY Employees DESC;

select concat('20', substr(hire_date, 8)) YEAR, COUNT(substr(hire_date, 8)) Total
from employees
where hire_date between '01-JAN-05' and '31-DEC-08'
group by substr(hire_date, 8)
ORDER BY YEAR;

select concat('20', substr(hire_date, 8)) YEAR, COUNT(substr(hire_date, 8)) Total
from employees
group by substr(hire_date, 8)
HAVING substr(hire_date, 8) between '05' and '08'
ORDER BY YEAR;

SELECT COUNT(*) total,
    SUM(CASE TO_CHAR(hire_date, 'YYYY') WHEN 2005 THEN 1 END) AS "2005",
    SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),2006,1,0)) AS "2006",
    SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),2007,1,0)) AS "2007",
    SUM(DECODE(TO_CHAR(hire_date, 'YYYY'),2008,1,0)) AS "2008"
FROM employees;

SELECT employee_id, last_name, employees.department_id, department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id;

SELECT e.employee_id, e.last_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
ORDER BY last_name;

SELECT employee_id, last_name, department_id, department_name
FROM employees
NATURAL JOIN departments
ORDER BY last_name;

SELECT employee_id, last_name, department_id, department_name
FROM employees
JOIN departments
USING (department_id)
ORDER BY last_name;

SELECT e.employee_id, e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d
ON (e.department_id = d.department_id)
ORDER BY e.last_name;

SELECT e.employee_id, e.last_name, e.department_id, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE (e.department_id = d.department_id)
AND (d.location_id = l.location_id)
ORDER BY e.last_name;

SELECT e.employee_id, e.last_name, e.department_id, d.department_name, l.city
FROM employees e
JOIN departments d
ON (e.department_id = d.department_id)
JOIN locations l
ON (d.location_id = l.location_id)
ORDER BY e.last_name;

SELECT e.employee_id, e.last_name, e.manager_id, manager.last_name as "Manager Name"
FROM employees e
JOIN employees manager
ON (e.manager_id = manager.employee_id)
ORDER BY e.last_name;

SELECT e.employee_id, e.last_name, e.manager_id, manager.last_name as "Manager Name"
FROM employees e, employees manager
WHERE (e.manager_id = manager.employee_id)
ORDER BY e.last_name;

SELECT e.last_name, e.salary, j.JOB_TITLE
FROM employees e JOIN jobs j
ON e.salary
BETWEEN j.min_salary AND j.max_salary;

SELECT e.last_name, e.salary, j.JOB_TITLE
FROM employees e, jobs j
WHERE e.salary
BETWEEN j.min_salary AND j.max_salary;

SELECT e.employee_id, e.last_name, e.department_id, d.department_name
FROM employees e
LEFT OUTER JOIN departments d
ON (e.department_id = d.department_id)
ORDER BY e.last_name;

SELECT e.employee_id, e.last_name, e.department_id, d.department_name
FROM employees e
RIGHT OUTER JOIN departments d
ON (e.department_id = d.department_id)
ORDER BY e.last_name;

SELECT e.employee_id, e.last_name, e.department_id, d.department_name
FROM employees e
CROSS JOIN departments d
ORDER BY e.last_name;
