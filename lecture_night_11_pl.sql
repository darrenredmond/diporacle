-- Basic Loop
SET SERVEROUTPUT ON
DECLARE
  v_country_id locations.country_id%TYPE := 'CA';
  v_location_id locations.location_id%TYPE;
  counter NUMBER(2) := 1;
  new_city locations.city%TYPE := 'Montreal';
BEGIN
  SELECT MAX(location_id) into v_location_id
  FROM locations
  WHERE country_id = v_country_id;
  LOOP
    INSERT INTO locations(location_id, city, country_id)
    VALUES (v_location_id + counter, new_city, v_country_id);
    counter := counter + 1;
    DBMS_OUTPUT.PUT_LINE('Added location.');
    EXIT WHEN counter > 3;
  END LOOP;
END;
/
SET SERVEROUTPUT OFF

-- While Loop
SET SERVEROUTPUT ON
DECLARE
  v_country_id locations.country_id%TYPE := 'CA';
  v_location_id locations.location_id%TYPE;
  counter NUMBER(2) := 1;
  new_city locations.city%TYPE := 'Montreal';
BEGIN
  SELECT MAX(location_id) into v_location_id
  FROM locations
  WHERE country_id = v_country_id;
  WHILE counter <= 3 LOOP
    INSERT INTO locations(location_id, city, country_id)
    VALUES (v_location_id + counter, new_city, v_country_id);
    counter := counter + 1;
    DBMS_OUTPUT.PUT_LINE('Added location.');
  END LOOP;
END;
/
SET SERVEROUTPUT OFF

-- For Loop
SET SERVEROUTPUT ON
DECLARE
  v_country_id locations.country_id%TYPE := 'CA';
  v_location_id locations.location_id%TYPE;
  new_city locations.city%TYPE := 'Montreal';
BEGIN
  SELECT MAX(location_id) into v_location_id
  FROM locations
  WHERE country_id = v_country_id;
  FOR counter in 1..3 LOOP
    INSERT INTO locations(location_id, city, country_id)
    VALUES (v_location_id + counter, new_city, v_country_id);
    DBMS_OUTPUT.PUT_LINE('Added location.');
  END LOOP;
END;
/
SET SERVEROUTPUT OFF

SET SERVEROUTPUT ON
DECLARE
  TYPE emp_record_type IS RECORD
    (last_name employees.last_name%TYPE,
     job_id employees.job_id%TYPE,
     salary employees.salary%TYPE);
  emp_record emp_record_type;
BEGIN
  SELECT last_name, job_id, salary into emp_record
  FROM employees WHERE employee_id = 100;
  DBMS_OUTPUT.PUT_LINE('Emp Record last name ' || emp_record.last_name);
  DBMS_OUTPUT.PUT_LINE('Emp Record job id ' || emp_record.job_id);
  DBMS_OUTPUT.PUT_LINE('Emp Record salary ' || emp_record.salary);
END;
/
SET SERVEROUTPUT OFF


SET SERVEROUTPUT ON
DECLARE
  emp_record employees%ROWTYPE;
BEGIN
  SELECT * into emp_record
  FROM employees WHERE employee_id = 100;
  DBMS_OUTPUT.PUT_LINE('Emp Record last name ' || emp_record.last_name);
  DBMS_OUTPUT.PUT_LINE('Emp Record job id ' || emp_record.job_id);
  DBMS_OUTPUT.PUT_LINE('Emp Record salary ' || emp_record.salary);
  DBMS_OUTPUT.PUT_LINE('Emp Record email ' || emp_record.email);
END;
/
SET SERVEROUTPUT OFF

SET SERVEROUTPUT ON
DECLARE
  TYPE emp_table_type is TABLE OF employees%ROWTYPE INDEX BY PLS_INTEGER;
  my_emp_table emp_table_type;
BEGIN
  FOR i IN 100..104 LOOP
    SELECT * into my_emp_table(i) FROM employees WHERE employee_id = i;
  END LOOP;
  FOR i IN my_emp_table.FIRST..my_emp_table.LAST LOOP
    DBMS_OUTPUT.PUT_LINE('Emp Record last name ' || my_emp_table(i).last_name);
    DBMS_OUTPUT.PUT_LINE('Emp Record job id ' || my_emp_table(i).job_id);
    DBMS_OUTPUT.PUT_LINE('Emp Record salary ' || my_emp_table(i).salary);
    DBMS_OUTPUT.PUT_LINE('Emp Record email ' || my_emp_table(i).email);
  END LOOP;
END;
/
SET SERVEROUTPUT OFF
