SELECT * 
FROM dim_customer 
WHERE customer = 'croma';
SELECT s.fiscal_year,
ROUND(SUM(g.gross_price * s.sold_quantity)/1000000,2) as yearly_gross_sales
FROM fact_sales_monthly as s
JOIN fact_gross_price as g
ON g.fiscal_year = s.fiscal_year AND g.product_code = s.product_code
WHERE customer_code = 90002002
GROUP BY fiscal_year
ORDER BY fiscal_year;

SELECT fiscal_year,
COUNT(DISTINCT product_code) as unique_product
FROM fact_sales_monthly
GROUP BY fiscal_year;
