set search_path to 'public';

CREATE TABLE Employee(emp_id varchar(20) NOT NULL UNIQUE, date_of_join date, FirstName varchar(30), LastName varchar(30),
					 Salary Float(2), Age Integer DEFAULT 25 CHECK(Age>23), Phone_1 BIGINT NOT NULL UNIQUE, Phone_2 BIGINT, Role_id varchar(20), 
					 PRIMARY KEY(emp_id), FOREIGN KEY(Role_id) REFERENCES Role(Role_id) );

CREATE TABLE Role(Role_id varchar(20) NOT NULL UNIQUE, Role_name varchar(20), PRIMARY KEY(Role_id));

CREATE TABLE Customer(cust_id varchar(20) NOT NULL UNIQUE, FirstName varchar(30), LastName varchar(30), Phone_1 BIGINT NOT NULL UNIQUE,
					  Phone_2 BIGINT, emp_id varchar(20), PRIMARY KEY(cust_id), FOREIGN KEY(emp_id) REFERENCES Employee(emp_id) );

CREATE TABLE Orders(Order_id varchar(20) NOT NULL UNIQUE, cust_id varchar(20), add_id varchar(20), date_order date,total_price Integer 	DEFAULT 0,
					completed varchar(5) DEFAULT 'NO', paid varchar(5) DEFAULT 'NO', PRIMARY KEY(Order_id), 
					FOREIGN KEY(cust_id) REFERENCES Customer(cust_id), FOREIGN KEY(add_id) REFERENCES Address(add_id));
--UPDATING THE TOTAL PRICE TO FLOAT
ALTER TABLE Orders ALTER COLUMN total_price TYPE Float(2);
				  
CREATE TABLE Payment(pay_id varchar(20) NOT NULL UNIQUE, date_of_pay date, order_id varchar(20), 
					PRIMARY KEY(pay_id), FOREIGN KEY(order_id) REFERENCES Orders(order_id));
					
CREATE TABLE Product(prod_id varchar(20) NOT NULL UNIQUE, prod_name varchar(20), unit_price Float(2), prod_quantity Integer, 
					 categ_id varchar(20), PRIMARY KEY(prod_id), 
					FOREIGN KEY(categ_id) REFERENCES Category(categ_id));

CREATE TABLE Completes(completes_id varchar(10), prod_id varchar(20), order_id varchar(20), ordered_quantity Integer,
					  PRIMARY KEY(completes_id), FOREIGN KEY(prod_id) REFERENCES Product(prod_id), 
					   FOREIGN KEY(order_id) REFERENCES Orders(order_id));
					
CREATE TABLE Category(categ_id varchar(20) NOT NULL UNIQUE, categ_name varchar(15), PRIMARY KEY(categ_id));

CREATE TABLE Brand(Brand_id varchar(20) NOT NULL UNIQUE, Brnd_name varchar(15), PRIMARY KEY(Brand_id) );

CREATE TABLE Supplies(supplies_id varchar(20) NOT NULL UNIQUE, prod_id varchar(20), sup_id varchar(20), supplies_quanTity Integer, 
					  Total_price Float(2), PRIMARY KEY(supplies_id), FOREIGN KEY(prod_id) REFERENCES Product(prod_id),
					  FOREIGN KEY(sup_id) REFERENCES Supplier(sup_id));
					 
CREATE TABLE Supplier(sup_id varchar(20) NOT NULL UNIQUE, First_name varchar(30), LastName varchar(20), 
					  Phone_1 BIGINT NOT NULL UNIQUE, Phone_2 BIGINT, PRIMARY KEY(sup_id) );
					  
CREATE TABLE Have(Have_id varchar(20) NOT NULL UNIQUE, categ_id varchar(20), Brand_id varchar(20), PRIMARY KEY(Have_id),
				 FOREIGN KEY(categ_id) REFERENCES Category(categ_id), FOREIGN KEY(Brand_id) REFERENCES Brand(Brand_id));
				 
CREATE TABLE Suppliedby(suppliedby_id varchar(20) NOT NULL UNIQUE, Brand_id varchar(20), sup_id varchar(20),
					   PRIMARY KEY(suppliedby_id), FOREIGN KEY(Brand_id) REFERENCES Brand(Brand_id),
					   FOREIGN KEY(sup_id) REFERENCES Supplier(sup_id));
					   
