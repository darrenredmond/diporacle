SET SERVEROUTPUT ON

DECLARE
  v_first_name VARCHAR2(50);
BEGIN
  SELECT first_name INTO v_first_name FROM employees WHERE employee_id = 200;
  DBMS_OUTPUT.PUT_LINE('The first name of the employee is ' || v_first_name);
END;
/

SET SERVEROUTPUT OFF

SET SERVEROUTPUT ON
DECLARE
  v_hire_date employees.hire_date%TYPE;
  v_salary employees.salary%TYPE;
BEGIN
  SELECT hire_date, salary INTO v_hire_date, v_salary
  FROM employees WHERE employee_id = 200;
  DBMS_OUTPUT.PUT_LINE('The hire date of the employee is ' || v_hire_date);
  DBMS_OUTPUT.PUT_LINE('The salary of the employee is ' || v_salary);
END;
/
SET SERVEROUTPUT OFF

SET SERVEROUTPUT ON
DECLARE
  v_sum_salary NUMBER(10, 2);
  v_dept_no NUMBER NOT NULL := 60;
BEGIN
  SELECT sum(salary) INTO v_sum_salary
  FROM employees WHERE department_id = v_dept_no;
  DBMS_OUTPUT.PUT_LINE('The sum of salaries is ' || v_sum_salary);
  IF SQL%FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Rows found.');
  END IF;
END;
/
SET SERVEROUTPUT OFF

BEGIN
  INSERT INTO employees(employee_id, first_name, last_name, email, hire_date, job_id, salary)
  VALUES (employees_seq.NEXTVAL, 'Ruth', 'Cores', 'rcores', SYSDATE, 'AD_ASST', 4000);
END;
/

SET SERVEROUTPUT ON
DECLARE
  v_salary_increase employees.salary%TYPE := 800;
BEGIN
  UPDATE employees
  SET salary = salary - v_salary_increase
  WHERE job_id = 'ST_CLERK';
  IF SQL%FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Rows found.');
  END IF;
  DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' rows updated.');
END;
/
SET SERVEROUTPUT OFF

SET SERVEROUTPUT ON
DECLARE
  v_my_age NUMBER := 15;
BEGIN
  IF v_my_age < 11 THEN
    DBMS_OUTPUT.PUT_LINE('I am a child.');
  ELSIF v_my_age < 13 THEN
    DBMS_OUTPUT.PUT_LINE('I am a nuisance.');
  ELSIF v_my_age < 20 THEN
    DBMS_OUTPUT.PUT_LINE('I am a teenager.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('I am neither a child nor a teenager.');
  END IF;
END;
/
SET SERVEROUTPUT OFF

SET SERVEROUTPUT ON
DECLARE
  v_grade CHAR(1) := 'A';
  v_appraisal VARCHAR(20);
BEGIN
  v_appraisal :=
    CASE v_grade
      WHEN 'A' THEN 'Excellent'
      WHEN 'B' THEN 'Very Good'
      WHEN 'C' THEN 'Good'
      ELSE 'No such grade'
    END;
    DBMS_OUTPUT.PUT_LINE('Grade ' || v_grade || ' Appraisal ' || v_appraisal);
END;
/
SET SERVEROUTPUT OFF

SET SERVEROUTPUT ON
DECLARE
  v_grade CHAR(1) := 'A';
  v_appraisal VARCHAR(20);
BEGIN
  v_appraisal :=
    CASE
      WHEN v_grade = 'A' THEN 'Excellent'
      WHEN v_grade in ('B', 'C') THEN 'Good'
      ELSE 'No such grade'
    END;
    DBMS_OUTPUT.PUT_LINE('Grade ' || v_grade || ' Appraisal ' || v_appraisal);
END;
/
SET SERVEROUTPUT OFF

SET SERVEROUTPUT ON
DECLARE
  v_my_age NUMBER := 1;
BEGIN
  CASE v_my_age
    WHEN 1 THEN
      DBMS_OUTPUT.PUT_LINE('I am a child.');
    WHEN 2 THEN
      DBMS_OUTPUT.PUT_LINE('I am a nuisance.');
    WHEN 3 THEN
      DBMS_OUTPUT.PUT_LINE('I am a teenager.');
  END CASE;
END;
/
SET SERVEROUTPUT OFF
