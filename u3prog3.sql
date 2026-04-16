SET SERVEROUTPUT ON;
DECLARE
    v_name EMP.EName%TYPE;
    v_sal EMP.BasicSal%TYPE;
BEGIN
    v_name := '&name';
    SELECT BasicSal INTO v_sal FROM EMP WHERE EName = v_name;
    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_sal);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee Not Found');
END;
/