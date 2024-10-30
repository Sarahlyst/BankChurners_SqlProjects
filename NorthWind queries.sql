CREATE DATABASE North_Wind;
use North_Wind;
-- Select all data from the categories table.
select * from categories_north;

 -- Create a report that shows the category name and description from the categories table, sorted by category name.
 select categoryname, description
 from categories_north order by categoryname;
 
 -- Create a report that shows the contact name, company name, contact title, and phone number from the customers table, sorted by phone.
 select contactname, companyname, contacttitle, phone
 from customer_north order by phone;
 
--  Create a report that shows the capitalized first name and last name renamed as firstname and lastname, respectively, and hiredate from the employees table, sorted from newest to oldest employees.
select upper(firstname), upper(lastname), hiredate
from employees_north order by hiredate desc;

-- Create a report that shows the top 10 orderid, orderdate, shippeddate, customerid, and freight from the orders table, sorted by freight in descending order.
select orderid, orderdate, shippeddate, customerid, freight
from orders_north order by freight desc;

-- Create a report that shows all the customer IDs in lowercase and renamed as "ID" from the customers table.
select lower(customerid) as ID from customer_north;

-- Create a report that shows the company name, fax, phone, country, and homepage from the suppliers table, sorted by the country in descending order, then by company name in ascending order.
select companyname, fax, phone, country, homepage 
from suppliers_north order by companyname;

-- Create a report that shows the company name and contact name of all customers with the name 'cactus'."
select companyname, contactname from customer_north 
where companyname like "%cactus%";

-- Create a report showing product name, unit price, quantity per unit, and units in stock for products that are out of stock
select productname, unitprice, quantityperunit, unitsinstock 
from products_north where unitsinstock < 1;

 -- Create a report showing the contact name, address, and city of all customers not from Germany, Mexico, or Spain.
 select contactname, address, city from customer_north
 where city not in ('Germany', 'mexico', 'spain');
 
 -- Create a report showing order date, shipped date, customer ID, and freight of all orders placed on May 21, 1996.
 select orderdate, shippeddate, customerID, freight
 from orders_north where orderdate = '1996-05-21 00:00:00'; 
 
 -- Create a report showing the first name, last name, and country of employees not from the United States.
 select firstname, lastname, country from employees_north
 where country not in ('usa');
 
-- Create a report that shows the employee ID, order ID, customer ID, required date, and shipped date from all orders shipped later than required.
select employeeID, orderID, customerID, requireddate, shippeddate
from orders_north where shippeddate > requireddate;

-- Create a report that shows the city, company name, and contact name of customers from cities starting with the letter "A" or "B."
select city, companyname, contactname
from customer_north where city like 'a%' or 'b%';

 -- Create a report showing all the even numbers of order IDs from the orders table.
 select orderid from orders_north where orderid %2 = 0;
 
 -- Create a report showing all the odd numbers of order IDs from the orders table.
 select orderid from orders_north where orderid %2 = 1;
 
 -- Create a report that shows all the orders where the freight cost is more than 500 dollars.
 select * from orders_north where freight > 500;
 
 -- Create a report that shows the product name, units in stock, units on order, and reorder level of all products that are up for reorder
 select productname, unitsinstock, unitsonorder, reorderlevel
 from products_north where reorderlevel > 1;
 
-- Create a report that shows the company name and contact name of all customers that do not have a fax number.
select companyname, contactname
from customer_north where fax is null;

-- Create a report that shows the first name and last name of all employees that do not report to anybody.
select firstname, lastname from employees_north
where reportsto is null;

-- Create a report showing all the odd numbers of order IDs from the orders table.
select orderid from orders_north where orderid %2 = 1;

-- Create a report that shows the company name, contact name, and fax of all customers that do not have a fax number, sorted by contact name.
select companyname, contactname, fax
from customer_north where fax is null
order by contactname;

-- Create a report that shows the city, company name, and contact name of customers from cities that have the letter "L" in the name, sorted by contact name.
select city, companyname, contactname from customer_north 
where city like '%l%' order by contactname;

-- Create a report that shows the first name, last name, and birthdate of employees born in 1950.
select firstname, lastname, birthdate from employees_north
where birthdate = year(1950);

-- Create a report that shows the first name, last name, and the year of birthdate as "birthyear" from the employees table
select firstname, lastname, year(birthdate) as "birthyear" from employees_north;