CREATE TABLE ADDRESS(add_id varchar(20) NOT NULL UNIQUE, state varchar(15), city varchar(15), road varchar(25), society_nm varchar(20),
					street_no varchar(10), House_no varchar(10), emp_id varchar(20), cust_id varchar(20), sup_id varchar(20),
					 PRIMARY KEY(add_id), FOREIGN KEY(emp_id) REFERENCES Employee(emp_id), FOREIGN KEY(cust_id) REFERENCES Customer(cust_id),
					 FOREIGN KEY(sup_id) REFERENCES Supplier(sup_id));
					 
--INSERTING VALUES TO ROLE:
INSERT INTO Role(Role_id, role_name) VALUES('R1', 'Manager');
INSERT INTO Role(Role_id, role_name) VALUES('R2', 'Common_Employee');
INSERT INTO Role(Role_id, role_name) VALUES('R3', 'Seller');
INSERT INTO Role(Role_id, role_name) VALUES('R4', 'Marketing Executive');
INSERT INTO Role(Role_id, role_name) VALUES('R5', 'Guider');

--INSERTING VALUES IN CATEGORY
INSERT INTO Category(categ_id, categ_name) VALUES('C1', 'Dry Fruits');
INSERT INTO Category(categ_id, categ_name) VALUES('C2', 'Cold Drinks');
INSERT INTO Category(categ_id, categ_name) VALUES('C3', 'Food Packets');
INSERT INTO Category(categ_id, categ_name) VALUES('C4', 'Stationaries');
INSERT INTO Category(categ_id, categ_name) VALUES('C5', 'Milk Products');
INSERT INTO Category(categ_id, categ_name) VALUES('C6', 'Pulses');
INSERT INTO Category(categ_id, categ_name) VALUES('C7', 'Grains');

--INSERTING VALUES IN EMPLOYEE
INSERT INTO Employee(emp_id, date_of_join, FirstName, LastName, Salary, Age, Phone_1, Phone_2, Role_id) 
	VALUES('E1', '2020-09-16', 'Ayush', 'Sharma', 25000.0, 26, 7826541253, 8526971594, 'R2' );
INSERT INTO Employee(emp_id, date_of_join, FirstName, LastName, Salary, Age, Phone_1, Role_id) 
	VALUES('E2', '2016-10-8', 'Prakash', 'Trivedi', 50000.0, 32, 7536913845, 'R1' );
INSERT INTO Employee(emp_id, date_of_join, FirstName, LastName, Salary, Phone_1, Role_id) 
	VALUES('E3', '2018-02-12', 'Mitul', 'Gajendra', 25000.0, 7826518365,'R2' );
INSERT INTO Employee(emp_id, date_of_join, FirstName, LastName, Salary, Age, Phone_1, Phone_2, Role_id) 
	VALUES('E4', '2013-05-16', 'Neelam', 'Shah', 30000.0, 29, 8426917634, 8526971594, 'R3' );
	
--INSERTING VALUES IN CUSTOMER
INSERT INTO Customer(cust_id, FirstName, LastName, Phone_1, Phone_2, emp_id) 
	VALUES('CU1', 'Aakash', 'Tripathi', 9825836751, 7852697432, 'E1');
INSERT INTO Customer(cust_id, FirstName, LastName, Phone_1, emp_id) 
	VALUES('CU2', 'Lalit', 'Kriplani', 8426873156,'E2');
INSERT INTO Customer(cust_id, FirstName, LastName, Phone_1, Phone_2, emp_id) 
	VALUES('CU3', 'Suman', 'Patel', 7526438512, 7852697432, 'E4');

	
--INSERTING VALUES IN BRAND
INSERT INTO Brand(Brand_id, Brnd_name) VALUES('BR1', 'Balaji');
INSERT INTO Brand(Brand_id, Brnd_name) VALUES('BR2', 'Everest');
INSERT INTO Brand(Brand_id, Brnd_name) VALUES('BR3', 'Milton');
INSERT INTO Brand(Brand_id, Brnd_name) VALUES('BR4', 'Classmate');
INSERT INTO Brand(Brand_id, Brnd_name) VALUES('BR5', 'Navneet');


