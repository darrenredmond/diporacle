# diporacle

http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html

http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html




Volume 3

Practice 4:

Practice4 Overview

In this practice you writePL/SQL blocks to select, input, update, and delete information in a table, using basic SQL query and DML statements within a PL/SQL block.

Practice 4
1. Create a PL/SQL block that selects the maximum department number in the DEPARTMENTS table and stores it in an iSQL*Plus variable.

Print the results to the screen.

Save your PL/SQL block in a file named p3q1.sql. by clicking the Save Script button. Save the script with a .sql extension.

2. Modify the PL/SQL block you created in exercise 1 to insert a new department into the DEPARTMENTS table. Save the PL/SQL block in a file named p3q2.sql by clicking the Save Script button.

Save the script with a .sql extension.

a. Rather than printing the department number retrieved from exercise1, add 10 to it and use it as the department number for the new department.

b. Use the DEFINE command to provide the department name.

Name the new department Education.

Pass the value to the PL/SQL block through a iSQL*Plus substitution variable.

c. Leave the location number as null for now.

d. Execute the PL/SQLblock.

e. Display the new department that you created.

3. Create a PL/SQL block that updates the location ID for the new department that you added in the previous practice. Save your PL/SQL block in a file named p3q3.sql by clicking the Save Script button.
Save the script with a .sql extension.

a. Use an iSQL*Plus variable for the departmentID number that you added in the previous practice.

b. Use the DEFINE command to provide the location ID.

Name the new location id 1700.

Pass the value to the PL/SQL block through a iSQL*Plus substitution variable.

c. Test the PL/SQL block.

DEFINE p_deptno = 280

DEFINE p_loc = 1700

d. Display the department number, department name, and location for the updated department.

4. Create a PL/SQL block that deletes the department that you created in exercise 2.

Save the PL/SQL block in a file named p3q4.sql. by clicking the Save Script button.

Save the script with a .sql extension.

a. Use the DEFINE command to provide the departmentID.

Pass the value to the PL/SQL block through a iSQL*Plus substitution variable.

b. Print to the screen the number of rows affected.

c. Test the PL/SQL block.

DEFINE p_deptno=280

d. Confirm that the department has been deleted.

