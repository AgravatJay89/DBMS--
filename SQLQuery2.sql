CREATE TABLE EMPLOYEE
(EID INT,
ENAME VARCHAR(100),
GENDER VARCHAR(10),
JOININGDATE DATETIME,
SALARY DECIMAL(8,2),
CITY VARCHAR(100), 
);

SELECT * FROM EMPLOYEE

INSERT INTO EMPLOYEE
	VALUES(1, 'Nick', 'Male', '01-JAN-13', 4000, 'London'),
		  (2, 'JULIAN', 'Female', '01-OCT-14', 3000, 'New York'),
		  (3, 'Roy', 'Male', '01-JUN-16', 3500, 'London'),
		  (4, 'Tom', 'Male', null, 4500, 'London'),
		  (5, 'Jerry', 'Male', '01-FEB-13', 2800, 'Sydney'),
		  (6, 'Philip', 'Male', '01-JAN-15', 7000, 'New York'),
		  (7, 'Sara', 'Female', '01-AUG-17', 4800, 'Sydney'),
		  (8, 'Emily', 'Female', '01-JAN-17', 5500, 'New York'),
		  (9, 'Michael', 'Male', null, 6500, 'London'),
		  (10, 'John', 'Male', '01-JAN-15', 8800, 'London');



1. Display all the employees whose name starts with “m” and 4 th character is “h”.

	select * from EMPLOYEE
	where ENAME like 'm__h%';

2. Find the value of 3 raised to 5. Label the column as output.

	 select power(3,5);

3. Write a query to subtract 20 days from the current date.

	select getdate() - 20;

4. Write a query to display name of employees whose name starts with “j” and contains “n” in their name.

	select Ename from EMPLOYEE
	where ENAME like 'j%n%';

5. Display 2nd to 9th character of the given string “SQL Programming”.
	
	select substring('SQL Programming',2,8);

6. Display name of the employees whose city name ends with “ney” &contains six characters.

	select ENAME from employee 
	where city like'___ney';

7. Write a query to convert value 15 to string.

	select cast(15 as varchar);
	
9. Set the value of department to Marketing who belongs to London city.

	
	alter table  Employee add department varchar(20);
	update EMPLOYEE set department='marketing' where CITY ='london';

	select * from EMPLOYEE

10. Display all the employees whose name ends with either “n” or “y”.

	select * from EMPLOYEE where Ename like '%n' or Ename like '%y';

11. Find smallest integer value that is greater than or equal to 63.1, 63.8 and -63.2.

	select FLOOR(63.1);
	select FLOOR(63.8);
	select FLOOR(-63.2);


12. Display all employees whose joining date is not available.
	
	select * from EMPLOYEE where JOININGDATE is null;

13. Display name of the employees in capital letters and city in small letters.
	
	select UPPER(ename) as ename, lower(city) as city from employee;

14. Change the data type of Ename from varchar (30) to char (30).

	alter table employee alter column enAME CHAR(30);
	
15. Display city wise maximum salary.

	SELECT MAX(SALARY) from employee group BY city ; 

16. Produce output like <Ename> works at <city> and earns <salary> (In single column).

	select concat(Ename , ' work at ' , city , ' erns ' , cast(salary as varchar)) from EMPLOYEE;


17. Find total number of employees whose salary is more than 5000.

	select COUNT(eid) from EMPLOYEE where SALARY<5000;

18. Write a query to display first 4 & last 3 characters of all the employees.

	select LEFT(ename,4) from EMPLOYEE;
	select RIGHT(RTRIM(ename),3) from EMPLOYEE;

19. List the city having total salaries more than 15000 and employees joined after 1st January, 2014.

	SELECT CITY FROM EMPLOYEE 
	WHERE  JOININGDATE >'2014-01-01' GROUP BY CITY HAVING SUM(SALARY)>15000;

20. Write a query to replace “u” with “oo” in Ename.

	SELECT REPLACE(ENAME,'U','OO') FROM EMPLOYEE;

21. Display city with average salaries and total number of employees belongs to each city.

	SELECT CITY,AVG(SALARY), COUNT(EID) FROM EMPLOYEE GROUP BY CITY

22. Display total salaries paid to female employees.

	SELECT SUM(SALARY) FROM EMPLOYEE WHERE GENDER='FEMALE' GROUP BY GENDER;

23. Display name of the employees and their experience in years.
	
	SELECT ENAME, GETDATE() - JOININGDATE FROM EMPLOYEE;

24. Remove column department from employee table.

	ALTER TABLE EPLOYEE 

25. Update the value of city from syndey to null.


26. Retrieve all Employee name, Salary & Joining date.

	SELECT ENAME,SALARY,JOININGDATE FROM EMPLOYEE;

27. Find out combine length of Ename & Gender.

	SELECT LEN(ENAME+GENDER) FROM EMPLOYEE;

28. Find the difference between highest & lowest salary.

	SELECT MAX(SALARY) - MIN(SALARY) FROM EMPLOYEE;

29. Rename a column from Ename to FirstName.

	SP_RENAME 'EMPLOYEE.ENAME','FIRSTNAME';

30. Rename a table from Employee to EmpMaster.	SP_RENAME 'EMPLOYEE','EMPMASTER';

		 