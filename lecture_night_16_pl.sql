CREATE OR REPLACE TRIGGER validate_employee_statement
BEFORE INSERT OR UPDATE
ON employees
BEGIN
  DBMS_OUTPUT.PUT_LINE('Validating statement.');
  IF INSERTING THEN
    DBMS_OUTPUT.PUT_LINE('Inserting.');
  ELSIF UPDATING THEN
    DBMS_OUTPUT.PUT_LINE('Updating.');
  END IF;
END;
/

CREATE OR REPLACE TRIGGER validate_employee_changes
BEFORE INSERT OR UPDATE
ON employees
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('Validating email.');
  DBMS_OUTPUT.PUT_LINE('Old email : ' || :OLD.email);
  DBMS_OUTPUT.PUT_LINE('New email : ' || :NEW.email);
END;
/

CREATE OR REPLACE TRIGGER log_employee_statement
AFTER INSERT OR UPDATE
ON employees
BEGIN
  DBMS_OUTPUT.PUT_LINE('Logging statement.');
END;
/
CREATE OR REPLACE TRIGGER log_employee_changes
AFTER INSERT OR UPDATE
ON employees
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE('Changing email.');
  DBMS_OUTPUT.PUT_LINE('Old email : ' || :OLD.email);
  DBMS_OUTPUT.PUT_LINE('New email : ' || :NEW.email);
END;
/

SET SERVEROUTPUT ON
UPDATE employees set email = 'sking' where employee_id = 100;

select count(*) from employees where department_id = 30;

SET SERVEROUTPUT ON
UPDATE employees set department_name = 'Finance' where department_id = 30;

select * from user_triggers;

CREATE OR REPLACE TRIGGER employee_compound
FOR INSERT OR UPDATE ON employees
COMPOUND TRIGGER
    BEFORE STATEMENT IS
    BEGIN
      DBMS_OUTPUT.PUT_LINE('Validating statement.');
      IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('Inserting.');
      ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('Updating.');
      END IF;
    END BEFORE STATEMENT;
    BEFORE EACH ROW IS
    BEGIN
      DBMS_OUTPUT.PUT_LINE('Validating email.');
      DBMS_OUTPUT.PUT_LINE('Old email : ' || :OLD.email);
      DBMS_OUTPUT.PUT_LINE('New email : ' || :NEW.email);
    END BEFORE EACH ROW;
    AFTER EACH ROW IS
    BEGIN
      DBMS_OUTPUT.PUT_LINE('Changing email.');
      DBMS_OUTPUT.PUT_LINE('Old email : ' || :OLD.email);
      DBMS_OUTPUT.PUT_LINE('New email : ' || :NEW.email);
    END AFTER EACH ROW;
    AFTER STATEMENT IS
    BEGIN
      DBMS_OUTPUT.PUT_LINE('Logging statement.');
    END AFTER STATEMENT;
END;
/
