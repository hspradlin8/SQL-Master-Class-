-- Employee Reports
-- Who are the top 5 employees for generating sales income?
SELECT 
CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
e.employee_id,
SUM(s.price)
FROM sales s
JOIN employees e ON e.employee_id = s.employee_id 
GROUP BY e.employee_id 
ORDER BY e.employee_id, SUM(s.price) DESC
LIMIT 5;


-- Who are the top 5 dealership for generating sales income?
SELECT 
d.business_name,
SUM(s.price)
FROM sales s
JOIN  dealerships d ON d.dealership_id = s.dealership_id
GROUP BY d.dealership_id 
ORDER BY  SUM(s.price) DESC
LIMIT 5;

-- Which vehicle model generated the most sales income?
SELECT 
vm.name,
s.price
FROM sales s 
JOIN vehicles v ON s.vehicle_id = v.vehicle_id
JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
JOIN vehiclemodels vm ON vt.model_id = vm.vehicle_model_id 
ORDER BY vm.name, s.price DESC
LIMIT 1;

-- Top Performance
-- Which employees generate the most income per dealership?
SELECT 
e.first_name,
e.last_name,
SUM(s.price) AS Income,
d.business_name
FROM sales s
JOIN dealerships d ON s.dealership_id = d.dealership_id
JOIN employees e ON s.employee_id = e.employee_id
GROUP BY e.employee_id, d.business_name
ORDER BY Income DESC
LIMIT 1;

-- OR
SELECT
 DISTINCT ON (d.dealership_id) d.dealership_id,
 d.business_name,
 e.employee_id,
 e.first_name,
 e.last_name,
 SUM(s.price) total_price
 FROM sales s
 JOIN employees e ON e.employee_id = s.employee_id
 JOIN dealerships d ON d.dealership_id = s.dealership_id
 GROUP BY d.dealership_id, e.employee_id
 ORDER BY d.dealership_id, total_price DESC;
-- Inventory
-- In our Vehicle inventory, show the count of each Model that is in stock.
SELECT 
COUNT(v.vehicle_id),
vm.name
FROM vehicles v 
JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
JOIN vehiclemodels vm ON vt.model_id = vm.vehicle_model_id
GROUP BY vm.vehicle_model_id
ORDER BY COUNT(v.vehicle_id) DESC;

-- In our Vehicle inventory, show the count of each Make that is in stock.
SELECT 
COUNT(v.vehicle_id),
vm.name
FROM vehicles v 
JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
JOIN vehiclemakes vm ON vt.model_id = vm.vehicle_make_id
GROUP BY vm.vehicle_make_id
ORDER BY COUNT(v.vehicle_id) DESC;

-- In our Vehicle inventory, show the count of each BodyType that is in stock.
SELECT 
vb.name,
COUNT(v.vehicle_id)
FROM vehicles v
JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
JOIN vehiclebodytypes vb ON vt.body_type_id = vb.vehicle_body_type_id
GROUP BY vb.vehicle_body_type_id
ORDER BY COUNT(v.vehicle_id) DESC;

-- Purchasing Power
-- Which US state's customers have the highest average purchase price for a vehicle?
SELECT 
AVG(s.price),
c.state
FROM sales s 
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.state 
ORDER BY AVG(s.price) DESC;

-- Now using the data determined above, which 5 states have the customers 
-- with the highest average purchase price for a vehicle?
SELECT 
AVG(s.price),
c.state
FROM sales s 
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.state 
ORDER BY AVG(s.price) DESC
LIMIT 5