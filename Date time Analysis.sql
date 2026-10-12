		# DATE TIME ANALYSIS 
        
# 1. What is the earliest and latest order date?

select
    MIN(order_date) AS First_Order_Date,
    MAX(order_date) AS Latest_Order_Date
from Orders;

# 2. How many orders were placed each month?

select MONTH(order_date) as Order_Month,
    COUNT(*) as Total_Orders from Orders
GROUP BY MONTH(order_date)
ORDER By Order_Month;

# 3. Which month generated the highest number of orders?

select MONTHNAME(order_date) AS Month_Name,
    COUNT(*) as Total_Orders from Orders
GROUP BY MONTH(order_date) , MONTHNAME(order_date)
ORDER BY Total_Orders DESC
LIMIT 1;