--INSERTING VALUES IN HAVE
INSERT INTO Have(Have_id, categ_id, Brand_id) VALUES('HI1', 'C1','BR1');
INSERT INTO Have(Have_id, categ_id, Brand_id) VALUES('HI2', 'C4','BR3');
INSERT INTO Have(Have_id, categ_id, Brand_id) VALUES('HI3', 'C5','BR2');
INSERT INTO Have(Have_id, categ_id, Brand_id) VALUES('HI4', 'C2','BR4');
INSERT INTO Have(Have_id, categ_id, Brand_id) VALUES('HI5', 'C6','BR5');


--INSERTING VALUES IN SUPPLIER
INSERT INTO Supplier(sup_id, First_name, LastName, Phone_1, Phone_2)
	VALUES('SU1', 'Ravindar', 'Sharma', 7624584621, 8426137942);
INSERT INTO Supplier(sup_id, First_name, LastName, Phone_1)
	VALUES('SU2', 'Divya', 'Chauhan', 9826475234);
INSERT INTO Supplier(sup_id, First_name, LastName, Phone_1, Phone_2)
	VALUES('SU3', 'Kamlesh', 'Bhatt', 964251732, 8426137942);

--INSERTING VALUES IN SUPPLIEDBY
INSERT INTO Suppliedby(suppliedby_id, Brand_id, sup_id) VALUES('SB1','BR1','SU1');
INSERT INTO Suppliedby(suppliedby_id, Brand_id, sup_id) VALUES('SB2','BR2','SU1');
INSERT INTO Suppliedby(suppliedby_id, Brand_id, sup_id) VALUES('SB3','BR1','SU3');
INSERT INTO Suppliedby(suppliedby_id, Brand_id, sup_id) VALUES('SB4','BR5','SU2');
INSERT INTO Suppliedby(suppliedby_id, Brand_id, sup_id) VALUES('SB5','BR4','SU3');
INSERT INTO Suppliedby(suppliedby_id, Brand_id, sup_id) VALUES('SB6','BR3','SU1');

SELECT * FROM SuppliedBy;

--INSERTING VALUES IN PRODUCT
INSERT INTO Product(prod_id, prod_name, unit_price, prod_quantity, categ_id)
	VALUES('PR1', 'Chocolate', 20.0, 50, 'C5' );
INSERT INTO Product(prod_id, prod_name, unit_price, prod_quantity, categ_id)
	VALUES('PR2', 'Pen', 5.0, 120, 'C4' );
INSERT INTO Product(prod_id, prod_name, unit_price, prod_quantity, categ_id)
	VALUES('PR3', 'Maaza', 10.0, 20, 'C2');

--INSERTING INTO SUPPLIES
INSERT INTO Supplies(supplies_id, prod_id, sup_id, supplies_quantity, Total_price)
	VALUES('SP1', 'PR1', 'SU1', 20, 50.0);

--UPDATE QUANTITY IN PRODUCT AS THE SUPPLY OF THAT PRODUCT IS ENTERED. 
UPDATE Product SET prod_quantity = (SELECT ((SELECT prod_quantity FROM Product,Supplies WHERE Product.prod_id = Supplies.prod_id and Supplies.supplies_id = 'SP1')+(SELECT supplies_quantity
		FROM Supplies,Product WHERE supplies.prod_id =Product.prod_id and Supplies.supplies_id = 'SP1')))
WHERE prod_id = (SELECT Product.prod_id FROM Product,Supplies WHERE Product.prod_id = Supplies.prod_id and Supplies.supplies_id = 'SP1');
	
INSERT INTO Supplies(supplies_id, prod_id, sup_id, supplies_quantity, Total_price)
	VALUES('SP2', 'PR3', 'SU1', 2, 30.0);
