CREATE TABLE DEPARTMENT(DEPARTMENT_ID INT NOT NULL PRIMARY KEY, DEPARTMENT_NO INT NOT NULL,DEPARTMENT_NAME VARCHAR(20),LOCATION VARCHAR(20) DEFAULT 'TOKYO', VERSION INT);
CREATE TABLE ADDRESS(ADDRESS_ID INT NOT NULL PRIMARY KEY, STREET VARCHAR(20), VERSION INT);
CREATE TABLE EMPLOYEE(EMPLOYEE_ID INT NOT NULL PRIMARY KEY, EMPLOYEE_NO INT NOT NULL ,EMPLOYEE_NAME VARCHAR(20),MANAGER_ID INT,HIREDATE DATETIME,SALARY DECIMAL(7,2),DEPARTMENT_ID INT,ADDRESS_ID INT, VERSION INT, CONSTRAINT FK_DEPARTMENT_ID FOREIGN KEY(DEPARTMENT_ID) REFERENCES DEPARTMENT(DEPARTMENT_ID), CONSTRAINT FK_ADDRESS_ID FOREIGN KEY(ADDRESS_ID) REFERENCES ADDRESS(ADDRESS_ID));

CREATE TABLE COMP_KEY_DEPARTMENT(DEPARTMENT_ID1 INT NOT NULL, DEPARTMENT_ID2 INT NOT NULL, DEPARTMENT_NO INT NOT NULL,DEPARTMENT_NAME VARCHAR(20),LOCATION VARCHAR(20) DEFAULT 'TOKYO', VERSION INT, CONSTRAINT PK_COMP_KEY_DEPARTMENT PRIMARY KEY(DEPARTMENT_ID1, DEPARTMENT_ID2));
CREATE TABLE COMP_KEY_ADDRESS(ADDRESS_ID1 INT NOT NULL, ADDRESS_ID2 INT NOT NULL, STREET VARCHAR(20), VERSION INT, CONSTRAINT PK_COMP_KEY_ADDRESS PRIMARY KEY(ADDRESS_ID1, ADDRESS_ID2));
CREATE TABLE COMP_KEY_EMPLOYEE(EMPLOYEE_ID1 INT NOT NULL, EMPLOYEE_ID2 INT NOT NULL, EMPLOYEE_NO INT NOT NULL ,EMPLOYEE_NAME VARCHAR(20),MANAGER_ID1 INT,MANAGER_ID2 INT,HIREDATE DATETIME,SALARY DECIMAL(7,2),DEPARTMENT_ID1 INT,DEPARTMENT_ID2 INT,ADDRESS_ID1 INT,ADDRESS_ID2 INT,VERSION INT, CONSTRAINT PK_COMP_KEY_EMPLOYEE PRIMARY KEY(EMPLOYEE_ID1, EMPLOYEE_ID2), CONSTRAINT FK_COMP_KEY_DEPARTMENT_ID FOREIGN KEY(DEPARTMENT_ID1, DEPARTMENT_ID2) REFERENCES COMP_KEY_DEPARTMENT(DEPARTMENT_ID1, DEPARTMENT_ID2), CONSTRAINT FK_COMP_KEY_ADDRESS_ID FOREIGN KEY(ADDRESS_ID1, ADDRESS_ID2) REFERENCES COMP_KEY_ADDRESS(ADDRESS_ID1, ADDRESS_ID2));

CREATE TABLE LARGE_OBJECT(ID INTEGER NOT NULL PRIMARY KEY, BLOB_VALUE VARBINARY(MAX), CLOB_VALUE VARCHAR(MAX));

