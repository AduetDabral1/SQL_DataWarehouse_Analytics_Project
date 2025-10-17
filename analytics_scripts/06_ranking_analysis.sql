/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
    - To rank items (e.g., products, customers) based on performance or other metrics.
    - To identify top performers or laggards.

SQL Functions Used:
    - Window Ranking Functions: RANK(), DENSE_RANK(), ROW_NUMBER(), TOP
    - Clauses: GROUP BY, ORDER BY
===============================================================================
*/

-- Which 5 products Generating the Highest Revenue?
-- Simple Ranking

SELECT TOP 5
    d.product_name,
    FORMAT(SUM(f.sales_amount), 'C') AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products d
    ON f.product_key = d.product_key
GROUP BY d.product_name
ORDER BY SUM(f.sales_amount) DESC;


-- What are the 5 worst-performing products in terms of sales?
SELECT TOP 5
    d.product_name,
    FORMAT(SUM(f.sales_amount), 'C') AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products d
    ON f.product_key = d.product_key
GROUP BY d.product_name
ORDER BY SUM(f.sales_amount);


-- Find the top 10 customers who have generated the highest revenue
SELECT TOP 10
    d.customer_key,
    d.first_name,
    d.last_name,
    FORMAT(SUM(f.sales_amount), 'C') AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers d
    ON f.customer_key = d.customer_key
GROUP BY
    d.customer_key,
    d.first_name,
    d.last_name
ORDER BY SUM(f.sales_amount) DESC;

-- The 3 customers with the fewest orders placed
SELECT TOP 3
    d.customer_key,
    d.first_name,
    d.last_name,
    COUNT(DISTINCT f.order_number) AS orders_placed
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers d
    ON f.customer_key = d.customer_key
GROUP BY
    d.customer_key,
    d.first_name,
    d.last_name
ORDER BY orders_placed;

-- Complex but Flexibly Ranking Using Window Functions
SELECT * 
FROM
(
    SELECT
        d.product_name,
        FORMAT(SUM(f.sales_amount), 'C') AS total_revenue,
        ROW_NUMBER() OVER (ORDER BY SUM(f.sales_amount) DESC) AS product_rank
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products d
        ON f.product_key = d.product_key
    GROUP BY d.product_name
) t
WHERE product_rank <= 5;
