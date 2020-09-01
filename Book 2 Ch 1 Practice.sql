-- Basic Query Review
-- 1.Write a query that returns the business name, city, state, and website for each dealership. Use an alias for the Dealerships table.
SELECT
    d.business_name AS "Dealership Table",
    d.city,
    d.state,
    d.website
FROM Dealerships d
;
-- 2.Write a query that returns the first name, last name, and email address of every customer. Use an alias for the Customers table.
SELECT c.first_name AS "Customer First Name",
    c.last_name AS "Customer Last Name",
    c.email AS "Customer Email"
FROM Customers c;