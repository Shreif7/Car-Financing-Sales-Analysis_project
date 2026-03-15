# 📊 Car Financing Data Analysis Case Study

## 📌 Project Overview

This project presents an End-to-End Data Analysis Case Study focused on
a Car Financing Business Model.

The goal of the project was to simulate a real-world financing
environment by building a complete dataset from scratch, then performing
analytical exploration to extract business insights that could help
improve loan approval performance, customer targeting, and branch
efficiency.

Unlike many public datasets that consist of a single table, this project
was designed as a multi-table relational database to better represent
real enterprise data structures.

Project workflow: - Database Design - Data Generation - Data Preparation
& Transformation - Business KPI Engineering - Data Visualization -
Insight Extraction - Strategic Business Recommendations

------------------------------------------------------------------------

# 🎯 Business Objective

Main business question:

How can a car financing company increase approved loans while improving
customer targeting and operational efficiency?

Analysis areas: - Loan applications performance - Customer
demographics - Branch efficiency - Car brand demand - Loan value
distribution - Seasonal financing trends

------------------------------------------------------------------------

# 🛠 Tools & Technologies Used

-   SQL → Database Creation & Data Preparation
-   Views → Structured analytical datasets
-   Power BI → Data Modeling & Dashboard Development
-   DAX → KPI Calculations & Business Metrics
-   Data Visualization → Insight Communication

------------------------------------------------------------------------

# 🗄 Database Design

The project started by designing a relational database representing a
Car Financing System.

Main tables:

### Customers

-   Customer ID
-   City
-   Monthly Income

### Loan Applications

-   Application ID
-   Customer ID
-   Loan Amount
-   Application Status (Approved / Pending / Rejected)

### Loans

-   Loan ID
-   Customer ID
-   Loan Start Date
-   Loan Amount

### Payments

-   Payment ID
-   Loan ID
-   Payment Amount
-   Payment Date

These tables were connected using relational keys to simulate a real
financing system.

------------------------------------------------------------------------

# 🧹 Data Preparation & Transformation (SQL)

All preprocessing was implemented in SQL.

Key steps: - Structuring relational tables - Generating realistic
financing data - Creating calculated analytical columns - Aggregating
business metrics - Creating SQL Views for Power BI integration

This ensured the dataset was analysis-ready.

------------------------------------------------------------------------

# 📊 Key Performance Indicators (KPIs)

Financing KPIs: - Total Loan Applications - Approved Applications -
Rejected Applications - Pending Applications - Conversion Rate

Business KPIs: - Total Customers - Total Loan Value - Total Payments -
Average Loan Amount

Growth KPIs: - Month-over-Month Applications - Application Trend
Analysis

------------------------------------------------------------------------

# 🔎 Key Insights

## Loan Application Status Distribution

Total applications analyzed: 19,000

-   Approved → 6,000 (33.54%)
-   Pending → 8,000 (43.87%)
-   Rejected → 4,000 (22.59%)

Insight: A large portion of applications remains pending.

Recommendation: Improve evaluation workflows to increase approvals.

------------------------------------------------------------------------

## Most Demanded Car Brands

Top brands financed: - Toyota - Hyundai - MG - Kia

Conversion rate range: 32.77% -- 34.80%.

Insight: These brands show strong customer demand.

Recommendation: Focus financing campaigns around these brands.

------------------------------------------------------------------------

## Seasonal Financing Trends

Loan demand pattern: - Peak demand in January and February - Decline
starting March - Fluctuations until August

Insight: Financing demand follows seasonal patterns.

Recommendation: Increase marketing campaigns during peak months.

------------------------------------------------------------------------

## Geographic Distribution

Highest demand cities: - Tanta - Cairo - Alexandria

Lower demand: - Zagazig

Insight: Demand varies by location.

Recommendation: Increase marketing in underrepresented cities.

------------------------------------------------------------------------

## Branch Performance

Top approval branches: - Mansoura - Zagazig - Maadi

Approval rates: 33.69% -- 35%.

Insight: These branches demonstrate higher efficiency.

Recommendation: Replicate their processes across other branches.

------------------------------------------------------------------------

## Customer Income Analysis

Loan value increases with income.

Findings: - 10k--20k income segment → smaller loans - 30k--40k income
segment → largest financing share

Insight: Income level strongly affects loan approval and size.

Recommendation: Target middle-to-high income customers.

------------------------------------------------------------------------

# 📊 Dashboard Highlights

Power BI dashboard includes: - Executive KPI overview - Loan status
breakdown - Car brand demand analysis - Branch performance comparison -
Geographic customer distribution - Monthly application trends

------------------------------------------------------------------------

# 🚀 Skills Demonstrated

-   Database Design
-   SQL Data Preparation
-   KPI Engineering
-   Power BI Data Modeling
-   Data Visualization
-   Business Insight Generation
-   Strategic Recommendation Design

------------------------------------------------------------------------

# ⭐ Final Conclusion

This project demonstrates how a full analytics workflow can transform
raw operational data into business insights.

By building the dataset, designing the database, and creating
dashboards, the project simulates a real-world financing analytics
environment.

Key outcomes: - Improve loan approval efficiency - Optimize branch
performance - Target high-value customers - Align financing strategies
with demand trends

------------------------------------------------------------------------

# 👤 Author

Shreif Mohy El‑Sayed Elfiky\
Data Analyst
