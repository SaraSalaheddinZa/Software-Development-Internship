select visitorId,fName,lName,country
from visitor v inner join country c on v.countryId = c.countryId
select * from country


--select
select visitorId,fName,lName,country
from visitor v inner join country c on v.countryId = c.countryId

--insert
insert visitor (fName,lName,countryId)
values (@fName, @lName, @countryId)

--update
update visitor
set fName = @fName, lName = @lName, countryId = @countryId
where visitorId = @visitorId


--delete
delete visitor where visitorId = @visitorId

select countryId, country from country