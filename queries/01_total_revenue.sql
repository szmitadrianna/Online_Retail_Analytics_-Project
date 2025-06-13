SELECT * FROM order_details LIMIT 1000;

SELECT SUM(quantity * unit_price_gross) AS Total_revenue
FROM order_details;
