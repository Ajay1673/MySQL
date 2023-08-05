-- create table College(code varchar(10) primary key,name varchar(40),address varchar(100),phone varchar(10));

-- CREATE TABLE IF NOT EXISTS `sq`.`Employees` (
--   `employeeNumber` INT(11) NOT NULL,
--   `lastName` VARCHAR(50) NOT NULL,
--   `firstName` VARCHAR(50) NOT NULL,
--   `extension` VARCHAR(10) NOT NULL,
--   `email` VARCHAR(100) NOT NULL,
--   `reportsTo` INT(11) NULL,
--   `jobTitle` VARCHAR(50) NOT NULL,
--   `officeCode` VARCHAR(10) NOT NULL,
--   PRIMARY KEY (`employeeNumber`),
--   INDEX `fk_Employees_Employees_idx` (`reportsTo` ASC),
--   INDEX `fk_Employees_Offices_idx` (`officeCode` ASC),
--   CONSTRAINT `fk_Employees_Employees`
--     FOREIGN KEY (`reportsTo`)
--     REFERENCES `ClassicModels`.`Employees` (`employeeNumber`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_Employees_Offices`
--     FOREIGN KEY (`officeCode`)
--     REFERENCES `ClassicModels`.`Offices` (`officeCode`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)

-- INSERT INTO `Employees` (`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) VALUES ('1002','Murphy','Diane','x5800','dmurphy@classicmodelcars.com','1',NULL,'President');

-- select * from customers order by customerNumber limit 7 offset 5;

-- select * from customers where state is not null;

-- select count(distinct orderNumber) from orderdetails where orderNumber in (select orderNumber from orders where customerNumber in (select distinct customerNumber from payments where amount>120000));

-- select * from employee_details;

-- update employee_details set gender="Female" where id=1;

-- delete from employee_details where id=2;

-- select customerNumber,count(*) as IndividualPaymentCount,sum(amount) as TotalPayment 
	-- from payments 
--     where paymentDate<"2004-10-28" 
--     group by customerNumber
--     order by customerNumber desc;

-- select * from products;

-- select productCode,sum(quantityOrdered) as productCount from orderdetails group by productCode;

-- select customerNumber, Max(amount) as payment from payments where year(paymentdate) = 2004 group by customerNumber order by payment desc;

-- select year(paymentDate) as paymentYear, month(paymentDate) as paymentMonth, round(sum(amount),2) as payment from payments group by paymentYear,paymentMonth order by paymentYear,paymentMonth desc;

-- select year(paymentDate) as payyear,date_format(paymentDate,"%b") as monthname,concat("$",format(sum(amount),2)) as totpayments from payments group by payyear,month(paymentDate),monthname order by payyear,month(paymentDate); in this format(amount) make the format like 100,000
-- concat() can combine two values may be user defined string or combining results of two columns
-- Ex: concat(FirstName," ",LastName) / concat("Hi ",FirstName) 

-- JOINS

-- select checknumber,amount,paymentdate,customers.customerNumber,customerName,phone from payments join customers on payments.customerNumber=customers.customerNumber order by paymentDate desc limit 10;

-- select customers.customerNumber,amount from customers join payments;

-- select * from employees;

-- select employeeNumber,addressLine1,phone from offices join employees on offices.officeCode=employees.officeCode;

-- select * from payments; 

-- select * from offices;

-- select * from orderdetails where orderNumber=10100;

-- select * from products ;

-- select * from orderdetails join products on orderdetails.productCode=products.productCode  where orderNumber=10100 ORDER BY quantityOrdered ASC LIMIT 2;

-- select * from employees;

-- select E.employeeNumber,E.reportsTo,M.firstName as ManagerName from employees E inner join employees M on E.reportsTo=M.employeeNumber;

-- select E.employeeNumber,E.reportsTo,M.firstName as ManagerName from employees E right join employees M on E.reportsTo=M.employeeNumber;

-- select E.employeeNumber,E.reportsTo,M.firstName as ManagerName from employees E left join employees M on E.reportsTo=M.employeeNumber;

-- View

-- create index employeeIndex on employees(firstName);

-- show index from employees; -- indexing are used to make the query performance better. While searching a name it will return it quickly using its index and not linearly searching the whole column for the record.

-- View

-- create view francecustomers as select * from customers where country = "France";

-- select * 
-- from francecustomers 
-- order by customerNumber asc;

-- Any,All

-- select customerName from customers where customerNumber = any(select customerNumber from orders where city="Nantes");

-- select customerName from customers where customerNumber = all(select customerNumber from orders where city="Nantes");

-- Case

-- select customerName,
-- Case
-- 	when country="India" then 'Indian'
--     when country="Russia" then 'Russian'
--     when country="USA" then 'American'
--     else
-- 		"Others"
-- end as `Customer Country`
-- from customers;