/*
===============================================================================
Stored Procedure: Load Silver Layer (Bronze -> Silver)
===============================================================================
Script Purpose:
    This stored procedure performs the ETL (Extract, Transform, Load) process to 
    populate the 'silver' schema tables from the 'bronze' schema.
	Actions Performed:
		- Truncates Silver tables.
		- Inserts transformed and cleansed data from Bronze into Silver tables.
		
Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC Silver.load_silver;
===============================================================================
*/

EXEC silver.load_silver

CREATE OR ALTER PROCEDURE silver.load_silver AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME; 
    BEGIN TRY
	    PRINT '================================================';
        PRINT 'LOADING SILVER LAYER';
        PRINT '================================================';

		-- Loading silver.construction
	    SET @start_time = GETDATE();

		PRINT '>>>>>TRUNCATING TABLE: silver.construction';
		TRUNCATE TABLE silver.construction;
		PRINT '>>>>>INSERTING TO TABLE: silver.construction'
		INSERT INTO silver.construction (
			project_id,
			category, 
			contractor, 
			starting_date, 
			plan_end_date, 
			actual_end_date, 
			budget,
			actual_cost,
			delay_days
		)
		Select
			project_id,
			COALESCE(category, 'Unknown') category,
			COALESCE(contractor, 'Unknown') contractor,
			TRY_CONVERT(DATE, starting_date, 103) AS starting_date,
			TRY_CONVERT(DATE, plan_end_date, 103) AS plan_end_date,
			TRY_CONVERT(DATE, actual_end_date, 103) AS actual_end_date,
			 --If value is null after extracting numeric figure then replace it with value from actual_cost column, if both column is Null then replace it with '0'
			CAST(COALESCE(COALESCE(silver.extract_numeric(budget), silver.extract_numeric(actual_cost)),0) AS BIGINT) AS budget,
			 --If value is null after extracting numeric figure then replace it with value from budget column, if both column is Null then replace it with '0'
			CAST(COALESCE(COALESCE(silver.extract_numeric(actual_cost), silver.extract_numeric(budget)),0) AS BIGINT) AS actual_cost,
			CAST(COALESCE(delay_days, '0') AS BIGINT) AS delay_days
		FROM bronze.construction
		SET @end_time = GETDATE();
		PRINT '>>>>>LOAD DURATION: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' SECONDS';
        PRINT '>>>>>LOAD COMPLETE'
        PRINT '>>>>>-------------';
	END TRY

	BEGIN CATCH
			PRINT '=========================================='
			PRINT 'ERROR OCCURED DURING LOADING SILVER LAYER'
			PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
			PRINT 'ERROR NUMBER' + CAST (ERROR_NUMBER() AS NVARCHAR);
			PRINT 'ERROR STATE' + CAST (ERROR_STATE() AS NVARCHAR);
			PRINT '=========================================='
	END CATCH
END
