CREATE VIEW v_patientInfo AS
SELECT p.patientId, p.fName, p.lName, p.Age, p.email, pc.country
FROM patientInfo p 
INNER JOIN patCountry pc ON p.countryId = pc.countryId;

declare @fName nvarchar(50), @lName nvarchar(50), @Age int, @countryId int
select @fName = 'Layan', @lName = 'Ahmed', @Age = 22, @countryId = 1
insert into patientInfo(fName, lName, Age, countryId)
values (@fName, @lName, @Age, @countryId)

select * from v_patientInfo

-- create procedure
create procedure p_patientInsert 
@fName nvarchar(50), @lName nvarchar(50), @Age int, @countryId int, @email nvarchar(50)
as 
insert patientInfo(fName, lName, Age, countryId)
values (@fName, @lName, @Age, @countryId)

ALTER PROCEDURE p_patientInsert 
@fName nvarchar(50), @lName nvarchar(50), @Age int, @countryId int, @email nvarchar(50)
AS 
BEGIN
    INSERT INTO patientInfo(fName, lName, Age, countryId, email) -- ????? ??? ?????? ???
    VALUES (@fName, @lName, @Age, @countryId, @email) -- ?????? ??????? ???
END

execute p_patientInsert 'Alex', 'Jhon', 15, 4, 'alex@gmail.com'