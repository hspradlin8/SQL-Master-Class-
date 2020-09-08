-- 1.Pick two of your friends or family and write a single 
--INSERT statement to add both of them to the Customers table.
INSERT INTO customers
    (first_name, last_name, email, phone, street, city, state, zipcode, company_name)
VALUES
    ('Edward', 'Smith', 'edwardthecat@gmail.com', '931-666-5656', '3518 Richland AVE', 'Nashville', 'TN', '37205', 'IHeartCuddles'),
    ('Sarah', 'Wilson', 'sarahb@gmail.com', '931-645-4545', '100 Precious Ave', 'Murfreesboro', 'TN', '37129', 'MTSU');

-- 2.Think of your dream car. In order to add this car to the Vehicles table, 
--you might need to add data to the VehicleTypes table. 
--Make sure the statements are ordered so that you can execute all your INSERT statements together.
INSERT INTO vehicles
    (engine_type, vehicle_type_id, exterior_color, interior_color, floor_price, msr_price, miles_count, year_of_car)
VALUES
    ('v6', 4, 'Indigo Blue', 'Khaki', '15350', '47', '152', '2008' )

-- 3.Use INSERT statements to add a new employee with the following info. 
--This employee works shifts at the first three dealerships listed in your Dealerships table:

-- Name: Kennie Maharg
-- Email: kmaharge@com.com
-- Phone: 598-678-4885
-- Role: Customer Service
INSERT INTO employees
    (first_name, last_name, email_address, phone, employee_type_id)
VALUES
    ('Kennie', 'Maharg', 'kmaharge@com.com', '598-678-4885', '4');