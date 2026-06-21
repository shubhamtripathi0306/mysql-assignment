CREATE DATABASE EmployeeDB;
USE EmployeeDB;

CREATE TABLE Employee (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Employee (CustomerID, CustomerName, City)
VALUES
(1,'John Smith','New York'),
(2,'Mary Johnson','Chicago'),
(3,'Peter Adams','Los Angeles'),
(4,'Nancy Miller','Houston'),
(5,'Robert White','Miami');

RENAME TABLE Employee  TO Customers;
SELECT * FROM Customers;

DROP TABLE Orders;

CREATE TABLE Orders
 (
    OrderID INT ,
    CustomerID INT,
    OrderDate DATE,
    Amount INT
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate,Amount)
VALUES
(101,1,'2024-10-01',250),
(102,'2','2024-10-05',300),
(103,'1','2024-10-07',150),
(104,'3','2024-10-10',450),
(105,'6','2024-10-12',400);

Select * from Orders;

#####


drop table Payments;
CREATE TABLE Payments
 (
     PayementId Varchar(10),
    CustomerID INT,
    PayementDate DATE,
    Amount INT
);

INSERT INTO Payments (PayementId,CustomerID,PayementDate,Amount)
VALUES
('P101',1,'2024-10-02',250),
('P102','2','2024-10-06',300),
('P103','3','2024-10-11',450),
('P104','4','2024-10-15',200);

Select * from Payments;


########

create table Employees
( EmployeeId Int,
EmployeeName varchar(50),
ManagerID int null );

INSERT INTO Employees (EmployeeId,EmployeeName,ManagerID)
VALUES
(1,'Alex Green',null),
(2,'Brain Lee',1),
(3,'Carol Ray',1),
(4,'David Kim',2),
(5,'Eva Smith',2);

Select * from Employees;

## Ques1

SELECT DISTINCT c.CustomerID, c.CustomerName, c.City
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;

## Quest 2
SELECT c.CustomerID, c.CustomerName, c.City,
       o.OrderID, o.OrderDate, o.Amount
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;

##ques 3

SELECT c.CustomerID, c.CustomerName, c.City,
       o.OrderID, o.OrderDate, o.Amount
FROM Customers c
RIGHT JOIN Orders o
ON c.CustomerID = o.CustomerID;

##QUEST 4

SELECT c.CustomerID, c.CustomerName, c.City,
       o.OrderID, o.OrderDate, o.Amount
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID

UNION

SELECT c.CustomerID, c.CustomerName, c.City,
       o.OrderID, o.OrderDate, o.Amount
FROM Customers c
RIGHT JOIN Orders o
ON c.CustomerID = o.CustomerID;

## QUEST 5

SELECT c.CustomerID, c.CustomerName, c.City
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

## QUEST 6

SELECT DISTINCT c.CustomerID, c.CustomerName, c.City
FROM Customers c
INNER JOIN Payments p
ON c.CustomerID = p.CustomerID
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL;


## QUEST 7

SELECT c.CustomerID, c.CustomerName,
       o.OrderID, o.OrderDate, o.Amount
FROM Customers c
CROSS JOIN Orders o;

## QUEST 8

SELECT c.CustomerID,
       c.CustomerName,
       o.Amount AS OrderAmount,
       p.Amount AS PaymentAmount
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p
ON c.CustomerID = p.CustomerID;

## QUEST 9

SELECT DISTINCT c.CustomerID, c.CustomerName, c.City
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
INNER JOIN Payments p
ON c.CustomerID = p.CustomerID;