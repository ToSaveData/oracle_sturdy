--pl/sql
DECLARE 
vno varchar2(20);
BEGIN
	SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') INTO vno
	FROM dual;
	dbms_output.put_line(vno);
END;

--사번을 입력받아 해당 사원의 사번, 이름, 급여를 출력 하는 PL/SQL작성
DECLARE
v_empno hr.employees.employee_id%TYPE;
v_name hr.employees.first_name%TYPE;
v_sal hr.employees.salary%TYPE;
BEGIN
	SELECT employee_id, first_name, salary
	INTO v_empno, v_name, v_sal
	FROM hr.EMPLOYEES
	WHERE EMPLOYEE_ID = :empno;
	DBMS_OUTPUT.put_line(v_empno||' '||v_name||' '||v_sal);
END;



DECLARE
v_no1 NUMBER 
:= :no1;
v_no2 NUMBER := :no2;
v_sum NUMBER;

BEGIN
	v_sum := v_no1 + v_no2;
	DBMS_OUTPUT.PUT_LINE('첫번째 수: '||v_no1||', 두번째 수: '||v_no2||', 합은 : '||v_sum||'입니다');
END;

SELECT *
FROM hr.EMPLOYEES e ;

CREATE OR REPLACE FUNCTION HR.FC_UPDATE_SALARY(V_EMPNO IN NUMBER)
RETURN NUMBER
AS	
	PRAGMA AUTONOMOUS_TRANSACTION;
	V_SALARY EMPLOYEES.SALARY%TYPE;
BEGIN
	UPDATE EMPLOYEES 
	SET SALARY = SALARY * 1.1
	WHERE EMPLOYEE_ID = V_EMPNO;
	COMMIT;
	SELECT SALARY 
	INTO V_SALARY
	FROM EMPLOYEES
	WHERE EMPLOYEE_ID = V_EMPNO;
	RETURN V_SALARY;
END;

CREATE OR REPLACE PROCEDURE print_emp(v_input employees.employee_id%TYPE)
IS 
	v_row employees%ROWTYPE;
BEGIN
	SELECT employee_id, first_name, salary, department_id
	INTO v_row.employee_id, v_row.first_name, v_row.salary, v_row.department_id
	FROM HR.EMPLOYEES 
	WHERE employee_id = v_input;

	dbms_output.put_line
	(v_row.employee_id||' '||v_row.frist_name||' '||v_row.salary||' '||v_row.department_id);
END print_emp;
/
	