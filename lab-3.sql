select * from Department
select * from Person

insert into Person
values	(101,'Rahul Trivedi',	2,	56000,	'01-01-2020',	'Rajkot'),
		(102,'Hardik Pandya',	3,	18000,	'25-09-2001',	'Ahemdabad'),
		(103,'Bhavin Kanani',	4,	25000,	'14-05-2000',	'Baroda'),
		(104,'Bhoomi Vaishnav',	1,	39000,	'08-02-2005',	'Rajkot'),
		(105,'Rohit Topiya',	2,	17000,	'23-07-2001',	'Jamnagar'),
		(106,'Priya Menpara',  null,9000,	'18-10-2000',	'Ahemdabad'),
		(107,'Neha Sharma',		2,	34000,	'25-12-2002',	'Rajkot'),
		(108,'Nayan Goswami',	3,	25000,	'01-07-2001',	'Rajkot'),
		(109,'Mehul Bhundiya',	4,	13500,	'09-01-2005',	'Baroda'),
		(110,'Mohit Maru',		5,	14000,	'25-05-2000',	'Jamnagar');

--1. Find all persons with their department name & code.
     SELECT PERSON.personname, Department.DepartmentName, Department.DepartmentCode
	 FROM Person INNER JOIN DEPARTMENT
	 ON DEPARTMENT.DEPARTMENTID=PERSON.DEPARTMENTID

--2. Give department wise maximum & minimum salary with department name.
    SELECT DEPARTMENT.DepartmentName,max(salary)as maximun,min(salary)as minimum
	from person Inner join Department
	on DEPARTMENT.DEPARTMENTID=PERSON.DEPARTMENTID
	group by DEPARTMENT.DepartmentName

--3. Find all departments whose total salary is exceeding 100000.
   select department.DepartmentName, sum(salary)
   from person Inner join Department
   on  DEPARTMENT.DEPARTMENTID=PERSON.DEPARTMENTID
   group by DEPARTMENT.DepartmentName
   having sum(salary)>100000


--4. Retrieve person name, salary & department name who belongs to Jamnagar city.
   select Person.PersonName, Person.Salary,Department.DepartmentName
   from person Inner join Department
   on  DEPARTMENT.DEPARTMENTID=PERSON.DEPARTMENTID
   where Person.city='jamnagar'

--5. Find all persons who does not belongs to any department.
   select Person.PersonName
   from person left outer join Department
   on  DEPARTMENT.DEPARTMENTID=PERSON.DEPARTMENTID
   where Department.Departmentid is null

--6. Find department wise person counts.
   select department.DepartmentName, count(personname)
   from person left outer join Department
   on  DEPARTMENT.DEPARTMENTID=PERSON.DEPARTMENTID
   group by DEPARTMENT.DepartmentName

--7. Find average salary of person who belongs to Ahmedabad city.
    select  avg(salary)
    from person inner join Department
	on  DEPARTMENT.DEPARTMENTID=PERSON.DEPARTMENTID
    where person.city='ahmedabad'

--8. Produce Output Like: <PersonName> earns <Salary> from department <DepartmentName> monthly.
--(In single column)
    select person.PersonName + ' earns ' + Cast(person.Salary as varchar(100) )+' from department  '+ Department.DepartmentName
	from person inner join department
	on  DEPARTMENT.DEPARTMENTID=PERSON.DEPARTMENTID


--9. List all departments who have no persons.
    select Department.DepartmentName 
	from person left outer join department
	on  DEPARTMENT.DEPARTMENTID=PERSON.DEPARTMENTID
	where person.PersonName is null

--10. Find city & department wise total, average & maximum salaries.
    select Person.City,Department.DepartmentName,sum(salary)as total,max(salary)as maximum,avg(salary)as avg
	from person left outer join department
	on  DEPARTMENT.DEPARTMENTID=PERSON.DEPARTMENTID
	group by Person.City,Department.DepartmentName


--11. Display Unique city names.
    select distinct city from person

--12. List out department names in which more than two persons.
    select department.DepartmentName ,count(personid)
	from person left outer join department
	on  DEPARTMENT.DEPARTMENTID=PERSON.DEPARTMENTID
	group by  department.DepartmentName
	having count(personid)>2

--13. Combine person name’s first three characters with city name’s last three characters in single column.
    select SUBSTRING(personname,1,3)+right(city,3) as string from person


 --14. Give 10% increment in Computer Department employee’s Salary.
	UPDATE Person Set
	Salary = ((Salary*10)/100) +Salary
	WHERE DepartmentID=
	(SELECT DepartmentID FROM Department WHERE DepartmentName='computer')



 --15. Display all the Person Name’s who’s joining dates difference with current date is more than 365 days.
	SELECT PersonName FROM Person 
	WHERE (GETDATE()-JoiningDate)>36
