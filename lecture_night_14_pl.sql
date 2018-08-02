
CREATE OR REPLACE FUNCTION calculate_tax
RETURN NUMBER
IS
  v_employee_id employees.employee_id%TYPE;
  v_tax employees.salary%TYPE;
BEGIN
  v_employee_id := 205;
  select salary * .4 into v_tax from employees where employee_id = v_employee_id;
  RETURN v_tax;
END;
/

select salary from employees where employee_id = 205;
select calculate_tax from dual;

SET SERVEROUTPUT ON
DECLARE
BEGIN
  IF calculate_tax > 0 THEN
    DBMS_OUTPUT.PUT_LINE('Tax has been calculated');
  END IF;
END;
/

DROP FUNCTION calculate_tax;

CREATE OR REPLACE FUNCTION calculate_tax(p_employee_id employees.employee_id%TYPE)
RETURN NUMBER IS
  v_tax employees.salary%TYPE;
BEGIN
  select salary * .32 into v_tax from employees where employee_id = p_employee_id;
  RETURN v_tax;
END;
/
select calculate_tax(205) as tax_205, calculate_tax(101) as tax_101 from dual;
select employee_id, salary, calculate_tax(employee_id) as tax from employees;
select employee_id, salary, salary * .32 as tax from employees;

CREATE OR REPLACE FUNCTION add_three_numbers(a NUMBER := 0, b NUMBER := 0, c NUMBER := 0)
RETURN NUMBER IS
BEGIN
  RETURN a + b + c;
END;
/
-- positional
select add_three_numbers(7, 6, 5) as total from dual;
-- positional with defaults (aka exclusionary)
select add_three_numbers(7) as total from dual;
-- named
select add_three_numbers(b=>6,c=>5,a=>7) as total from dual;
-- mixed, i.e. positional first, and then optional named parameters
select add_three_numbers(7, c=>5) as total from dual;

CREATE OR REPLACE PROCEDURE add_department
IS
  v_department_id departments.department_id%TYPE;
  v_department_name departments.department_name%TYPE;
BEGIN
  v_department_id := 293;
  v_department_name := 'ST-Cirriculum';
  INSERT INTO departments(department_id, department_name)
    VALUES(v_department_id, v_department_name);
  DBMS_OUTPUT.PUT_LINE('Inserted ' || SQL%ROWCOUNT || ' row(s)');
END;
/

SET SERVEROUTPUT ON
EXECUTE add_department();

BEGIN
  add_department();
END;
/

DROP PROCEDURE add_department;

CREATE OR REPLACE PROCEDURE add_department(
  p_department_id IN departments.department_id%TYPE,
  p_department_name IN departments.department_name%TYPE
)
IS
BEGIN
  INSERT INTO departments(department_id, department_name)
    VALUES(p_department_id, p_department_name);
  DBMS_OUTPUT.PUT_LINE('Inserted ' || SQL%ROWCOUNT || ' row(s)');
END;
/

EXECUTE add_department(295, 'IT');
SET SERVEROUTPUT ON
EXECUTE add_department(296, 'Sales');

SET SERVEROUTPUT ON
BEGIN
  add_department(297, 'Accounts');
  add_department(298, 'Finance');
  add_department(299, 'Development');
END;
/

/*
ALTER TABLE marketing RENAME COLUMN team_id TO id;

ALTER TABLE marketing ADD COLUMN id NUMBER(6);
UPDATE marketing set ID = team_id;
ALTER TABLE marketing DROP COLUMN team_id;

RENAME dremps TO dremps50;
*/
