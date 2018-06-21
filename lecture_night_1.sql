select first_name, last_name, department_id, salary, hire_date, manager_id 
from hr.EMPLOYEES 
where department_id = 90;

Select last_name, job_id, department_id
from hr.employees
where last_name = 'Whalen';

Select last_name, job_id, salary, department_id
from hr.employees
where salary between 6000 and 8000;

Select last_name, job_id, salary, department_id
from hr.employees
where salary <=4000;

Select first_name||' '||last_name as Name, salary, department_id
from hr.employees
where last_name between 'King' and 'Smith';

Select employee_id, first_name||' '||last_name as Name, manager_id, department_id
from hr.employees
where manager_id IN (100, 101, 201);

Select employee_id, first_name||' '||last_name as Name
from hr.employees
where first_name like 'S%';

Select employee_id, first_name||' '||last_name as Name, hire_date
from hr.employees
where hire_date like '%05';

Select employee_id, first_name||' '||last_name as Name, manager_id
from hr.employees
where last_name like '_o%' and lower(first_name) like '%e%';