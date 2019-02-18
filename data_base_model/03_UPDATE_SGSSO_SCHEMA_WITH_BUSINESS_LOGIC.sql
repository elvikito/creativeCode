USE [SGSSO]

PRINT 'Start of Script Execution....';
GO


/*************************************************************************
**  Name: InsertUser            										**
**  Desc: Insert a new user of the system  								**
**																		**
**  Called by: Portal        											**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 08/01/2019		Antonio Vargas			Initial version				**
**************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[InsertUser]') 
		         AND type in (N'P', N'PC'))
	BEGIN
		DROP PROCEDURE [dbo].[InsertUser]
	END
GO

CREATE PROCEDURE [dbo].[InsertUser] (
	 @role_id    INT
	,@first_name VARCHAR(50)
	,@last_name  VARCHAR(50)
	,@email      VARCHAR(40)
	,@password   VARCHAR(MAX)
)
AS

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN
	DECLARE @person_id INT;

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

	SET @person_id = @@IDENTITY;

	INSERT INTO [dbo].[Person_Role] (
		 [person_id]
		,[role_id]
	)
	VALUES (
		 @person_id
		,@role_id
	);

	INSERT INTO [dbo].[Account] (
		 [person_id]
		,[password]
	)
	VALUES (
		 @person_id
		,ENCRYPTBYPASSPHRASE('password', @password)
	);

END
GO

PRINT 'Procedure [dbo].[InsertUser] created';
GO

/*************************************************************************
**  Name: InsertEmployee        										**
**  Desc: Insert a new employee          								**
**																		**
**  Called by: Portal        											**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 08/01/2019		Antonio Vargas			Initial version				**
**************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[InsertEmployee]') 
		         AND type in (N'P', N'PC'))
	BEGIN
		DROP PROCEDURE [dbo].[InsertEmployee]
	END
GO

CREATE PROCEDURE [dbo].[InsertEmployee] (
	 @first_name   VARCHAR(50)
	,@last_name    VARCHAR(50)
	,@email        VARCHAR(40)
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
	DECLARE @person_id INT;

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

	SET @person_id = @@IDENTITY;

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

PRINT 'Procedure [dbo].[InsertEmployee] created';
GO

/*************************************************************************
**  Name: UpdateEmployee        										**
**  Desc: Updates employee's information   								**
**																		**
**  Called by: Portal        											**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 08/01/2019		Antonio Vargas			Initial version				**
**************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[UpdateEmployee]') 
		         AND type in (N'P', N'PC'))
	BEGIN
		DROP PROCEDURE [dbo].[UpdateEmployee]
	END
GO

CREATE PROCEDURE [dbo].[UpdateEmployee] (
	 @employee_id  INT
	,@first_name   VARCHAR(50)
	,@last_name    VARCHAR(50)
	,@email        VARCHAR(40)
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

	IF EXISTS (SELECT 1
	           FROM [dbo].[Employee]
		       WHERE employee_id = @employee_id)
		BEGIN
			DECLARE @person_id INT;

			SELECT @person_id = person_id 
	        FROM [dbo].[Employee]
		    WHERE employee_id = @employee_id; 

			UPDATE [dbo].[Employee]
			SET  [ci]           = @ci
				,[address]      = @address
				,[birth_date]   = @birth_date
				,[gender]       = @gender
				,[phone_number] = @phone_number
				,[picture]      = @picture
			WHERE employee_id = @employee_id;

			UPDATE [dbo].[Person]
			SET  [first_name] = @first_name
				,[last_name]  = @last_name
				,[email]      = @email
			WHERE person_id = @person_id;

		END
	
	ELSE
		BEGIN
			PRINT 'Error: the id of the employee does not exist.';
		END

END
GO

PRINT 'Procedure [dbo].[UpdateEmployee] created';
GO

/*************************************************************************
**  Name: DeleteEmployee        										**
**  Desc: Deletes employee              								**
**																		**
**  Called by: Portal        											**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 08/01/2019		Antonio Vargas			Initial version				**
**************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[DeleteEmployee]') 
		         AND type in (N'P', N'PC'))
	BEGIN
		DROP PROCEDURE [dbo].[DeleteEmployee]
	END
GO

CREATE PROCEDURE [dbo].[DeleteEmployee] (
	 @employee_id  INT
)
AS

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN

	IF EXISTS (SELECT 1
	           FROM [dbo].[Employee]
		       WHERE employee_id = @employee_id)
		BEGIN
			DELETE FROM [dbo].[Employee]
      		WHERE employee_id = employee_id;
		END
	
	ELSE
		BEGIN
			PRINT 'Error: the id of the employee does not exist.';
		END

END
GO

PRINT 'Procedure [dbo].[DeleteEmployee] created';
GO

/*************************************************************************
**  Name: InsertAccident        										**
**  Desc: Insert an accident            								**
**																		**
**  Called by: Portal        											**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 08/01/2019		Antonio Vargas			Initial version				**
**************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[InsertAccident]') 
		         AND type in (N'P', N'PC'))
	BEGIN
		DROP PROCEDURE [dbo].[InsertAccident]
	END
GO

CREATE PROCEDURE [dbo].[InsertAccident] (
	 @employee_id      INT
	,@accident_type_id INT
	,@cause            VARCHAR(255)
	,@date_init        DATETIME
	,@start_lost_time  DATETIME
	,@end_lost_time    DATETIME
	,@day_lost         INT
	,@severity         VARCHAR(20)
	,@turn             VARCHAR(15)
)
AS

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN

	IF EXISTS (SELECT 1
	           FROM [dbo].[Employee]
		       WHERE employee_id = @employee_id)
		BEGIN

			INSERT INTO [dbo].[Accident] (
				 [employee_id]
				,[accident_type_id]
				,[cause]
				,[date_init]
				,[start_lost_time]
				,[end_lost_time]
				,[day_lost]
				,[severity]
				,[turn]
			)
			VALUES (
				 @employee_id      
				,@accident_type_id 
				,@cause
				,@date_init        
				,@start_lost_time  
				,@end_lost_time    
				,@day_lost         
				,@severity
				,@turn
			);

		END
	
	ELSE
		BEGIN
			PRINT 'Error: the id of the employee does not exist.';
		END

END
GO

PRINT 'Procedure [dbo].[InsertAccident] created';
GO

/*************************************************************************
**  Name: UpdateAccident        										**
**  Desc: Updates accident's information   								**
**																		**
**  Called by: Portal        											**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 08/01/2019		Antonio Vargas			Initial version				**
**************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[UpdateAccident]') 
		         AND type in (N'P', N'PC'))
	BEGIN
		DROP PROCEDURE [dbo].[UpdateAccident]
	END
GO

CREATE PROCEDURE [dbo].[UpdateAccident] (
	 @accident_id      INT
	,@employee_id      INT
	,@accident_type_id INT
	,@cause            VARCHAR(255)
	,@date_init        DATETIME
	,@start_lost_time  DATETIME
	,@end_lost_time    DATETIME
	,@day_lost         INT
	,@severity         VARCHAR(20)
	,@turn             VARCHAR(15)
)
AS

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN

	IF EXISTS (SELECT 1
	           FROM [dbo].[Accident]
		       WHERE accident_id = @accident_id)
		BEGIN

			UPDATE [dbo].[Accident]
			SET  [employee_id]      = @employee_id
				,[accident_type_id] = @accident_type_id
				,[cause]            = @cause
				,[date_init]        = @date_init
				,[start_lost_time]  = @start_lost_time
				,[end_lost_time]    = @end_lost_time
				,[day_lost]         = @day_lost
				,[severity]         = @severity
				,[turn]             = @turn
			WHERE accident_id = @accident_id;

		END
	
	ELSE
		BEGIN
			PRINT 'Error: the id of the accident does not exist.';
		END

END
GO

PRINT 'Procedure [dbo].[UpdateAccident] created';
GO

/*************************************************************************
**  Name: DeleteAccident        										**
**  Desc: Deletes accident              								**
**																		**
**  Called by: Portal        											**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 08/01/2019		Antonio Vargas			Initial version				**
**************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[DeleteAccident]') 
		         AND type in (N'P', N'PC'))
	BEGIN
		DROP PROCEDURE [dbo].[DeleteAccident]
	END
GO

CREATE PROCEDURE [dbo].[DeleteAccident] (
	 @accident_id  INT
)
AS

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN

	IF EXISTS (SELECT 1
	           FROM [dbo].[Accident]
		       WHERE accident_id = @accident_id)
		BEGIN
			DELETE FROM [dbo].[Accident]
      		WHERE accident_id = @accident_id;
		END
	
	ELSE
		BEGIN
			PRINT 'Error: the id of the accident does not exist.';
		END

END
GO

PRINT 'Procedure [dbo].[DeleteAccident] created';
GO

/*************************************************************************
**  Name: InsertContractForEmployee										**
**  Desc: Insert a new contract for an employee							**
**																		**
**  Called by: Portal        											**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 08/01/2019		Antonio Vargas			Initial version				**
**************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[InsertContractForEmployee]') 
		         AND type in (N'P', N'PC'))
	BEGIN
		DROP PROCEDURE [dbo].[InsertContractForEmployee]
	END
GO

CREATE PROCEDURE [dbo].[InsertContractForEmployee] (
	 @employee_id   INT
	,@area_id       INT
	,@position_id   INT
	,@salary        MONEY
	,@init_date     DATETIME
	,@employee_type VARCHAR(8)
)
AS

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN

	IF EXISTS (SELECT 1
	           FROM [dbo].[Employee]
		       WHERE employee_id = @employee_id)
		BEGIN
			DECLARE @area_position_id INT;

			INSERT INTO [dbo].[Area_Position] (
				 [area_id]
				,[position_id]
			)
			VALUES (
				 @area_id
				,@position_id
			);

			SET @area_position_id = @@IDENTITY;

			INSERT INTO [dbo].[Contract] (
				 [employee_id]
				,[area_position_id]
				,[salary]
				,[init_date]
				,[employee_type]
			)
			VALUES (
				 @employee_id
				,@area_position_id
				,@salary
				,@init_date
				,@employee_type
			);

		END
	
	ELSE
		BEGIN
			PRINT 'Error: the id of the employee does not exist.';
		END

END
GO

PRINT 'Procedure [dbo].[InsertContractForEmployee] created';
GO

/*************************************************************************
**  Name: InsertProject        		    								**
**  Desc: Insert a new project          								**
**																		**
**  Called by: Portal        											**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 08/01/2019		Antonio Vargas			Initial version				**
**************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[InsertProject]') 
		         AND type in (N'P', N'PC'))
	BEGIN
		DROP PROCEDURE [dbo].[InsertProject]
	END
GO

CREATE PROCEDURE [dbo].[InsertProject] (
	 @name_project       VARCHAR(255)
	,@design_project     VARCHAR(255)
	,@location_project   VARCHAR(255)
	,@budget_project     MONEY
	,@start_date_project DATETIME
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
	)
	VALUES (
		 @name_project
		,@design_project
		,@location_project
		,@budget_project
		,@start_date_project
	);

END
GO

PRINT 'Procedure [dbo].[InsertProject] created';
GO

/*************************************************************************
**  Name: UpdateProject         										**
**  Desc: Updates Project's information   								**
**																		**
**  Called by: Portal        											**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 08/01/2019		Antonio Vargas			Initial version				**
**************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[UpdateProject]') 
		         AND type in (N'P', N'PC'))
	BEGIN
		DROP PROCEDURE [dbo].[UpdateProject]
	END
GO

CREATE PROCEDURE [dbo].[UpdateProject] (
	 @project_id          INT
	,@name_project        VARCHAR(255)
	,@design_project      varchar(255)
	,@location_project    varchar(255)
	,@budget_project      MONEY
	,@start_date_project  DATETIME
	,@ending_date_project DATETIME
)
AS

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN

	IF EXISTS (SELECT 1
	           FROM [dbo].[Project]
		       WHERE project_id = @project_id)
		BEGIN

			UPDATE [dbo].[Project]
			SET  [name_project]        = @name_project
				,[design_project]      = @design_project
				,[location_project]    = @location_project
				,[budget_project]      = @budget_project
				,[start_date_project]  = @start_date_project
				,[ending_date_project] = @ending_date_project
			WHERE project_id = @project_id;

		END
	
	ELSE
		BEGIN
			PRINT 'Error: the id of the project does not exist.';
		END

END
GO

PRINT 'Procedure [dbo].[UpdateProject] created';
GO

/*************************************************************************
**  Name: InsertMachinery        		    								**
**  Desc: Insert a new machinery        								**
**																		**
**  Called by: Portal        											**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 17/02/2019		Antonio Vargas			Initial version				**
**************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[InsertMachinery]') 
		         AND type in (N'P', N'PC'))
	BEGIN
		DROP PROCEDURE [dbo].[InsertMachinery]
	END
GO

CREATE PROCEDURE [dbo].[InsertMachinery] (
	 @name_machinery  VARCHAR(150)
	,@brand_machinery VARCHAR(50)
	,@model_machinery VARCHAR(50)
	,@state_machinery VARCHAR(50)
)
AS

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN

	INSERT INTO [dbo].[Machinery] (
		 [name_machinery]
		,[brand_machinery]
		,[model_machinery]
		,[state_machinery]
	)
	VALUES (
		 @name_machinery
		,@brand_machinery
		,@model_machinery
		,@state_machinery
	);

END
GO

PRINT 'Procedure [dbo].[InsertMachinery] created';
GO

/*************************************************************************
**  Name: UpdateMachinery        										**
**  Desc: Updates Machinery's information 								**
**																		**
**  Called by: Portal        											**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 17/02/2019		Antonio Vargas			Initial version				**
**************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[UpdateMachinery]') 
		         AND type in (N'P', N'PC'))
	BEGIN
		DROP PROCEDURE [dbo].[UpdateMachinery]
	END
GO

CREATE PROCEDURE [dbo].[UpdateMachinery] (
	 @machinery_id    INT
	,@name_machinery  VARCHAR(150)
	,@brand_machinery VARCHAR(50)
	,@model_machinery VARCHAR(50)
	,@state_machinery VARCHAR(50)
)
AS

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN

	IF EXISTS (SELECT 1
	           FROM [dbo].[Machinery]
		       WHERE machinery_id = @machinery_id)
		BEGIN

			UPDATE [dbo].[Machinery]
			SET  [name_machinery]  = @name_machinery
				,[brand_machinery] = @brand_machinery
				,[model_machinery] = @model_machinery
 				,[state_machinery] = @state_machinery
			WHERE machinery_id = @machinery_id;

		END
	
	ELSE
		BEGIN
			PRINT 'Error: the id of the machinery does not exist.';
		END

END
GO

PRINT 'Procedure [dbo].[UpdateMachinery] created';
GO

/*************************************************************************
**  Name: DeleteMachinery        										**
**  Desc: Deletes machinery              								**
**																		**
**  Called by: Portal        											**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 17/02/2019		Antonio Vargas			Initial version				**
**************************************************************************/

IF EXISTS (SELECT * FROM sys.objects 
		   WHERE object_id = OBJECT_ID(N'[dbo].[DeleteMachinery]') 
		         AND type in (N'P', N'PC'))
	BEGIN
		DROP PROCEDURE [dbo].[DeleteMachinery]
	END
GO

CREATE PROCEDURE [dbo].[DeleteMachinery] (
	 @machinery_id  INT
)
AS

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN

	IF EXISTS (SELECT 1
	           FROM [dbo].[Machinery]
		       WHERE machinery_id = @machinery_id)
		BEGIN
			DELETE FROM [dbo].[Machinery]
      		WHERE machinery_id = @machinery_id;
		END
	
	ELSE
		BEGIN
			PRINT 'Error: the id of the machinery does not exist.';
		END

END
GO

PRINT 'Procedure [dbo].[DeleteMachinery] created';
GO


PRINT 'End of Script Execution....';
GO