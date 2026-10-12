		# SUB QUERY 
use salesdb;

# 1. Which products have a price higher than the average product price? 

select productID , product_name , price from products where price > (
select avg(price) from products )
order by price desc;

# 2. Which product has the highest price?

select productID , product_name , price from products where price = (
select max(price) from products);

# 3. Which customers have never placed an order?

select customerID , customer_name , city from customers where customerID not in (
select customerID from orders );

# 4. Which customers have placed more orders than the average number of orders per customer?

select c.customerID , c.customer_name,
COUNT(o.orderID) AS total_orders
from Customers c
inner join Orders o
on c.customerID = o.customerID
group by c.customerID , c.customer_name
having COUNT(o.orderID) > (
    select AVG(order_count)
    from (
        select COUNT(orderID) AS order_count
        from Orders
        group by customerID
    ) as customer_orders
)
order by total_orders DESC;