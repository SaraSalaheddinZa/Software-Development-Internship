create database TargetDB;
Go

USE TargetDB;
Go

create table TransformedEmployees (
EmployeeID int primary key,
fullName nvarchar(100),
annualSalary decimal(18, 2));
