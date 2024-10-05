SELECT *
FROM fact_manufacturing_cost;
(SELECT 
dp.product_code,
dp.product,
cost.manufacturing_cost
FROM fact_manufacturing_cost cost
JOIN dim_product as dp
ON dp.product_code = cost.product_code
ORDER BY manufacturing_cost DESC
LIMIT 1
)
UNION ALL
(SELECT 
dp.product_code,
dp.product,
cost.manufacturing_cost
FROM fact_manufacturing_cost cost
JOIN dim_product as dp
ON dp.product_code = cost.product_code
ORDER BY manufacturing_cost ASC
LIMIT 1
)
