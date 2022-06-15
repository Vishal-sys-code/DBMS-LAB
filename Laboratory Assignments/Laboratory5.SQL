-- LABORATORY 5
/*----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------------------*/
/*
 CONSIDERING THE TABLES
 SAILORS(S_ID,S_NAME,RATING,AGE)
 BOATS(B_ID,B_NAME,COLOR)
 RESERVES(S_ID,B_ID,DAY)
*/

CREATE TABLE SAILORS(
    S_ID number(10) constraint PK_SID primary key,
    S_NAME varchar2(20) NOT NULL,
    RATING number(15),
    AGE number(15)
);

CREATE TABLE BOATS(
    B_ID number(10) constraint PK_BID primary key,
    B_NAME varchar2(20) NOT NULL,
    COLOR varchar2(15) NOT NULL
);

CREATE TABLE RESERVES(
    S_ID number(10) constraint FK_SID references SAILORS(S_ID) on delete cascade,
    B_ID number(10) constraint FK_BID references BOATS(B_ID) on delete cascade,
    DAY varchar2(15) NOT NULL,
    CONSTRAINT PK_SBID primary key(S_ID,B_ID)
);

/*      INSERTING THE VALUES TO SAILORS     */
insert into sailors values(10006,'Tarun',10,20);
insert into sailors values(10007,'Vishal',20,21);
insert into sailors values(10008,'Ishanvi',30,22);
insert into sailors values(10009,'Yakshini',40,23);
insert into sailors values(10010,'Yuvraj',50,24);

/*      INSERTING THE VALUES TO BOATS     */
insert into boats values(20006,'Pentya','Red');
insert into boats values(20007,'William','Blue');
insert into boats values(20008,'Rohan','Green');
insert into boats values(20009,'Mohan','Violet');
insert into boats values(20010,'Sohan','Indigo');

UPDATE BOATS SET B_NAME = 'Tarun' where B_ID = 20008;

/*      INSERTING THE VALUES TO RESERVES     */
insert into reserves values(10006,20006,'Monday');
insert into reserves values(10007,20007,'Tuesday');
insert into reserves values(10008,20008,'Wednesday');
insert into reserves values(10009,20009,'Thrusday');
insert into reserves values(10010,20010,'Friday');

SELECT * FROM SAILORS;

SELECT * FROM BOATS;

SELECT * FROM RESERVES;

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 1 => Finding the color of boats which is being owned by Tarun
SELECT B.COLOR FROM SAILORS S, BOATS B, RESERVES R WHERE S.S_ID = R.S_ID AND B.B_ID = R.B_ID AND S.S_NAME like 'Tarun%';

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 2
SELECT S.S_ID,S.S_NAME FROM SAILORS S , RESERVES R WHERE S.S_ID = R.S_ID AND R.DAY like 'Monday%';

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 3
SELECT B.B_ID, B.B_NAME, B.COLOR FROM BOATS B WHERE COLOR IN('Red','Green');
SELECT B1.B_ID,B1.B_NAME FROM BOATS B1, BOATS B2 WHERE B1.B_ID = B2.B_ID AND B1.COLOR IN('Red','Green'); -- SELF JOIN

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 4
DELETE FROM SAILORS S WHERE S.AGE > 60; 
-- THERE IS NO ONE WHOSE AGE IS ABOVE 60

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

/*
TEACHER(TID, NAME, DEPT)
SUBJECT(SUBNO,SUBTITLE)
TAUGHTBY(TID,SUBNO)
STUDENT(ROLL, SNAME, CITY)
*/

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE STUDENT(
    ROLL NUMBER(4) CONSTRAINT PK_RN PRIMARY KEY,
    SNAME VARCHAR2(20) NOT NULL,
    CITY VARCHAR2(30) NOT NULL
);

CREATE TABLE TEACHER(
    TID NUMBER(10) CONSTRAINT PK_TID PRIMARY KEY,
    NAME VARCHAR2(20) NOT NULL,
    DEPT VARCHAR2(20) NOT NULL
);

CREATE TABLE SUBJECT(
    SUBNO NUMBER(10) CONSTRAINT PK_SN PRIMARY KEY,
    SUBTITLE VARCHAR2(30) NOT NULL
);

CREATE TABLE TAUGHTBY(
    TID NUMBER(10) CONSTRAINT FK_TID REFERENCES TEACHER(TID) ON DELETE CASCADE,
    SUBNO NUMBER(10) CONSTRAINT FK_SN REFERENCES SUBJECT(SUBNO) ON DELETE CASCADE,
    CONSTRAINT PK_TSNO PRIMARY KEY(TID,SUBNO)
);

INSERT INTO TEACHER VALUES(100,'Erik Demaine','CSE');
INSERT INTO STUDENT VALUES(40,'Vishal','Kolkata');
INSERT INTO SUBJECT VALUES('1001','Python');
INSERT INTO TAUGHTBY VALUES(100,'1001');

INSERT INTO TEACHER VALUES(101,'Richard Feynman','Physics');
INSERT INTO STUDENT VALUES(41,'Yakshini','Boston');
INSERT INTO SUBJECT VALUES('1002','Thermodynamics');
INSERT INTO TAUGHTBY VALUES(101,'1002');

SELECT * FROM TEACHER;
SELECT * FROM STUDENT ;
SELECT * FROM SUBJECT;
SELECT * FROM TAUGHTBY;


