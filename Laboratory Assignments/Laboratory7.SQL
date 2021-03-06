-- LABORATORY 7
/*----------------------------------------------------------------------------------------------------------------------------------------------------*/
SELECT * FROM EMP;
SELECT * FROM DEPT;
/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 1
SELECT ENAME FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP);

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 2
SELECT ENAME FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP WHERE JOB LIKE 'Salesman%');

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 3
SELECT ENAME FROM EMP WHERE SAL = (SELECT MIN(SAL) FROM EMP WHERE JOB LIKE 'Clerk%');

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 4[CORELATED]
SELECT * FROM DEPT WHERE DEPTNO IN (SELECT DEPTNO FROM EMP GROUP BY DEPTNO WHERE AVG(SAL) = (SELECT MAX(AVG(SAL)) FROM EMP GROUP BY DEPT NO));

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 5 [BOTH ARE SAME]
SELECT ENAME FROM EMP WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME LIKE 'Turner%');
SELECT ENAME FROM EMP WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'Turner');

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 6
SELECT ENAME FROM EMP WHERE HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME LIKE 'Allen%');
SELECT ENAME FROM EMP WHERE HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME = 'Allen');

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 7
SELECT DNAME FROM DEPT WHERE DNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'Ford');
SELECT DNAME FROM DEPT WHERE DNO = (SELECT DEPTNO FROM EMP WHERE ENAME LIKE 'Ford%');

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 8
SELECT DNAME FROM DEPT WHERE DNO = (SELECT DEPTNO NO FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP));

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 9
SELECT LOC FROM DEPT WHERE DNO = (SELECT DEPTNO FROM EMP WHERE ENAME LIKE 'Smith%');
SELECT LOC FROM DEPT WHERE DNO = (SELECT DEPTNO FROM EMP WHERE ENAME  = 'Smith');

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 10
SELECT DNAME,LOC FROM DEPT WHERE DNO IN (SELECT DEPTNO FROM EMP WHERE JOB = 'Manager');

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/


-- Question 11 [Grade]
SELECT 

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 12
SELECT * FROM EMP WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = (SELECT DNO FROM DEPT WHERE LOC LIKE 'Dallas%'));
SELECT * FROM EMP WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = (SELECT DNO FROM DEPT WHERE LOC = 'Dallas'));

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 13
SELECT DNAME FROM DEPT WHERE DNO NOT IN (SELECT DEPTNO FROM EMP);

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 14
SELECT ENAME FROM EMP WHERE HIREDATE = (SELECT HIREDATE FROM EMP WHERE ENAME = 'Adams');

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 15
SELECT DNAME FROM DEPT WHERE DNO IN (SELECT DEPTNO FROM EMP WHERE COMM > 0);

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 16
SELECT ENAME FROM EMP WHERE SAL IN (SELECT MIN(SAL) FROM EMP GROUP BY DEPTNO);

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/

-- Question 17
SELECT DNAME,DNO FROM DEPT D JOIN (SELECT DEPTNO,COUNT(*) AS COUNT FROM EMP GROUP BY DEPTNO) E ON D.DNO = E.DEPTNO WHERE COUNT>1;

/*----------------------------------------------------------------------------------------------------------------------------------------------------*/