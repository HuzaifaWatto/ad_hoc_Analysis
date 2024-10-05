SELECT *
FROM dim_customer;
SELECT *
FROM fact_gross_price;
SELECT *
FROM fact_sales_monthly;
SELECT 
    dc.channel, 
    ROUND(SUM(fgp.gross_price * fsm.sold_quantity) / 
    1000000, 2) AS gross_sales_mln,
    ROUND((SUM(fgp.gross_price * fsm.sold_quantity) / 
          (SELECT SUM(fgp.gross_price * fsm.sold_quantity)
           FROM fact_sales_monthly fsm
           JOIN fact_gross_price fgp
           ON fsm.product_code = fgp.product_code
           WHERE fsm.fiscal_year = 2021) * 100), 2) AS percentage
FROM fact_sales_monthly fsm
JOIN dim_customer dc
    ON fsm.customer_code = dc.customer_code
JOIN fact_gross_price fgp
    ON fsm.product_code = fgp.product_code
WHERE fsm.fiscal_year = 2021
GROUP BY dc.channel
ORDER BY gross_sales_mln DESC;

