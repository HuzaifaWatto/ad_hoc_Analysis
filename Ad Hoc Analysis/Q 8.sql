SELECT
EXTRACT(QUARTER FROM sm.date) AS QUARTER,
SUM(sold_quantity) AS total_sold_quantity
FROM fact_sales_monthly sm
WHERE EXTRACT(YEAR FROM sm.date) = 2020
GROUP BY QUARTER
ORDER BY QUARTER 