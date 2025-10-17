/*
===============================================================================
Performance Analysis (Year-over-Year, Month-over-Month)
===============================================================================
Purpose:
    - To measure the performance of products, customers, or regions over time.
    - For benchmarking and identifying high-performing entities.
    - To track yearly trends and growth.

SQL Functions Used:
    - LAG(): Accesses data from previous rows.
    - AVG() OVER(): Computes average values within partitions.
    - CASE: Defines conditional logic for trend analysis.
===============================================================================
*/

/* Analyze the yearly performance of products by comparing their sales 
to both the average sales performance of the product and the previous year's sales */
WITH yearly_product_sales AS (
SELECT
    YEAR(f.order_date) AS order_year,
    p.product_name,
    SUM(f.sales_amount) AS current_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON f.product_key = p.product_key
WHERE f.order_date IS NOT NULL
GROUP BY 
    YEAR(f.order_date), p.product_name
)
SELECT
    order_year,
    product_name,
    FORMAT(current_sales, 'C') AS current_sales,
    FORMAT(AVG(current_sales) OVER (PARTITION BY product_name), 'C') AS avg_sales,
    FORMAT(current_sales - AVG(current_sales) OVER (PARTITION BY product_name), 'C') AS diff_avg,
    CASE 
        WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) > 0 THEN 'Above Average'
        WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) < 0 THEN 'Below Average'
        ELSE 'Same as the average'
    END AS avg_change,
-- Year over year analysis
    FORMAT(LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year), 'C') AS previous_year_sales,
    FORMAT(current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year), 'C') AS diff_prev_year,
        CASE 
        WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) > 0 THEN 'Increase'
        WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) < 0 THEN 'Decrease'
        ELSE 'No change'
    END AS prev_year_change
FROM yearly_product_sales
ORDER BY product_name, order_year
