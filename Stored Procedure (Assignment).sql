
		--  JAY AGRAVAT (B-1  202)--

select * from MST_state

select * from MST_city1

--2.insert procedure

create procedure PR_MST_city1_insert
@CityId	int,
@CityName	varchar(50),
@pincode varchar(50),	
@State_id	int,	
@Remark	varchar(50)
as
begin
insert into MST_city1
values(@CityId,@CityName,@pincode,@State_id,@Remark);
end

--EXEC PR_MST_city1_insert 6,RAJKOT,370001,3,GOOD

-- 3.update procedure

create procedure PR_MST_city1_update

@CityId	int,
@CityName	varchar(50),
@pincode varchar(50),	
@State_id	int,	
@Remark	varchar(50)

as
begin

update MST_city1
set

CityName=@CityName,
pincode=@pincode,
Remark=@Remark

where CityId=@CityId
END
--EXEC PR_MST_city1_update 1,AHEMDABAD,360001,2,POOR

--4.DELETE PROCEDURE

CREATE PROCEDURE PR_MST_CITY1_DELETE

@CityId	int

AS
BEGIN

DELETE FROM MST_city1
WHERE CityId=@CityId;

END

--EXEC PR_MST_CITY1_DELETE 1

--5.SelectByPK PROCEDURE

CREATE PROCEDURE PR_MST_CITY1_SelectByPK

@CityId	int

AS
BEGIN

SELECT * FROM MST_city1
WHERE CityId=@CityId;

END

-- EXEC PR_MST_CITY1_SelectByPK 2


--6.SELECT SelectByPincodeStartWith360

CREATE PROCEDURE PR_MAT_CITY1_SelectByPincodeStartWith360

 AS
 BEGIN 

 SELECT * FROM MST_city1
 WHERE PINCODE LIKE'360%';

 END

 --EXEC PR_MAT_CITY1_SelectByPincodeStartWith360 



 -- 7.SelectByCityNamePincode

 CREATE PROCEDURE MST_CITY1_SelectByCityNamePincode

 @CityName	varchar(50), 
 @pincode varchar(50)

 AS 
 BEGIN

 SELECT * FROM MST_city1
 WHERE
 CityName=@CityName AND
 pincode=@pincode;

 END

 --EXEC MST_CITY1_SelectByCityNamePincode AHEMDABAD,360001


 --8. PROCEDURE SelectByCityRemarks

 CREATE PROCEDURE PR_MST_CITY1_SelectByCityRemarks

 @Remark	varchar(50)

 AS
 BEGIN

 SELECT * FROM MST_city1
 WHERE
 Remark=@Remark;
 
 END


-- EXEC PR_MST_CITY1_SelectByCityRemarks GOOD



-- 9.PROCEDURE SelectByStateID

CREATE PROCEDURE PR_MST_CITY1_SelectByStateID

@State_id	int

AS
BEGIN

SELECT * FROM MST_CITY1
WHERE State_id=@State_id;

END

--EXEC PR_MST_CITY1_SelectByStateID 1



--10.PROCEDURE SelectByStateIDCityID

CREATE PROCEDURE PR_MST_CITY1_SelectByStateIDCityID

@CityId	int,

@State_id	int

AS
BEGIN

SELECT * FROM MST_CITY1
WHERE
CityId=@CityId AND 
State_id=@State_id;

END


--EXEC PR_MST_CITY1_SelectByStateIDCityID 3,3


--PROCEDURE 1. Select All CityID, CityName, Pincode, Remarks, StateID,  StateName

CREATE PROCEDURE PR_MST_CITY1_SELECTALL



AS
BEGIN

SELECT C.CityID,C.CityName,C.Pincode,C.Remark FROM MST_city1 AS C 
INNER JOIN MST_state AS S ON C.State_id= S.State_id;

END



EXEC PR_MST_CITY1_SELECTALL 


