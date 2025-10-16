/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - To explore the structure of dimension tables.
    - Identify the unique values (or categories) in each dimension.
    - Recognizing how data might be grouped or segmented, which is useful for 
      later analysis.
	
SQL Functions Used:
    - DISTINCT [dimension]
    - ORDER BY
===============================================================================
*/

-- Retrieve a list of unique countries from which customers originate
SELECT
    DISTINCT country
FROM gold.dim_customers
ORDER BY country;


-- Retrieve a list of unique categories, subcategories, and products
SELECT DISTINCT
    category,
    subcategory,
    product_name
FROM gold.dim_products
GROUP BY category, subcategory, product_name;
