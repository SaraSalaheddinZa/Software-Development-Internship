select visitorId, fName, lName, country
from visitor v inner join country c on v.countryId= c.country
select * from country

--isert
insert into visitor



--update 
update visitor set fName = @fName, @lName, countryId, @countryId