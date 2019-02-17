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

GRANT EXECUTE ON OBJECT::[dbo].[InsertEmployee] TO [RoleService] AS [dbo];
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
	SET  [person_id]     = @person_id
         ,[ci]           = @ci
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

GRANT EXECUTE ON OBJECT::[dbo].[UpdateEmployee] TO [RoleService] AS [dbo];
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

GRANT EXECUTE ON OBJECT::[dbo].[InsertPerson] TO [RoleService] AS [dbo];
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

GRANT EXECUTE ON OBJECT::[dbo].[UpdatePerson] TO [RoleService] AS [dbo];
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

GRANT EXECUTE ON OBJECT::[dbo].[InsertRolePerson] TO [RoleService] AS [dbo];
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

GRANT EXECUTE ON OBJECT::[dbo].[UpdateRolePerson] TO [RoleService] AS [dbo];
GO

PRINT 'Procedure [dbo].[UpdateRolePerson] created';
GO


-- POST 
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- PROCEDURE InsertProject
-- ----------------------------
IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[InsertProject]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertProject];
END
GO

CREATE PROCEDURE [dbo].[InsertProject] (
      @name_project         VARCHAR(255)
     ,@design_project       VARCHAR(255)
     ,@location_project     VARCHAR(255)
     ,@budget_project       MONEY
     ,@start_date_project   DATETIME
     ,@ending_date_project  DATETIME
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    INSERT INTO [dbo].[Project] (
         [name_project]
        ,[design_project]
        ,[location_project]
        ,[budget_project]
        ,[start_date_project]
        ,[ending_date_project]
	)
	VALUES (
		 @name_project
        ,@design_project
        ,@location_project
        ,@budget_project
        ,@start_date_project
        ,@ending_date_project
	);
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[InsertProject] TO [RoleService] AS [dbo];
GO

PRINT 'Procedure [dbo].[InsertProject] created';
GO

IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[UpdateProject]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateProject];
END
GO

CREATE PROCEDURE [dbo].[UpdateProject] (
	 @project_id            INT
	 ,@name_project         VARCHAR(255)
     ,@design_project       VARCHAR(255)
     ,@location_project     VARCHAR(255)
     ,@budget_project       MONEY
     ,@start_date_project   DATETIME
     ,@ending_date_project  DATETIME
     ,@created_at           DATETIME
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[Project]
    SET  [name_project]        = @name_project
         ,[design_project]      = @design_project
         ,[location_project]    = @location_project
         ,[budget_project]      = @budget_project
         ,[start_date_project]  = @start_date_project
         ,[ending_date_project] = @ending_date_project
         ,[created_at]          = @created_at
         ,[updated_at]          = GETDATE()
	WHERE project_id = @project_id
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[UpdateProject] TO [RoleService] AS [dbo];
GO

PRINT 'Procedure [dbo].[UpdateProject] created';
GO

----------------

-- POST 
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- PROCEDURE InsertRole
-- ----------------------------
IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[InsertRole]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertRole];
END
GO

CREATE PROCEDURE [dbo].[InsertRole] (
        @role_name      VARCHAR(50)
        ,@description   VARCHAR(200)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    INSERT INTO [dbo].[Role] (
         [role_name]
        ,[description]
	)
	VALUES (
		 @role_name
        ,@description
	);
END
GO
GRANT EXECUTE ON OBJECT::[dbo].[InsertRole] TO [RoleService] AS [dbo];
GO

PRINT 'Procedure [dbo].[InsertRole] created';
GO

----------------
-- Update 
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- PROCEDURE UpdateRole
-- ----------------------------

IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[UpdateRole]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateRole];
END
GO

CREATE PROCEDURE [dbo].[UpdateRole] (
	 @role_id           INT
	,@role_name         VARCHAR(50)
    ,@description       VARCHAR(200)
    ,@created_at        DATETIME
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[Role]
    SET   [role_name]    = @role_name
         ,[role_id]      = @role_id
         ,[description]  = @description
         ,[created_at]   = @created_at
         ,[updated_at]   = GETDATE()
	WHERE role_id   = @role_id
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[UpdateRole] TO [RoleService] AS [dbo];
GO

PRINT 'Procedure [dbo].[UpdateRole] created';
GO

----------------
-- POST 
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- PROCEDURE InsertDepartment
-- ----------------------------
IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[InsertDepartment]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertDepartment];
END
GO

CREATE PROCEDURE [dbo].[InsertDepartment] (
        @name           VARCHAR(255)
        ,@description   VARCHAR(255)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    INSERT INTO [dbo].[Department] (
         [name]
        ,[description]
	)
	VALUES (
		 @name
        ,@description
	);
END
GO
GRANT EXECUTE ON OBJECT::[dbo].[InsertDepartment] TO [RoleService] AS [dbo];
GO

PRINT 'Procedure [dbo].[InsertDepartment] created';
GO

----------------
-- Update 
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- PROCEDURE UpdateDepartment
-- ----------------------------

IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[UpdateDepartment]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateDepartment];
END
GO

