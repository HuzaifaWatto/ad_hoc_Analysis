WITH product_counts AS (
    SELECT 
        fiscal_year,
        COUNT(DISTINCT product_code) AS unique_products
    FROM fact_sales_monthly
    WHERE fiscal_year IN (2020, 2021)
    GROUP BY fiscal_year
)
SELECT 
    MAX(CASE WHEN fiscal_year = 2020 THEN unique_products END) AS unique_products_2020,
    MAX(CASE WHEN fiscal_year = 2021 THEN unique_products END) AS unique_products_2021,
    ROUND(
        (MAX(CASE WHEN fiscal_year = 2021 THEN unique_products END) - 
         MAX(CASE WHEN fiscal_year = 2020 THEN unique_products END)) * 100.0 /
         MAX(CASE WHEN fiscal_year = 2020 THEN unique_products END), 
        2
    ) AS percentage_chg
FROM product_counts;
