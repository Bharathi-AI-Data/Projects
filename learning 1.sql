--database start:
create database myDB;
DROP DATABASE my DB;
alter database myDB read only = 1;
use database myDB;
--database end:

--tables start:
Create Table employees(
	employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    haourly_pay DECIMAL(4, 2),
    hire_date DATETIME
);

SELECT * FROM employees;
RENAME TABLE Workers TO employees;
DROP TABLE employees;

Alter table employees
add phone_number varchar(15);

Alter table employees
RENAME Column phone_number to email;

Alter table employees
Modify Column email varchar(50);

Alter table employees
Modify email varchar(50)
AFTER last_name;

Alter table employees
Modify email varchar(50)
FIRST;

Alter table employees
DROP column email;

drop table employees;

--table end:

Insert Into employees
Values (1, "Eugene", "Krabs", 25.50, "2023-01-02");

Insert Into employees
Values
	(2, "Sqidward", "Tentacles", 15.00, "2023-01-03"),
    (3, "Spongebob", "Squarepants", 12.50, "2023-01-04"),
    (4, "Patrick", "Star", 12.50, "2023-01-05"),
    (5, "Sandy", "Cheeks", 17.25, "2023-01-06");

select * from employees;

select * 
From employees
order by employee_id desc;

Insert Into employees (employee_id, first_name)
Values (6, "Sheldon");

Select *
from employees
where hourly_pay is not Null;

Update employees
Set hourly_pay = 10.25
where employee_id = 6; 

update employees
set last_name = "plankton", hire_date = "2023-01-07", hourly_pay = 10.50
where employee_id =6;

DELETE FROM employees
WHERE employee_id = 6;

--table end:

--AutoCommit, rollback Start:

SET autocommit = off;

commit;
rollback;

SET autocommit = On;

--AUTOCOMMIT, ROLLBACK END:

--Current_date(), Current_time(), NOW():
CREATE TABLE TEST(
		my_date DATE,
        my_time TIME,
        my_datetime DATETIME
);

select * from TEST;

INSERT INTO TEST
VALUES (current_date(), current_time(), now());

drop table TEST;

--END:

--Constraints( Unique, NOT Null, DEfault, Primary KEY):
--NOT NULL - Ensures that a column cannot have a NULL value
UNIQUE - Ensures that all values in a column are different
PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
FOREIGN KEY - Prevents actions that would destroy links between tables
CHECK - Ensures that the values in a column satisfies a specific condition
DEFAULT - Sets a default value for a column if no value is specified
CREATE INDEX - Used to create and retrieve data from the database very quickly--


CREATE TABLE products (
	product_id int,
    product_name Varchar(25) Unique,
    price decimal(4, 2)
    
);

alter table products
add constraint
unique(price);

alter table products
drop constraint
price;

Insert Into products 
values	(100, "hamburger", 3.99),
		(101, "fries", 1.89),
        (102, "soda", 1.00),
        (103, "ice cream", 1.49);

Alter table employees
add constraint check(hourly_pay >= 10.00);

select * from employees;

ALter table employees
drop check chk_name;

insert into employees
values  (1, "sbvf", "sdf", 9, now());

Alter table employees
drop constraint employees_chk_1;

delete from employees
where last_name = "sdf";

alter table employees
alter employee_id set default 0;

Alter Table tabl_name
ADD Constraint primary key(column_name);

--constraints END:

--auto increment

Create Table transaction(
	id int primary key auto_increment,
    amount int8
    );

alter table transaction
auto_increment = 1000;

--END:

--foriegn_Key_start

Create table transactions (
		transaction_id Int primary Key Auto_increment,
        amount decimal(5, 2)
);
select * from transactions;

INsert into transactions(amount)
values (4.99);
select * from transactions;

delete from transactions;

Create table customers (
	customer_id Int Primary key Auto_increment,
    first_name Varchar(50),
    last_name Varchar(50)
);

Insert Into customers (first_name, last_name)
Values  ("Fred","Fish"),
		("Larry","Lobster"),
        ("Bubble","Bass");
select * From customers;

drop table transactions;
Create table transactions (
	transaction_id int Primary key Auto_increment,
    amount decimal(5, 2),
    customer_id INT
);

alter table transactions
add foreign key(customer_id) references customers(customer_id);

Alter Table transactions
auto_increment = 1000;

insert into transactions (amount, customer_id)
values (4.99,3),
		(2.89, 2),
        (3.38, 3),
        (4.99, 1);
select *from transactions;

delete from customers
where customer_id = 3;

Insert into customers (first_name, last_name)
values ("poppy", "puff");

--joins:

--inner_join

Select * 
from transactions inner join customers
On transactions.customer_id = customers.customer_id
order by transaction_id;

Select * 
from transactions left join customers
On transactions.customer_id = customers.customer_id
order by transaction_id;


Select * 
from transactions as t  right join customers as c
On t.customer_id = c.customer_id
order by transaction_id;

Select * 
from transactions full join customers
On transactions.customer_id = customers.customer_id
order by transaction_id;

-- cross join, natural join, self join
rename table transactionsss to transactions;

--END
--Functions(count, max, min, avg, sum)
--Logical_operator(and, or, Between, In, Not)

--WildCard(a%, %a, %a%, _ook, _oo_, )

select * from employees
where first_name like "%a";
-- END

-- union(remove duplicates), Union ALL(includes duplicates) operator combines two or more select statements:
select first_name from employees
union
select product_name from products ;

select first_name from employees
union all
select product_name from products ;
-- END
-- self joins
Select * from customers;
 alter table customers
 add column refferal_id int after last_name;

