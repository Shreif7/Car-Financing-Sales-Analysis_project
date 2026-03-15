

/*==================================================
≈‰‘«¡ View Ìœ„Ã Brand „⁄ Model
==================================================*/
CREATE VIEW Brand_Vw AS
WITH Brand_Vw AS (
    SELECT 
        b.BrandName,
        m.ModelID,
        m.ModelName,
        m.ModelYear,
        m.CarPrice
    FROM CarBrands b
    INNER JOIN CarModels m
        ON b.BrandID = m.BrandID
)
SELECT *
FROM Brand_Vw;


/*==================================================
≈‰‘«¡ View ··‹ Branches 
==================================================*/
CREATE VIEW Branches_Vw AS
SELECT 
    BranchID,
    BranchName,
    City
FROM Branches;


/*==================================================
≈‰‘«¡ View ··‹ Customers 
==================================================*/
CREATE VIEW CustomersVw AS
SELECT 
    CustomerID,
    FullName,
    Gender,
    City,
    MonthlyIncome
FROM Customers;


/*==================================================
≈‰‘«¡ View ·ÃœÊ· LoanApplications „⁄ RequestedAmount ›ﬁÿ
==================================================*/
CREATE VIEW LoanApplicationsView AS
SELECT
    ApplicationID,
    CustomerID,
    BranchID,
    ModelID,
    Status,
    RequestedAmount
FROM LoanApplications;



/*==================================================
≈‰‘«¡ View ·ÃœÊ· Loans
==================================================*/
CREATE VIEW LoansVw AS
SELECT
    LoanID,
    ApplicationID,
    LoanAmount,
    InterestRate,
    LoanTermMonths,
    StartDate,
    LoanStatus
FROM Loans;

/*==================================================
≈‰‘«¡ View ·ÃœÊ· Payments
==================================================*/
CREATE VIEW PaymentsVw AS
SELECT
    PaymentID,
    LoanID,
    PaymentDate,
    PaymentAmount,
    PaymentStatus
FROM Payments;