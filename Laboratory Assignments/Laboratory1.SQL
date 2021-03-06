-- LABORATORY 1
/*----------------------------------------------------------------------------------------------------------------------------------------------------*/
-- Question 1
/* DEPARTMENT TABLE */
CREATE TABLE DEPT(
    DNO number(2) constraints PK_DNO primary key , 
    DNAME varchar2(15),
    LOC varchar2(20)
);

/* EMPLOYEE TABLE */
CREATE TABLE EMP(
    EMPNO number(4) constraints PK_ENO primary key,
    ENAME varchar2(10),
    JOB varchar2(15),
    MGR number(4) constraints FK_MGR references EMP(EMPNO) on delete cascade,
    HIREDATE date,
    SAL number(5),
    COMM number(5),
    DEPTNO number(2) constraints FK_DNO references DEPT(DNO) on delete cascade
);

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/
-- Question 2
ALTER TABLE EMP ADD Phone number(10);
/*----------------------------------------------------------------------------------------------------------------------------------------------------*/
--Question 3
ALTER TABLE EMP MODIFY JOB char(20); /*Adding the new attribute Phone to EMP*/
desc EMP;
ALTER TABLE EMP MODIFY JOB varchar2(20); /*Changing attribute of JOB from Char->Varchar2 && Varchar2->Char*/
/*----------------------------------------------------------------------------------------------------------------------------------------------------*/
-- Question 4
ALTER TABLE EMP DROP Column Phone; /*Deleting the attribute Phone from EMP table*/
/*----------------------------------------------------------------------------------------------------------------------------------------------------*/
-- Question 5 [Describing the Tables]
desc DEPT;
desc EMP;
/*----------------------------------------------------------------------------------------------------------------------------------------------------*/
--Question 6

/* INSERTING INTO THE DEPT TABLES */
insert into dept values(10,'Accounting','New York');
insert into dept values(20,'Research','Dallas');
insert into dept values(30,'Sales','Chicago');
insert into dept values(40,'Operations','Boston');

/* INSERTING INTO THE EMP TABLES */
select * from emp;

insert into emp values(7839,'King','President',NULL,'11/17/1981',5000,NULL,10);

insert into emp values(7566,'Jones','Manager',7839,'04/02/1981',2975,NULL,20);
insert into emp values(7698,'Blake','Manager',7839,'05/01/1981',2850,NULL,30);
insert into emp values(7782,'Clark','Manager',7839,'06/09/1981',2450,NULL,10);

insert into emp values(7788,'Scott','Analyst',7566,'12/09/1982',3000,NULL,20);
insert into emp values(7902,'Ford','Analyst',7566,'12/04/1981',3000,NULL,20);

insert into emp values(7499,'Allen','Salesman',7698,'02/20/1981',1600,300,30);
insert into emp values(7521,'Ward','Salesman',7698,'02/22/1981',1250,500,30);
insert into emp values(7654,'Martin','Salesman',7698,'09/28/1981',1250,1400,30);
insert into emp values(7844,'Turner','Salesman',7698,'09/08/1981',1500,500,30);
insert into emp values(7900,'James','Clerk',7698,'12/03/1981',950,NULL,30);

insert into emp values(7369,'Smith','Clerk',7902,'12/17/1980',800,NULL,20);
insert into emp values(7876,'Adams','Clerk',7788,'01/12/1983',1100,NULL,20);
insert into emp values(7934,'Miller','Clerk',7782,'01/23/1982',1300,NULL,10);
/*----------------------------------------------------------------------------------------------------------------------------------------------------*/
-- Question 7
select * from dept;
select * from emp;
/*----------------------------------------------------------------------------------------------------------------------------------------------------*/
-- Question 8
CREATE TABLE SALESPEOPLE(
    snum number(10) constraints PK_SNUM primary key,
    sname varchar2(20),
    city varchar2(20),
    comm number(5)
);
/*----------------------------------------------------------------------------------------------------------------------------------------------------*/
-- Question 9
drop table SALESPEOPLE;
/*----------------------------------------------------------------------------------------------------------------------------------------------------*/
--Question 10
CREATE TABLE CLIENT_MASTER(
    ClientNo varchar2(6) constraint PK_CNO primary key check(ClientNo like 'C%'),
    Name varchar2(20) NOT NULL,
    City varchar2(15),
    PinCode number(8),
    State varchar2(15),
    BalanceDue number(10,2)
);

