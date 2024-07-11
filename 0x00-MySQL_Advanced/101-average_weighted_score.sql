-- Creates a stored procedure called 'ComputeAverageWeightedScoreForUsers'
-- The procedure computes and stores the average weighted score for all users (students)

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;

DELIMITER $$

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    -- Update the 'average_score' column for all users
    -- The average weighted score for each user is calculated as:
    -- (Sum of correction scores * project weights) / Sum of project weights
    UPDATE users AS users,
           (
               SELECT users.id, SUM(score * weight) / SUM(weight) AS weight_avg
               FROM users
               JOIN corrections AS correct ON users.id = correct.user_id
               JOIN projects AS proj ON correct.project_id = proj.id
               GROUP BY users.id
           ) AS weight
    SET users.average_score = weight.weight_avg
    WHERE users.id = weight.id;
END $$

DELIMITER ;
