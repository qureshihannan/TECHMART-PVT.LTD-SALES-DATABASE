		# Views 
        
        use salesdb;
        
# 1. Customer Revenue View

# Can we create a reusable table-like result showing each customer's total revenue?

CREATE VIEW customer_revenue_view AS
select c.customerID , c.customer_name , c.city,
SUM(od.quantity * od.unit_price) AS total_revenue
from Customers c
inner join Orders o
on c.customerID = o.customerID
inner join OrderDetails od
on o.orderID = od.orderID
group by c.customerID, c.customer_name, c.city;

select * from customer_revenue_view
order by total_revenue DESC;

# 2. Product Performance View

# Can we create a reusable view showing product sales performance?

CREATE VIEW product_performance_view AS
SELECT p.productID, p.product_name, c.category_name,
sUM(od.quantity) AS total_quantity_sold,
SUM(od.quantity * od.unit_price) AS total_revenue
from Products p
inner join Category c
on p.CategoryID = c.categoryID
inner join OrderDetails od
on p.productID = od.productID
GROUP BY p.productID, p.product_name, c.category_name;

select * from product_performance_view
order by total_revenue DESC;

# 3. Order Payment View

CREATE VIEW order_payment_view AS
select o.orderID, o.order_date, c.customer_name,pay.payment_method,
pay.payment_amount,pay.payment_status
from Orders o
inner join Customers c
on o.customerID = c.customerID
inner join Payments pay
on o.orderID = pay.orderID;

select * from order_payment_view;