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
-- PROCEDURE PostEmployee
-- ----------------------------

CREATE PROCEDURE [dbo].[InsertEmployee]
(
    @person_id INT,
    @ci INT,
    @address VARCHAR(255),
    @birth_date DATETIME,
    @gender VARCHAR(8),
    @phone_number INT,
    @picture VARBINARY(max),
    @created_at DATETIME,
    @updated_at DATETIME
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    INSERT INTO [dbo].[Employee]([person_id],[ci],[address],[birth_date],[gender],[phone_number],[picture],[created_at],[updated_at])
	VALUES(@person_id, @ci, @address, @birth_date,@gender, @phone_number, @picture, @created_at, @updated_at);
	IF @@ROWCOUNT > 0
	BEGIN
		SELECT [updated_at] 
		FROM Employee 
		WHERE person_id = @person_id;
	END
END
GO

GRANT EXECUTE ON OBJECT::[dbo].[InsertEmployee] TO [RoleReporting] AS [dbo];
GO

PRINT 'Procedure [dbo].[InsertEmployee] created';
GO
