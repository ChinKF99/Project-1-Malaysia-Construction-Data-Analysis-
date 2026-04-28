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
		PRINT '>>>>>INSERTING TO TABLE: silver.construction';
		--CTE named cleaned
		WITH cleaned AS (
			SELECT
				project_id,
				COALESCE(category, 'Unknown') category,
				COALESCE(contractor, 'Unknown') contractor,
				TRY_CONVERT(DATE, starting_date, 103) AS starting_date,
				TRY_CONVERT(DATE, plan_end_date, 103) AS plan_end_date,
				TRY_CONVERT(DATE, actual_end_date, 103) AS actual_end_date,
				-- Use extract_numeric function for both budget & actual_cost column
				CAST(COALESCE(COALESCE(silver.extract_numeric(budget), silver.extract_numeric(actual_cost)),0) AS BIGINT) AS budget,
				CAST(COALESCE(COALESCE(silver.extract_numeric(actual_cost), silver.extract_numeric(budget)),0) AS BIGINT) AS actual_cost,
				CAST(COALESCE(delay_days, '0') AS INT) AS delay_days
			FROM bronze.construction
		)
		INSERT INTO silver.construction
		SELECT 
		*,
		(actual_cost - budget) AS cost_overrun_saving,
		--(actual_cost - budget)/budget AS percentage
		(CAST(actual_cost AS FLOAT) - budget) / NULLIF(budget, 0) AS cost_overrun_saving_percentage
		FROM cleaned
		--Exclude row which both budget & actual_cost column is 0 (Outliers)
		WHERE NOT (budget = 0 AND actual_cost = 0);
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
