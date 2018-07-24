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

Practice 5
----------
1. Execute the command in the file lab04_1.sql to create the MESSAGES table.
Write a PL/SQL block to insert numbers into the MESSAGES table.
a. Insert the numbers 1 to 10, excluding 6 and 8.
b. Commit before the end of the block.
c. Select from the MESSAGES table to verify that your PL/SQL block worked.

2. Create a PL/SQL block that computes the commission amount for a given employee based
on the employee’s salary.
a. Use the DEFINE command to provide the employeeID.
Pass the value to the PL/SQL block through a iSQL*Plus substitution variable.
DEFINE p_empno = 100

b. If the employee’s salary is less than $5,000, display the bonus amount for the employee as 10% of the salary.
c. If the employee’s salary is between $5,000 and $10,000, display the bonus amount for the employee as 15% of the salary.
d. If the employee’s salary exceeds $10,000, display the bonus amount for the employee as 20% of the salary.
e. If the employee’s salary is NULL, display the bonus amount for the employee as 0.
f. Test the PL/SQL block for each case using the following test cases, and check each bonus amount.
Employee Number Salary ResultingBonus
1002 4000 4800
1491 0500 2100
178 700010 50
Note:IncludeSET VERIFY OFFinyoursolution.
Practice5(continued)
Ifyouhavetime,completethefollowingexercises:
3. Createan EMPtablethatisa replicaoftheEMPLOYEEStable.Youcandothisbyexecutingthe
scriptlab4_3.sql. Adda new column,
STARS,ofVARCHAR2datatypeandlengthof50tothe EMPtableforstoringasterisk (*).
4. CreateaPL/SQLblockthatrewardsanemployeeby appendinganasteriskinthe STARS
column forevery$1000oftheemployee’ssalary. SaveyourPL/SQLblockina filecalled p4q4.sql
byclickingontheSaveScriptbutton.Remembertosavethescriptwitha.sqlextension.
a.Usethe DEFINEcommandtoprovidetheemployeeID.PassthevaluetothePL/SQLblock
through aiSQL*Plussubstitution variable.
b.Initializeav_asteriskvariable thatcontainsaNULL.
c.Appendanasterisktothe stringforevery$1000ofthesalaryamount.Forexample,iftheemployee
hasasalaryamountof$8000,the stringofasterisksshouldcontaineightasterisks.Iftheemployee
hasasalaryamountof$12500,the stringofasterisksshouldcontain13asterisks.
d.UpdatetheSTARScolumnfortheemployeewiththestringofasteris
ks. e.Commit.
f.Testthe blockforthefollowing values:
DEFINE p_empno=104
DEFINE p_empno=174
DEFINE p_empno=176
g.DisplaytherowsfromtheEMPtableto verifywhetheryourPL/SQL
blockhasexecuted successfully.
