SELECT * 
FROM fact_pre_invoice_deductions;
SELECT * 
FROM dim_customer;
SELECT 
dc.customer_code,
dc.customer,
ROUND(AVG(ind.pre_invoice_discount_pct),4) AS average_discount_percentage
FROM fact_pre_invoice_deductions ind
JOIN dim_customer dc
ON ind.customer_code = dc.customer_code
WHERE fiscal_year = 2021 AND dc.market = 'india'
GROUP BY 
dc.customer_code, 
dc.customer
ORDER BY average_discount_percentage DESC
LIMIT 5

