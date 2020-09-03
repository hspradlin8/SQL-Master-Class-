-- Complex Joins
-- Practice Sales Type by Dealership: Produce a report that lists 
-- every dealership, the number of purchases done by each,and the 
-- number of leases done by each.
SELECT business_name, COUNT(sp.sale_id)AS purchases, COUNT(sl.sale_id) AS leases
FROM Dealerships d
    LEFT JOIN sales sp on sp.dealership_id = d.dealership_id AND sp.sales_type_id = 1
    LEFT JOIN sales sl on sl.dealership_id = d.dealership_id AND sl.sales_type_id = 2
GROUP BY business_name;

-- Practice Leased Types: Produce a report that determines the most 
-- popular vehicle model that is leased.

SELECT vm.name, COUNT( s.sale_id) AS leaseCount
FROM sales s
    INNER JOIN vehicles v ON s.vehicle_id = v.vehicle_id
   INNER JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
    INNER JOIN vehiclemodel vm ON vt.vehicle_model_id = vm.vehicle_model
WHERE s.sales_type_id = 2
GROUP BY vm.name
ORDER BY leaseCount DESC
LIMIT 1;
-- Who Sold What
-- 1.What is the most popular vehicle make in terms of number of sales?
SELECT 
COUNT(s.sale_id) AS SalesCount, vm.name
FROM sales s
INNER JOIN salestypes st ON st.sales_type_id = s.sales_type_id
INNER JOIN vehicles v ON s.vehicle_id = v.vehicle_id
INNER JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
INNER JOIN vehiclemake vm ON vt.vehicle_make = vm.vehicle_make_id
-- WHERE s.sales_type_id = 1
GROUP BY vm.name
ORDER BY SalesCount DESC
LIMIT 1;
-- 2.Which employee type sold the most of that make?
SELECT COUNT(sale_id) AS SaleCount, et.name
FROM vehiclemake vm
LEFT JOIN vehicletypes vt ON vt.vehicle_make = vm.vehicle_make_id
LEFT JOIN vehicles v ON v.vehicle_type_id = vt.Vehicle_type_id
LEFT JOIN sales s ON s.vehicle_id = v.vehicle_id
LEFT JOIN employees e ON e.employee_id = s.employee_id
LEFT JOIN employeetypes et ON et.employee_type_id = e.employee_type_id
WHERE vehicle_make_id = 3
GROUP BY et.name
ORDER BY SaleCount DESC
LIMIT 1
