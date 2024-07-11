-- Creates a table named 'users' with the following attributes:
-- id: Integer, never null, auto increment, and primary key
-- email: String (255 characters), never null and unique
-- name: String (255 characters)
-- country: Enum of countries (US, CO, TN), never null (default=US)
-- The script will not fail if the table already exists, and can be executed on any database.

CREATE TABLE IF NOT EXISTS users (
       id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
       email VARCHAR(255) NOT NULL UNIQUE,
       name VARCHAR(255),
       country ENUM ('US', 'CO', 'TN') NOT NULL DEFAULT 'US'
)
