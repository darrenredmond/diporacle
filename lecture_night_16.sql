-- the subquery
SELECT l.location_id, l.city, l.country_id
FROM locations l
JOIN countries c
ON(l.country_id = c.country_id)
JOIN regions USING(region_id)
WHERE region_name = 'Europe';

SELECT department_name, city
FROM departments
NATURAL JOIN (SELECT l.location_id, l.city, l.country_id
FROM locations l
JOIN countries c
ON(l.country_id = c.country_id)
JOIN regions USING(region_id)
WHERE region_name = 'Europe');

CREATE OR REPLACE VIEW european_cities
AS
SELECT l.location_id, l.city, l.country_id
FROM locations l
JOIN countries c
ON(l.country_id = c.country_id)
JOIN regions USING(region_id)
WHERE region_name = 'Europe';

SELECT department_name, city
FROM departments
NATURAL JOIN european_cities;

SELECT d.department_name, e.city
FROM departments d, european_cities e
WHERE d.location_id = e.location_id;

SELECT employee_id, manager_id, department_id, last_name, first_name
FROM employees
WHERE (manager_id, department_id) IN
(SELECT manager_id, department_id
FROM employees
WHERE first_name = 'John')
AND first_name <> 'John';

SELECT employee_id, manager_id, department_id, last_name, first_name
FROM employees
WHERE manager_id IN
(SELECT manager_id
FROM employees
WHERE first_name = 'John')
AND department_id IN
(SELECT department_id
FROM employees
WHERE first_name = 'John')
AND first_name <> 'John';

SELECT employee_id, manager_id, department_id, last_name, first_name
FROM employees
WHERE manager_id IN
(SELECT manager_id
FROM employees
WHERE first_name = 'John')
OR department_id IN
(SELECT department_id
FROM employees
WHERE first_name = 'John')
AND first_name <> 'John';

-- scalar subqueries
SELECT employee_id, last_name,
(CASE WHEN department_id = (SELECT department_id FROM departments WHERE location_id = 1800)
THEN 'Canada' ELSE 'USA' END) location
FROM employees;


SELECT employee_id, last_name
FROM employees e
ORDER BY (SELECT department_name
FROM departments d
WHERE e.department_id = d.department_id), last_name;

-- correlated sub query
SELECT last_name, salary, department_id
FROM employees outer_table
WHERE salary >
(SELECT AVG(salary)
FROM employees inner_table
WHERE inner_table.department_id =
outer_table.department_id);

-- exists

SELECT employee_id, last_name, job_id, department_id
FROM employees outer
WHERE EXISTS (SELECT 'X' FROM employees WHERE manager_id = outer.employee_id);

SELECT employee_id, last_name, job_id, department_id
FROM employees outer
WHERE NOT EXISTS (SELECT 'X' FROM employees WHERE manager_id = outer.employee_id);

SELECT department_id, department_name
FROM departments d
WHERE NOT EXISTS (SELECT 'X' FROM employees WHERE department_id = d.department_id);

-- with

WITH
dept_costs AS (
SELECT d.department_name, SUM(e.salary) AS dept_total
FROM employees e JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name),
avg_cost AS (
SELECT SUM(dept_total)/COUNT(*) AS dept_avg
FROM dept_costs)
SELECT *
FROM dept_costs
WHERE dept_total >
(SELECT dept_avg
FROM avg_cost)
ORDER BY department_name;


-- insert with subquery - type safety - preventing typing mistakes
-- or for business rules.

INSERT INTO (SELECT l.location_id, l.city, l.country_id
FROM locations l
JOIN countries c
ON(l.country_id = c.country_id)
JOIN regions USING(region_id)
WHERE region_name = 'Europe')
VALUES (3301, 'Cardiff', 'UK');

select * from locations where location_id = 3300;

INSERT INTO ( SELECT location_id, city, country_id
FROM locations
WHERE country_id IN
(SELECT country_id
FROM countries
NATURAL JOIN regions
WHERE region_name = 'Europe')
WITH CHECK OPTION )
VALUES (3600, 'Washington', 'US');

select e.first_name, e.last_name, d.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id;

describe departments

alter table employees
add department_name varchar2(30);

UPDATE employees e
SET department_name =
(SELECT department_name
FROM departments d
WHERE e.department_id = d.department_id)
WHERE e.department_name != d.department_name;

select e.first_name, e.last_name, e.department_id, e.department_name
from employees e;

alter table employees
drop column department_name;
