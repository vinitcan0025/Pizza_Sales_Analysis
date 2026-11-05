use pizza_db;
SELECT 
    COUNT(*)
FROM
    pizza_sales;


SELECT 
    SUM(total_price) AS Total_Revenue
FROM
    pizza_sales;

SELECT 
    SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value
FROM
    pizza_sales;


SELECT 
    SUM(quantity) AS Total_Pizza_Sold
FROM
    pizza_sales;


SELECT 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM
    pizza_sales;


SELECT 
    CAST((SUM(quantity) / COUNT(DISTINCT order_id))
        AS DECIMAL (10 , 2 )) AS Avg_pizzas_per_order
FROM
    pizza_sales;


SELECT 
    DAYNAME(order_date) AS order_day,
    COUNT(DISTINCT order_id) AS Total_orders
FROM
    pizza_sales
GROUP BY DAYNAME(order_date);


SELECT 
    HOUR(order_time) AS order_hours,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM
    pizza_sales
GROUP BY HOUR(order_time)
ORDER BY HOUR(order_time);


SELECT 
    pizza_category,
    SUM(total_price) as Total_Sales,
    SUM(total_price) * 100 / (SELECT 
            SUM(total_price)
        FROM
            pizza_sales) AS PCT
FROM
    pizza_sales
Where month(order_date) = 1
GROUP BY pizza_category;


SELECT 
    pizza_size,
    cast(SUM(total_price) as Decimal(10,2)) as Total_Sales,
    cast(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales where quarter(order_date)=1) as decimal(10,2)) AS PCT
FROM
    pizza_sales
where quarter(order_date)=1
GROUP BY pizza_size
order by pct desc;


SELECT 
    pizza_name, SUM(quantity) AS Total_Pizzas_Sold
FROM
    pizza_sales
where month(order_date) = 8
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC;











