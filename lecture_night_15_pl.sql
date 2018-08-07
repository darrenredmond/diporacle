CREATE OR REPLACE PACKAGE package_variables IS
  -- Declare package components.
  FUNCTION get RETURN VARCHAR2;

  PROCEDURE set(value VARCHAR2);

END package_variables;
/

CREATE OR REPLACE PACKAGE BODY package_variables IS
  -- Declare package scope variable.
  variable VARCHAR2(20) := 'Initial Value';

  FUNCTION get_five_squared RETURN NUMBER IS
  BEGIN
    RETURN 5 * 5;
  END get_five_squared;

  -- Define function
  FUNCTION get RETURN VARCHAR2 IS
  BEGIN
    RETURN variable || get_five_squared();
  END get;

  -- Define procedure.
  PROCEDURE set(value VARCHAR2) IS
  BEGIN
    variable := value;
  END set;
END package_variables;
/

select package_variables.get() from DUAL;

select package_variables.get_five_squared() from DUAL;

EXECUTE package_variables.set('Hi Darren');

BEGIN
  package_variables.set('Hi Darren');
END;
/

select package_variables.get() from DUAL;

DECLARE
    PROCEDURE b (caller VARCHAR2);
    PROCEDURE a (caller VARCHAR2) IS
        procedure_name VARCHAR2(1) := 'A';
    BEGIN
        dbms_output.put_line('Procedure "A" called by ['||caller||']');
        b(procedure_name);
    END;
    PROCEDURE b (caller VARCHAR2) IS
        procedure_name VARCHAR2(1) := 'B';
    BEGIN
        dbms_output.put_line('Procedure "B" called by ['||caller||']');
    END;
    BEGIN
        a('Main');
    END;
/

CREATE OR REPLACE PACKAGE global_consts
IS
  mile_2_kilo CONSTANT NUMBER := 1.6093;
  kilo_2_mile CONSTANT NUMBER := 0.6214;
  yard_2_meter CONSTANT NUMBER := 0.9144;
  meter_2_yard CONSTANT NUMBER := 1.0936;
END global_consts;
/

EXECUTE DBMS_OUTPUT.PUT_LINE('20 miles = '||20*global_consts.mile_2_kilo||' km');

select * from jobs;

-- create the job package
CREATE OR REPLACE PACKAGE job_pack IS
  -- the add job procedure
  PROCEDURE add_job(p_job_id jobs.job_id%TYPE, p_job_title jobs.job_title%TYPE,
      p_min_salary jobs.min_salary%TYPE, p_max_salary jobs.max_salary%TYPE);
  -- the delete job procedure
  PROCEDURE delete_job(p_job_id jobs.job_id%TYPE);
  PROCEDURE update_job(p_job_id jobs.job_id%TYPE, p_job_title jobs.job_title%TYPE,
      p_min_salary jobs.min_salary%TYPE, p_max_salary jobs.max_salary%TYPE);
  PROCEDURE update_job(p_job_id jobs.job_id%TYPE, p_job_title jobs.job_title%TYPE);
  PROCEDURE update_job(p_job_id jobs.job_id%TYPE,
      p_min_salary jobs.min_salary%TYPE, p_max_salary jobs.max_salary%TYPE);

  FUNCTION query_job(p_job_id jobs.job_id%TYPE, p_job_title jobs.job_title%TYPE,
      p_min_salary jobs.min_salary%TYPE, p_max_salary jobs.max_salary%TYPE)
      RETURN jobs.job_title%TYPE;
  FUNCTION query_job(p_job_id jobs.job_id%TYPE)
      RETURN jobs.job_title%TYPE;
  FUNCTION query_job(p_job_id jobs.job_id%TYPE, p_job_title jobs.job_title%TYPE)
      RETURN jobs.job_title%TYPE;
  FUNCTION query_job(p_salary jobs.min_salary%TYPE)
      RETURN jobs.job_title%TYPE;
  FUNCTION query_job_by_title(p_job_title jobs.job_title%TYPE)
      RETURN jobs.job_title%TYPE;

END job_pack;
/