CREATE TABLE ID_GENERATOR(PK VARCHAR(20) NOT NULL PRIMARY KEY, VALUE INTEGER NOT NULL);
CREATE TABLE MY_ID_GENERATOR(MY_PK VARCHAR(20) NOT NULL PRIMARY KEY, MY_VALUE INTEGER NOT NULL);
CREATE TABLE AUTO_STRATEGY(ID INT IDENTITY PRIMARY KEY, VALUE VARCHAR(10));
CREATE TABLE IDENTITY_STRATEGY(ID INT IDENTITY PRIMARY KEY, VALUE VARCHAR(10));
CREATE TABLE SEQUENCE_STRATEGY(ID INT NOT NULL PRIMARY KEY, VALUE VARCHAR(10));
CREATE TABLE SEQUENCE_STRATEGY2(ID INT NOT NULL PRIMARY KEY, VALUE VARCHAR(10));
CREATE TABLE TABLE_STRATEGY(ID INT NOT NULL PRIMARY KEY, VALUE VARCHAR(10));
CREATE TABLE TABLE_STRATEGY2(ID INT NOT NULL PRIMARY KEY, VALUE VARCHAR(10));

INSERT INTO DEPARTMENT VALUES(1,10,'ACCOUNTING','NEW YORK',1);
INSERT INTO DEPARTMENT VALUES(2,20,'RESEARCH','DALLAS',1);
INSERT INTO DEPARTMENT VALUES(3,30,'SALES','CHICAGO',1);
INSERT INTO DEPARTMENT VALUES(4,40,'OPERATIONS','BOSTON',1);
INSERT INTO ADDRESS VALUES(1,'STREET 1',1);
INSERT INTO ADDRESS VALUES(2,'STREET 2',1);
INSERT INTO ADDRESS VALUES(3,'STREET 3',1);
INSERT INTO ADDRESS VALUES(4,'STREET 4',1);
INSERT INTO ADDRESS VALUES(5,'STREET 5',1);
INSERT INTO ADDRESS VALUES(6,'STREET 6',1);
INSERT INTO ADDRESS VALUES(7,'STREET 7',1);
INSERT INTO ADDRESS VALUES(8,'STREET 8',1);
INSERT INTO ADDRESS VALUES(9,'STREET 9',1);
INSERT INTO ADDRESS VALUES(10,'STREET 10',1);
INSERT INTO ADDRESS VALUES(11,'STREET 11',1);
INSERT INTO ADDRESS VALUES(12,'STREET 12',1);
INSERT INTO ADDRESS VALUES(13,'STREET 13',1);
INSERT INTO ADDRESS VALUES(14,'STREET 14',1);
INSERT INTO EMPLOYEE VALUES(1,7369,'SMITH',13,'1980-12-17',800,2,1,1);
INSERT INTO EMPLOYEE VALUES(2,7499,'ALLEN',6,'1981-02-20',1600,3,2,1);
INSERT INTO EMPLOYEE VALUES(3,7521,'WARD',6,'1981-02-22',1250,3,3,1);
INSERT INTO EMPLOYEE VALUES(4,7566,'JONES',9,'1981-04-02',2975,2,4,1);
INSERT INTO EMPLOYEE VALUES(5,7654,'MARTIN',6,'1981-09-28',1250,3,5,1);
INSERT INTO EMPLOYEE VALUES(6,7698,'BLAKE',9,'1981-05-01',2850,3,6,1);
INSERT INTO EMPLOYEE VALUES(7,7782,'CLARK',9,'1981-06-09',2450,1,7,1);
INSERT INTO EMPLOYEE VALUES(8,7788,'SCOTT',4,'1982-12-09',3000.0,2,8,1);
INSERT INTO EMPLOYEE VALUES(9,7839,'KING',NULL,'1981-11-17',5000,1,9,1);
INSERT INTO EMPLOYEE VALUES(10,7844,'TURNER',6,'1981-09-08',1500,3,10,1);
INSERT INTO EMPLOYEE VALUES(11,7876,'ADAMS',8,'1983-01-12',1100,2,11,1);
INSERT INTO EMPLOYEE VALUES(12,7900,'JAMES',6,'1981-12-03',950,3,12,1);
INSERT INTO EMPLOYEE VALUES(13,7902,'FORD',4,'1981-12-03',3000,2,13,1);
INSERT INTO EMPLOYEE VALUES(14,7934,'MILLER',7,'1982-01-23',1300,1,14,1);

