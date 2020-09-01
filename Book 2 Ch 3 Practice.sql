-- Joining Data
-- 1.Get a list of the sales that was made for each sales type.
SELECT
    s.price,
    s.deposit,
    s.purchase_date,
    st.name AS Sales_type
FROM
    sales s
    RIGHT JOIN Salestypes st
    ON s.sales_type_id = st.sales_type_id;
-- 2.Get a list of sales with the VIN of the vehicle, the first name and last name of the customer, 
-- first name and last name of the employee who made the sale and the name, city and state of the dealership.
SELECT s.sale_id,
    v.vin,
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name,
    e.first_name AS employee_first_name,
    e.Last_name AS employee_last_name,
    d.business_name AS dealership,
    d.city,
    d.state
FROM sales s
    JOIN vehicles v ON s.vehicle_id = v.vehicle_id
    JOIN customers c ON s.customer_id = c.customer_id
    JOIN employees e ON s.employee_id = e.employee_id
    JOIN dealerships d ON s.dealership_id = d.dealership_id;



-- 3.Get a list of all the dealerships and the employees, if any, working at each one.
SELECT de.dealership_employee_id,
    d.dealership_id,
    e.employee_id
FROM dealershipemployees de
    JOIN dealerships d ON de.dealership_id = d.dealership_id
    JOIN employees e ON de.employee_id = e.employee_id;
-- 4.Get a list of vehicles with the names of the body type, make, model and color.
SELECT
    v.vehicle_id,
    b.name as BodyType,
    m.name as Make,
    vm.name as Model,
    v.exterior_color

FROM vehicles v
    JOIN vehicleTypes vt ON v.vehicle_type_id = vt.vehicle_type_id
    JOIN vehicleBodyType b ON vt.vehicle_body_type = b.vehicle_body_type_id
    JOIN vehicleMake m ON vt.vehicle_make = m.vehicle_make_id
    JOIN vehicleModel vm ON vt.vehicle_model = vm.vehicle_model_id;