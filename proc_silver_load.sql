TRUNCATE silver.construction
Select
project_id,
COALESCE(category, 'Unknown') category,
COALESCE(contractor, 'Unknown') contractor,
TRY_CONVERT(DATE, starting_date, 103) AS starting_date,
TRY_CONVERT(DATE, plan_end_date, 103) AS plan_end_date,
TRY_CONVERT(DATE, actual_end_date, 103) AS actual_end_date
--CAST(COALESCE(TRIM(REPLACE(budget, 'RM', '')),0) AS BIGINT) AS budget,
--CAST(COALESCE(TRIM(REPLACE(actual_cost, 'RM', '')),0) AS BIGINT) AS actual_cost
FROM bronze.construction


SELECT
    budget,
    silver.extract_numeric(budget) AS only_numbers
FROM
    bronze.construction;

/*
===============================================================================
Function: To extract numeric characters from alphanumeric string

Parameters:
    column to be extracted 

Usage Example:
    silver.extract_numeric(column) AS column_name;
===============================================================================
*/
DROP FUNCTION IF EXISTS silver.extract_numeric;
GO
CREATE FUNCTION silver.extract_numeric(@input VARCHAR(255))
RETURNS VARCHAR(255)
AS
BEGIN
    DECLARE @alphabetIndex INT;
    SET @alphabetIndex = PATINDEX('%[^0-9]%', @input);

    WHILE @alphabetIndex > 0
    BEGIN
        SET @input = STUFF(@input, @alphabetIndex, 1, '');
        SET @alphabetIndex = PATINDEX('%[^0-9]%', @input);
    END;
    RETURN @input;
END;
  