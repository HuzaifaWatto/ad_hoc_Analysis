SELECT *
FROM dim_product;
SELECT segment,
COUNT(DISTINCT product_code) AS product_counts
FROM dim_product
GROUP BY segment
ORDER BY product_counts DESC