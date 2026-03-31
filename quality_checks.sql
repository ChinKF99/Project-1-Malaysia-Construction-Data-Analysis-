/*
===============================================================================
Quality Checks
===============================================================================
Script Purpose:
    This script performs various quality checks for data consistency, accuracy, 
    and standardization across the 'silver' layer. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.

Usage Notes:
    - Run these checks after data loading Silver Layer.
    - Investigate and resolve any discrepancies found during the checks.
===============================================================================
*/


-- ====================================================================
-- Checking 'silver.construction'
-- ====================================================================
-- Check for NULLs or Duplicates in Primary Key
-- Expectation: No Results
SELECT 
    project_id,
    COUNT(*)
FROM bronze.construction
GROUP BY project_id
HAVING COUNT(*) > 1 OR project_id IS NULL;

-- Data Standardization & Consistency for category column
SELECT
DISTINCT(category)
FROM bronze.construction

-- Check for Null Vales for category column
-- Expectation: No Results
SELECT
DISTINCT(category)
FROM bronze.construction
WHERE category IS NULL

-- Data Standardization & Consistency for contractor column
SELECT
DISTINCT(contractor)
FROM bronze.construction

-- Check for Null Vales for contractor column
-- Expectation: No Results
SELECT
DISTINCT(contractor)
FROM bronze.construction
WHERE contractor IS NULL

-- Check for Null Values in starting_date after conversion to date data type (dd/mm/yyy) column
-- Expectation: No Results
SELECT 
starting_date
FROM bronze.construction
WHERE TRY_CONVERT(DATE, starting_date,103) IS NULL

-- Check for Null Values in plan_end_date after conversion to date data type (dd/mm/yyy) column
-- Expectation: No Results
SELECT 
plan_end_date
FROM bronze.construction
WHERE TRY_CONVERT(DATE, plan_end_date,103) IS NULL

-- Check for Null Values in actual_end_date after conversion to date data type (dd/mm/yyy) column
-- Expectation: No Results
SELECT 
actual_end_date,
FROM bronze.construction
WHERE actual_end_date != TRY_CONVERT(DATE, actual_end_date, 103)

-- Check for Value that is Non BIGINT & Null Values for budget column
-- Expectation: No Results
SELECT 
budget
FROM bronze.construction
WHERE TRY_CAST(budget AS BIGINT) IS NULL
