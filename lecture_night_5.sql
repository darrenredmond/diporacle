
-- this natural join is on the country_id column - please don't it.
SELECT location_id, street_address, city, state_province,
country_name
FROM locations
NATURAL JOIN countries;

describe locations
describe countries

SELECT location_id, street_address, city, state_province, country_name
FROM locations l, countries c
WHERE l.country_id = c.country_id;

SELECT last_name, first_name, salary
FROM employees
WHERE salary > 10000;

SELECT last_name, first_name, salary
FROM employees
WHERE salary > (SELECT salary from employees where last_name = 'Abel');

-- works but is disgustinglyy horrible - please don't do
SELECT last_name, first_name, salary
FROM employees
WHERE (SELECT salary from employees where last_name = 'Abel') < salary;

SELECT last_name, first_name, salary
FROM employees
WHERE salary <= (SELECT salary from employees where last_name like '%a%');

select * from employees where last_name = 'Taylor';

update employees set last_name = 'Tiylor' where employee_id = 180;

SELECT last_name, job_id, salary
FROM employees
WHERE job_id = (SELECT job_id FROM employees WHERE last_name = 'Taylor')
AND salary > (SELECT salary FROM employees WHERE last_name = 'Taylor');

update employees set last_name = 'Taylor' where employee_id = 180;

SELECT last_name, job_id, salary
FROM employees
WHERE job_id IN (SELECT job_id FROM employees WHERE last_name = 'Taylor')
AND salary > (SELECT max(salary) FROM employees WHERE last_name = 'Taylor');

SELECT last_name, job_id, salary
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id

HAVING MIN(salary) > (SELECT MIN(salary) FROM employees WHERE department_id = 20);

SELECT employee_id, last_name
FROM employees
WHERE salary =
(SELECT MIN(salary) FROM employees GROUP BY department_id);

SELECT last_name, salary, department_id
FROM employees
WHERE salary IN (SELECT MIN(salary)
                 FROM employees
                 GROUP BY department_id);

-- find all non it programmers earning salaries less the max it programming salary
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE job_id <> 'IT_PROG'
AND salary < ANY (SELECT salary
                FROM employees
                WHERE job_id = 'IT_PROG');

-- find all non it programmers earning salaries less the min it programming salary
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE job_id <> 'IT_PROG'
AND salary < ALL (SELECT salary
                FROM employees
                WHERE job_id = 'IT_PROG');

SELECT employee_id,salary,last_name FROM employees M
WHERE EXISTS
(SELECT employee_id FROM employees W
WHERE (W.manager_id=M.employee_id) AND W.salary > 10000);

SELECT employee_id,salary,last_name FROM employees M
WHERE M.employee_id IN
(SELECT employee_id FROM employees W
WHERE (W.manager_id=M.employee_id) AND W.salary > 10000);

SELECT * FROM departments
WHERE NOT EXISTS
(SELECT * FROM employees
WHERE employees.department_id=departments.department_id);

SELECT * FROM departments
WHERE NOT EXISTS
(SELECT * FROM employees
WHERE employees.department_id=departments.department_id);

SELECT emp.last_name FROM employees emp
WHERE emp.employee_id NOT IN (
SELECT mgr.manager_id FROM employees mgr);

SELECT emp.last_name FROM employees emp
WHERE emp.employee_id NOT IN (
SELECT mgr.manager_id FROM employees mgr WHERE mgr.manager_id is not null);

SELECT e.employee_id, e.last_name, e.salary
FROM employees e
WHERE e.salary > (SELECT avg(i.salary) from employees i)
ORDER BY e.salary ASC;

SELECT employee_id, job_id
FROM employees
UNION
SELECT employee_id, job_id
FROM job_history;

SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;

SELECT employee_id, job_id
FROM employees
MINUS
SELECT employee_id, job_id
FROM job_history;

SELECT employee_id, job_id
FROM job_history
MINUS
SELECT employee_id, job_id
FROM employees;

SELECT location_id, department_name "Department",
TO_CHAR(NULL) "Warehouse location"
FROM departments
UNION
SELECT location_id, TO_CHAR(NULL) "Department",
state_province
FROM locations
ORDER BY location_id desc;