--UPDATE QUANTITY IN PRODUCT AS THE SUPPLY OF THAT PRODUCT IS ENTERED. 
UPDATE Product SET prod_quantity = (SELECT ((SELECT prod_quantity FROM Product,Supplies WHERE Product.prod_id = Supplies.prod_id and 
		Supplies.supplies_id = 'SP2')+(SELECT supplies_quantity FROM Supplies,Product WHERE supplies.prod_id =Product.prod_id 
		and Supplies.supplies_id = 'SP2'))) WHERE prod_id = (SELECT Product.prod_id FROM Product,Supplies 
		WHERE Product.prod_id = Supplies.prod_id and Supplies.supplies_id = 'SP2');
	
	
INSERT INTO Supplies(supplies_id, prod_id, sup_id, supplies_quantity, Total_price)
	VALUES('SP3', 'PR1', 'SU3', 30, 60.0);
--UPDATE QUANTITY IN PRODUCT AS THE SUPPLY OF THAT PRODUCT IS ENTERED. 
UPDATE Product SET prod_quantity = (SELECT ((SELECT prod_quantity FROM Product,Supplies WHERE Product.prod_id = Supplies.prod_id and 
		Supplies.supplies_id = 'SP3')+(SELECT supplies_quantity FROM Supplies,Product WHERE supplies.prod_id =Product.prod_id 
		and Supplies.supplies_id = 'SP3'))) WHERE prod_id = (SELECT Product.prod_id FROM Product,Supplies 
		WHERE Product.prod_id = Supplies.prod_id and Supplies.supplies_id = 'SP3');
	

INSERT INTO Supplies(supplies_id, prod_id, sup_id, supplies_quantity, Total_price)
	VALUES('SP4', 'PR2', 'SU2', 50, 20.0);
--UPDATE QUANTITY IN PRODUCT AS THE SUPPLY OF THAT PRODUCT IS ENTERED. 
UPDATE Product SET prod_quantity = (SELECT ((SELECT prod_quantity FROM Product,Supplies WHERE Product.prod_id = Supplies.prod_id and 
		Supplies.supplies_id = 'SP4')+(SELECT supplies_quantity FROM Supplies,Product WHERE supplies.prod_id =Product.prod_id 
		and Supplies.supplies_id = 'SP4'))) WHERE prod_id = (SELECT Product.prod_id FROM Product,Supplies 
		WHERE Product.prod_id = Supplies.prod_id and Supplies.supplies_id = 'SP4');
	
--SEEING UPDATED PRODUCT TABLE AND PRODUCT QUANTITY
SELECT * FROM Product;

--INSERTING INTO ADDRESS
INSERT INTO Address(add_id, state, city, road, society_nm, street_no, House_no, emp_id)
	VALUES('AD1', 'Gujarat', 'Rajkot', 'Jamnagar Road', 'Global', 'V3', 'HN1', 'E1' );
INSERT INTO Address(add_id, state, city, road, society_nm, street_no, House_no, emp_id)
	VALUES('AD2', 'Gujarat', 'Rajkot', 'Madhapar', 'Sun Rise', 'S2', 'SR1', 'E2' );
INSERT INTO Address(add_id, state, city, road, society_nm, street_no, House_no, emp_id)
	VALUES('AD3', 'MP', 'Ujjain', 'Pragya', 'Prakash', 'P1', 'PR5', 'E3' );
INSERT INTO Address(add_id, state, city, road, society_nm, street_no, House_no, emp_id)
	VALUES('AD4', 'Gujarat', 'Rajkot', 'Indira Circle', 'Crystal', 'C5', 'CR2', 'E4' );
INSERT INTO Address(add_id, state, city, road, society_nm, street_no, House_no, emp_id)
	VALUES('AD5', 'Gujarat', 'Rajkot', 'Raiya Road', 'Silver Height', 'SH4', 'H1', 'E4' );
	
INSERT INTO Address(add_id, state, city, road, society_nm, street_no, House_no, cust_id)
	VALUES('AD6', 'Gujarat', 'Rajkot', 'Jamnagar Road', 'COPPER CITY', 'CC5', 'HN60', 'CU1' );
INSERT INTO Address(add_id, state, city, road, society_nm, street_no, House_no, cust_id)
	VALUES('AD7', 'MP', 'Lucknow', 'Sabar Road', 'HighLights', 'HG2', 'HN120', 'CU2' );
