DECLARE
    
BEGIN
    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('NUMBER IS : ' || i);
    END LOOP;
END;
/ 