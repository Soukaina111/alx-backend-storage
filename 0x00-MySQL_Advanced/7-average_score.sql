-- Writes an SQL script that creates a stored procedure called 'ComputeAverageScoreForUser'
-- The procedure computes and stores the average score for a given student
-- The procedure takes one input parameter:
--   1. 'user_id': an existing 'users.id' value

DELIMITER $$

-- Drop the procedure if it already exists, to allow for re-creation
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;

CREATE PROCEDURE ComputeAverageScoreForUser (
    IN user_id INT
)
BEGIN
    -- Update the 'average_score' column in the 'users' table
    -- for the given 'user_id'
    UPDATE users
    SET average_score = (
        SELECT AVG(score)
        FROM corrections
        WHERE corrections.user_id = user_id
    )
    WHERE id = user_id;
END $$

DELIMITER ;
