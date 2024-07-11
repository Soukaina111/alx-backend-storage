-- Creates a stored procedure called 'ComputeAverageWeightedScoreForUser'
-- The procedure computes and stores the average weighted score for a given user

DELIMITER $$

-- Drop the procedure if it already exists, to allow for re-creation
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;

CREATE PROCEDURE ComputeAverageWeightedScoreForUser (IN user_id INT)
BEGIN
    -- Update the 'average_score' column for the user with the specified user_id
    -- The average weighted score is calculated as:
    -- (Sum of correction scores * project weights) / Sum of project weights
    UPDATE users
    SET average_score = (
        SELECT SUM(corrections.score * projects.weight) / SUM(projects.weight)
        FROM corrections
        INNER JOIN projects ON projects.id = corrections.project_id
        WHERE corrections.user_id = user_id
    )
    WHERE users.id = user_id;
END $$

DELIMITER ;
