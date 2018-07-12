
SELECT * from USER_TABLES
WHERE TABLE_NAME like '%EMP%';

SELECT * from USER_TAB_COLUMNS
WHERE TABLE_NAME like '%EMP%';

SELECT * from DBA_TABLES;

SELECT * from DICTIONARY;

SELECT * from USER_OBJECTS;

SELECT object_name, object_type, created, status from USER_OBJECTS
ORDER BY object_type;

SELECT TABLE_NAME FROM USER_TABLES;

SELECT COLUMN_ID, COLUMN_NAME FROM USER_TAB_COLUMNS WHERE lower(TABLE_NAME) = 'employees'
ORDER BY COLUMN_ID;

DESCRIBE USER_TAB_COLUMNS;

SELECT * from USER_TAB_COMMENTS;

COMMENT ON TABLE employees
IS 'Employee Information';
