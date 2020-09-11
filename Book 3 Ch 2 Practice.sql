-- Practice - Employees
-- 1.A sales employee at carnival creates a new sales record for a sale they are 
-- trying to close. The customer, last minute decided not to purchase the vehicle. 
-- Help delete the Sales record with an invoice number of '7628231837'.
DELETE FROM sales
WHERE invoice_number = '7628231837';

-- 2.An employee was recently fired so we must delete them from our database. 
-- Delete the employee with employee_id of 35. What problems might you run into 
-- when deleting? How would you recommend fixing it?
BEGIN;
    --option 1
    DELETE FROM sales
WHERE employee_id = 35;

    DELETE FROM employees
WHERE employee_id = 35;

    ROLLBACK;

    --Option 2: Keep Sales Record(Soft Delete)- Make employee inactive

    BEGIN;

        ALTER TABLE employees
ADD COLUMN isActive bool NOT NULL
DEFAULT TRUE;

    --test--
    SELECT *
    FROM employees;
    --to delete
    UPDATE employees
SET isactive = FALSE
WHERE employee_id = 35;

    --Option 3 --- On Delete Cascade 
    BEGIN;

        ALTER Table sales
DROP CONSTRAINT sales_employee_id_fkey
        ,
        DROP CONSTRAINT sales_employee_id_fkey
FOREIGN KEY
        (employee_id) REFERENCES employee
        (employee_id) ON
        DELETE CASCADE;
