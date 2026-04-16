SET SERVEROUTPUT ON;
DECLARE
    CURSOR c IS SELECT * FROM EMP WHERE Deptno = &dno;
    no_dept_exist EXCEPTION;
    v_flag NUMBER := 0;
BEGIN
    FOR rec IN c LOOP
        v_flag := 1;
        INSERT INTO EMP_BACKUP VALUES rec;
    END LOOP;

    IF v_flag = 0 THEN
        RAISE no_dept_exist;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Records Inserted');
    END IF;
EXCEPTION
    WHEN no_dept_exist THEN
        DBMS_OUTPUT.PUT_LINE('No Department Exists');
END;
/