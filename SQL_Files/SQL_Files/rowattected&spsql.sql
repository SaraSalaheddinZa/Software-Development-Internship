create procedure p_getCustomerByCountryR @countryId int
as 
select fName, lName, country
from customer c inner join country co 
on c.countryId = co.countryId
where c.countryId = @countryId
return @@rowcount

declare @num int
execute @num = p_getCustomerByCountryR 2
select @num as rowsAffected
----------
create procedure p_updateCustomer 
@customerId int,
@fName nvarchar(50), 
@lName nvarchar(50)
as 
update customer
set fName = @fName, lName = @lName
where customerId = @customerId
execute p_updateCustomer 1, 'Reeman', 'Mohammed'
----------
select * from country

create procedure p_selectCountry
as 
select * from country

execute p_selectCountry
