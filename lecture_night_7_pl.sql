SET SERVEROUTPUT ON

DECLARE
  v_first_name VARCHAR2(50);
BEGIN
  SELECT first_name INTO v_first_name FROM employees WHERE employee_id = 100;
  DBMS_OUTPUT.PUT_LINE('The first name of the employee is ' || v_first_name);
END;
/

SET SERVEROUTPUT OFF


SET SERVEROUTPUT ON
DECLARE
  emp_hiredate DATE;
  emp_deptno NUMBER(2) NOT NULL := 10;
  location VARCHAR2(13) := 'Atlanta';
  c_comm CONSTANT NUMBER := 1400;
BEGIN
  DBMS_OUTPUT.PUT_LINE('The hire date is ' || emp_hiredate);
  DBMS_OUTPUT.PUT_LINE('The department number is ' || emp_deptno);
  DBMS_OUTPUT.PUT_LINE('The location is ' || location);
  DBMS_OUTPUT.PUT_LINE('The commission is ' || c_comm);
END;
/
SET SERVEROUTPUT OFF
