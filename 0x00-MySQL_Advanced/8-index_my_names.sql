-- Creates an index called 'idx_name_first' on the 'names' table
-- The index is created on the first character (letter) of the 'name' column
-- This approach indexes only the first letter of the 'name' column

CREATE INDEX idx_name_first
ON names(name(1));
