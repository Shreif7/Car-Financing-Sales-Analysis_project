/*==================================================
Õ–› ﬁ«⁄œ… «·»Ì«‰«  «·ﬁœÌ„… ·Ê „ÊÃÊœ…
==================================================*/
IF DB_ID('Car_Financing_DB') IS NOT NULL
BEGIN
    ALTER DATABASE Car_Financing_DB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Car_Financing_DB;
END
GO

/*==================================================
≈‰‘«¡ ﬁ«⁄œ… «·»Ì«‰« 
==================================================*/
CREATE DATABASE Car_Financing_DB;
GO

USE Car_Financing_DB;
GO

/*==================================================
ÃœÊ· «·›—Ê⁄
==================================================*/
CREATE TABLE Branches (
    BranchID INT IDENTITY(1,1) PRIMARY KEY,
    BranchName NVARCHAR(100),
    City NVARCHAR(50),
    OpenDate DATE
);

/*==================================================
ÃœÊ· «·⁄„·«¡
==================================================*/
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100),
    Gender NVARCHAR(10),
    BirthDate DATE,
    Phone NVARCHAR(20),
    City NVARCHAR(50),
    MonthlyIncome DECIMAL(12,2)
);

/*==================================================
ÃœÊ· „«—ﬂ«  «·”Ì«—« 
==================================================*/
CREATE TABLE CarBrands (
    BrandID INT IDENTITY(1,1) PRIMARY KEY,
    BrandName NVARCHAR(100)
);

/*==================================================
ÃœÊ· „ÊœÌ·«  «·”Ì«—« 
==================================================*/
CREATE TABLE CarModels (
    ModelID INT IDENTITY(1,1) PRIMARY KEY,
    BrandID INT,
    ModelName NVARCHAR(100),
    ModelYear INT,
    CarPrice DECIMAL(12,2),
    CONSTRAINT FK_CarModels_Brands FOREIGN KEY (BrandID) REFERENCES CarBrands(BrandID)
);

/*==================================================
ÃœÊ· ÿ·»«  «· „ÊÌ·
==================================================*/
CREATE TABLE LoanApplications (
    ApplicationID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    BranchID INT,
    ModelID INT,
    ApplicationDate DATE,
    RequestedAmount DECIMAL(12,2),
    Status NVARCHAR(50),
    CONSTRAINT FK_Applications_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    CONSTRAINT FK_Applications_Branches FOREIGN KEY (BranchID) REFERENCES Branches(BranchID),
    CONSTRAINT FK_Applications_Models FOREIGN KEY (ModelID) REFERENCES CarModels(ModelID)
);

/*==================================================
ÃœÊ· «·ﬁ—Ê÷
==================================================*/
CREATE TABLE Loans (
    LoanID INT IDENTITY(1,1) PRIMARY KEY,
    ApplicationID INT,
    LoanAmount DECIMAL(12,2),
    InterestRate DECIMAL(5,2),
    LoanTermMonths INT,
    StartDate DATE,
    LoanStatus NVARCHAR(50),
    CONSTRAINT FK_Loans_Applications FOREIGN KEY (ApplicationID) REFERENCES LoanApplications(ApplicationID)
);

/*==================================================
ÃœÊ· «·„œ›Ê⁄« 
==================================================*/
CREATE TABLE Payments (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    LoanID INT,
    PaymentDate DATE,
    PaymentAmount DECIMAL(12,2),
    PaymentStatus NVARCHAR(50),
    CONSTRAINT FK_Payments_Loans FOREIGN KEY (LoanID) REFERENCES Loans(LoanID)
);

/*==================================================
≈œŒ«· „«—ﬂ«  «·”Ì«—« 
==================================================*/
INSERT INTO CarBrands (BrandName)
VALUES 
('Toyota'),('Hyundai'),('Kia'),('Nissan'),('Chevrolet'),
('Honda'),('BMW'),('Mercedes'),('Peugeot'),('MG');

/*==================================================
≈÷«›… „ÊœÌ·«  ”Ì«—«  √ﬂ —
==================================================*/
INSERT INTO CarModels (BrandID, ModelName, ModelYear, CarPrice)
VALUES
(1,'Corolla',2023,750000),(1,'Yaris',2023,650000),(1,'Camry',2024,1100000),(1,'Rav4',2024,1400000),
(2,'Elantra',2023,700000),(2,'Accent',2023,550000),(2,'Tucson',2024,950000),(2,'Santa Fe',2024,1600000),
(3,'Sportage',2024,900000),(3,'Cerato',2023,720000),(3,'Seltos',2024,880000),
(4,'Sunny',2023,520000),(4,'Qashqai',2024,1200000),
(5,'Optra',2023,560000),(5,'Captiva',2023,850000),
(6,'Civic',2024,980000),(6,'HRV',2024,1150000),
(7,'X3',2024,2500000),(7,'X5',2024,3200000),
(8,'C200',2024,2800000),(8,'E200',2024,3000000),
(9,'3008',2024,1200000),(9,'508',2024,1350000),
(10,'MG5',2023,600000),(10,'ZS',2024,780000),(10,'HS',2024,1050000);