/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 5
SELECT T.NAME,T.DEPT FROM TEACHER T, SUBJECT S WHERE T.DEPT = 'Physics' AND S.SUBTITLE = 'Thermodynamics';

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/


-- Question 6
UPDATE SUBJECT SET SUBTITLE = 'RDBMS' WHERE SUBTITLE = 'DBMS'; /* Query of the question */
UPDATE SUBJECT SET SUBTITLE = 'RDBMS' WHERE SUBTITLE = 'Python'; /* According to my database */
/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 7
SELECT SNAME, ROLL FROM STUDENT WHERE CITY = 'Kolkata' AND ROLL BETWEEN 40 AND 60; /* According to my database */
SELECT SNAME, ROLL FROM STUDENT WHERE CITY = 'Kolkata' AND ROLL BETWEEN 20 AND 25;  /* Query of the question */
/*----------------------------------------------------------------------------------------------------------------------------------------------------*/


-- Question 8
SELECT SNAME, ROLL FROM STUDENT WHERE CITY = 'Kolkata' order by ROLL;

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/
CREATE TABLE ZIPCODES(
    ZIP NUMBER(10) CONSTRAINT PK_ZIP PRIMARY KEY,
    CITY VARCHAR2(20)
);

CREATE TABLE EMPLOYEES_5 (
    ENO NUMBER(5) CONSTRAINT PK_ENO1 PRIMARY KEY,
    ENAME VARCHAR2(20),
    ZIP NUMBER(10) CONSTRAINT FK_ZIP1 REFERENCES ZIPCODES(ZIP) ON DELETE CASCADE,
    HDATE DATE
);

CREATE TABLE PARTS(
    PNO NUMBER(10) CONSTRAINT PK_PNO1 PRIMARY KEY, 
    PNAME VARCHAR2(20) NOT NULL, 
    QOH NUMBER(10) NOT NULL, 
    PRICE NUMBER(10) NOT NULL, 
    LVL NUMBER(10)
);

CREATE TABLE CUSTOMERS_5(
    CNO NUMBER(10) CONSTRAINT PK_CNO1 PRIMARY KEY, 
    CNAME VARCHAR2(20) NOT NULL, 
    STREET VARCHAR2(20) NOT NULL, 
    ZIP NUMBER(10) CONSTRAINT FK_ZIP2 REFERENCES ZIPCODES(ZIP) ON DELETE CASCADE, 
    PHONE NUMBER(14)
);

CREATE TABLE ORDERS_5(
    ONO NUMBER(10) CONSTRAINT PK_ONO1 PRIMARY KEY,
    CNO NUMBER(10) CONSTRAINT FK_NO1 REFERENCES CUSTOMERS_5(CNO) ON DELETE CASCADE,
    ENO NUMBER(10) CONSTRAINT FK_NO2 REFERENCES EMPLOYEES_5(ENO) ON DELETE CASCADE,
    PRECEIVED DATE,
    SHIPPED DATE
);

CREATE TABLE ODETAILS(
    ONO NUMBER(20) CONSTRAINT FK_NO3 REFERENCES ORDERS_5(ONO) ON DELETE CASCADE,
    PNO NUMBER(20) CONSTRAINT FK_NO4 REFERENCES PARTS(PNO) ON DELETE CASCADE,
    QTY NUMBER(20) CONSTRAINT PK_QTY PRIMARY KEY 
);

INSERT INTO ZIPCODES VALUES(60000,'Jaipur');
INSERT INTO EMPLOYEES_5 VALUES(104,'Sumit',600001,'03/21/2002');
INSERT INTO PARTS VALUES(203,'Iphone',100,250000,2250);
INSERT INTO CUSTOMERS_5 VALUES(204,'Ishanvi','Lucknow',223098,9830067451);
INSERT INTO ORDERS_5 VALUES(401,302,100,'03/31/2002','12/18/2002');
INSERT INTO ODETAILS VALUES(400,202,25);

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- QUESTION 12
SELECT PNO, PNAME FROM PARTS WHERE PRICE < 20;

-- QUESTION 13
SELECT P.PNO FROM PARTS P, ODETAILS O WHERE P.PNO = O.PNO;

--QUESTION 14
SELECT CNAME FROM CUSTOMERS WHERE CNAME LIKE  'S%';

-- QUESTION 15
SELECT O.ONO,C.CNAME FROM ORDERS O,CUSTOMERS C WHERE O.SHIPPED IS NULL AND O.CNO = C.CNO;

-- QUESTION 16
SELECT C.CNAME, E.ENAME FROM CUSTOMERS C, EMPLOYEES E, ORDERS O WHERE O.CNO = C.CNO AND E.ENO = O.ENO;

-- QUESTION 17
SELECT * FROM EMPLOYEES WHERE HDATE = (SELECT MIN(HDATE) FROM EMPLOYEES);

-- QUESTION 18
SELECT P.PNO, P.PNAME, P.PRICE FROM PARTS P WHERE P.PRICE > 20000 GROUP BY P.PNO ASC;

SELECT * FROM PARTS WHERE PRICE > 20000 ORDER BY PNO;

-- QUESTION 19
SELECT P.PNO, P.PNAME FROM PARTS P, ODETAILS O WHERE O.PNO = P.PNO;

-- QUESTION 20
SELECT O.QTY FROM ODETAILS O, PARTS P WHERE O.PNO = P.PNO AND O.PNO = 10601;