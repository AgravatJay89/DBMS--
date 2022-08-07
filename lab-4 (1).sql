--• Stored Procedures
--1. All tables Insert, Update & Delete


select * from Department
create procedure pr_insert_department
@DepartmentID int,
@DepartmentName varchar(100)
as
begin
insert into Department(
DepartmentID,
DepartmentName)
values(
@DepartmentID,
@DepartmentName
)
end

-- to execute--
exec pr_insert_department 1,admin
exec pr_insert_department 2,IT
exec pr_insert_department 3,HR
exec pr_insert_department 4,Account

select * from Department

--------------------------
select * from Designation

create procedure pr_insert_designation
@DesignationID int,
@DesignationName varchar(100)
as
begin
insert into Designation(
DesignationID,
DesignationName)
values(
@DesignationID,
@DesignationName
)
end

-- to execute--

exec pr_insert_Designation 11,Jobber
exec pr_insert_Designation 12,Welder
exec pr_insert_Designation 13,Clerk
exec pr_insert_Designation 14,Manager
exec pr_insert_Designation 15,CEO

select * from Designation
-------------------------------------------------------------------------------------
select * from Person1

create procedure pr_insert_person1Table
@FirstName		varchar(100),
@LastName		varchar(100),
@Salary			decimal(8,2),
@JoiningDate	datetime,
@DepartmentID	int,
@DesignationID  int
as
begin
insert into Person1(
FirstName,		
LastName,		
Salary,			
JoiningDate,
DepartmentID,
DesignationID
)
values(
@FirstName,		
@LastName,		
@Salary,			
@JoiningDate,	
@DepartmentID,
@DesignationID
)
end

exec pr_insert_person1Table 'rahul','anshu',56000,'01-01-1990',1,12;
exec pr_insert_person1Table 'hardik','hinsu',18000,'1990-09-25',2,11;
exec pr_insert_person1Table 'bhavin','kamani',25000,'1991-05-14',null,11;
exec pr_insert_person1Table 'bhoomi','patel',39000,'2014-02-20',1,13;
exec pr_insert_person1Table 'rohit','rajgor',17000,'1990-07-23',2,15;
exec pr_insert_person1Table 'priya','mehta',25000,'1990-10-18',2,null;;
exec pr_insert_person1Table 'neha','trivedi',18000,'2014-02-20',3,15;


select * from person1


--------------------------------------

select * from Department



create procedure pr_update_Department

@DepartmentId	int,
@DepartmentName	varchar(100)

as

update Department
set 
DepartmentId	=	@DepartmentId,
DepartmentName	=	@DepartmentName

where DepartmentId	=	@DepartmentId

EXEC pr_update_Department 1,Admin1



------------------------------------------

select * from Designation

create procedure pr_update_Designation

@DesignationId	int,
@DesignationName	varchar(100)

as

update Designation
set 
DesignationID	=	@DesignationID,
DesignationName	=	@DesignationName

where DesignationID	=	@DesignationID

EXEC pr_update_Designation 11,jobber1


-------------------------------

select * from Person1


create procedure pr_update_person1
@WorkerID int,
@FirstName		varchar(100),
@LastName		varchar(100),
@Salary			decimal(8,2),
@JoiningDate	datetime,
@DepartmentID	int,
@DesignationID  int
as
begin
update Person1
set 

FirstName = @FirstName,		
LastName = @LastName,		
Salary	  = @Salary,	
JoiningDate = @JoiningDate,			
DepartmentID = @DepartmentID,
DesignationID = @DesignationID


where WorkerID = @WorkerID
end

exec pr_update_person1 101,'rahul_1','anshu_1',57000,'1990-01-01',1,12

 --------DELETE------------

 select * from Department
 
 create procedure pr_delete_department

 @DepartmentID  int
 as
 begin

	delete from Department
	where
	DepartmentID = @DepartmentID
	end

	exec pr_delete_department 4


	------------------

select * from Designation

	create procedure pr_delete_designation

 @DesignationID  int
 as
 begin

	delete from Designation
	where	
	DesignationID = @DesignationID
	end

	exec pr_delete_designation 14


	------------------

