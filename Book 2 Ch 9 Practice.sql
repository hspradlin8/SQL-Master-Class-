-- Available Models
-- 1.Which model of vehicle has the lowest current inventory? This will help dealerships know which models the purchase from manufacturers.
SELECT
    vt.vehicle_type_id,
    vm.vehicle_model_id,
    vm.name
FROM vehicles v
    LEFT JOIN vehicletypes vt ON vt.vehicle_type_id = v.vehicle_type_id
    LEFT JOIN vehiclemodels vm ON vm.vehicle_model_id = vt.model_id
ORDER BY vm.vehicle_model_id ASC
LIMIT 1;
-- 2.Which model of vehicle has the highest current inventory? This will help dealerships know which models are, perhaps, not selling.
SELECT 
    vt.vehicle_type_id, 
    vm.name, 
    vm
.vehicle_model_id
FROM vehicles v
    LEFT JOIN vehicletypes vt ON vt.vehicle_type_id = v.vehicle_type_id
    LEFT JOIN vehiclemodels vm ON vm.vehicle_model_id = vt.model_id
ORDER BY vm.vehicle_model_id DESC
LIMIT 1;
-- Diverse Dealerships
-- 1.Which dealerships are currently selling the least number of vehicle models? This will let dealerships market vehicle models more effectively per region.
SELECT
    vt.vehicle_type_id,
    vm.vehicle_model_id,
    vm.name,
    d.business_name
FROM sales s
    LEFT JOIN vehicletypes vt ON vt.vehicle_type_id = s.vehicle_id
    LEFT JOIN vehiclemodels vm ON vm.vehicle_model_id = vt.model_id
    LEFT JOIN dealerships d ON d.dealership_id = s.dealership_id
ORDER BY vm.vehicle_model_id ASC
LIMIT 1;
-- 2.Which dealerships are currently selling the highest number of vehicle models? This will let dealerships know which regions have either a high population, or less brand loyalty.
SELECT 
	vt.vehicle_type_id,
	vm.vehicle_model_id,
	vm.name, 
	d.business_name
FROM sales s  
 INNER JOIN vehicletypes vt ON vt.vehicle_type_id
= s.vehicle_id
 INNER JOIN vehiclemodels vm ON vm.vehicle_model_id = vt.model_id
 INNER JOIN dealerships d ON d.dealership_id = s.dealership_id
ORDER BY vm.vehicle_model_id DESC
LIMIT 1;