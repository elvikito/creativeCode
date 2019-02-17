-- GET
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- PROCEDURE GetEmployee
-- ----------------------------
select * from [dbo].[Employee];
IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[GetEmployee]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetEmployee];
END
GO

CREATE PROCEDURE [dbo].[GetEmployee]
(
	@employee_id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT employee_id
		  ,person_id
		  ,ci
		  ,address
		  ,birth_date
		  ,gender
		  ,phone_number  
		  ,picture
		  ,created_at
		  ,updated_at
    FROM dbo.Employee
	WHERE employee_id = @employee_id;
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[GetEmployee] TO [RoleReporting] AS [dbo];
GO

PRINT 'Procedure [dbo].[GetEmployee] created';
GO

-- GET
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- PROCEDURE GetAccident
-- ----------------------------

IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[GetAccident]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetAccident];
END
GO

CREATE PROCEDURE [dbo].[GetAccident]
(
	@accident_id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT accident_id
           ,employee_id
           ,accident_type_id
           ,cause
           ,date_init
           ,start_lost_time
           ,end_lost_time
           ,day_lost
           ,severity
           ,turn
           ,created_at
           ,updated_at
    FROM dbo.Accident
	WHERE accident_id = @accident_id;
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[GetAccident] TO [RoleReporting] AS [dbo];
GO

PRINT 'Procedure [dbo].[GetAccident] created';
GO

-- GET
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- PROCEDURE GetDepartment
-- ----------------------------

IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[GetDepartment]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetDepartment];
END
GO

CREATE PROCEDURE [dbo].[GetDepartment]
(
	@department_id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT department_id
           ,name
           ,description
           ,created_at
           ,updated_at
    FROM dbo.Department
	WHERE department_id = @department_id;
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[GetDepartment] TO [RoleReporting] AS [dbo];
GO

PRINT 'Procedure [dbo].[GetDepartment] created';
GO
-- GET
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- PROCEDURE GetPerson
-- ----------------------------

IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[GetPerson]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetPerson];
END
GO

CREATE PROCEDURE [dbo].[GetPerson]
(
	@person_id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT person_id
           ,first_name
           ,last_name
           ,email
           ,created_at
           ,updated_at
    FROM dbo.Person
	WHERE person_id = @person_id;
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[GetPerson] TO [RoleReporting] AS [dbo];
GO

PRINT 'Procedure [dbo].[GetPerson] created';
GO

-- GET
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- PROCEDURE GetProject
-- ----------------------------

IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[GetProject]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetProject];
END
GO

