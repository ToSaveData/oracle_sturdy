SELECT CONCAT('A', 'B') FROM dual;

SELECT *
FROM EMPLOYEES e 
WHERE department_id = 50;

CREATE OR REPLACE VIEW emp_v1 AS
SELECT *
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID = 50;

SELECT *
FROM emp_v1;

SELECT *FROM emp_v1
WHERE salary > 2500;

CREATE OR REPLACE VIEW emp_v2 AS
SELECT e.EMPLOYEE_ID , e.FIRST_NAME , e.LAST_NAME , e.SALARY 
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID = 10
UNION
SELECT e.EMPLOYEE_ID, e.FIRST_NAME , e.LAST_NAME , e.SALARY
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID = 20;

SELECT *
FROM emp_v2;

SELECT * FROM EMPLOYEES e WHERE e.EMPLOYEE_ID in(10, 20);

SELECT /*+ use merge(e, d)*/ 
	e.EMPLOYEE_ID, e.FIRST_NAME, d.DEPARTMENT_NAME  
FROM EMPLOYEES e , DEPARTMENTS d 
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID; 

SELECT
	e.EMPLOYEE_ID, e.FIRST_NAME, d.DEPARTMENT_NAME
FROM EMPLOYEES e , DEPARTMENTS d 
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID



SELECT 
   (SELECT VALUE FROM NLS_DATABASE_PARAMETERS WHERE PARAMETER='NLS_LANGUAGE')
    || '_' ||
    (SELECT VALUE FROM NLS_DATABASE_PARAMETERS WHERE PARAMETER='NLS_TERRITORY')
    || '.' ||
    (SELECT VALUE FROM NLS_DATABASE_PARAMETERS WHERE PARAMETER='NLS_CHARACTERSET')
FROM DUAL


