SELECT *
FROM dim_customer;
SELECT *
FROM fact_sales_monthly;
SELECT *
FROM fact_gross_price;
SELECT
EXTRACT(MONTH FROM sm.date) AS MONTH,
EXTRACT(YEAR FROM sm.date) AS YEAR,
ROUND(SUM(gp.gross_price * sm.sold_quantity), 2) AS gross_sales_amount
FROM fact_sales_monthly sm
JOIN fact_gross_price gp
ON sm.product_code = gp.product_code AND sm.fiscal_year = gp.fiscal_year
WHERE sm.customer_code = 90002002
GROUP BY EXTRACT(MONTH FROM sm.date), EXTRACT(YEAR FROM sm.date)
ORDER BY year,month;