CREATE PROCEDURE [dbo].[UpdateDepartment] (
	    @department_id   INT
        ,@name           VARCHAR(255)
        ,@description    VARCHAR(255)
        ,@created_at     DATETIME
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[Department]
    SET   [name]             = @name
         ,[description]  = @description
         ,[created_at]   = @created_at
         ,[updated_at]   = GETDATE()
	WHERE department_id   = @department_id
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[UpdateDepartment] TO [RoleService] AS [dbo];
GO

PRINT 'Procedure [dbo].[UpdateDepartment] created';
GO


----------------
-- Update 
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- PROCEDURE DeleteDepartment
-- ----------------------------

IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[DeleteDepartment]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[DeleteDepartment];
END
GO
CREATE PROCEDURE [dbo].[DeleteDepartment]
(
	@department_id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Department 
	WHERE department_id = @department_id;
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[DeleteDepartment] TO [RoleService] AS [dbo];
GO

PRINT 'Procedure [dbo].[DeleteDepartment] created';
GO

----------------
-- POST 
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- PROCEDURE InsertArea
-- ----------------------------
IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[InsertArea]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertArea];
END
GO

CREATE PROCEDURE [dbo].[InsertArea] (
        @department_id  INT
        ,@name           VARCHAR(255)
        ,@description   VARCHAR(255)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    INSERT INTO [dbo].[Area] (
        [department_id]
        ,[name]
        ,[description]
	)
	VALUES (
         @department_id
		 ,@name
         ,@description
	);
END
GO
GRANT EXECUTE ON OBJECT::[dbo].[InsertArea] TO [RoleService] AS [dbo];
GO

PRINT 'Procedure [dbo].[InsertArea] created';
GO

----------------
-- Update 
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- PROCEDURE UpdateArea
-- ----------------------------

IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[UpdateArea]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdateArea];
END
GO

CREATE PROCEDURE [dbo].[UpdateArea] (
        @area_id         INT
	    ,@department_id  INT
        ,@name           VARCHAR(255)
        ,@description    VARCHAR(255)
        ,@created_at     DATETIME
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[Area]
    SET   [department_id]    = @department_id
         ,[name]             = @name
         ,[description]  = @description
         ,[created_at]   = @created_at
         ,[updated_at]   = GETDATE()
	WHERE area_id   = @area_id
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[UpdateArea] TO [RoleService] AS [dbo];
GO

PRINT 'Procedure [dbo].[UpdateArea] created';
GO


----------------
-- Update 
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- PROCEDURE DeleteArea
-- ----------------------------

IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[DeleteArea]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[DeleteArea];
END
GO
CREATE PROCEDURE [dbo].[DeleteArea]
(
	@area_id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Area 
	WHERE area_id = @area_id
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[DeleteArea] TO [RoleService] AS [dbo];
GO

PRINT 'Procedure [dbo].[DeleteArea] created';
GO


----------------
-- POST 
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- PROCEDURE InsertPosition
-- ----------------------------
IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[InsertPosition]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[InsertPosition];
END
GO

CREATE PROCEDURE [dbo].[InsertPosition] (
        @name           VARCHAR(255)
        ,@description   VARCHAR(255)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    INSERT INTO [dbo].[Position] (
        [name]
        ,[description]
	)
	VALUES (
		 @name
         ,@description
	);
END
GO
GRANT EXECUTE ON OBJECT::[dbo].[InsertPosition] TO [RoleService] AS [dbo];
GO

PRINT 'Procedure [dbo].[InsertPosition] created';
GO

----------------
-- Update 
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- PROCEDURE UpdatePosition
-- ----------------------------

IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[UpdatePosition]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[UpdatePosition];
END
GO

CREATE PROCEDURE [dbo].[UpdatePosition] (
        @position_id     INT
        ,@name           VARCHAR(255)
        ,@description    VARCHAR(255)
        ,@created_at     DATETIME
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[Position]
    SET  [name]         = @name
         ,[description]  = @description
         ,[created_at]   = @created_at
         ,[updated_at]   = GETDATE()
	WHERE position_id    = @position_id
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[UpdatePosition] TO [RoleService] AS [dbo];
GO

PRINT 'Procedure [dbo].[UpdatePosition] created';
GO

----------------
-- Update 
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- PROCEDURE DeletePosition
-- ----------------------------

IF EXISTS (SELECT * FROM sys.objects 
           WHERE object_id = OBJECT_ID(N'[dbo].[DeletePosition]') 
           AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[DeletePosition];
END
GO
CREATE PROCEDURE [dbo].[DeletePosition]
(
	@position_id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM Position 
	WHERE position_id = @position_id
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[DeletePosition] TO [RoleService] AS [dbo];
GO

PRINT 'Procedure [dbo].[DeletePosition] created';
GO