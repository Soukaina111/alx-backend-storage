-- Writes an SQL script that creates a trigger to decrease the quantity of an item
-- after a new order is added to the 'orders' table
-- The quantity in the 'items' table can be negative
-- This approach helps maintain data integrity by handling the update of multiple tables
-- in a single action, which can be useful in case of network disconnections or crashes

CREATE TRIGGER decrease_items_quantity
AFTER INSERT ON orders
FOR EACH ROW
UPDATE items
SET quantity = quantity - NEW.number
WHERE name = NEW.item_name;
