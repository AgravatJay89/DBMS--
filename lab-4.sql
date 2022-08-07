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
