		# inserting data 
        
        # category
        
insert into Category
(categoryID,category_name) values 
(1,"laptops"),
(2,"smartphones"),
(3,"Accessories"),
(4,"smart_devices"),
(5,"home_electronics");

select * from category;

		# customers
        
insert into Customers 
(customerID,customer_name,city,phone,email) values
(101,"Rohan","mumbai","9898989898","rohan@gmail.com"),
(102,"saniya","pune","9898989897","saniya@gmail.com"),
(103,"Raj","Indore","9898989896","raj@gmail.com"),
(104,"aman","delhi","9898989895","aman@gmail.com"),
(105,"Rahul","nagpur","9898989894","rahul@gmail.com");

select * from customers;

		# products
        
INSERT INTO Products
(productID, product_name, CategoryID, price, stock_quantity)
VALUES
(201, 'Dell Laptop', 1, 55000, 20),
(202, 'HP Laptop', 1, 60000, 15),
(203, 'Samsung Phone', 2, 25000, 30),
(204, 'iPhone', 2, 70000, 10),
(205, 'Wireless Mouse', 3, 1200, 50),
(206, 'Keyboard', 3, 1800, 40),
(207, 'Smart Watch', 4, 5000, 25),
(208, 'Smart Speaker', 4, 4000, 20),
(209, 'LED TV', 5, 45000, 12),
(210, 'Air Conditioner', 5, 55000, 8);

select * from products;

		# orders
        
INSERT INTO Orders
(orderID, customerID, order_date, order_time, order_status)
VALUES
(301, 101, '2026-01-05', '10:30:00', 'Delivered'),
(302, 102, '2026-01-08', '14:15:00', 'Delivered'),
(303, 103, '2026-01-12', '11:45:00', 'Pending'),
(304, 104, '2026-01-18', '16:20:00', 'Delivered'),
(305, 105, '2026-02-02', '09:30:00', 'Cancelled'),
(306, 101, '2026-02-10', '13:10:00', 'Delivered'),
(307, 102, '2026-02-15', '17:45:00', 'Pending'),
(308, 103, '2026-02-20', '12:00:00', 'Delivered'),
(309, 104, '2026-03-03', '15:30:00', 'Cancelled'),
(310, 105, '2026-03-10', '18:15:00', 'Delivered');

select * from orders;

		# orderdetails
        
INSERT INTO OrderDetails
(order_detail_id, orderID, productID, quantity, unit_price)
VALUES
(401, 301, 201, 1, 55000),
(402, 301, 205, 2, 1200),
(403, 302, 203, 1, 25000),
(404, 303, 207, 1, 5000),
(405, 304, 209, 1, 45000),
(406, 305, 206, 1, 1800),
(407, 306, 202, 1, 60000),
(408, 306, 205, 1, 1200),
(409, 307, 204, 1, 70000),
(410, 308, 208, 2, 4000),
(411, 309, 210, 1, 55000),
(412, 310, 203, 2, 25000);
        
select * from orderdetails;

		# payments
        
INSERT INTO Payments
(orderID, payment_date, payment_method, payment_amount, payment_status)
VALUES
(301, '2026-01-15', 'UPI', 55000, 'Paid'),
(302, '2026-01-20', 'Credit Card', 75000, 'Paid'),
(303, '2026-01-28', 'Debit Card', 35000, 'Paid'),
(304, '2026-02-05', 'UPI', 12000, 'Paid'),
(305, '2026-02-12', 'Cash', 45000, 'Paid'),
(306, '2026-02-15', 'Credit Card', 85000, 'Pending'),
(307, '2026-02-18', 'UPI', 25000, 'Paid'),
(308, '2026-02-20', 'Debit Card', 4000, 'Paid'),
(309, '2026-03-03', 'Credit Card', 55000, 'Failed'),
(310, '2026-03-10', 'UPI', 25000, 'Paid');
        
select * from payments;

