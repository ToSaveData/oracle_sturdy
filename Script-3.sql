SELECT 
	EMPLOYEE_ID, FIRST_NAME, SALARY 
FROM 
	EMPLOYEES
WHERE 
	SALARY = (SELECT 
					SALARY
			  FROM 
					EMPLOYEES
			  WHERE 
					FIRST_NAME = 'Den');

SELECT FIRST_NAME, SALARY, EMPLOYEE_ID 
FROM EMPLOYEES e 
WHERE SALARY = (SELECT
					min(SALARY)
				FROM 
					EMPLOYEES);
				
SELECT min(SALARY) 
FROM EMPLOYEES e 
				
SELECT FIRST_NAME, SALARY 
FROM EMPLOYEES
WHERE SALARY < (SELECT 
					avg(SALARY)
				FROM
					EMPLOYEES);

SELECT DEPARTMENT_ID, max(SALARY)
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID

SELECT 
	DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY  
FROM 
	EMPLOYEES e 
WHERE 
	(DEPARTMENT_ID, SALARY) IN (SELECT 
									DEPARTMENT_ID, max(SALARY)
								FROM
									EMPLOYEES
								GROUP BY DEPARTMENT_ID);
								
SELECT e.DEPARTMENT_ID, e.EMPLOYEE_ID, e.FIRST_NAME, e.SALARY  
FROM EMPLOYEES e , (SELECT 
						DEPARTMENT_ID, max(SALARY) SALARY 
					FROM
						EMPLOYEES
					GROUP BY
						DEPARTMENT_ID) s
WHERE 
	e.DEPARTMENT_ID = s.department_id
	AND e.SALARY  = s.salary;

--예제1
SELECT
	*
FROM
	EMPLOYEES e 
WHERE
	SALARY < (SELECT 
					avg(SALARY) 
			  from
					EMPLOYEES);

--예제2
SELECT 
	EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID 
FROM
	EMPLOYEES
WHERE 
	(DEPARTMENT_ID, SALARY) in (SELECT
									DEPARTMENT_ID, max(SALARY) 
							  FROM
							  		EMPLOYEES
							  GROUP BY 
							 		DEPARTMENT_ID) 
	
--예제3
SELECT 
	j.JOB_TITLE, s.sumsalary 
FROM 
	JOBS j, (SELECT 
					JOB_ID, sum(salary) sumsalary  
		     FROM 
		  			EMPLOYEES 
		     GROUP BY 
		  			JOB_ID) s 
WHERE j.JOB_ID = s.job_ID
ORDER BY 2 DESC;

--서브쿼리가 아닌 방식(join을 먼저 함)
 SELECT 
 	j.JOB_TITLE,  sum(e.SALARY) 
 FROM 
 	EMPLOYEES e, JOBS j
 WHERE						--group by 다음에는 where를 못 쓰지만 join 조건으로 where를 앞에서 쓰는건 가능 
 	e.JOB_ID = j.JOB_ID  
 GROUP BY
 	j.JOB_TITLE 

--예제4
SELECT 
	e.FIRST_NAME, e.LAST_NAME, e.SALARY 
FROM 
	EMPLOYEES e, (SELECT 
						DEPARTMENT_ID, avg(SALARY) salaryavg
				  FROM 
						EMPLOYEES 
				  GROUP BY
						DEPARTMENT_ID) s 
WHERE
	e.DEPARTMENT_ID = s.DEPARTMENT_ID
	AND SALARY > s.salaryavg;


SELECT 
		rownum,
		FIRST_NAME,
		salary
FROM (
		SELECT 
			FIRST_NAME,
			salary
		FROM 
			EMPLOYEES
		ORDER BY 2 DESC
	)
WHERE rownum <= 3 ;

SELECT 
		rn,
		FIRST_NAME,
		salary
FROM (
		SELECT 
			rownum rn,
			first_name,
			salary
		FROM(
				SELECT 
					first_name,
					salary
				FROM
					EMPLOYEES
				ORDER BY salary desc)
	)
WHERE 
	rn >= 11 
	AND rn <= 20;

--예제1
SELECT
	FIRST_NAME || LAST_NAME, SALARY, d.DEPARTMENT_NAME, e.HIRE_DATE  
FROM
	EMPLOYEES e, DEPARTMENTS d  
WHERE 
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
	AND HIRE_DATE  = (SELECT 
						max(HIRE_DATE)
					  FROM
					  	EMPLOYEES);
--예제2
SELECT
	EMPLOYEE_ID, FIRST_NAME, LAST_NAME, e.SALARY, a.avgsal, j.JOB_TITLE 
FROM
	EMPLOYEES e, JOBS j, (SELECT 
								DEPARTMENT_ID, 
								avg(SALARY) avgsal
						  FROM
						  		EMPLOYEES
						  GROUP BY
						  		DEPARTMENT_ID
						  ORDER BY
						  		2 desc) a
WHERE 
	a.DEPARTMENT_ID = e.DEPARTMENT_ID 
	AND e.JOB_ID = j.JOB_ID
	AND a.avgsal = (SELECT	
						max(avgsal)
				   FROM	
				   		(SELECT 
							DEPARTMENT_ID, avg(SALARY) avgsal
					  FROM
					  		EMPLOYEES
					  GROUP BY
					  		DEPARTMENT_ID ) sa);
	
--예제3
SELECT a.avgsal
FROM 
	DEPARTMENTS d , (SELECT DEPARTMENT_ID, avg(SALARY) avgsal 
				     FROM EMPLOYEES 
				     GROUP BY DEPARTMENT_ID) a
WHERE
	d.DEPARTMENT_ID = a.DEPARTMENT_ID
	AND a.avgsal = (SELECT max(sal)
				FROM (SELECT avg(salary) sal
				  	  FROM EMPLOYEES
					  GROUP BY DEPARTMENT_ID) avgs)

--예제4


--예제5
