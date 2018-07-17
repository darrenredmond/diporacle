DECLARE
  v_first_name VARCHAR2(50) := 'Darren';
  v_date_of_joining DATE := '02-JAN-02';
BEGIN
  DBMS_OUTPUT.PUT_LINE('The first name of the employee is ' || LOWER(v_first_name));
  DBMS_OUTPUT.PUT_LINE('The first name is of length ' || LENGTH(v_first_name));
  DBMS_OUTPUT.PUT_LINE('Date of joining ' || v_date_of_joining);
  v_date_of_joining := TO_DATE('January 12, 2002', 'Month DD, YYYY');
  --v_date_of_joining := 'January 02, 2002';
  DBMS_OUTPUT.PUT_LINE('Date of joining ' || v_date_of_joining);
END;
/

SET SERVEROUTPUT ON
<<outer>>
DECLARE
  sal NUMBER(7,2) := 60000;
  comm NUMBER(7,2) := 0.2;
  message VARCHAR2(255) := ' eligible for commission';
BEGIN
  DECLARE
    sal NUMBER(7,2) := 50000;
    comm NUMBER(7,2) := 0;
    total_comp NUMBER(7,2) := sal + comm;
  BEGIN
    -- referring to the inner salary
    DBMS_OUTPUT.PUT_LINE('Sal ' || sal);
    DBMS_OUTPUT.PUT_LINE('Outer Sal ' || outer.sal);
    DBMS_OUTPUT.PUT_LINE('Comm ' || comm);
    DBMS_OUTPUT.PUT_LINE('Total Comp ' || total_comp);
    DBMS_OUTPUT.PUT_LINE('Message ' || message);
    -- referring to the outer message
    message := 'CLERK not' || message;  
    DBMS_OUTPUT.PUT_LINE('Message ' || message);
  END;
  DBMS_OUTPUT.PUT_LINE('Message ' || message);
  message := 'SALESMAN' || message;  
  DBMS_OUTPUT.PUT_LINE('Sal ' || sal);
  DBMS_OUTPUT.PUT_LINE('Comm ' || comm);
  DBMS_OUTPUT.PUT_LINE('Message ' || message);
END;
/

INSERT INTO departments(department_id, department_name, location_id)
  VALUES (dept_deptid_seq.NEXTVAL, 'Support', 2500);

SELECT dept_deptid_seq.CURRVAL from dual;

-- following example only works in oracle 12 and later.
CREATE SEQUENCE seq_1 START WITH 1;

CREATE TABLE emp_seq_example (
  a1 NUMBER(7) DEFAULT seq_1.NEXTVAL,
  a2 VARCHAR2(10)
);

INTO emp_seq_example (a2) VALUES ('mark');
INTO emp_seq_example (a2) VALUES ('john');
SELECT * FROM emp_seq_example;

DROP SEQUENCE seq_1;

-- oracle 12 example finished 

ALTER SEQUENCE dept_deptid_seq
INCREMENT BY 20
MAXVALUE 999999
NOCACHE
NOCYCLE;

SELECT sequence_name, min_value, max_value, increment_by, last_number
FROM user_sequences;

CREATE SYNONYM e for employees;

select * from e;

DROP SYNONYM e;
