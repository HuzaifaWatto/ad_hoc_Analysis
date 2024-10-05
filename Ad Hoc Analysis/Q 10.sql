WITH ranked_products AS (
SELECT 
dp.product_code,
dp.product,
dp.division,
SUM(fsm.sold_quantity) AS total_sold_quantity,
ROW_NUMBER() 
OVER (PARTITION BY dp.division 
	  ORDER BY SUM(fsm.sold_quantity) DESC) AS rn
FROM dim_product dp
JOIN fact_sales_monthly fsm
ON dp.product_code = fsm.product_code
WHERE fsm.fiscal_year = 2021
GROUP BY 
dp.division,
dp.product_code,
dp.product
)
SELECT 
division,
product_code,
product,
total_sold_quantity,
rn AS rank_order
FROM ranked_products
WHERE rn <= 3
ORDER BY division, total_sold_quantity DESC;