CREATE TABLE PRODUCT_MASTER(
    ProductNo varchar2(6) constraint PK_PNO primary key check(ProductNo like 'P%'),
    Description varchar2(15) NOT NULL,
    ProfitPercent number(4,2) NOT NULL,
    UnitMeasure varchar2(10) NOT NULL,
    QtyInHand number(8) NOT NULL,
    ReorderLvl number(8) NOT NULL,
    SellPrice number(8,2) NOT NULL check(SellPrice <> 0),
    CostPrice number(8,2) NOT NULL check(CostPrice <> 0)
);

CREATE TABLE SALESMAN_MASTER(
    SalesmanNo varchar2(6) constraint PK_SLNO primary key check(SalesmanNo like 'S%'),
    Name varchar2(20) NOT NULL,
    Address1 varchar2(10) NOT NULL,
    Address2 varchar2(10),
    City varchar2(20),
    Pincode number(7),
    State varchar2(20),
    Sal number(8,2) NOT NULL check(Sal <> 0),
    TgtToGet number(6,2) NOT NULL check(TgtToGet <> 0),
    YtdSales number(6,2) NOT NULL,
    Remarks varchar2(20)
);

CREATE TABLE SALES_ORDER(
    OrderNo varchar2(6) constraint PK_ORNO primary key check(OrderNo like 'O%'),
    OrderDate date,
    ClientNo varchar2(6) constraint FK_CNO references CLIENT_MASTER(ClientNo) on delete cascade,
    DelyAddress varchar2(25),
    SalesmanNo varchar2(6) constraint FK_SLNO references SALESMAN_MASTER(SalesmanNo) on delete cascade,
    DelyType char(1) default 'F',
    BilledYN char(1),
    DelyDate date, 
    OrderStatus varchar2(10),
    constraint K_DelyType check(DelyType in ('P','F')),
    constraint K_DelyDate check(DelyDate > OrderDate),
    constraint K_OrderStatus check(OrderStatus in ('In Process', 'Fulfilled', 'Back Order', 'Cancelled'))
);

CREATE TABLE SALES_ORDER_DETAILS(
    OrderNo varchar2(6) constraint FK_ONO references SALES_ORDER(OrderNo) on delete cascade,
    ProductNo varchar2(6) constraint FK_PNO references PRODUCT_MASTER(ProductNo) on delete cascade,
    QtyOrdered number(8),
    QtyDisp number(8),
    ProductRate number(10,2)    
);

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

/* INSERTING THE VALUES INTO THE CLIENT MASTER */
insert into CLIENT_MASTER values('C00001','Ivan Baybross','Mumbai',400054,'Maharashtra',15000);
insert into CLIENT_MASTER values('C00002','Mamta Mazumdar','Madras',780001,'Tamil Nadu',0);
insert into CLIENT_MASTER values('C00003','Chhaya Bankar','Mumbai',400057,'Maharashtra',5000);
insert into CLIENT_MASTER values('C00004','Ashwini Joshi','Bangalore',560001,'Karnataka',0);
insert into CLIENT_MASTER values('C00005','Hansel Colaco','Mumbai',400060,'Maharashtra',2000);
insert into CLIENT_MASTER values('C00006','Deepak Sharma','Mangalore',560050,'Karnataka',0);