-- create the job package body
CREATE OR REPLACE PACKAGE BODY job_pack IS
  -- the add job procedure
  PROCEDURE add_job(p_job_id jobs.job_id%TYPE, p_job_title jobs.job_title%TYPE,
      p_min_salary jobs.min_salary%TYPE, p_max_salary jobs.max_salary%TYPE)
  IS
  BEGIN
    INSERT INTO jobs(job_id, job_title, min_salary, max_salary)
      VALUES(p_job_id, p_job_title, p_min_salary, p_max_salary);
  END add_job;
  -- the delete job procedure
  PROCEDURE delete_job(p_job_id jobs.job_id%TYPE)
  IS
  BEGIN
    DELETE FROM jobs where job_id = p_job_id;
  END delete_job;
  PROCEDURE update_job(p_job_id jobs.job_id%TYPE, p_job_title jobs.job_title%TYPE,
      p_min_salary jobs.min_salary%TYPE, p_max_salary jobs.max_salary%TYPE)
  IS
  BEGIN
    UPDATE jobs SET job_title = p_job_title, min_salary = p_min_salary,
      max_salary = p_max_salary WHERE job_id = p_job_id;
  END update_job;
  PROCEDURE update_job(p_job_id jobs.job_id%TYPE, p_job_title jobs.job_title%TYPE)
  IS
  BEGIN
    UPDATE jobs SET job_title = p_job_title WHERE job_id = p_job_id;
  END update_job;
  PROCEDURE update_job(p_job_id jobs.job_id%TYPE,
      p_min_salary jobs.min_salary%TYPE, p_max_salary jobs.max_salary%TYPE)
  IS
  BEGIN
    UPDATE jobs SET min_salary = p_min_salary,
      max_salary = p_max_salary WHERE job_id = p_job_id;
  END update_job;

  FUNCTION query_job(p_job_id jobs.job_id%TYPE, p_job_title jobs.job_title%TYPE,
      p_min_salary jobs.min_salary%TYPE, p_max_salary jobs.max_salary%TYPE)
      RETURN jobs.job_title%TYPE
  IS
    v_job jobs.job_title%TYPE;
  BEGIN
    SELECT job_title INTO v_job FROM jobs WHERE job_id = p_job_id and job_title = p_job_title
      and min_salary = p_min_salary and max_salary = p_max_salary;
    RETURN v_job;
  END query_job;

  FUNCTION query_job(p_job_id jobs.job_id%TYPE)
      RETURN jobs.job_title%TYPE
  IS
    v_job jobs.job_title%TYPE;
  BEGIN
    SELECT job_title INTO v_job FROM jobs WHERE job_id = p_job_id;
    RETURN v_job;
  END query_job;
  FUNCTION query_job(p_job_id jobs.job_id%TYPE, p_job_title jobs.job_title%TYPE)
      RETURN jobs.job_title%TYPE
  IS
    v_job jobs.job_title%TYPE;
  BEGIN
    SELECT job_title INTO v_job FROM jobs WHERE job_id = p_job_id and job_title = p_job_title;
    RETURN v_job;
  END query_job;
  FUNCTION query_job(p_salary jobs.min_salary%TYPE)
      RETURN jobs.job_title%TYPE
  IS
    v_job jobs.job_title%TYPE;
  BEGIN
    SELECT job_title INTO v_job FROM jobs WHERE min_salary = p_salary or max_salary = p_salary;
    RETURN v_job;
  END query_job;
  FUNCTION query_job_by_title(p_job_title jobs.job_title%TYPE)
      RETURN jobs.job_title%TYPE
  IS
    v_job jobs.job_title%TYPE;
  BEGIN
    SELECT job_title INTO v_job FROM jobs WHERE job_title = p_job_title;
    RETURN v_job;
  END query_job_by_title;

END job_pack;
/

-- test script
EXECUTE job_pack.add_job('IT_DEV', 'IT Developer', 1000, 5000);
select * from jobs where job_id = 'IT_DEV';
select job_pack.query_job('IT_DEV') from dual;
select job_pack.query_job('IT_DEV', 'IT Developer', 1000, 5000) from dual;
select job_pack.query_job('IT_DEV', 'IT Developer') from dual;
select job_pack.query_job_by_title('IT Developer') from dual;
--select job_pack.query_job(job_id) from jobs;
-- 1 row should be selected
EXECUTE job_pack.update_job('IT_DEV', 'Internet Technology Developer');
select * from jobs where job_title = 'Internet Technology Developer';
-- 1 row should be selected
EXECUTE job_pack.update_job('IT_DEV', 50000, 92111);
select * from jobs where min_salary = 50000 and max_salary = 92111;
select job_pack.query_job(92111) from dual;
-- 1 row should be selected
EXECUTE job_pack.update_job('IT_DEV', 'IT Developer', 60000, 93111);
select * from jobs where min_salary = 60000 and max_salary = 93111
  and job_title = 'IT Developer';
-- 1 row should be selected
EXECUTE job_pack.delete_job('IT_DEV');
select * from jobs where job_id = 'IT_DEV';
-- 0 row should be selected