INSERT INTO COMP_KEY_DEPARTMENT VALUES(1,1,10,'ACCOUNTING','NEW YORK',1);
INSERT INTO COMP_KEY_DEPARTMENT VALUES(2,2,20,'RESEARCH','DALLAS',1);
INSERT INTO COMP_KEY_DEPARTMENT VALUES(3,3,30,'SALES','CHICAGO',1);
INSERT INTO COMP_KEY_DEPARTMENT VALUES(4,4,40,'OPERATIONS','BOSTON',1);
INSERT INTO COMP_KEY_ADDRESS VALUES(1,1,'STREET 1',1);
INSERT INTO COMP_KEY_ADDRESS VALUES(2,2,'STREET 2',1);
INSERT INTO COMP_KEY_ADDRESS VALUES(3,3,'STREET 3',1);
INSERT INTO COMP_KEY_ADDRESS VALUES(4,4,'STREET 4',1);
INSERT INTO COMP_KEY_ADDRESS VALUES(5,5,'STREET 5',1);
INSERT INTO COMP_KEY_ADDRESS VALUES(6,6,'STREET 6',1);
INSERT INTO COMP_KEY_ADDRESS VALUES(7,7,'STREET 7',1);
INSERT INTO COMP_KEY_ADDRESS VALUES(8,8,'STREET 8',1);
INSERT INTO COMP_KEY_ADDRESS VALUES(9,9,'STREET 9',1);
INSERT INTO COMP_KEY_ADDRESS VALUES(10,10,'STREET 10',1);
INSERT INTO COMP_KEY_ADDRESS VALUES(11,11,'STREET 11',1);
INSERT INTO COMP_KEY_ADDRESS VALUES(12,12,'STREET 12',1);
INSERT INTO COMP_KEY_ADDRESS VALUES(13,13,'STREET 13',1);
INSERT INTO COMP_KEY_ADDRESS VALUES(14,14,'STREET 14',1);
INSERT INTO COMP_KEY_EMPLOYEE VALUES(1,1,7369,'SMITH',13,13,'1980-12-17',800,2,2,1,1,1);
INSERT INTO COMP_KEY_EMPLOYEE VALUES(2,2,7499,'ALLEN',6,6,'1981-02-20',1600,3,3,2,2,1);
INSERT INTO COMP_KEY_EMPLOYEE VALUES(3,3,7521,'WARD',6,6,'1981-02-22',1250,3,3,3,3,1);
INSERT INTO COMP_KEY_EMPLOYEE VALUES(4,4,7566,'JONES',9,9,'1981-04-02',2975,2,2,4,4,1);
INSERT INTO COMP_KEY_EMPLOYEE VALUES(5,5,7654,'MARTIN',6,6,'1981-09-28',1250,3,3,5,5,1);
INSERT INTO COMP_KEY_EMPLOYEE VALUES(6,6,7698,'BLAKE',9,9,'1981-05-01',2850,3,3,6,6,1);
INSERT INTO COMP_KEY_EMPLOYEE VALUES(7,7,7782,'CLARK',9,9,'1981-06-09',2450,1,1,7,7,1);
INSERT INTO COMP_KEY_EMPLOYEE VALUES(8,8,7788,'SCOTT',4,4,'1982-12-09',3000.0,2,2,8,8,1);
INSERT INTO COMP_KEY_EMPLOYEE VALUES(9,9,7839,'KING',NULL,NULL,'1981-11-17',5000,1,1,9,9,1);
INSERT INTO COMP_KEY_EMPLOYEE VALUES(10,10,7844,'TURNER',6,6,'1981-09-08',1500,3,3,10,10,1);
INSERT INTO COMP_KEY_EMPLOYEE VALUES(11,11,7876,'ADAMS',8,8,'1983-01-12',1100,2,2,11,11,1);
INSERT INTO COMP_KEY_EMPLOYEE VALUES(12,12,7900,'JAMES',6,6,'1981-12-03',950,3,3,12,12,1);
INSERT INTO COMP_KEY_EMPLOYEE VALUES(13,13,7902,'FORD',4,4,'1981-12-03',3000,2,2,13,13,1);
INSERT INTO COMP_KEY_EMPLOYEE VALUES(14,14,7934,'MILLER',7,7,'1982-01-23',1300,1,1,14,14,1);

