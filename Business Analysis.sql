		# Business_Analysis
        
use salesdb;

# 1. Who are the top 5 customers by revenue?

select c.customerID , c.customer_name , 
sum(od.quantity * od.unit_price) as total_revenue
from customers c 
join orders o 
on c.customerID = o.customerID
join orderdetails od
on o.orderID = od.orderID 
group by c.customerID , c.customer_name
order by total_revenue 
limit 5;

# 2. Which category generates the highest revenue?

select c.categoryID , c.category_name , 
sum(od.quantity * od.unit_price) as total_revenue
from category c 
join Products p
on c.categoryID = p.CategoryID
join OrderDetails od
on p.productID = od.productID
group by c.categoryID , c.category_name
order by total_revenue desc
limit 1;

# 3. Which are the top 5 best-selling products by quantity?

select p.productID , p.product_name,
SUM(od.quantity) AS total_quantity_sold
from Products p
inner join OrderDetails od
ON p.productID = od.productID
group BY p.productID , p.product_name
order BY total_quantity_sold DESC
limit 5;

# 4. What are the top 5 highest-value orders?

select o.orderID, o.order_date,
SUM(od.quantity * od.unit_price) AS order_value
from Orders o
join OrderDetails od
ON o.orderID = od.orderID
GROUP BY o.orderID, o.order_date
ORDER BY order_value DESC
LIMIT 5;

# 5. Which customers are repeat customers?

select c.customerID, c.customer_name,
COUNT(o.orderID) AS total_orders
FROM Customers c
INNER JOIN Orders o
ON c.customerID = o.customerID
GROUP BY c.customerID, c.customer_name
HAVING COUNT(o.orderID) > 1
ORDER BY total_orders DESC;

# 6. What is the monthly revenue?

select year(o.order_date) AS order_year,
month(o.order_date) AS order_month,
SUM(od.quantity * od.unit_price) AS monthly_revenue
from Orders o
INNER JOIN OrderDetails od
ON o.orderID = od.orderID
GROUP BY YEAR(o.order_date), MONTH(o.order_date)
ORDER BY order_year, order_month;

# 7. Which payment method is used the most?

select payment_method,
COUNT(*) AS total_transactions
FROM Payments
GROUP BY payment_method
ORDER BY total_transactions DESC;

# 8. Which customers have spent more than ₹1,00,000?

select c.customerID, c.customer_name,
SUM(od.quantity * od.unit_price) AS total_spent
FROM Customers c
INNER JOIN Orders o
ON c.customerID = o.customerID
INNER JOIN OrderDetails od
ON o.orderID = od.orderID
GROUP BY c.customerID,c.customer_name
HAVING SUM(od.quantity * od.unit_price) > 100000
ORDER BY total_spent DESC;
