--CREATE OR REPLACE PROCEDURE print_emp(v_input employees.employee_id%TYPE)
--IS 
--	v_row employees%ROWTYPE;
--BEGIN
--	SELECT employee_id, first_name, salary, department_id
--	INTO v_row.employee_id, v_row.first_name, v_row.salary, v_row.department_id
--	FROM EMPLOYEES 
--	WHERE employee_id = v_input;
--
--	dbms_output.put_line
--	(v_row.employee_id||' '||v_row.frist_name||' '||v_row.salary||' '||v_row.department_id);
--END print_emp;
--/
--
----예시
--create or replace PROCEDURE PRINT_EMP( v_input employees.EMPLOYEE_ID%TYPE )
--IS
--	v_row   employees%ROWTYPE;
--BEGIN
--	SELECT employee_id,  first_name, salary, department_id
--	INTO    v_row.employee_id, v_row.first_name, v_row.salary, v_row.department_id
--	FROM EMPLOYEES
--	WHERE EMPLOYEE_ID = v_input;
--
--	dbms_output.put_line
--	( v_row.employee_id||' '||v_row.first_name||' '||v_row.salary||' '||v_row.department_id);
--	
--END PRINT_EMP;
--/
--
--
--CREATE OR REPLACE procedure HR.rowtype_test
--(p_empno in employees.employee_id%TYPE )
--is
--    v_emp employees%ROWTYPE;
--begin 
--    dbms_output.enable;
--
--    select employee_id, first_name, hire_date
--    into   v_emp.employee_id, v_emp.first_name,v_emp.hire_date
--    FROM   employees
--    where  employee_id = p_empno;
--
--    DBMS_OUTPUT.PUT_LINE('EMP NO : '||v_emp.employee_id);
--    DBMS_OUTPUT.PUT_LINE('EMP NAME : '||v_emp.first_name);
--    DBMS_OUTPUT.PUT_LINE('EMP HIRE : '||v_emp.hire_date);
--
--end;


--CREATE OR REPLACE PROCEDURE HR.TABLE_TEST
--(v_deptno IN employees.DEPARTMENT_ID %TYPE)
--IS
--	-- 테이블의 선언
--	TYPE empno_table IS TABLE OF employees.employee_id%TYPE INDEX BY BINARY_INTEGER;
--	TYPE ename_table IS TABLE OF employees.first_name%TYPE INDEX BY BINARY_INTEGER;
--	TYPE sal_table      IS TABLE OF employees.salary%TYPE INDEX BY BINARY_INTEGER;
--
--	-- 테이블타입으로 변수 선언
--	empno_tab empno_table ; 
--	ename_tab ename_table ; 
--	sal_tab   sal_table;
--	i BINARY_INTEGER := 0;
--BEGIN   
--	DBMS_OUTPUT.ENABLE;
--
--	-- FOR 루프 사용
--                 -- 여기서 emp_list는 ( BINARY_INTEGER형 변수로) 1씩 증가
--	FOR emp_list IN ( SELECT employee_id, first_name, salary
--		        FROM employees 
--		      WHERE department_id = v_deptno ) LOOP
--	      i := i + 1;
--	      -- 테이블 변수에 검색된 결과를 넣는다
--		empno_tab(i) := emp_list.employee_id ;
--		ename_tab(i) := emp_list.first_name ;
--		sal_tab(i) := emp_list.salary ;
--	END LOOP;
--	
--	-- 1부터 i까지 FOR 문을 실행
--	FOR cnt IN 1..i LOOP
--		-- TABLE변수에 넣은 값을 뿌려줌
--		DBMS_OUTPUT.PUT_LINE( '사원번호 : ' || empno_tab(cnt) ); 
--		DBMS_OUTPUT.PUT_LINE( '사원이름 : ' || ename_tab(cnt) ); 
--		DBMS_OUTPUT.PUT_LINE( '사원급여 : ' || sal_tab(cnt));
--	END LOOP; 
--END TABLE_TEST;

CALL TABLE_TEST(100);

CALL record_test(200);

CALL UPDATE_TEST(500, 5000);