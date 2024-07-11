-- Creates an index called 'idx_name_first_score' on the 'names' table
-- The index is created on the first character (letter) of the 'name' column
-- and the 'score' column
-- This approach indexes the first letter of the 'name' column and the 'score' column

CREATE INDEX idx_name_first_score
ON names(name(1), score);
