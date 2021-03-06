-- Laboratory 3
/*----------------------------------------------------------------------------------------------------------------------------------------------------*/
-- Question 1
SELECT * FROM PRODUCT_MASTER;
UPDATE PRODUCT_MASTER SET ReorderLvl = 80 WHERE Description = 'Shirts';

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 2
UPDATE PRODUCT_MASTER SET SellPrice = SellPrice + 0.1;

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 3
SELECT * FROM SALESMAN_MASTER; 
UPDATE SALESMAN_MASTER SET YtdSales = 35 WHERE SalesmanNo = 'S00003';

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 4
SELECT * FROM SALES_ORDER_DETAILS;
UPDATE SALES_ORDER_DETAILS SET QtyDisp = QtyOrdered WHERE ProductRate <= 1000;

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 5
UPDATE SALESMAN_MASTER SET Pincode = 400001 WHERE CITY = 'Mumbai';

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 6
UPDATE PRODUCT_MASTER SET ReorderLvl = ReorderLvl * 2;

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 7
SELECT * FROM SALES_ORDER;
DELETE FROM SALES_ORDER WHERE OrderStatus = 'Cancelled';

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 8
-- Delete all the records of the Salesman_Master Table and make it again 

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 9
SELECT * FROM PRODUCT_MASTER;
SELECT * FROM PRODUCT_MASTER WHERE ReorderLvl > QtyInHand;
SELECT * FROM PRODUCT_MASTER WHERE QtyInHand < ReorderLvl;
-- Both are same

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 10
SELECT * FROM EMP;
update emp set mgr = (select empno from emp where ename = 'Blake') where ename in ('Smith','Adams');
/*----------------------------------------------------------------------------------------------------------------------------------------------------*/