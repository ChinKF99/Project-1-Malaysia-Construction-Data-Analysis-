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
    RETURN TRIM(@input);
END;