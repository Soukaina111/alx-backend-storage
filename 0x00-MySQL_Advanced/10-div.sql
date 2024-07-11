-- Creates a function called 'SafeDiv' that performs a safe division operation
-- The function takes two input parameters:
--   1. 'a': an integer value
--   2. 'b': an integer value
-- The function returns the result of a / b, or 0 if b is equal to 0

DELIMITER //

-- Drop the function if it already exists, to allow for re-creation
DROP FUNCTION IF EXISTS SafeDiv;

CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT DETERMINISTIC
BEGIN
    -- If b is equal to 0, return 0, otherwise return a / b
    RETURN (IF (b = 0, 0, a / b));
END //

DELIMITER ;