/*==================================================
≈÷«›… ›—Ê⁄ «·‘—ﬂ…
==================================================*/
INSERT INTO Branches (BranchName, City, OpenDate)
VALUES
('Nasr City Branch','Cairo','2018-01-01'),
('Maadi Branch','Cairo','2019-03-10'),
('Alex Branch','Alexandria','2017-05-15'),
('Mansoura Branch','Dakahlia','2020-07-01'),
('Tanta Branch','Gharbia','2021-02-20'),
('Zagazig Branch','Sharqia','2022-06-10');

/*==================================================
 Ê·Ìœ 50000 ⁄„Ì· »√”„«¡ „’—Ì… „ ›—ﬁ… Ê—Ê« » Ê«ﬁ⁄Ì…
==================================================*/
WITH Numbers AS (
    SELECT TOP 50000 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.objects a CROSS JOIN sys.objects b
)
INSERT INTO Customers (FullName, Gender, BirthDate, Phone, City, MonthlyIncome)
SELECT
FirstNames.Name + ' ' + LastNames.Name,
CASE WHEN ABS(CHECKSUM(NEWID())) % 10 < 7 THEN 'Male' ELSE 'Female' END,
DATEADD(YEAR, -(22 + ABS(CHECKSUM(NEWID())) % 34), GETDATE()),
'01' + CAST(ABS(CHECKSUM(NEWID())) % 3 AS VARCHAR) + RIGHT('00000000' + CAST(ABS(CHECKSUM(NEWID())) % 99999999 AS VARCHAR),8),
CASE ABS(CHECKSUM(NEWID())) % 6
    WHEN 0 THEN 'Cairo'
    WHEN 1 THEN 'Alexandria'
    WHEN 2 THEN 'Giza'
    WHEN 3 THEN 'Mansoura'
    WHEN 4 THEN 'Zagazig'
    ELSE 'Tanta'
END,
10000 + ABS(CHECKSUM(NEWID())) % 40000
FROM Numbers
CROSS APPLY (
    SELECT TOP 1 Name FROM (VALUES
    ('Ahmed'),('Mohamed'),('Mahmoud'),('Mostafa'),('Omar'),
    ('Youssef'),('Hassan'),('Ibrahim'),('Amr'),('Karim'),
    ('Tarek'),('Sherif'),('Khaled'),('Ayman'),('Wael'),
    ('Mina'),('Ramy'),('Bassem'),('Hany'),('Samir'),
    ('Adel'),('Nader'),('Magdy'),('Sami'),('Fady'),
    ('Ashraf'),('Lotfy'),('Hussein'),('Reda'),('Ehab')
    ) AS FirstNames(Name)
    ORDER BY NEWID()
) AS FirstNames
CROSS APPLY (
    SELECT TOP 1 Name FROM (VALUES
    ('Hassan'),('Mahmoud'),('Ibrahim'),('Ali'),('Abdullah'),
    ('Salem'),('Fahmy'),('Nassar'),('Soliman'),('Farouk'),
    ('Mostafa'),('Gaber'),('Hamdy'),('Saad'),('Shawky'),
    ('Zaki'),('Helmy'),('Fawzy'),('Eid'),('Younes'),
    ('Mokhtar'),('Anwar'),('Lotfy'),('Khalil'),('Salah'),
    ('Hamed'),('Taha'),('Samy'),('Gamal'),('Reda')
    ) AS LastNames(Name)
    ORDER BY NEWID()
) AS LastNames;

/*==================================================
≈‰‘«¡ ÿ·»«  «· „ÊÌ·
==================================================*/
INSERT INTO LoanApplications
(CustomerID, BranchID, ModelID, ApplicationDate, RequestedAmount, Status)
SELECT
CustomerID,
ABS(CHECKSUM(NEWID())) % 6 + 1,
ABS(CHECKSUM(NEWID())) % 26 + 1,
DATEADD(DAY,-ABS(CHECKSUM(NEWID())) % 900,GETDATE()),
300000 + ABS(CHECKSUM(NEWID())) % 900000,
CASE 
WHEN ABS(CHECKSUM(NEWID())) % 3 = 0 THEN 'Approved'
WHEN ABS(CHECKSUM(NEWID())) % 3 = 1 THEN 'Rejected'
ELSE 'Pending'
END
FROM Customers;

/*==================================================
≈‰‘«¡ «·ﬁ—Ê÷ «·„⁄ „œ…
==================================================*/
INSERT INTO Loans
(ApplicationID, LoanAmount, InterestRate, LoanTermMonths, StartDate, LoanStatus)
SELECT
ApplicationID,
RequestedAmount,
8 + ABS(CHECKSUM(NEWID())) % 7,
36 + ABS(CHECKSUM(NEWID())) % 36,
ApplicationDate,
'Active'
FROM LoanApplications
WHERE Status = 'Approved';

/*==================================================
≈‰‘«¡ «·„œ›Ê⁄« 
==================================================*/
INSERT INTO Payments
(LoanID, PaymentDate, PaymentAmount, PaymentStatus)
SELECT
LoanID,
DATEADD(MONTH, ABS(CHECKSUM(NEWID())) % 12, StartDate),
2000 + ABS(CHECKSUM(NEWID())) % 8000,
CASE WHEN ABS(CHECKSUM(NEWID())) % 5 = 0 THEN 'Late' ELSE 'Paid' END
FROM Loans;