select * from Person1


	create procedure pr_delete_person1

	@workerID int

	as
	begin

	delete from Person1
	WHERE WorkerID = @WorkerID
	end

	exec  pr_delete_person1 101




--2. All tables SelectAll (If foreign key is available than do write join and take columns on select list)
	CREATE PROCEDURE PR_PERSON_SELECTALL
	AS
	BEGIN
	SELECT 
		P.WorkerID,
		P.FirstName,	
		P.LastName,	
		P.Salary,		
		P.JoiningDate,	
		DEPT.DepartmentName,
		DESIG.DesignationName
	FROM PERSON1 AS P 
	INNER JOIN DEPARTMENT AS DEPT 
	ON P.DEPARTMENTID = DEPT.DEPARTMENTID
	INNER JOIN DESIGNATION AS DESIG
	on
	P.DESIGNATIONID = DESIG.DESIGNATIONID
	END

	EXEC PR_PERSON_SELECTALL

	SELECT * FROM Person1

---------------------------

	CREATE PROCEDURE PR_DEPARTMENT_SELECTALL
	AS
	BEGIN
		SELECT * FROM Department
	END

	EXEC PR_DEPARTMENT_SELECTALL

-------------------------

	CREATE PROCEDURE PR_DESIGNATION_SELECTALL
	AS
	BEGIN
		SELECT * FROM Designation
	END

	EXEC PR_DESIGNATION_SELECTALL


-- 3. All tables SelectPK--
--PERSON1
	CREATE PROCEDURE PR_PERSON1_SELECTBYPK
		@WORKERID INT
	AS
	BEGIN
		SELECT * FROM Person1
		WHERE WorkerID = @WORKERID
	END

	EXEC PR_PERSON1_SELECTBYPK 102

	------------------
	--DEPARTMENT

	CREATE PROCEDURE PR_DEPARTMENT_SELECTBYPK
		@DEPARTMENTID INT
	AS
	BEGIN
		SELECT * FROM Department
		WHERE DepartmentID = @DEPARTMENTID
	END

	EXEC PR_DEPARTMENT_SELECTBYPK 2

	-----------------
	--DESIGNATION

	CREATE PROCEDURE PR_DESIGNATION_SELECTBYPK
		@DESIGNATIONID INT
	AS
	BEGIN
		SELECT * FROM Designation
		WHERE DesignationID = @DESIGNATIONID
	END

	EXEC PR_DESIGNATION_SELECTBYPK 12

-- 4. Create Procedure that takes Department Name & Designation Name as Input and Returns a table with Worker’s First Name, Salary, Joining Date & Department Name.	CREATE PROCEDURE PR_SelectByDepartmentNameAndDesignationName		@DEPARTMENTNAME		VARCHAR(100),		@DESIGNATIONNAME	VARCHAR(100)	AS	BEGIN		SELECT			P.FIRSTNAME,			P.SALARY,			P.JOININGDATE,			DEPT.DEPARTMENTNAME	FROM PERSON1 AS P LEFT OUTER JOIN DEPARTMENT AS DEPT	ON DEPT.DEPARTMENTID = P.DEPARTMENTID	LEFT OUTER JOIN DESIGNATION AS DESIG	ON DESIG.DESIGNATIONID = P.DESIGNATIONID	WHERE DEPARTMENTNAME = @DEPARTMENTNAME		AND	  DESIGNATIONNAME =@DESIGNATIONNAME	END	EXEC PR_SelectByDepartmentNameAndDesignationName IT,JOBBER1--5. Create Procedure that takes FirstName as an input parameter and displays’ all the details of the worker with their department & designation name.

	CREATE PROCEDURE PR_SelectByFiirstName
		@FIRSTNAME VARCHAR(100)
	AS
	BEGIN
		SELECT 
		P.FIRSTNAME FROM Person1 AS P INNER JOIN Department AS DEPT
		ON P.DepartmentID = DEPT.DepartmentID
		INNER JOIN Designation AS DESIG
		ON P.DesignationID = DESIG.DesignationID
		WHERE @FIRSTNAME = FirstName
	END

	

	EXEC PR_SelectByFiirstName 'Bhoomi'


