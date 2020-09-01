-- Filtering Date
-- 1.Get a list of sales records where the sale was a lease.
SELECT * , sales_type_id
FROM Sales
WHERE sales_type_id = 2;
-- 2.Get a list of sales where the purchase date is within the last two years.
SELECT *
FROM Sales
WHERE purchase_date BETWEEN '2018-01-01' AND '2020-01-01';
-- 3.Get a list of sales where the deposit was above 5000 or the customer payed with American Express.
SELECT *
FROM Sales
WHERE deposit > 5000 OR payment_method = 'americanexpress';
-- 4.Get a list of employees whose first names start with "M" or ends with "E".
SELECT *
FROM employees
WHERE first_name LIKE 'M%' or first_name LIKE '%e';
-- 5.Get a list of employees whose phone numbers have the 600 area code.
SELECT *
FROM Employees
WHERE phone LIKE '600%';

