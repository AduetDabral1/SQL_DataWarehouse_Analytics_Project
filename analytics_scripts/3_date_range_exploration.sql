/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/

-- Determine the first and last order date and the total duration in months

SELECT
	MIN (order_date) AS first_order_date,
	MAX (order_date) AS last_order_date,
	DATEDIFF(MONTH, MIN (order_date), MAX (order_date)) AS orders_range_in_months
FROM gold.fact_sales;


-- Find the youngest and oldest customer based on birthdate

SELECT 
	MIN (birthdate) AS oldest_birthdate,
	DATEDIFF (YEAR, MIN (birthdate), GETDATE()) AS oldest_customer_age,
	MAX (birthdate) AS youngest_birthdate,
	DATEDIFF (YEAR, MAX (birthdate), GETDATE()) AS youngest_customer_age
FROM gold.dim_customers;
	

/*
-- To select names of the oldest and youngest customers

SELECT 
	t1.first_name + ' ' + t1.last_name AS oldest_customer,
	t1.birthdate AS oldest_birthdate,
	DATEDIFF (YEAR, t1.birthdate, GETDATE()) AS oldest_customer_age,
	t2.first_name + ' ' + t2.last_name AS youngest_customer,
	t2.birthdate AS youngest_birthdate,
	DATEDIFF (YEAR, t2.birthdate, GETDATE()) AS youngest_customer_age
FROM 
	gold.dim_customers t1,
	gold.dim_customers t2
WHERE
	t1.birthdate = (SELECT MIN (birthdate) from gold.dim_customers)
	AND
	t2.birthdate = (SELECT MAX (birthdate) from gold.dim_customers);

	*/