-- Create a report showing order ID and the total number of order IDs as "number of orders" from the order details table, grouped by order ID and sorted by the number of orders in descending order.
select orderid, count(orderid) as no_of_orders from orderdetails_north
group by orderid order by no_of_orders;

-- Create a report that shows the supplier ID, product name, and company name of products supplied by Exotic Liquids, Specialty Biscuits Ltd., and Escargots Nouveaux, sorted by supplier ID.
select suppliers_north.supplierid, products_north.productname, suppliers_north.companyname
from suppliers_north
join products_north
on suppliers_north.supplierid = products_north.supplierid
where suppliers_north.companyname in ('exotic liquids', 'specialty biscuits ltd', 'escargots nouveaux')
order by supplierid;

-- Create a report that shows the ship postal code, order ID, order date, required date, and shipped date of all orders with a ship postal code beginning with "98124."
select shippostalcode, orderID, orderdate, requireddate, shippeddate 
from  orders_north where shippostalcode like '98124%';

-- Create a report that shows the contact name, contact title, and company name of customers that do not have "sales" in their contact title.
select contactname, contacttitle, companyname
from suppliers_north where contacttitle not like ('%sales%');

-- Create a report that shows the last name, first name, and city of all employees in cities other than Seattle.
select lastname, firstname, city from employees_north 
where city not in ('seattle');

-- Create a report that shows the company name, contact title, city, and country of all customers in any city in Mexico or other cities in Spain other than Madrid.
select companyname, contacttitle, city, country
from customer_north where city in ('mexico') or ('spain') not in ('madrid');

-- Create a report that shows the contact name of all customers that do not have the letter "A" as the second letter in their contact name.
select contactname from customer_north
where contactname not in ('%_a');

-- Create a report that shows the average unit price rounded to the nearest whole number, total price of units in stock and the maximum number of orders from the product table. Save them as average price, total stock, and max order, respectively.
 select round(avg(unitprice)) as average_price, unitsinstock*unitprice as total_stock, unitsonorder as max_order
 from products_north 
 group by total_stock, max_order order by max_order desc;
 
-- Create a report that shows the supplier ID, company name, category name, product name, and unit price from the products, suppliers, and categories table.
select suppliers_north.supplierid, suppliers_north.companyname, categories_north.categoryname, 
products_north.productname, products_north.unitprice
from suppliers_north
join products_north on suppliers_north.supplierid = products_north.supplierid
join categories_north on products_north.categoryid = categories_north.categoryid;

-- Create a report that shows the customer ID and sum of freight from the orders table with a sum of freight greater than 200 dollars, grouped by customer ID.
select customerid, sum(freight) as sum_of_freight
from orders_north
group by customerid
having sum_of_freight > 200;

-- Create a report that shows the order ID, contact name, unit price, quantity, and discount from the order details, orders, and customer table, with discounts given on every purchase
select orders_north.orderid, customer_north.contactname, orderdetails_north.unitprice,
orderdetails_north.quantity, orderdetails_north.discount
from orderdetails_north join orders_north
on orderdetails_north.orderid = orders_north.orderid
join customer_north on customer_north.customerid = orders_north.customerid;

-- Create a report that shows the employee ID, last name, first name as "employee," and the last name and first name of the person they report to as "manager" from the employees table, sorted by  employee.
select concat(employeeid,' ',lastname,' ',firstname) as employee, reportsto as manager
from employees_north order by employee;

-- Create a report that shows the average, minimum, and maximum unit price of all products as average price, minimum price, and maximum price, respectively.
select avg(unitprice) as average_price, min(unitprice) as minimum_price, max(unitprice) as maximum_price
from orderdetails_north;

-- Create a view named "customerinfo" that shows the customer ID, company name, contact name, contact title, address, city, country, phone, order date, required date, and shipped date from the customers and orders table.
create table customerinfo as
select customer_north.customerid, customer_north.companyname, customer_north.contactname, customer_north.contacttitle,
customer_north.address, customer_north.city, customer_north.country, customer_north.phone, orders_north.orderdate,
orders_north.requireddate, orders_north.shippeddate from customer_north join orders_north 
on customer_north.customerid = orders_north.customerid;

-- Change the name of the view from "customerinfo" to "customerdetails. 
rename table customerinfo to customerdetails