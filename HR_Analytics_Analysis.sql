CREATE DATABASE hr_analytics;
USE hr_analytics;

SELECT COUNT(*) AS Total_Rows
FROM hr_data;


USE hr_analytics;

-- ==========================================
-- OBJECTIVE 1: ATTRITION OVERVIEW
-- ==========================================

-- Q1. Total headcount and overall attrition rate

SELECT
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS Attrition_Rate
FROM hr_data;


-- Q2. Department-wise attrition rate

SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY Department
ORDER BY Attrition_Rate DESC;


-- Q3. Job role-wise attrition rate

SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY JobRole
ORDER BY Attrition_Rate DESC;


-- Q4. Attrition by age group and salary slab

SELECT
    `Age Group`,
    `Salary Slab`,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY `Age Group`, `Salary Slab`
ORDER BY Attrition_Rate DESC;


-- Q5. Attrition by tenure and distance from home

SELECT
    CASE
        WHEN YearsAtCompany <= 2 THEN '0-2 Years'
        WHEN YearsAtCompany <= 5 THEN '3-5 Years'
        WHEN YearsAtCompany <= 10 THEN '6-10 Years'
        ELSE '10+ Years'
    END AS Tenure_Band,
    CASE
        WHEN DistanceFromHome <= 5 THEN '0-5'
        WHEN DistanceFromHome <= 10 THEN '6-10'
        WHEN DistanceFromHome <= 20 THEN '11-20'
        ELSE '21+'
    END AS Distance_Band,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY Tenure_Band, Distance_Band
ORDER BY Attrition_Rate DESC;


-- ==========================================
-- OBJECTIVE 2: ATTRITION DRIVERS
-- ==========================================

-- Q6. Attrition by overtime

SELECT
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY OverTime
ORDER BY Attrition_Rate DESC;


-- Q7. Attrition by stock option level

SELECT
    StockOptionLevel,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY StockOptionLevel
ORDER BY StockOptionLevel;


-- Q8. Attrition by business travel category

SELECT
    BusinessTravel,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY BusinessTravel
ORDER BY Attrition_Rate DESC;


-- Q9. Attrition by marital status

SELECT
    MaritalStatus,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY MaritalStatus
ORDER BY Attrition_Rate DESC;


-- Q10. Attrition by job level and gender

SELECT
    JobLevel,
    Gender,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY JobLevel, Gender
ORDER BY JobLevel, Gender;


-- ==========================================
-- OBJECTIVE 3: CORRELATION & CROSS-TABULATION
-- ==========================================

-- Q11. Average monthly income of employees who left vs stayed

SELECT
    Attrition,
    COUNT(*) AS Total_Employees,
    ROUND(AVG(MonthlyIncome), 2) AS Average_Monthly_Income,
    MIN(MonthlyIncome) AS Minimum_Income,
    MAX(MonthlyIncome) AS Maximum_Income
FROM hr_data
GROUP BY Attrition;


-- Q12. Attrition across monthly income bands

SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Below 3K'
        WHEN MonthlyIncome < 6000 THEN '3K-6K'
        WHEN MonthlyIncome < 10000 THEN '6K-10K'
        ELSE '10K+'
    END AS Income_Band,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY Income_Band
ORDER BY Attrition_Rate DESC;


-- Q13. Attrition by years since last promotion

SELECT
    YearsSinceLastPromotion,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY YearsSinceLastPromotion
ORDER BY YearsSinceLastPromotion;


-- Q14. Age group and salary slab cross-tabulation

SELECT
    `Age Group`,
    `Salary Slab`,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY `Age Group`, `Salary Slab`
ORDER BY Attrition_Rate DESC;


-- Q15. Attrition by job level and promotion delay

SELECT
    JobLevel,
    CASE
        WHEN YearsSinceLastPromotion = 0 THEN '0 Years'
        WHEN YearsSinceLastPromotion <= 2 THEN '1-2 Years'
        WHEN YearsSinceLastPromotion <= 5 THEN '3-5 Years'
        ELSE '5+ Years'
    END AS Promotion_Delay_Band,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS Attrition_Rate
FROM hr_data
GROUP BY JobLevel, Promotion_Delay_Band
ORDER BY Attrition_Rate DESC;
