/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/

-- Find the Total Sales

SELECT
    FORMAT(SUM(sales_amount), 'C') AS total_sales
FROM gold.fact_sales;

-- Find how many items are sold

SELECT
    SUM(quantity) AS total_items_sold
FROM gold.fact_sales;

-- Find the average selling price

SELECT
    FORMAT(AVG(price), 'C') AS avg_price
FROM gold.fact_sales;

-- Find the Total number of Orders

SELECT
    COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales;

-- Find the total number of products

SELECT
    COUNT(DISTINCT product_key) AS total_products
FROM gold.dim_products;

-- Find the total number of customers

SELECT
    COUNT(customer_key) AS total_customers
FROM gold.dim_customers;

-- Find the total number of customers that has placed an order
SELECT
    COUNT(DISTINCT customer_key) AS total_customers_who_placed_orders
FROM gold.fact_sales;

-- Generate a Report that shows all key metrics of the business
-- (Type Casting to VARCHAR because when using UNION the number of columns and data types must be matching)
SELECT 'Total Sales' AS measure_name, CAST(FORMAT(SUM(sales_amount), 'C') AS NVARCHAR) AS measure_quantity FROM gold.fact_sales
UNION ALL 
SELECT 'Total Items Sold' AS measure_name, CAST(SUM(quantity) AS NVARCHAR) AS measure_quantity FROM gold.fact_sales
UNION ALL
SELECT 'Average Price' AS measure_name, CAST(FORMAT(AVG(price), 'C') AS NVARCHAR) AS measure_quantity FROM gold.fact_sales
UNION ALL
SELECT 'Total Orders' AS measure_name, CAST(COUNT(DISTINCT order_number) AS NVARCHAR) AS measure_quantity FROM gold.fact_sales
UNION ALL
SELECT 'Total Products' AS measure_name, CAST(COUNT(DISTINCT product_key) AS NVARCHAR) AS measure_quantity FROM gold.dim_products
UNION ALL
SELECT 'Total Customers' AS measure_name, CAST(COUNT(DISTINCT customer_key) AS NVARCHAR) AS measure_quantity FROM gold.dim_customers
UNION ALL
SELECT 'Total Customers who placed an order' AS measure_name, CAST(COUNT(DISTINCT customer_key) AS NVARCHAR) AS measure_quantity FROM gold.fact_sales;