INSERT INTO Address(add_id, state, city, road, society_nm, street_no, House_no, cust_id)
	VALUES('AD8', 'Gujarat', 'Surat', 'Surat Highway', 'Sun Raise', 'S5', 'SRE30', 'CU3' );
	
INSERT INTO Address(add_id, state, city, road, society_nm, street_no, House_no, sup_id)
	VALUES('AD9', 'Gujarat', 'Rajkot', 'Raiya Exchange', 'Ramananda', 'R1', 'R10', 'SU1' );
INSERT INTO Address(add_id, state, city, road, society_nm, street_no, House_no, sup_id)
	VALUES('AD10', 'MP', 'Ujjain', 'Gopalpura Road', 'Nivti', 'N2', 'NV28', 'SU2' );
INSERT INTO Address(add_id, state, city, road, society_nm, street_no, House_no, sup_id)
	VALUES('AD11', 'Gujarat', 'Rajkot', 'Hospital Chowk', 'High Pillars', 'H3', 'HP32', 'SU3' );
	
--INSERTING VALUES IN ORDERS
INSERT INTO Orders(Order_id, cust_id, add_id, date_order) VALUES('OD1','CU1','AD6', '2019-09-21');
INSERT INTO Orders(Order_id, cust_id, add_id,date_order) VALUES('OD2','CU2','AD7', '2020-10-24');
INSERT INTO Orders(Order_id, cust_id, add_id, date_order) VALUES('OD3','CU3','AD8','2018-1-5');
INSERT INTO Orders(Order_id, cust_id, add_id, date_order) VALUES('OD4','CU2','AD7', '2021-10-25');
DELETE FROM Orders WHERE date_order = '2021-10-25';
INSERT INTO Orders(Order_id, cust_id, add_id, date_order) VALUES('OD4','CU2','AD7', '2021-1-25');

INSERT INTO Orders(Order_id, cust_id, add_id, date_order) VALUES('OD5','CU2','AD7', '2021-5-22');

--INSERTING VALUES IN COMPLETES
INSERT INTO Completes(completes_id, prod_id, order_id, ordered_quantity)
	VALUES('CMP1', 'PR1','OD1',10);
--UPDATE QUANTITY IN PRODUCT AS THE SUPPLY OF THAT PRODUCT IS ENTERED. 
UPDATE Product SET prod_quantity = (SELECT ((SELECT prod_quantity FROM Product,Completes WHERE Product.prod_id = Completes.prod_id and 
		Completes.completes_id = 'CMP1') - (SELECT ordered_quantity FROM Completes,Product WHERE completes.prod_id =Product.prod_id 
		and Completes.completes_id = 'CMP1'))) WHERE prod_id = (SELECT Product.prod_id FROM Product,Completes 
		WHERE Product.prod_id = completes.prod_id and Completes.completes_id = 'CMP1');

--UPDATING THAT ORDER COMPLETED
UPDATE Orders SET completed = 'YES' WHERE order_id = (SELECT order_id FROM Completes WHERE completes_id = 'CMP1');

--UPDATING FOR THE PRICE 
UPDATE Orders SET total_price = (SELECT((SELECT total_price FROM Orders,Completes WHERE Orders.order_id = Completes.order_id and 
		Completes.completes_id = 'CMP1') + (SELECT (SELECT unit_price FROM Product,Completes WHERE Product.prod_id = Completes.prod_id and 
		Completes.completes_id = 'CMP1') * (SELECT ordered_quantity FROM Completes WHERE completes_id = 'CMP1'))))
		WHERE order_id = 
		(SELECT Orders.order_id FROM Orders, Completes WHERE Orders.order_id = Completes.order_id and Completes.completes_id = 'CMP1');

INSERT INTO Completes(completes_id, prod_id, order_id, ordered_quantity)
	VALUES('CMP2', 'PR3','OD1',2);

--UPDATE QUANTITY IN PRODUCT AS THE SUPPLY OF THAT PRODUCT IS ENTERED. 
UPDATE Product SET prod_quantity = (SELECT ((SELECT prod_quantity FROM Product,Completes WHERE Product.prod_id = Completes.prod_id and 
		Completes.completes_id = 'CMP2') - (SELECT ordered_quantity FROM Completes,Product WHERE completes.prod_id =Product.prod_id 
		and Completes.completes_id = 'CMP2'))) WHERE prod_id = (SELECT Product.prod_id FROM Product,Completes 
		WHERE Product.prod_id = completes.prod_id and Completes.completes_id = 'CMP2');
