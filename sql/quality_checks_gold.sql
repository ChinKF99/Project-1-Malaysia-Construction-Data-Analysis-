/*
===============================================================================
Quality Checks
===============================================================================
Script Purpose:
    This script performs quality checks to validate the consistency, 
    and accuracy of the Gold Layer. These checks ensure:
    - Uniqueness of primary keys in fact tables.

Usage Notes:
    - Investigate and resolve any discrepancies found during the checks.
===============================================================================
*/

-- ====================================================================
-- Checking 'gold.fact_construction'
-- ====================================================================
-- Check for Uniqueness of project_id in gold.fact_construction
-- Expectation: No results 
SELECT 
    project_id,
    COUNT(*) AS duplicate_count
FROM gold.fact_construction
GROUP BY project_id
HAVING COUNT(*) > 1;
