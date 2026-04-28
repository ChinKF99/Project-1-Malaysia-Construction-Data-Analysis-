/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

USE Construction
EXEC bronze.load_bronze

CREATE OR ALTER PROCEDURE bronze.load_bronze AS

	BEGIN
		BEGIN TRY
		DECLARE @start_time DATETIME, @end_time DATETIME
		PRINT '==============================';
		PRINT 'LOADING BRONZE LAYER';
		PRINT '==============================';
		SET @start_time = GETDATE();
		PRINT '>>>>TRUNCATING TABLE'
		TRUNCATE TABLE bronze.construction
		PRINT '>>>>INSERTING TO TABLE'
		BULK INSERT bronze.construction
		FROM 'C:\Users\Khai Foong\Desktop\Data Analyst Project\Project_2_Malaysia_Construction Data\modified_construction_project_dataset.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n',
			TABLOCK
		);
		SET @end_time = GETDATE()
		PRINT 'LOAD DURATION: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'
		PRINT '>>>>LOAD COMPLETE'
		PRINT '------------------------------'
		END TRY

		BEGIN CATCH
			PRINT '=========================================='
			PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
			PRINT 'Error Message' + ERROR_MESSAGE();
			PRINT 'Error Number' + CAST(ERROR_NUMBER() AS NVARCHAR);
			PRINT 'Error State' + CAST(ERROR_STATE() AS NVARCHAR);
		END CATCH

	END
