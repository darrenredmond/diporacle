
SET SERVEROUTPUT ON
DECLARE
  CURSOR emp_cursor IS SELECT employee_id, last_name
    FROM employees WHERE department_id = 30;
  v_employee_id employees.employee_id%TYPE;
  v_last_name employees.last_name%TYPE;
BEGIN
  OPEN emp_cursor;
  FETCH emp_cursor INTO v_employee_id, v_last_name;
  DBMS_OUTPUT.PUT_LINE(v_employee_id || ' ' || v_last_name);
  CLOSE emp_cursor;
END;
/

SET SERVEROUTPUT ON
DECLARE
  CURSOR emp_cursor IS SELECT employee_id, last_name
    FROM employees WHERE department_id = 30;
  v_employee_id employees.employee_id%TYPE;
  v_last_name employees.last_name%TYPE;
BEGIN
  OPEN emp_cursor;
  LOOP
    FETCH emp_cursor INTO v_employee_id, v_last_name;
    EXIT WHEN emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_employee_id || ' ' || v_last_name);
  END LOOP;
  CLOSE emp_cursor;
END;
/

SET SERVEROUTPUT ON
DECLARE
  CURSOR emp_cursor IS SELECT *
    FROM employees WHERE department_id = 30;
  emp_record emp_cursor%ROWTYPE;
BEGIN
  OPEN emp_cursor;
  LOOP
    FETCH emp_cursor INTO emp_record;
    EXIT WHEN emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(emp_record.employee_id || ' ' || emp_record.email);
  END LOOP;
  CLOSE emp_cursor;
END;
/

-- the cursor for loop way
SET SERVEROUTPUT ON
DECLARE
  CURSOR emp_cursor IS SELECT *
    FROM employees WHERE department_id = 30;
BEGIN
  FOR emp_record in emp_cursor
  LOOP
    DBMS_OUTPUT.PUT_LINE(emp_record.employee_id || ' ' || emp_record.email);
  END LOOP;
END;
/

-- the cursor for loop way
SET SERVEROUTPUT ON
BEGIN
  FOR emp_record in (SELECT *
    FROM employees WHERE department_id = 30)
  LOOP
    DBMS_OUTPUT.PUT_LINE(emp_record.employee_id || ' ' || emp_record.email);
  END LOOP;
END;
/

SET SERVEROUTPUT ON
DECLARE
  CURSOR emp_cursor(dept_num employees.department_id%TYPE) IS SELECT *
    FROM employees WHERE department_id = dept_num;
  emp_record emp_cursor%ROWTYPE;
BEGIN
  OPEN emp_cursor(30);
  LOOP
    FETCH emp_cursor INTO emp_record;
    EXIT WHEN emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(emp_record.employee_id || ' ' || emp_record.email);
  END LOOP;
  CLOSE emp_cursor;
  OPEN emp_cursor(50);
  LOOP
    FETCH emp_cursor INTO emp_record;
    EXIT WHEN emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(emp_record.employee_id || ' ' || emp_record.email);
  END LOOP;
  CLOSE emp_cursor;
END;
/


