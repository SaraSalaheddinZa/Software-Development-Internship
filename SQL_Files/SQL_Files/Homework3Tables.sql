/* Homework
Task 1:
Create 3 tables
1: Main table called patint (patientId, fName, lName, age, regDate) 
2: patientTreatment (patientTreatmentId, patientId -forign key-, diagnostic, vistDate, Treatment, doctorId)
3: doctor (doctorId, fName, lName, joiningDate)
then fill'em with information using CRUD Operation

Task 2:
Create View to link the doctors with the patients in a record
*/
select * from patients
select * from patientTreatment
select * from doctor

--create stored procedure for the doctors
create procedure p_insertDoctor
@fName nvarchar(50), @lName nvarchar(50)
as
insert doctor (fName, lName)
values (@fName, @lName)
--test the code above
execute p_insertDoctor 'Mahmoud', 'Salah'

--
create procedure p_PatientTreatment
@patientId int, @diagnostic nvarchar(50), @treatment nvarchar(50), @doctorId int
as
insert patientTreatment (patientId, diagnostic,treatment, doctorId)
values (@patientId, @diagnostic, @treatment, @doctorId)
execute p_PatientTreatment 1, 'nose bleed', 'anti biotic', 3

-- inner join --
create view v_doctorPerformance as 
select d.doctorId, d.fName + ' ' + d.lName as Doctor, p.fName + ' ' + p.lName as Patient, diagnostic, treatment
from doctor d inner join patientTreatment pt
on d.doctorId = pt.doctorId
inner join patients p 
on pt.patientId = p.patientId
select * from v_doctorPerformance

-- left join --
create view v_doctorPatientStatus as 
select d.doctorId, d.fName + ' ' + d.lName as Doctor, p.fName + ' ' + p.lName as Patient, diagnostic, treatment
from doctor d left join patientTreatment pt
on d.doctorId = pt.doctorId
left join patients p 
on pt.patientId = p.patientId
select * from v_doctorPatientStatus