--UPDATING THAT ORDER COMPLETED
UPDATE Orders SET completed = 'YES' WHERE order_id = (SELECT order_id FROM Completes WHERE completes_id = 'CMP2');
--UPDATING FOR THE PRICE 
UPDATE Orders SET total_price = (SELECT((SELECT total_price FROM Orders,Completes WHERE Orders.order_id = Completes.order_id and 
		Completes.completes_id = 'CMP2') + (SELECT (SELECT unit_price FROM Product,Completes WHERE Product.prod_id = Completes.prod_id and 
		Completes.completes_id = 'CMP2') * (SELECT ordered_quantity FROM Completes WHERE completes_id = 'CMP2'))))
		WHERE order_id = 
		(SELECT Orders.order_id FROM Orders, Completes WHERE Orders.order_id = Completes.order_id and Completes.completes_id = 'CMP2');


INSERT INTO Completes(completes_id, prod_id, order_id, ordered_quantity)
	VALUES('CMP3', 'PR1','OD2',22);

--UPDATE QUANTITY IN PRODUCT AS THE SUPPLY OF THAT PRODUCT IS ENTERED. 
UPDATE Product SET prod_quantity = (SELECT ((SELECT prod_quantity FROM Product,Completes WHERE Product.prod_id = Completes.prod_id and 
		Completes.completes_id = 'CMP3') - (SELECT ordered_quantity FROM Completes,Product WHERE completes.prod_id =Product.prod_id 
		and Completes.completes_id = 'CMP3'))) WHERE prod_id = (SELECT Product.prod_id FROM Product,Completes 
		WHERE Product.prod_id = completes.prod_id and Completes.completes_id = 'CMP3');
--UPDATING THAT ORDER COMPLETED
UPDATE Orders SET completed = 'YES' WHERE order_id = (SELECT order_id FROM Completes WHERE completes_id = 'CMP3');
--UPDATING FOR THE PRICE 
UPDATE Orders SET total_price = (SELECT((SELECT total_price FROM Orders,Completes WHERE Orders.order_id = Completes.order_id and 
		Completes.completes_id = 'CMP3') + (SELECT (SELECT unit_price FROM Product,Completes WHERE Product.prod_id = Completes.prod_id and 
		Completes.completes_id = 'CMP3') * (SELECT ordered_quantity FROM Completes WHERE completes_id = 'CMP3'))))
		WHERE order_id = 
		(SELECT Orders.order_id FROM Orders, Completes WHERE Orders.order_id = Completes.order_id and Completes.completes_id = 'CMP3');


INSERT INTO Completes(completes_id, prod_id, order_id, ordered_quantity)
	VALUES('CMP4', 'PR2','OD3',30);

--UPDATE QUANTITY IN PRODUCT AS THE SUPPLY OF THAT PRODUCT IS ENTERED. 
UPDATE Product SET prod_quantity = (SELECT ((SELECT prod_quantity FROM Product,Completes WHERE Product.prod_id = Completes.prod_id and 
		Completes.completes_id = 'CMP4') - (SELECT ordered_quantity FROM Completes,Product WHERE completes.prod_id =Product.prod_id 
		and Completes.completes_id = 'CMP4'))) WHERE prod_id = (SELECT Product.prod_id FROM Product,Completes 
		WHERE Product.prod_id = completes.prod_id and Completes.completes_id = 'CMP4');
--UPDATING THAT ORDER COMPLETED
UPDATE Orders SET completed = 'YES' WHERE order_id = (SELECT order_id FROM Completes WHERE completes_id = 'CMP4');
--UPDATING FOR THE PRICE 
UPDATE Orders SET total_price = (SELECT((SELECT total_price FROM Orders,Completes WHERE Orders.order_id = Completes.order_id and 
		Completes.completes_id = 'CMP4') + (SELECT (SELECT unit_price FROM Product,Completes WHERE Product.prod_id = Completes.prod_id and 
		Completes.completes_id = 'CMP4') * (SELECT ordered_quantity FROM Completes WHERE completes_id = 'CMP1'))))
		WHERE order_id = 
		(SELECT Orders.order_id FROM Orders, Completes WHERE Orders.order_id = Completes.order_id and Completes.completes_id = 'CMP4');


