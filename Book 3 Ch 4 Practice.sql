-- Goals
-- 1.Use the story above and extract the requirements.
ALTER TABLE vehicles
ADD COLUMN is_sold  bool NOT NULL
SET
DEFAULT false;


-- 2.Build two stored procedures for Selling a car and Returning a car.
--  Be ready to share with your class or instructor your result.
-- Selling a car--
CREATE  PROCEDURE remove_vehicle_from_inventory(vehicleId int)
LANGUAGE plpsql
AS $$
BEGIN

    UPDATE vehicles v
    SET is_sold
    = true
WHERE v.vehicle_id = vehicleId;

END
$$;

CALL remove_vehicle_from_inventory
(2);
CALL remove_vehicle_from_inventory
(3);
CALL remove_vehicle_from_inventory
(55);