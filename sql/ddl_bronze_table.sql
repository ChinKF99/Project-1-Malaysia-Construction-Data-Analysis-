/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

IF OBJECT_ID ('bronze.construction','U') IS NOT NULL
	DROP TABLE bronze.construction

CREATE TABLE bronze.construction(
	project_id NVARCHAR(300),
	project_name NVARCHAR(300),
	category NVARCHAR(300),
	contractor NVARCHAR(300),
	starting_date NVARCHAR(300),
	plan_end_date NVARCHAR(300),
	actual_end_date NVARCHAR(300),
	budget NVARCHAR(300),
	actual_cost NVARCHAR(300),
	delay_days NVARCHAR(300),
)
