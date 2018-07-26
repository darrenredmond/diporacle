SELECT table_name FROM user_tables
WHERE table_name IN ('MEMBER', 'TITLE', 'TITLE_COPY', 'RENTAL', 'RESERVATION');

SELECT constraint_name, constraint_type, table_name
FROM user_constraints
WHERE table_name IN ('MEMBER', 'TITLE', 'TITLE_COPY', 'RENTAL', 'RESERVATION'); 

SELECT sequence_name, increment_by, last_number
FROM user_sequences WHERE sequence_name IN ('MEMBER_ID_SEQ', 'TITLE_ID_SEQ');

SELECT * from title;
