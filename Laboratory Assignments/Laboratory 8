-- LABORATORY 8

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE SALESPEOPLE(
    SNUM NUMBER(4) CONSTRAINT PK_SNUM PRIMARY KEY,
    SNAME VARCHAR2(20) NOT NULL,
    CITY VARCHAR2(20),
    COMM NUMBER(3,2)
);

CREATE TABLE CUSTOMER(
    CNUM NUMBER(4) CONSTRAINT PK_CNUM PRIMARY KEY,
    CNAME VARCHAR2(20),
    CITY VARCHAR2(20),
    RATING NUMBER(5),
    SNUM NUMBER(4) REFERENCES SALESPEOPLE(SNUM) ON DELETE CASCADE
);

CREATE TABLE ORDERS(
    ONUM NUMBER(4) CONSTRAINT PK_ONUM PRIMARY KEY,
    AMT NUMBER(5,2),
    ODATE DATE,
    CNUM NUMBER(4) REFERENCES CUSTOMER(CNUM) ON DELETE CASCADE,
    SNUM NUMBER(4) REFERENCES SALESPEOPLE(SNUM) ON DELETE CASCADE
);

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

INSERT INTO SALESPEOPLE VALUES(1001,'Peel','London',0.12);
INSERT INTO SALESPEOPLE VALUES(1002,'Serres','San Jose',0.13);
INSERT INTO SALESPEOPLE VALUES(1004,'Motika','London',0.11);
INSERT INTO SALESPEOPLE VALUES(1003,'Axelrod','New York',0.1);
INSERT INTO SALESPEOPLE VALUES(1007,'Rifikin','Barcelona',0.15);

SELECT * FROM SALESPEOPLE;

INSERT INTO CUSTOMER VALUES(2001,'Hoffman','London',100,1001);
INSERT INTO CUSTOMER VALUES(2003,'Liu','San Jose',200,1002);
INSERT INTO CUSTOMER VALUES(2006,'Clemens','London',100,1001);
INSERT INTO CUSTOMER VALUES(2008,'Cisneros','San Jose',300,1007);
INSERT INTO CUSTOMER VALUES(2002,'Giovanni','Rome',200,1003);
INSERT INTO CUSTOMER VALUES(2004,'Grass','Berlin',300,1002);
INSERT INTO CUSTOMER VALUES(2007,'Pereira','Rome',100,1004);

SELECT * FROM CUSTOMER;

INSERT INTO ORDERS VALUES(3003,767.19,'03/10/1990','2001','1001');
INSERT INTO ORDERS VALUES(3006,1098.16,'03/10/1990',2008,1007);
INSERT INTO ORDERS VALUES(3007,75.75,'04/10/1990',2004,1002);
INSERT INTO ORDERS VALUES(3008,4723,'05/10/1990',2006,1001);
INSERT INTO ORDERS VALUES(3011,9891.88,'06/10/1990',2006,1001);
INSERT INTO ORDERS VALUES(3001,18.69,'03/10/1990',2008,1007);
INSERT INTO ORDERS VALUES(3002,1900.1,'03/10/1990',2007,1004);
INSERT INTO ORDERS VALUES(3005,5160.45,'03/10/1990',2003,1002);
INSERT INTO ORDERS VALUES(3009,1713.23,'04/10/1990',2002,1003);
INSERT INTO ORDERS VALUES(3010,1390.95,'06/10/1990',2004,1002);

SELECT * FROM ORDERS;

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 1
CREATE VIEW MAX_RATE AS 
SELECT * FROM CUSTOMER 
WHERE RATING = (SELECT MAX(RATING) FROM CUSTOMER);

SELECT * FROM MAX_RATE;

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 2
CREATE VIEW CNT_SLSP AS
SELECT CITY AS CITY, COUNT(*) AS CNT FROM SALESPEOPLE
GROUP BY CITY;

SELECT * FROM CNT_SLSP;

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 3
-- The avg and total orders for each salesperson
CREATE VIEW V3 AS
SELECT X.AVGE,Y.TOT,Y.SNUM 
FROM (SELECT AVG(COUNT(*)) AS AVGE FROM ORDERS GROUP BY SNUM) X, (SELECT TOT, SNUM AS SNUM FROM ORDERS GROUP BY SNUM)Y;

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 4

CREATE VIEW V4 AS
SELECT * FROM SALESPEOPLE
WHERE SNUM IN (SELECT SNUM FROM CUSTOMER GROUP BY SNUM HAVING COUNT(SNUM)>1);

SELECT * FROM V4;

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 5

CREATE VIEW Salespeople_Customer_Orders AS
SELECT X.SNUM, Y.CNUM, Z.ONUM FROM SALESPEOPLE X, CUSTOMER Y, ORDERS Z;

SELECT * FROM Salespeople_Customer_Orders;

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 6

CREATE VIEW V6 AS
SELECT SNUM,COMM FROM SALESPEOPLE
WHERE COMM IS BETWENN 1000 AND 2000 WITH CHECK OPTION;

SELECT * FROM V6;

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/