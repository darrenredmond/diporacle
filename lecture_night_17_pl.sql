CREATE OR REPLACE PROCEDURE secure_dml
IS
BEGIN
    IF TO_CHAR (SYSDATE, 'HH24:MI')
        NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
    RAISE_APPLICATION_ERROR (-20205, 
        'You may only make changes during normal office hours');
    END IF;
END secure_dml;
/
CREATE OR REPLACE TRIGGER secure_employees
BEFORE 
    INSERT OR UPDATE OR DELETE ON employees
BEGIN
    secure_dml;
END secure_employees;
/
CREATE OR REPLACE TRIGGER secure_departments
BEFORE 
    INSERT OR UPDATE OR DELETE ON departments
BEGIN
    secure_dml;
END secure_departments;
/
ALTER TRIGGER secure_employees ENABLE;
ALTER TRIGGER secure_employees DISABLE;

update employees set email = 'sking' where employee_id = 100;

CREATE OR REPLACE PROCEDURE check_salary(p_salary employees.salary%TYPE)
IS
  v_email employees.email%TYPE; 
BEGIN
  SELECT email INTO v_email FROM employees WHERE salary = p_salary;
  DBMS_OUTPUT.PUT_LINE('Email is : ' || v_email);
EXCEPTION
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Too many users earn this salary : ' || p_salary);
END;
/

select salary from employees order by salary asc;

SET SERVEROUTPUT ON
execute check_salary(1300);
execute check_salary(11);
execute check_salary(1400);

CREATE OR REPLACE PROCEDURE check_salary(p_salary employees.salary%TYPE)
IS
  v_email employees.email%TYPE; 
BEGIN
  SELECT email INTO v_email FROM employees WHERE salary = p_salary;
  DBMS_OUTPUT.PUT_LINE('Email is : ' || v_email);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Noone earns this salary : ' || p_salary);
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Too many users earn this salary : ' || p_salary);
END;
/

SET SERVEROUTPUT ON
execute check_salary(1400);
SET SERVEROUTPUT ON
execute check_salary(1399);

CREATE OR REPLACE PROCEDURE check_salary(p_salary employees.salary%TYPE)
IS
  v_email employees.email%TYPE; 
BEGIN
  SELECT email INTO v_email FROM employees WHERE salary = p_salary;
  DBMS_OUTPUT.PUT_LINE('Email is : ' || v_email);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Noone earns this salary : ' || p_salary);
    raise_application_error(-20100, 'Noone earns this salary : ' || p_salary);
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Too many users earn this salary : ' || p_salary);
    raise_application_error(-20101, 'Too many users earn this salary : ' || p_salary);
END;
/

SET SERVEROUTPUT ON
execute check_salary(1400);
SET SERVEROUTPUT ON
execute check_salary(1399);

CREATE USER DARREN IDENTIFIED BY DARREN;

GRANT SELECT ON EMPLOYEES TO DEMO;

REVOKE SELECT ON EMPLOYEES FROM DEMO;

GRANT ALL PRIVILEGES TO DEMO;
REVOKE ALL PRIVILEGES FROM DEMO;