INSERT INTO ID_GENERATOR VALUES('TABLE_STRATEGY_ID', 1);
INSERT INTO MY_ID_GENERATOR VALUES('TableStrategy2', 1);

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_NONE_PARAM] 
AS
BEGIN
    SET NOCOUNT ON;
END
GO

CREATE PROCEDURE [dbo].[PROC_SIMPLETYPE_PARAM]
    @param1 int
AS
BEGIN
    SET NOCOUNT ON;
END
GO

CREATE PROCEDURE [dbo].[PROC_DTO_PARAM]
    @param1 int,
    @param2 int OUTPUT,
    @param3 int OUTPUT
AS
BEGIN
    SET @param2 = @param2 + @param1;
    SET @param3 = @param1;
END
GO

CREATE PROCEDURE [dbo].[PROC_RESULTSET]
    @employeeId int
AS
BEGIN
    SELECT * FROM EMPLOYEE WHERE employee_id > @employeeId ORDER BY employee_id;
END
GO

CREATE PROCEDURE [dbo].[PROC_RESULTSET_OUT]
    @employeeId int,
    @employeeCount int OUTPUT
AS
BEGIN
    SELECT * FROM EMPLOYEE WHERE employee_id > @employeeId ORDER BY employee_id;
    SELECT @employeeCount = COUNT(*) FROM EMPLOYEE;
END
GO

CREATE PROCEDURE [dbo].[PROC_RESULTSET_UPDATE]
    @employeeId int
AS
BEGIN
    SELECT * FROM EMPLOYEE WHERE employee_id > @employeeId ORDER BY employee_id;
    UPDATE DEPARTMENT SET DEPARTMENT_NAME = 'HOGE' WHERE department_id = 1;
END
GO

CREATE PROCEDURE [dbo].[PROC_RESULTSETS]
    @employeeId int,
    @departmentId int
AS
BEGIN
    SELECT * FROM EMPLOYEE WHERE employee_id > @employeeId ORDER BY employee_id;  
    SELECT * FROM DEPARTMENT WHERE department_id > @departmentId ORDER BY department_id;
END
GO

CREATE PROCEDURE [dbo].[PROC_RESULTSETS_UPDATES_OUT]
    @employeeId int,
    @departmentId int,
    @employeeCount int OUTPUT
AS
BEGIN
    SELECT * FROM EMPLOYEE WHERE employee_id > @employeeId ORDER BY employee_id;
    UPDATE ADDRESS SET STREET = 'HOGE' WHERE address_id = 1;
    SELECT * FROM DEPARTMENT WHERE department_id > @departmentId ORDER BY department_id;
    UPDATE ADDRESS SET STREET = 'FOO' WHERE address_id = 2;
    SELECT @employeeCount = COUNT(*) FROM EMPLOYEE;
END
GO

CREATE FUNCTION [dbo].[FUNC_NONE_PARAM] ()
RETURNS int
AS
BEGIN
    RETURN 10;
END
GO

CREATE FUNCTION [dbo].[FUNC_SIMPLETYPE_PARAM] (
    @param1 int)
RETURNS int
AS
BEGIN
    RETURN 20;
END
GO

CREATE FUNCTION [dbo].[FUNC_DTO_PARAM](
    @param1 int,
    @param2 int)
RETURNS int
AS
BEGIN
    RETURN @param2 + @param1;
END
GO