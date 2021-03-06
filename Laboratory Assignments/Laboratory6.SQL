--  LABORATORY 6
/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE CUSTOMERS(
    CUSTOMERID NUMBER(2) CONSTRAINT PK_CID PRIMARY KEY,
    CUSTOMERNAME VARCHAR2(20),
    CONTACTNAME VARCHAR2(20),
    ADDRESS VARCHAR2(20),
    CITY VARCHAR2(20),
    POSTALCODE NUMBER(20),
    COUNTRY VARCHAR2(20)
);

CREATE TABLE SUPPLIERS(
    SUPPLIERID NUMBER(20) CONSTRAINT PK_SRID PRIMARY KEY,
    SUPPLIERNAME VARCHAR2(20),
    CONTACTNAME VARCHAR2(20),
    ADDRESS VARCHAR2(20),
    CITY VARCHAR2(20),
    POSTALCODE NUMBER(20),
    COUNTRY VARCHAR2(20)
);

INSERT INTO CUSTOMERS VALUES(1,'Alferds Futter','Maria Anders','Obere Str 57','Berlin',12209,'Germany');
INSERT INTO CUSTOMERS VALUES(2,'Ana Helados','Ana Trujillo','Avda Construction 22','Mexico',05021,'Mexico');
INSERT INTO CUSTOMERS VALUES(3,'Antonio Moreno','Antonio Moreno','Mataderos 2312','Mexico',05023,'Mexico');

INSERT INTO SUPPLIERS VALUES(1,'Exotic Liquid','Charlotte Cooper', '49 Gilbert St.','Berlin',12209,'Germany');
INSERT INTO SUPPLIERS VALUES(2,'New Orleans','Shelley Burke', 'P.O Box','Mexico D.F.',05023,'Mexico');
INSERT INTO SUPPLIERS VALUES(3,'Grandma Kelly','Regina Murphy', '707 Oxford','Ann Arbor',48104,'USA');

SELECT * FROM CUSTOMERS;
SELECT * FROM SUPPLIERS;

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 1
SELECT CITY FROM CUSTOMERS UNION SELECT CITY FROM SUPPLIERS;

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 2
SELECT CITY FROM CUSTOMERS UNION ALL SELECT CITY FROM SUPPLIERS;

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 3
SELECT CITY FROM CUSTOMERS WHERE COUNTRY LIKE 'Germany%' UNION SELECT CITY FROM SUPPLIERS WHERE COUNTRY LIKE 'Germany%';

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 4
-- SELECT ALL THE CUSTOMER NAME AND THE SUPPLIER NAME FROM CUSTOMERS TABLES WHERE CITY NAME IS COOMON IN BOTH
SELECT C.CUSTOMERNAME, S.SUPPLIERNAME FROM CUSTOMERS C, SUPPLIERS S WHERE C.CITY IN (SELECT CITY FROM CUSTOMERS INTERSECT SELECT CITY FROM SUPPLIERS) AND S.CITY IN (SELECT CITY FROM CUSTOMERS INTERSECT SELECT CITY FROM SUPPLIERS);

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 5
SELECT COUNTRY FROM SUPPLIERS MINUS SELECT COUNTRY FROM CUSTOMERS;

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/