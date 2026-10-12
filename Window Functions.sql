		# Window Functions 

# Can we assign a unique sequential number to every order?

select orderID , customerID , order_date,
row_number() over (order by order_date) as row_num
from Orders;

# Can we rank orders based on their order ID?

select orderID , customerID , order_date ,
rank() over(order by orderID ) as order_rank
from orders; 

# Previous Order Using LAG()

# Can we see the previous order ID for every order?

select orderID , customerID , order_date,
lag(orderID) over (order by order_date) as previous_order
from Orders;

#  Next Order Using LEAD()

# Can we see the next order ID for every order?

select orderID , customerID , order_date,
lead(orderID) over (order by order_date) as next_order
from Orders;

# What is the sequence of orders placed by each customer?

select orderID , customerID , order_date,
row_number() OVER (partition by customerID order by order_date) as customer_order_number
from Orders
order by customerID, order_date;

# Which customers generate the highest revenue?

select c.customerID , c.customer_name,
SUM(od.quantity * od.unit_price) AS total_revenue,
rank() over (order by SUM(od.quantity * od.unit_price) desc) as revenue_rank
from Customers c
inner join Orders o
on c.customerID = o.customerID
inner join OrderDetails od
ON o.orderID = od.orderID
group by c.customerID , c.customer_name
order by revenue_rank;