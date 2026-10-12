		#  KPI's

use salesdb;
#	Total Revenue
#	Total Orders
#	Total Customers
#	Total Products Sold
#	Average Order Value
#	Average Product Price
#	Total Payment Amount
#	Successful Payment Rate

# 1 Total_Revenue 

#	Revenue = SUM(quantity × unit_price) from OrderDetails

SELECT SUM(quantity * unit_price) AS Total_Revenue
FROM OrderDetails;

# 2 Total_Orders

SELECT COUNT(DISTINCT orderID) AS Total_Orders
FROM Orders;

# 3 Total_Customers

select count(customerID) as Total_customers
from customers;

# 4 Total_Products_sold

select sum(quantity) as Total_Products_sold
from orderdetails;

# 5 Average_order_value

SELECT SUM(quantity * unit_price) / 
COUNT(DISTINCT orderID) AS Average_Order_Value
FROM OrderDetails;

# 6 Average_product_price

select avg(price) AS Average_Product_Price
from products;

# 7 Total Payment Amount

select sum(payment_amount) as Total_Payment_Amount
from payments;

# 8 Successful Payment Rate

SELECT
    COUNT(CASE WHEN payment_status = 'Paid' THEN 1 END) * 100.0
    / COUNT(*) AS Successful_Payment_Rate
FROM Payments;
