-- Writes an SQL script that creates a trigger to reset the 'valid_email' attribute
-- only when the email has been changed in the 'users' table
-- This approach can be useful for user email validation, as it distributes the
-- logic to the database itself, without the need for additional application-level logic

DELIMITER $$

CREATE TRIGGER resets_valid_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF NEW.email != OLD.email THEN
        SET NEW.valid_email = 0;
    END IF;
END;

DELIMITER ;