update customers
Set refferal_id = Null
where customer_id = 1 ;
select * from Customers;
-- example 1
select a.customer_id, a.first_name, a.last_name,
		concat(b.first_name," ",b.last_name) as "reffered_by"
from customers as a
inner join customers as b
On a.refferal_id = b.customer_id;
-- example 2
 select a.employee_id, concat(a.first_name," ",a.last_name) as Employee_name, concat(b.first_name," ", b.last_name)as report_to 
 from employees as a
 inner join employees as b
 on a.supervisor_id = b.employee_id
 order by a. employee_id;
 
 select *
 from employees as a
 inner join employees as b
 on a.employee_id = b.supervisor_id
 order by a. employee_id;

-- END
-- Views ( NOT a Real Table, But can interacted with it as a real one, 
-- it is not stored any where and updates automatically because it executes set of query each time we view it.
/* changes in structure of tabele will not refelects on existing view only values get updated */
create or replace view insd_nsdj as
select * from employees;

create User 'bharathi'@'localhost' identified by 'bharathi';
grant select on employees to bharathi;
drop user bharathi@localhost;

-- index(BTree Data structure)
-- indexes are used to find values witin a specific column more quickly
-- My SQL normally searches sequentially through the column
-- the longer the column, the more expensive the poeration is
-- update takes more time, SElect take less time.

select * from customers;
show indexes from customers;

Create index last_name_idx
on customers(last_name);

create index last_first_name_idx
on customers(last_name, first_name); -- left most column checked 1st.

show indexes from customers;

alter table customers
drop index last_name_idx;
-- indexes end:

-- Subquery
-- a query within the main query

select * from employees;

-- example 1:
select	first_name, last_name, hourly_pay, 
		(select avg(hourly_pay) from employees) AS avg_pay
from employees;

-- example 2:
select	first_name, last_name, hourly_pay
from employees
where hourly_pay > (select avg(hourly_pay) from employees);

-- END
-- Group BY
-- often used with aggregate functions such as sum(), MAX(), Min(), AVG(), Count()
update transactions
set transaction_id = 1004
where transaction_id = 5;

select * from transactions;

Update transactions
set order_date = '2023-01-02'
where transaction_id = 1003;

insert into transactions
values	(1004, 1.00, null, '2023-01-03'),
		(1005, 2.49, 4, '2023-01-03'),
        (1006, 5.48, null, '2023-01-03');

select sum(amount) as total_amt, order_date
from transactions
group by order_date
having sum(amount)>5;

select count(amount) as total_amt, customer_id
from transactions
group by customer_id
having customer_id is not null;

-- ROllUP, extension of the group By clause
-- products another row and shows the grand total (super-aggregate value)
-- not work with having

select * from transactions;

select count(amount) as total_amt, customer_id
from transactions
group by customer_id with rollup;

-- END:
-- On DELETE SET Null = When a FK is deleted, replace FK with Null
-- ON DELETE CASCADE = when a Fk is Deleted, delete the row

Delete from customers
where customer_id = 5;

select * from customers;

ALTER TABLE transactions
ADD constraint fk_customer_id
foreign key(cutomer_id) References Customers(customer_id)
On delete set null;


ALTER TABLE transactions
ADD constraint fk_customer_id
foreign key(customer_id) References Customers(customer_id)
On delete cascade;

-- Stored Procedures = is prepared SQL code that you can save.
-- great if there's query that you write often
-- reduce network traffic
-- increase performance
-- secure, admin can grant permission to use
-- increase memory usage of every connection

-- EX 1
DELIMITER //
CREATE PROCEDURE get_customers()
BEGIN
    SELECT * FROM customers;
END //
DELIMITER ;

call get_customers;

-- EX 2
DELIMITER $$
Create Procedure find_customer(IN id INT)
BEGIN
	Select * from customers where customer_id = id;
END $$
DELIMITER ;

Call find_customer(1);
Call find_customer(2);
Call find_customer(3);
Call find_customer(4);

drop procedure find_customer;
-- EX 3

DELIMITER &&
CREATE PROCEDURE find_customer	(IN f_name varchar(50),
								In l_name VARCHAR(50))
BEGIN
	SELECT * FROM customers
    where first_name = f_name AND last_name = l_name;
END &&
DELIMITER ;

Call find_customer('Larry', 'Lobster');
-- END:

-- triggers =	when an event happens, do something
--	ex. (INSERT, UPDATE, DELETE)
--	checks data, handers error, auditing tables.

select * from employees;

create database joins;
use joins;

create table visits(visit_id int, customer_id int2);
select * from visits;

insert into visits
values (1, 23),
		(2, 9),
        (4, 30),
        (5, 54),
        (6, 96),
        (7, 54),
        (8, 54);
        
Create table transactions(transaction_id int, visit_id int, amount float);

insert into transactions
values (2, 5, 310),
		(3, 5, 300),
        (9, 5, 200),
        (12, 1, 910),
        (13, 2, 970);
select * from transactions;

select customer_id, count(customer_id) as no_trans
from visits
where visit_id not in (select visit_id from transactions)
group by customer_id
order by no_trans desc;

select v.customer_id, count(v.customer_id) as no_trans
from visits as v
left join transactions as t on v.visit_id = t.visit_id
where t.transaction_id is null 
group by v.customer_id
having no_trans is not null;

show engines;
use sys;
select * from sys_config;
show triggers;


create database tet;
use tet;
create table emp(id int, name varchar(20), mng int , salary float);

insert into emp
values (3, "brad", null, 4000),
		(1, "john", 3, 1000),
        (2, "Dan", 3, 2000),
        (4, "thomas", 3, 4000);
select * from bonus;

select a.name, b.bonus
from emp a
left join bonus b on a.id = b.id
where bonus < 1000 or bonus is null;

