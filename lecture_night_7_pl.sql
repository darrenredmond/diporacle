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


SET SERVEROUTPUT ON
DECLARE
  my_name VARCHAR2(20);
  second_name my_name%TYPE;
  emp_id employees.employee_id%TYPE;
BEGIN
  DBMS_OUTPUT.PUT_LINE('My name is ' || my_name);
  my_name := 'John';
  DBMS_OUTPUT.PUT_LINE('My name is ' || my_name);
END;
/
SET SERVEROUTPUT OFF

DESCRIBE employees

VARIABLE emp_salary NUMBER

BEGIN
  SELECT salary INTO :emp_salary FROM employees WHERE employee_id = 178;
END;
/

PRINT emp_salary

SELECT first_name, last_name FROM employees WHERE salary = :emp_salary;

SET AUTOPRINT ON
DECLARE
  empno NUMBER(6) := &empno;
BEGIN
  SELECT salary INTO :emp_salary FROM employees WHERE employee_id = empno;
END;
/

-- Q1
DECLARE
  v_id NUMBER(4);
  v_x VARCHAR2(10); v_y VARCHAR2(10); v_z VARCHAR2(10);
  v_birthdate DATE NOT NULL := '04-JAN-04';
  v_in_stock BOOLEAN := TRUE;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Hi');
END;
/

-- Q2
DECLARE
  v_due_date DATE;
  v_days_to_go NUMBER(6);
  v_dept_no NUMBER(6) := 10;
  v_sender VARCHAR2(32);
  v_sum NUMBER(9);
  v_flag BOOLEAN;
  v_n1 BOOLEAN; v_n2 NUMBER(6) := 10; v_n3 NUMBER(6) := 20;
  v_value VARCHAR2(20);
BEGIN
  v_due_date := SYSDATE + 1;
  v_days_to_go := v_due_date - SYSDATE;
  v_dept_no := 10;
  v_sender := USER || ': ' || TO_CHAR(v_dept_no);
  v_sum := 100000 + 250000;
  v_flag := TRUE;
  v_n1 := v_n2 > (2 * v_n3);
  v_value := NULL;
END;
/

-- Q3
SET SERVEROUTPUT ON
BEGIN
  DBMS_OUTPUT.PUT_LINE('My PL/SQL Block Works');
END;
/
SET SERVEROUTPUT OFF

-- Q4
VARIABLE dr_char VARCHAR2
VARIABLE dr_num NUMBER
SET AUTOPRINT ON
DECLARE
  v_char VARCHAR2(20) := '42 is the answer';
  v_num NUMBER(6) := substr(v_char, 0, 2);
BEGIN
  :dr_char := v_char;
  :dr_num := v_num;
END;
/
