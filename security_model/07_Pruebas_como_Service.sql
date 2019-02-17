USE [SGSSOCODE]
GO

--Funciona
-----------------------------------------------

DECLARE @RC int
DECLARE @name varchar(255)
DECLARE @description varchar(255)

EXECUTE @RC = [dbo].[InsertDepartment] 
   @name = 'Nuevo'
  ,@description = 'Prueba de insersion Con Reporting'
GO


--NO funciona
-----------------------------------------------

DECLARE @RC int
DECLARE @department_id int

-- TODO: Set parameter values here.

EXECUTE @RC = [dbo].[GetDepartment] 
   @department_id = 1
GO

