SET SERVEROUTPUT ON;
DECLARE
    v_name RESULT.Name%TYPE;
BEGIN
    v_name := '&name';
    FOR rec IN (SELECT * FROM RESULT WHERE Name = v_name)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Result Found for ' || rec.Name);
    END LOOP;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE NO_DATA_FOUND;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Student Not Found');
END;
/