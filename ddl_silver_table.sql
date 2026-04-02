/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables 
    if they already exist.
	Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

IF OBJECT_ID('silver.construction', 'U') IS NOT NULL
    DROP TABLE silver.construction;
GO

CREATE TABLE silver.construction (
    project_id NVARCHAR(50),
    category NVARCHAR(50),
    contractor NVARCHAR(50),
    starting_date DATE,
    plan_end_date DATE,
    actual_end_date DATE,
    budget INT,
    actual_cost INT,
    delay_days INT
);


IF OBJECT_ID('silver.construction_test', 'U') IS NOT NULL
    DROP TABLE silver.construction_test;
GO

CREATE TABLE silver.construction_test (
    project_id NVARCHAR(50),
    category NVARCHAR(50),
    contractor NVARCHAR(50),
    starting_date DATE,
    plan_end_date DATE,
    actual_end_date DATE,
    budget INT,
    actual_cost INT,
    delay_days INT,
    cost_overrun_saving BIGINT,
    cost_overrun_saving_percentage FLOAT
);