--6. Create Procedure which displays department wise maximum, minimum & total salaries.	CREATE PROCEDURE PR_Person_Man_Max_Salary	AS	BEGIN		SELECT DEPT.DEPARTMENTNAME,				MAX(P.SALARY) AS MaxSalary,				MIN(P.SALARY) AS MinSalary,				SUM(P.SALARY) AS TotalSalary		FROM Person1 AS P INNER JOIN  Department AS DEPT		ON DEPT.DepartmentID = P.DepartmentID		GROUP BY DEPT.DepartmentName	END	EXEC PR_Person_Man_Max_Salary -------------------• Views----------------------
--1. Create a view that display first 100 workers details.

	CREATE VIEW DisplayTop100Workerdetails
	AS
	
		SELECT TOP 100 * FROM Person1
	

	SELECT * FROM DisplayTop100Workerdetails

--2. Create a view that displays designation wise maximum, minimum & total salaries.

	CREATE VIEW DisplayDesigMaxMinTotalSalary
	AS
	
		SELECT DESIG.DesignationID,				MAX(P.SALARY) AS MaxSalary,				MIN(P.SALARY) AS MinSalary,				SUM(P.SALARY) AS TotalSalary		FROM Person1 AS P INNER JOIN  Designation AS DESIG		ON  P.DesignationID = DESIG.DesignationID 		GROUP BY DESIG.DesignationID		select * from DisplayDesigMaxMinTotalSalary	
		

--3. Create a view that displays Worker’s first name with their salaries & joining date, it also displays duration column which is difference of joining date with respect to current date.


--4. Create a view which shows department & designation wise total number of workers.
	

	CREATE VIEW DEPARTMENTTOTALWORKER
	AS
	SELECT DEPARTMENT.DEPARTMENTID,
		   COUNT(Person1.WORKERID)AS 'Total_Worker'
	FROM Person1 RIGHT OUTER JOIN DEPARTMENT 
	ON Person1.DEPARTMENTID=DEPARTMENT.DEPARTMENTID
	GROUP BY DEPARTMENT.DEPARTMENTID
	---------------------------------
	create VIEW DESIGNATIONTOTALWORKER
	AS
	SELECT DESIGNATION.DESIGNATIONID,
		   COUNT(Person1.WORKERID)AS 'Total_Worker'
	FROM Person1 RIGHT OUTER JOIN DESIGNATION 
	ON Person1.DESIGNATIONID=DESIGNATION.DESIGNATIONID
	GROUP BY DESIGNATION.DESIGNATIONID

	SELECT * FROM DEPARTMENTTOTALWORKER
	SELECT * FROM DESIGNATIONTOTALWORKER

--5. Create a view that displays worker names who don’t have either in any department or designation.	create view worker_detail	as		select FirstName from Person1		where DepartmentID is null or DesignationID is null;	select * from worker_detail--• User Defined Functions

--1. Create a table valued function which accepts DepartmentID as a parameter & returns a worker table based on DepartmentID.

	CREATE FUNCTION fnWorkerIdByDepartmentId(@DepartmentId int)
	RETURNs TABLE
	AS
		RETURN(SELECT WorkerId FROM Person1 
				where DepartmentId = @DepartmentId)

	select * from fnWorkerIdByDepartmentId(1) 

--2. Create a table valued function which returns a table with unique city names from worker table.

--3. Create a scalar valued function which accepts two parameters start date & end date, and returns a date difference in days.

	CREATE FUNCTION fnDateDifference(@StartDate datetime, @EndDate datetime)
	returns varchar(150)
	as
	begin 
		return (select convert (varchar(150),Datediff(Day,@StartDate,@EndDate)))
	end

	select dbo.fnDateDifference('2022-05-01','2022-06-01')

--4. Create a scalar valued function which accepts two parameters year in integer & month in integer and returns total days in passed month & year.

	CREATE FUNCTION fnReturnsNumberOfDaysInPerticulerMonth3(@StartDate datetime)
	returns varchar(150)
	as
	begin
		return (select CONVERT(varchar(150),DATEDIFF(day,@StartDate,DateAdd(month,1,@StartDate))))
	end

	select  dbo.fnReturnsNumberOfDaysInPerticulerMonth3('2024-02-01')As 'Day'




.--5. Create a scalar valued function which accepts two parameters year in integer & month ininteger and returns first date in passed month & year