--Min
select MIN(salary) as minimumSalaries
from intern2
--Max
select MAX(*) as totalInterns
from intern2
--COUNT
select COUNT(*) as totalIntern
from intern2

--alter column salary from nvarchar(50) into decimal(10,2)
alter table intern2
alter column salary decimal(10, 2)

--SUM()
select SUM(salary) as totalSalaries
from intern2

--AVG()
select AVG(salary) as avgSalariy
from intern2


SELECT 
    COUNT(*) AS TotalInterns,
    SUM(salary) AS TotalSalaries,
    AVG(salary) AS AverageSalary
FROM intern2;
