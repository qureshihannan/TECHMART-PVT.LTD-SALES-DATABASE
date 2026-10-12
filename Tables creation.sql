		# TECHMART PVT.LTD SALESDB 

create database SalesDB;
use SalesDB;

		# category

create table Category (
categoryID int ,
 category_name varchar(20));
 
 alter table Category add primary key (categoryID );
 
		# customers
 
 create table Customers (
 customerID int primary key,
 customer_name varchar(20),
 city varchar(20),
 phone varchar(15),
 email varchar(20)
 );
 
		# products
 
 create table products (
 productID int primary key ,
 product_name varchar(20),
 CategoryID int,
 price decimal(10,2),
 stock_quantity int ,
 foreign key (categoryID) references Category(categoryID)
 );
 
		# orders
 
 create table Orders (
 orderID int primary key,
 customerID int,
 order_date date,
 order_time time,
order_status varchar(20),
foreign key (customerID) references Customers(customerID)
 );
 
		# order details
 
 create table OrderDetails (
order_detail_id int primary key,
 orderID int,
 productID int,
 quantity int ,
 unit_price decimal ,
foreign key (orderID) references Orders(orderID),
foreign key (productID) references Products(productID)
 );
 
		# payments
 
 create table Payments (
paymentID int primary key auto_increment,
 orderID int,
 payment_date date,
 payment_method varchar(20),
 payment_amount decimal(10,2),
 payment_status varchar(20),
foreign key (orderID) references Orders(orderID)
);