INSERT INTO Completes(completes_id, prod_id, order_id, ordered_quantity)
	VALUES('CMP5', 'PR2','OD3',10);
--deleting value as placed wrong
DELETE FROM Completes WHERE order_id = 'OD3';

INSERT INTO Completes(completes_id, prod_id, order_id, ordered_quantity)
	VALUES('CMP5', 'PR2','OD4',10);

--UPDATE QUANTITY IN PRODUCT AS THE SUPPLY OF THAT PRODUCT IS ENTERED. 
UPDATE Product SET prod_quantity = (SELECT ((SELECT prod_quantity FROM Product,Completes WHERE Product.prod_id = Completes.prod_id and 
		Completes.completes_id = 'CMP5') - (SELECT ordered_quantity FROM Completes,Product WHERE completes.prod_id =Product.prod_id 
		and Completes.completes_id = 'CMP5'))) WHERE prod_id = (SELECT Product.prod_id FROM Product,Completes 
		WHERE Product.prod_id = completes.prod_id and Completes.completes_id = 'CMP5');
--UPDATING THAT ORDER COMPLETED
UPDATE Orders SET completed = 'YES' WHERE order_id = (SELECT order_id FROM Completes WHERE completes_id = 'CMP5');
--UPDATING FOR THE PRICE 
UPDATE Orders SET total_price = (SELECT((SELECT total_price FROM Orders,Completes WHERE Orders.order_id = Completes.order_id and 
		Completes.completes_id = 'CMP5') + (SELECT (SELECT unit_price FROM Product,Completes WHERE Product.prod_id = Completes.prod_id and 
		Completes.completes_id = 'CMP5') * (SELECT ordered_quantity FROM Completes WHERE completes_id = 'CMP5'))))
		WHERE order_id = 
		(SELECT Orders.order_id FROM Orders, Completes WHERE Orders.order_id = Completes.order_id and Completes.completes_id = 'CMP5');

--SEEING UPDATED ORDERS TABLE FOR SEEING WHICH ORDERS ARE COMPLETED
SELECT * FROM Orders;

--SEEING THE UPDATED QUANTITY FOR PRODUCT TABLE
SELECT * FROM Product;

--INSERTING VALUES IN PAYMENT
INSERT INTO Payment(pay_id, date_of_pay, order_id) VALUES('PAY1','2020-12-11','OD2');

--UPDATING ORDERS TABLE THAT PAYMENT CAME FOR THE ORDER
UPDATE Orders SET paid = 'YES' WHERE order_id = (SELECT order_id FROM Payment WHERE pay_id = 'PAY1');

INSERT INTO Payment(pay_id, date_of_pay, order_id) VALUES('PAY2','2019-06-1','OD3');

--UPDATING ORDERS TABLE THAT PAYMENT CAME FOR THE ORDER
UPDATE Orders SET paid = 'YES' WHERE order_id = (SELECT order_id FROM Payment WHERE pay_id = 'PAY2');

INSERT INTO Payment(pay_id, date_of_pay, order_id) VALUES('PAY3','2020-04-15','OD1');

--UPDATING ORDERS TABLE THAT PAYMENT CAME FOR THE ORDER
UPDATE Orders SET paid = 'YES' WHERE order_id = (SELECT order_id FROM Payment WHERE pay_id = 'PAY3');

INSERT INTO Payment(pay_id, date_of_pay, order_id) VALUES('PAY4','2021-02-15','OD4');

--UPDATING ORDERS TABLE THAT PAYMENT CAME FOR THE ORDER
UPDATE Orders SET paid = 'YES' WHERE order_id = (SELECT order_id FROM Payment WHERE pay_id = 'PAY4');

--SEEING WHICH OF THE ORDERS ARE PAID
SELECT * FROM Orders;


