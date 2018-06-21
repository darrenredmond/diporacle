SELECT employee_id, first_name
FROM employees
ORDER BY employee_id;

SELECT employee_id, first_name
FROM employees
ORDER BY employee_id DESC;
--FETCH FIRST 5 ROWS ONLY;

SELECT employee_id, first_name, salary*12 annsal
FROM employees
ORDER BY annsal;

SELECT employee_id, first_name, salary*12 annsal
FROM employees
ORDER BY 3;

SELECT employee_id, first_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;

SELECT employee_id, first_name
FROM employees
ORDER BY employee_id DESC
FETCH FIRST 5 ROWS ONLY;

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_num;

SELECT last_name, department_id, salary*12
FROM employees
WHERE job_id = '&job_title';

SELECT employee_id, last_name, job_id, &&column_name
FROM employees
ORDER BY &column_name;

UNDEFINE column_name

SET VERIFY ON
DEFINE employee_num = 200

SELECT employee_id, last_name, salary
FROM employees
WHERE employee_id = &employee_num;

UNDEFINE employee_num
SET VERIFY OFF

SELECT lower('SQL Course') from dual;
SELECT upper('SQL Course') from dual;
SELECT initcap('SQL Course') from dual;

select lower(first_name) from employees;

SELECT 'The job id for ' || UPPER(last_name) || ' is '
||LOWER(job_id) AS "EMPLOYEE DETAILS"
FROM employees;

SELECT concat('The job id for ', UPPER(last_name)), ' is ', LOWER(job_id)) AS "EMPLOYEE DETAILS"
FROM employees;

SELECT concat(concat(concat('The job id for ', UPPER(last_name)), ' is '),
   LOWER(job_id)) AS "EMPLOYEE DETAILS"
FROM employees;

SELECT employee_id, CONCAT(first_name, last_name) NAME, job_id, LENGTH (last_name), INSTR(last_name, 'a') "Contains 'a'?"
FROM employees
WHERE SUBSTR(job_id, 4) = 'REP';

SELECT employee_id, CONCAT(CONCAT(first_name, ' '), last_name) NAME,
    job_id, LENGTH (last_name), INSTR(last_name, 'a') "Contains 'a'?"
FROM employees
WHERE SUBSTR(job_id, 4) = 'REP';

SELECT last_name, UPPER(CONCAT(SUBSTR (LAST_NAME, 1, 8), '_US'))
FROM employees
WHERE department_id = 60;

SELECT sysdate
FROM dual;

SELECT last_name, round((SYSDATE-hire_date)/7, 0) AS WEEKS
FROM employees
WHERE department_id = 90;

SELECT employee_id, TO_CHAR(hire_date, 'MM/YY') Month_Hired
FROM employees
WHERE last_name = 'Higgins';

SELECT last_name, TO_CHAR(hire_date, 'fmDD Month YYYY')
AS HIREDATE
FROM employees;

SELECT last_name, hire_date
FROM employees
WHERE hire_date = TO_DATE('May     24,    2007    ', 'Month  DD, YYYY');

select salary+(nvl(commission_pct, 0)*10) from employees;

SELECT last_name, salary, commission_pct,
   NVL2(commission_pct, 'SAL+COMM', 'SAL') income
FROM employees WHERE department_id IN (50, 80);

SELECT first_name, LENGTH(first_name) "expr1",
  last_name, LENGTH(last_name) "expr2",
  NULLIF(LENGTH(first_name), LENGTH(last_name)) result
FROM employees;

SELECT last_name, job_id, salary,
  CASE job_id WHEN 'IT_PROG' THEN 1.10*salary
       WHEN 'ST_CLERK' THEN 1.15*salary
       WHEN 'SA_REP' THEN 1.20*salary
       ELSE salary END "Revised Salary"
FROM employees;

SELECT last_name, job_id, salary,
  decode(job_id,
        'IT_PROG', 1.10*salary,
        'ST_CLERK', 1.15*salary,
        'SA_REP', 1.20*salary,
        1*salary) "Revised Salary"
FROM employees;

