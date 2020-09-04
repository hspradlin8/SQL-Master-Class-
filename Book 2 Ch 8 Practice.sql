-- Purchase Income by Dealership
-- 1.Write a query that shows the total purchase sales income per dealership.
SELECT
    st.sales_type_id, st.name,
    d.business_name
FROM Sales s
    LEFT JOIN salestypes st ON s.sales_type_id = st.sales_type_id
    LEFT JOIN dealerships d ON s.dealership_id = d.dealership_id
WHERE st.sales_type_id = 1

-- 2.Write a query that shows the purchase sales income per dealership for the current month.
SELECT d.dealership_id,
    SUM(s.price)
FROM sales s
    JOIN dealerships d ON d.dealership_id = s.dealership_id
WHERE EXTRACT(MONTH FROM s.purchase_date) = EXTRACT(MONTH FROM CURRENT_DATE) AND EXTRACT(YEAR FROM s.purchase_date) = EXTRACT(MONTH FROM CURRENT_DATE)
GROUP BY d.dealership_id
ORDER BY d.dealership_id;
-- 3.Write a query that shows the purchase sales income per dealership for the current year.
SELECT d.dealership_id,
    SUM(s.price),
    s.purchase_date
FROM sales s
    JOIN dealerships d ON d.dealership_id = s.dealership_id
WHERE EXTRACT(YEAR FROM s.purchase_date) = EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY d.dealership_id, s.purchase_date
ORDER BY d.dealership_id;
-- Lease Income by Dealership
-- 1.Write a query that shows the total lease income per dealership.
SELECT
    d.business_name,
    s.sales_type_id AS num_leases,
    COUNT(s.sale_id) AS num_sales,
    SUM(s.price) AS income
FROM sales s
    JOIN dealerships d ON d.dealership_id = s.dealership_id
    JOIN salestypes st ON s.sales_type_id = st.sales_type_id
WHERE st.sales_type_id = 2
GROUP BY s.sales_type_id, d.business_name
ORDER BY SUM(s.price) DESC;
-- 2.Write a query that shows the lease income per dealership for the current month.
SELECT d.dealership_id,
    SUM(s.price)
FROM sales s
    JOIN dealerships d ON d.dealership_id = s.dealership_id
WHERE EXTRACT(MONTH FROM s.purchase_date) = EXTRACT(MONTH FROM CURRENT_DATE) AND EXTRACT(YEAR FROM s.purchase_date) = EXTRACT(MONTH FROM CURRENT_DATE) AND s.sales_type_id =2
GROUP BY d.dealership_id
ORDER BY d.dealership_id;
-- 3.Write a query that shows the lease income per dealership for the current year.
SELECT d.dealership_id,
    SUM(s.price),
    s.purchase_date
FROM sales s
    JOIN dealerships d ON d.dealership_id = s.dealership_id
WHERE EXTRACT(YEAR FROM s.purchase_date) = EXTRACT(YEAR FROM CURRENT_DATE) AND s.sales_type_id =2
GROUP BY d.dealership_id, s.purchase_date
ORDER BY d.dealership_id;
--Total Income by Employee
-- 1.Write a query that shows the total income (purchase and lease) per employee.
SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    COUNT(s.sale_id) AS num_sales,
    SUM(s.price) AS income
FROM sales s
    JOIN employees e ON s.employee_id = e.employee_id
GROUP BY employee_name
ORDER BY SUM(s.price) DESC;