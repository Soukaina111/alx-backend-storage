-- Creates a view called 'need_meeting' that lists all students
-- who meet the following criteria:
-- 1. Have a score strictly less than 80
-- 2. Either have no recorded 'last_meeting' date,
--    or their last recorded meeting was more than 1 month ago

DROP VIEW IF EXISTS need_meeting;

CREATE VIEW need_meeting AS
SELECT name
FROM students
WHERE score < 80
  AND (students.last_meeting IS NULL
       OR students.last_meeting < DATE_ADD(NOW(), INTERVAL -1 MONTH));
