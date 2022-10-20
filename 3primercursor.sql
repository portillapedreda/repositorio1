-- CURSOR

USE AdventureWorks2017
GO
DECLARE Employee_Cursor CURSOR FOR
    SELECT BusinessEntityID, JobTitle
	FROM AdventureWorks2017.HumanResources.Employee;
OPEN Employee_Cursor;
FETCH NEXT FROM Employee_Cursor;
WHILE @@FETCH_STATUS = 0
    BEGIN
	    FETCH NEXT FROM Employee_Cursor
	END;
CLOSE Employee_Cursor;
DEALLOCATE Employee_Cursor;


CREATE OR ALTER PROC EMPLOYEE_CURSOR
AS
       DECLARE Employee_Cursor CURSOR FOR
          SELECT BusinessEntityID, JobTitle
	      FROM AdventureWorks2017.HumanResources.Employee;
       OPEN Employee_Cursor;
       FETCH NEXT FROM Employee_Cursor;
       WHILE @@FETCH_STATUS = 0
          BEGIN
	          FETCH NEXT FROM Employee_Cursor
	      END;
       CLOSE Employee_Cursor;
       DEALLOCATE Employee_Cursor;
GO
EXEC EMPLOYEE_CURSOR
GO