/* INSERTING THE VALUES INTO THE PRODUCT MASTER */
insert into PRODUCT_MASTER values('P00001','T-Shirts',5,'Piece',200,50,350,250);
insert into PRODUCT_MASTER values('P0345','Shirts',6,'Piece',150,50,500,350);
insert into PRODUCT_MASTER values('P06734','Cotton Jeans',5,'Piece',100,20,600,450);
insert into PRODUCT_MASTER values('P07865','Jeans',5,'Piece',100,20,750,500);
insert into PRODUCT_MASTER values('P07868','Trousers',2,'Piece',150,50,850,550);
insert into PRODUCT_MASTER values('P07885','PullOver',2.5,'Piece',80,30,700,450);
insert into PRODUCT_MASTER values('P07965','Denim Shirts',4,'Piece',100,40,350,250);
insert into PRODUCT_MASTER values('P07975','Lyers Tops',5,'Piece',70,30,300,175);
insert into PRODUCT_MASTER values('P08865','Skirts',5,'Piece',75,30,450,300);

/* INSERTING THE VALUES INTO THE SALESMAN MASTER */
insert into SALESMAN_MASTER values('S00001','Aman','A/14','Jadavpur','Kolkata', 700032,'West Bengal', 3000,100,50, 'Good');
insert into SALESMAN_MASTER values('S00002','Omkar','65','Chandni','Delhi',110006,'Delhi',3000,200,100,'Good');
insert into SALESMAN_MASTER values('S00003','Raj','P-7','Bandra','Mumbai',400032,'Maharashtra',3000,200,100,'Good');
insert into SALESMAN_MASTER values('S00004','Ashish','A/5','Agara','Bengaluru',560034,'Karnataka',3500,200,150,'Good');

/* INSERTING THE VALUES INTO THE SALES ORDER */
insert into SALES_ORDER values('O19001','06/10/2002','C00001','New York','S00001','F','N','06/20/2002','In Process');
insert into SALES_ORDER values('O19002','06/15/2002','C00002','Boston','S00002','P','N','06/27/2002','Cancelled');
insert into SALES_ORDER values('O46865','02/11/2002','C00003','Oslo','S00003','F','Y','02/20/2002','Fulfilled');
insert into SALES_ORDER values('O19003','03/15/2002','C00001','New Delhi','S00001','F','Y','04/07/2002','Fulfilled');
insert into SALES_ORDER values('O46866','05/12/2002','C00004','Qatar','S00002','P','N','05/22/2002','Cancelled');
insert into SALES_ORDER values('O19008','07/14/2002','C00005','Madrid','S00004','F','N','07/26/2002','In Process');

/* INSERTING THE VALUES INTO THE SALES ORDER DETAILS*/
insert into SALES_ORDER_DETAILS values('O19001','P00001',4,4,525);
insert into SALES_ORDER_DETAILS values('O19001','P07965',2,1,8400);
insert into SALES_ORDER_DETAILS values('O19001','P07885',2,1,5250);
insert into SALES_ORDER_DETAILS values('O19002','P00001',10,0,525);
insert into SALES_ORDER_DETAILS values('O46865','P07868',3,3,3150);
insert into SALES_ORDER_DETAILS values('O46865','P07885',3,1,5250);
insert into SALES_ORDER_DETAILS values('O46865','P00001',10,10,525);
insert into SALES_ORDER_DETAILS values('O46865','P0345',4,4,1050);
insert into SALES_ORDER_DETAILS values('O19003','P03453',2,2,1050);
insert into SALES_ORDER_DETAILS values('O19003','P06734',1,1,12000);
insert into SALES_ORDER_DETAILS values('O46866','P07965',1,0,8400);
insert into SALES_ORDER_DETAILS values('O46866','P07965',1,0,1050);
insert into SALES_ORDER_DETAILS values('O19008','P00001',10,5,525);
insert into SALES_ORDER_DETAILS values('O19008','P07975',5,3,1050);