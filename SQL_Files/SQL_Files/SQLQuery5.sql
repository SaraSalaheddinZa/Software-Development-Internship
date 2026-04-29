ALTER TABLE prescriptionTbl
DROP CONSTRAINT FK07;

ALTER TABLE prescriptionTbl
ADD CONSTRAINT FK07 FOREIGN KEY (doctor)
REFERENCES doctorTbl (doctorId)
ON DELETE CASCADE;

ALTER TABLE prescriptionTbl
DROP CONSTRAINT FK07;

ALTER TABLE prescriptionTbl
ADD CONSTRAINT FK07 FOREIGN KEY (doctor)
REFERENCES doctorTbl (doctorId)
ON DELETE CASCADE;

SELECT * 
FROM sys.objects
WHERE object_id = OBJECT_ID(N'dbo.prescriptionTbl') AND type = 'U';

SELECT name
FROM sys.tables;

USE [HospitalMS-Sara7593-Wasan7639];
GO

SELECT HAS_PERMS_BY_NAME('dbo.prescriptionTbl', 'OBJECT', 'SELECT') AS HasSelectPermission;


ALTER TABLE prescriptionTbl
DROP CONSTRAINT FK07;

ALTER TABLE prescriptionTbl
ADD CONSTRAINT FK07 FOREIGN KEY (doctor)
REFERENCES doctorTbl (doctorId)
ON DELETE CASCADE;

EXEC sp_help 'prescriptionTbl';





INSERT INTO prescriptionTbl (doctor, patient, medicines, labTest, cost)
VALUES (300, 1001, 'Paracetamol', 201, 50);

INSERT INTO doctorTbl (doctorName, doctorPhone, doctorExp, doctorSpec, doctorGender, doctorAdd, doctorDOB, doctorPassword, doctorEmail)
VALUES ('Dr. yara', '123456789', 10, 'Cardiology', 'Male', 'jdhne', '1980-01-01', 'password123', 'yara@gmail.com');

SELECT doctor FROM prescriptionTbl
WHERE doctor NOT IN (SELECT doctorId FROM doctorTbl);

ALTER TABLE prescriptionTbl
ADD CONSTRAINT FK07 FOREIGN KEY (doctor)
REFERENCES doctorTbl (doctorId)
ON DELETE CASCADE;

ALTER TABLE prescriptionTbl DROP CONSTRAINT FK07;

ALTER TABLE prescriptionTbl
ADD CONSTRAINT FK07 FOREIGN KEY (doctor)
REFERENCES doctorTbl (doctorId)
ON DELETE CASCADE;

ALTER TABLE prescriptionTbl
DROP CONSTRAINT FK07; -- حذف القيد القديم إذا كان موجودًا

ALTER TABLE prescriptionTbl
ADD CONSTRAINT FK07 FOREIGN KEY (doctor)
REFERENCES doctorTbl (doctorId)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE prescriptionTbl
ALTER COLUMN doctor INT NULL; -- تعديل العمود ليقبل NULL

ALTER TABLE prescriptionTbl
DROP CONSTRAINT FK07; -- حذف القيد القديم

ALTER TABLE prescriptionTbl
ADD CONSTRAINT FK07 FOREIGN KEY (doctor)
REFERENCES doctorTbl (doctorId)
ON DELETE SET NULL
ON UPDATE CASCADE;

alter table prescriptionTbl
add constraint FK07 foreign key (doctorId) references doctorTbl(doctorId)
on delete set Null;

alter table prescriptionTbl
add doctorId int;

ALTER TABLE prescriptionTbl
ADD CONSTRAINT FK07 FOREIGN KEY (doctorId)
REFERENCES doctorTbl (doctorId)
ON DELETE SET NULL;

alter table prescriptionTbl
drop constraint FK07

alter table prescriptionTbl
add CONSTRAINT FK07_New FOREIGN KEY (doctorId)
REFERENCES doctorTbl (doctorId)
ON DELETE SET NULL;

select * 
from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where TABLE_NAME = 'prescriptionTbl';



