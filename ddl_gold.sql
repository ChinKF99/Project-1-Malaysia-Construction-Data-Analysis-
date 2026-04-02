/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse. 
    The Gold layer represents the final dimension/fact tables (Star Schema)

    Each view performs transformations and combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/


-- =============================================================================
-- Create Dimension: gold.fact_construction
-- =============================================================================
IF OBJECT_ID('gold.fact_construction', 'V') IS NOT NULL
    DROP VIEW gold.fact_construction;
GO

CREATE VIEW gold.fact_construction AS
SELECT
    project_id,
    category,
    contractor,
    starting_date,
    plan_end_date,
    actual_end_date,
    budget,
    actual_cost,
    delay_days
FROM silver.construction