CREATE PROCEDURE [dbo].[GetProject]
(
	@project_id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT project_id
           ,name_project
           ,design_project
           ,location_project
           ,budget_project
           ,start_date_project
           ,ending_date_project
           ,created_at
           ,updated_at
    FROM dbo.Project
	WHERE project_id = @project_id;
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[GetProject] TO [RoleReporting] AS [dbo];
GO

PRINT 'Procedure [dbo].[GetProject] created';
GO

-- GET
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- PROCEDURE GetRole
-- ----------------------------

IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[GetRole]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[GetRole];
END
GO

CREATE PROCEDURE [dbo].[GetRole]
(
	@role_id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	SELECT role_id
           ,role_name
           ,description
           ,created_at
           ,updated_at
    FROM dbo.Role
	WHERE role_id = @role_id;
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[GetRole] TO [RoleReporting] AS [dbo];
GO

PRINT 'Procedure [dbo].[GetRole] created';
GO


-- POST 
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- PROCEDURE InsertEmployee
-- ----------------------------

IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[InsertEmployee]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertEmployee];
END
GO

CREATE PROCEDURE [dbo].[InsertEmployee] (
     @person_id     INT
	,@ci           INT
	,@address      VARCHAR(255)
	,@birth_date   DATETIME
	,@gender       VARCHAR(8)
	,@phone_number INT
	,@picture      VARBINARY(MAX)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    INSERT INTO [dbo].[Employee] (
		 [person_id]
		,[ci]
		,[address]
		,[birth_date]
		,[gender]
		,[phone_number]
		,[picture]
	)
	VALUES (
		 @person_id
		,@ci
		,@address
		,@birth_date
		,@gender
		,@phone_number
		,@picture
	);
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[InsertEmployee] TO [RoleReporting] AS [dbo];
GO

PRINT 'Procedure [dbo].[InsertEmployee] created';
GO

IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[UpdateEmployee]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateEmployee];
END
GO

CREATE PROCEDURE [dbo].[UpdateEmployee] (
	 @person_id  INT
	,@ci           INT
	,@address      VARCHAR(255)
	,@birth_date   DATETIME
	,@gender       VARCHAR(8)
	,@phone_number INT
	,@picture      VARBINARY(MAX)
    ,@created_at   DATETIME
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[Employee]
	SET   [ci]       = @ci
	     ,[address]      = @address
	     ,[birth_date]   = @birth_date
	     ,[gender]       = @gender
	     ,[phone_number] = @phone_number
	     ,[picture]      = @picture
         ,[created_at]   = @created_at
         ,[updated_at]   = GETDATE()
	WHERE person_id = @person_id;
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[UpdateEmployee] TO [RoleReporting] AS [dbo];
GO

PRINT 'Procedure [dbo].[UpdateEmployee] created';
GO


-- POST 
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- PROCEDURE InsertPerson
-- ----------------------------
IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[InsertPerson]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertPerson];
END
GO

CREATE PROCEDURE [dbo].[InsertPerson] (
     @first_name    VARCHAR(50)
    ,@last_name     VARCHAR(50)
    ,@email         VARCHAR(40)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    INSERT INTO [dbo].[Person] (
        [first_name]
        ,[last_name]
        ,[email]
	)
	VALUES (
		 @first_name
        ,@last_name
		,@email
	);
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[InsertPerson] TO [RoleReporting] AS [dbo];
GO

PRINT 'Procedure [dbo].[InsertPerson] created';
GO

IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[UpdatePerson]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdatePerson];
END
GO

CREATE PROCEDURE [dbo].[UpdatePerson] (
	 @person_id         INT
	,@first_name        VARCHAR(50)
    ,@last_name         VARCHAR(50)
    ,@email             VARCHAR(40)
    ,@created_at        DATETIME
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[Person]
    SET   [first_name]   = @first_name
         ,[last_name]    = @last_name
         ,[email]        = @email
         ,[created_at]   = @created_at
         ,[updated_at]   = GETDATE()
	WHERE person_id = @person_id;
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[UpdatePerson] TO [RoleReporting] AS [dbo];
GO

PRINT 'Procedure [dbo].[UpdatePerson] created';
GO


-- POST 
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- PROCEDURE InsertRolePerson
-- ----------------------------
IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[InsertRolePerson]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertRolePerson];
END
GO

CREATE PROCEDURE [dbo].[InsertRolePerson] (
      @person_id    INT
     ,@role_id     INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    INSERT INTO [dbo].[Person_Role] (
         [person_id]
        ,[role_id]
	)
	VALUES (
		 @person_id
        ,@role_id
	);
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[InsertRolePerson] TO [RoleReporting] AS [dbo];
GO

PRINT 'Procedure [dbo].[InsertRolePerson] created';
GO

IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[UpdateRolePerson]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateRolePerson];
END
GO

CREATE PROCEDURE [dbo].[UpdateRolePerson] (
	 @person_id         INT
	,@role_id           INT
    ,@created_at        DATETIME
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[Person_Role]
    SET   [person_id]    = @person_id
         ,[role_id]      = @role_id
         ,[created_at]   = @created_at
         ,[updated_at]   = GETDATE()
	WHERE person_id = @person_id AND
          role_id   = @role_id
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[UpdateRolePerson] TO [RoleReporting] AS [dbo];
GO

PRINT 'Procedure [dbo].[UpdateRolePerson] created';
GO