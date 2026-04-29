CREATE TABLE Country (
    countryId INT PRIMARY KEY IDENTITY,
    country NVARCHAR(50) NOT NULL
);

CREATE TABLE Student (
    studentId INT PRIMARY KEY IDENTITY,
    fName NVARCHAR(50) NOT NULL,
    lName NVARCHAR(50) NOT NULL,
    dob DATE,
    salary DECIMAL(18, 2),
    active BIT,
    countryId INT NOT NULL,
    CONSTRAINT FK_Student_Country FOREIGN KEY (countryId) REFERENCES Country(countryId)
);