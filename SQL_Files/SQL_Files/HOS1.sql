--users table
CREATE TABLE users(
userId INT PRIMARY KEY IDENTITY,
userName NVARCHAR(100) NOT NULL,
passwordHash NVARCHAR(255) NOT NULL,
role NVARCHAR(50) NOT NULL,
fullName NVARCHAR(100),
email NVARCHAR(100),
phone NVARCHAR(15))

--patients table
CREATE TABLE patients(
patientsId INT PRIMARY KEY IDENTITY,
fName NVARCHAR(100),
lName NVARCHAR(100),
gender CHAR(1) CHECK (gender IN ('M', 'F')),
dateOfBirth DATE,
address NVARCHAR(255),
phone NVARCHAR(15),
emergencyContact NVARCHAR(100),
emergencyPhone NVARCHAR(15),
dataRegistered DATETIME DEFAULT GETDATE())

--Doctor Table
CREATE TABLE Doctors(
DoctorId INT PRIMARY KEY IDENTITY,
fName NVARCHAR(100) NOT NULL,
lName NVARCHAR(100) NOT NULL,
specialty NVARCHAR(15),
departmentId INT,
phone NVARCHAR(15),
email NVARCHAR(100),
FOREIGN KEY (departmentId) REFERENCES departments(departmentId)
)

--departments table
CREATE TABLE departments(
departmentId INT PRIMARY KEY IDENTITY,
departmentName NVARCHAR(100) NOT NULL)

--Appointments table
CREATE TABLE appointment(
appointmentId INT PRIMARY KEY IDENTITY,
patientId INT NOT NULL,
doctorId INT NULL,
appointmentDate DATETIME NOT NULL,
appointmentStatus NVARCHAR(50) CHECK (appointmentStatus IN ('Scheduled', 'Completed', 'Cancelled')),
notes NVARCHAR(255),
FOREIGN KEY (patientId) REFERENCES patients(patientsId) ON DELETE CASCADE,
FOREIGN KEY (DoctorId) REFERENCES Doctors(DoctorId) ON DELETE SET NULL)

