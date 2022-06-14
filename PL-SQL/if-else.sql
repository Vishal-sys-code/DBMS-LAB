SET SERVEROUTPUT ON

DECLARE 
    a number(2) := 50;

BEGIN
    IF(a<42) THEN
        dbms_output.put_line('a is less than 42');
    ELSE
        dbms_output.put_line('a is greater than 42');
    END IF;
        dbms_output.put_line('value of a is : ' || a);
END;
/

SET SERVEROUTPUT OFF