--ALL TABLES
SELECT * FROM Employee;
SELECT * FROM Role;
SELECT * FROM Customer;
SELECT * FROM Orders;
SELECT * FROM Payment;
SELECT * FROM Product;
SELECT * FROM Address;
SELECT * FROM Brand;
SELECT * FROM Category;.,.

SELECT * FROM Have;
SELECT * FROM SuppliedBy;
SELECT * FROM Supplier;
SELECT * FROM Supplies;

--EXTRA QUERIES:

--SEEING WHICH SUPPLIER HAVE dealing with brand 1 
SELECT sup_id FROM SuppliedBy WHERE brand_id = 'BR1';

--SEEING FOR ORDER WHAT'S THE TOTAL PRICE FOR COMPLETED ONE
SELECT total_price,order_id FROM Orders WHERE completed = 'YES';

-- SEEING WHICH OF THE ORDER NEED TO BE COMPLETED
SELECT order_id FROM Orders WHERE completed = 'NO';

--SEEING DISTINCT ID FOR BRAND via HAVE TABLE
SELECT DISTINCT brand_id FROM HAVE;

--SEEING LAST ORDER MADE BY CUSTOMER 2 as we want to see the last order first we can use 
--order by while using descending order on the date limiting it to 1 so as to show only the top most row
SELECT * FROM Orders WHERE cust_id = 'CU2' ORDER BY date_order DESC LIMIT 1;

--TO SERACH THE EMPLOYEE WHOSE NAME STARTS WITH A
SELECT * FROM Employee WHERE FirstName LIKE 'A%';

--SELECTING THE MAXIMUM SALARY FROM THE EMPLOYEE  name AND  ROLE FROM ROLE TABLE
SELECT MAX(SALARY) FROM Employee;
SELECT Role.role_name,Employee.FirstName FROM Role,Employee
	WHERE Role.role_id = (SELECT Role_id FROM Employee WHERE Salary = (SELECT MAX(SALARY) FROM Employee)) 
	and Employee.emp_id = (SELECT emp_id FROM Employee WHERE Salary = (SELECT MAX(SALARY) FROM Employee));

--SHOWING THE PRODUCTS COMING FROM CATEGORY C2 SHOWING IT'S CATEGORY 
SELECT Product.prod_name, Product.prod_id, Category.categ_name FROM Product,Category WHERE Category.categ_id = 'C2' 
	and Product.prod_id = (SELECT prod_id FROM Product WHERE categ_id = 'C2');

--ordering products as per the categ id
SELECT * FROM Product ORDER BY CASE WHEN categ_id = 'C3' THEN '1' WHEN categ_id = 'C5' THEN '2' ELSE categ_id END ASC;

--seeing that for all employee how much does it cost for there salary
SELECT SUM(SALARY) FROM Employee;

--seeing the supplier and address details via inner join
SELECT * FROM Supplier INNER JOIN Address ON Supplier.sup_id = Address.sup_id;

--seeing customer address via left join 
SELECT *  FROM Customer LEFT JOIN Address ON Customer.cust_id = Address.cust_id;

--FULL JOIN TO SEE CUSTOMER AND ORDERS AT A TIME
SELECT * FROM Customer FULL JOIN Orders ON Customer.cust_id = Orders.cust_id;

--SELECTING CUSTOMER WHICH ARE ADDEED BY EMPLOYEE 1 AND 3
SELECT FirstName, LastName,emp_id FROM Customer WHERE emp_id IN ('E1','E3');

--SELECTING EMPLOYEE ID AND FIRSTNAME WHOSE AGE BETWEEN 26 TO 30
SELECT emp_id, FirstName,age FROM Employee WHERE age BETWEEN 26 and 30;

--indexing on employee
CREATE INDEX empind ON Employee(emp_id);

--CREATING VIEW FOR CUSTOMER OF ITS ADDRESS SO AS TO SHOW ONLY LIMITED VIEW TO CUSTOMER
CREATE VIEW showcustadd AS 	SELECT Customer.cust_id, Customer.FirstName, Address.state, Address.city FROM Customer,Address 
	WHERE Customer.cust_id = Address.cust_id;

SELECT * FROM showcustadd;
