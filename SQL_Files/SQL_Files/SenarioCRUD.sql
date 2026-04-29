/*
Senario


I am a doctor, I need to follow up with my patients

first name, last name, age

Task: 
Step 1:
--------------------
Create a table in db
fill a few patients using CRUD operations (select, update, insert, delete)

Step 2:
--------------------
use stored procedures to apply insert statement
*/
Create Table patients 
(
 patientId int primary key identity(1,1),
 fName nvarchar(50),
 lName nvarchar(50),
 age int
);
insert into patients
values ('Nuha', 'Rashid', 45)

select * from patients

update patients
set fName = 'Amal'
where patientId =5

delete from patients where patientId = 2

create procedure p_patientsInsert @fName nvarchar(50), @lName nvarchar(50), @age int
as 
insert patients (fName, lName, age)
values (@fName, @lName, @age)

execute p_patientsInsert 'Nuha', 'Mazen', 33
-----------------------------------------
update patients 
set age = 25
where patientId = 1

update patients
set regDate = GETDATE()
where patientId = 6

select * from patients