select * from customer
select * from country

truncate table customer
----------
create procedure p_insertCountry
@country nvarchar(50)
as 
insert into country (country)
values (@country)

execute p_insertCountry 'UK'
----------
create procedure p_insertCustomerInformation
@fName nvarchar(50), @lName nvarchar(50), @dob datetime, @active bit, 
@membershipDate datetime, @membershipFee decimal(18, 2), @countryId int, @email nvarchar(50)
as
insert into customer (fName, lName, dob, active, membershipDate, membershipFee, countryId, email)
values (@fName, @lName, @dob, @active, @membershipDate, @membershipFee, @countryId, @email)

execute p_insertCustomerInformation 'Rahaf', 'Khalid', '1-1-2000', True, '09-09-2000', 200, 3, 'Rahaf@gmail.com'
----------
create procedure p_getCustomerFullNameById @customerId int, @fullName nvarchar(50) output
as 
select @fullName = fName + ' ' + lName
from customer
where customerId = @customerId
