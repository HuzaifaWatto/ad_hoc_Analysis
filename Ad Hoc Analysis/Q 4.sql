SELECT 
    dp.segment,
    COUNT(DISTINCT CASE
		WHEN fs.fiscal_year = 2020 
        THEN fs.product_code END) 
        AS product_count_2020,
    COUNT(DISTINCT CASE 
    WHEN fs.fiscal_year = 2021 
    THEN fs.product_code END) 
    AS product_count_2021,
    COUNT(DISTINCT CASE 
    WHEN fs.fiscal_year = 2021 
    THEN fs.product_code END) - 
    COUNT(DISTINCT CASE 
    WHEN fs.fiscal_year = 2020 
    THEN fs.product_code END) 
    AS difference
FROM fact_sales_monthly fs
JOIN dim_product dp 
    ON fs.product_code = dp.product_code 
GROUP BY dp.segment
ORDER BY difference DESC;
