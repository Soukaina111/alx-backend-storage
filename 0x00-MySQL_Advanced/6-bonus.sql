-- Writes an SQL script that creates a stored procedure called 'AddBonus'
-- The procedure adds a new correction for a student
-- The procedure takes three input parameters in the following order:
--   1. 'user_id': an existing 'users.id' value
--   2. 'project_name': the name of a new or already existing project
--   3. 'score': the score value for the correction
-- If the 'project_name' does not exist in the 'projects' table, it will be created
-- The script assumes that the 'user_id' is linked to an existing 'users' record

DELIMITER $$

CREATE PROCEDURE AddBonus(
    IN user_id INT,
    IN project_name VARCHAR(255),
    IN score INT
)
BEGIN
    -- Check if the 'project_name' already exists in the 'projects' table
    IF NOT EXISTS (SELECT name FROM projects WHERE name = project_name) THEN
        -- If the project does not exist, insert it into the 'projects' table
        INSERT INTO projects (name) VALUES (project_name);
    END IF;

    -- Insert the new correction into the 'corrections' table
    INSERT INTO corrections (user_id, project_id, score)
    VALUES (user_id, (SELECT id FROM projects WHERE name = project_name), score);
END$$

DELIMITER ;
