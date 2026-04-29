select * from customer
truncate table customer

create procedure p_insertCustomer @fName nvarchar(50), @lName nvarchar(50)
as 
insert into customer(fName, lName)
values (@fName, @lName)
execute p_insertCustomer 'Nuha', 'Ahmed'

create procedure p_getCustomerCoutry @countryId int 
as 
select fName, lName, country
from customer c inner join country co on c.countryId = co.countryId
where c.countryId = @countryId
