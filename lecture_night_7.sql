CREATE TABLE dremps(
  employee_id NUMBER(6) CONSTRAINT dremps_employee_id_pk PRIMARY KEY,
  first_name VARCHAR2(20)
);

CREATE TABLE dremps2(
  employee_id NUMBER(6),
  first_name VARCHAR2(20),
  CONSTRAINT dremps2_employee_id_pk PRIMARY KEY (EMPLOYEE_ID)
);

CREATE TABLE dremps3(
  employee_id NUMBER(6) PRIMARY KEY,
  first_name VARCHAR2(20) NOT NULL,
  last_name VARCHAR2(20) UNIQUE
);

-- creating a foreign key
CREATE TABLE dremps4(
  employee_id NUMBER(6) PRIMARY KEY,
  first_name VARCHAR2(20) NOT NULL,
  last_name VARCHAR2(20) UNIQUE,
  department_id NUMBER(6),
  CONSTRAINT dremps4_department_id_fk FOREIGN KEY (department_id)
    REFERENCES departments(department_id) ON DELETE SET NULL
);

INSERT INTO dremps4(employee_id, first_name, last_name, department_id)
VALUES (1, 'Darren', 'Redmond', 10);
-- fails as foreign key doesn't exist
INSERT INTO dremps4(employee_id, first_name, last_name, department_id)
VALUES (2, 'John', 'Smith', 10000);
-- referential integrity will allow null
INSERT INTO dremps4(employee_id, first_name, last_name, department_id)
VALUES (2, 'John', 'Smith', null);
-- test primary key for duplicity
-- referential integrity will allow null
INSERT INTO dremps4(employee_id, first_name, last_name, department_id)
VALUES (2, 'John', 'Dawes', null);
-- last name uniqueness causes this next failure
INSERT INTO dremps4(employee_id, first_name, last_name, department_id)
VALUES (3, 'David', 'Smith', null);
-- first name can't be null
INSERT INTO dremps4(employee_id, first_name, last_name, department_id)
VALUES (3, null, 'Jones', null);

CREATE TABLE teach_emp2 (
  empno NUMBER(5) PRIMARY KEY,
  ename VARCHAR2(15) CONSTRAINT teach_emp2_ename_uk UNIQUE,
  job VARCHAR2(10) NOT NULL,
  mgr NUMBER(5),
  hiredate DATE DEFAULT (sysdate),
  photo BLOB,
  sal NUMBER(7,2),
  deptno NUMBER(3) NOT NULL
    CONSTRAINT teach_emp2_dept_fkey REFERENCES departments(department_id),
  CONSTRAINT teach_emp2_sal_ck CHECK (sal > 0)
);
INSERT INTO teach_emp2
VALUES (1, 'dredmond', 'sales', null, SYSDATE, null, 23, 10);
INSERT INTO teach_emp2
VALUES (2, 'dredmond2', 'sales', null, SYSDATE, null, -23, 10);

CREATE TABLE dept80_2
AS
  SELECT employee_id, last_name, salary*12 ANNSAL, hire_date
  FROM employees
  WHERE department_id = 80;

DESCRIBE dept80_2

SELECT * from dept80_2;

ALTER TABLE dept80_2
ADD (job_id VARCHAR2(9));
DESCRIBE dept80_2

ALTER TABLE dept80_2
MODIFY (job_id VARCHAR2(20));
DESCRIBE dept80_2

ALTER TABLE dept80_2
DROP (job_id);
DESCRIBE dept80_2

DROP TABLE dept80_2;
