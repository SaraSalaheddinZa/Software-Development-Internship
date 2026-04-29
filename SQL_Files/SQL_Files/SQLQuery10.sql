CREATE DATABASE CROpera
CREATE TABLE Country (
    CountryId INT PRIMARY KEY IDENTITY,
    CountryName NVARCHAR(100)
);
INSERT INTO Country (CountryName) VALUES ('Saudi Arabia'), ('USA'), ('Canada');
CREATE TABLE Student (
    StudentId INT PRIMARY KEY IDENTITY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DateOfBirth DATE,
    Salary DECIMAL(10, 2),
    Active BIT,
    CountryId INT FOREIGN KEY REFERENCES Country(CountryId)
);

SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Country';

SELECT 
    s.StudentId,
    s.FirstName,
    s.LastName,
    s.DateOfBirth,
    s.Salary,
    s.Active,
    s.CountryId,     -- CountryId من جدول Student
    c.CountryName    -- CountryName من جدول Country
FROM 
    [CROpera].[dbo].[Student] s
LEFT JOIN 
    [CROpera].[dbo].[Country] c
ON 
    s.CountryId = c.CountryId

	INSERT INTO Countries (CountryId, CountryName)
VALUES (1, 'USA'), (2, 'Canada'), (3, 'Egypt');
