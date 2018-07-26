-- this is the create to setup and initialise my database
@drop_sequences.sql
@drop_tables.sql

@create_tables.sql
@create_sequences.sql

@insert_data.sql

@verify_setup.sql

-- to run from the command line
-- echo exit | sqlplus hr/hr @setup_db.sql > output.log