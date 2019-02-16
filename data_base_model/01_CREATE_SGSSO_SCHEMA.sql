USE [SGSSO]
GO

PRINT 'Creating database...';

/*************************************************************************
**  Table Name: [dbo].[Person]   										**
**																		**
**  Primary Key: person_id												**
**	Foreign Keys: -   													**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 28/01/2019		Antonio Vargas			Version Initial				**
**************************************************************************/
PRINT 'Creating the Person table...';
IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Person]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Person](
			person_id  INT IDENTITY CONSTRAINT PK_person PRIMARY KEY NOT NULL,
			first_name VARCHAR(50)  CONSTRAINT NN_first_name NOT NULL,
			last_name  VARCHAR(50)  CONSTRAINT NN_last_name NOT NULL,
			email      VARCHAR(40)  CONSTRAINT NN_email NOT NULL,
			created_at DATETIME     DEFAULT (GETUTCDATE()),
			updated_at DATETIME     DEFAULT (GETUTCDATE()));

		PRINT 'Table Person created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Person already exists into the database...';
	END
GO

/*************************************************************************
**  Table Name: [dbo].[Account]   										**
**																		**
**  Primary Key: account_id												**
**	Foreign Keys: person_id  											**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 28/01/2019		Antonio Vargas			Version Initial				**
**************************************************************************/
PRINT 'Creating the Account table...';

IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Account]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Account] (
			account_id INT IDENTITY CONSTRAINT PK_account  PRIMARY KEY NOT NULL,
			person_id  INT          CONSTRAINT FK_account_person FOREIGN KEY REFERENCES [dbo].[Person](person_id) ON DELETE CASCADE,
			password   VARCHAR(MAX) CONSTRAINT NN_password NOT NULL,
			created_at DATETIME     DEFAULT (GETUTCDATE()),
			updated_at DATETIME     DEFAULT (GETUTCDATE()));

		PRINT 'Table Account created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Account already exists into the database';
	END
GO

/*************************************************************************
**  Table Name: [dbo].[Role]	   										**
**																		**
**  Primary Key: role_id												**
**	Foreign Keys: -			  											**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 28/01/2019		Antonio Vargas			Version Initial				**
**************************************************************************/
PRINT 'Creating the Role table...';

IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Role]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Role] (
			role_id     INT IDENTITY CONSTRAINT PK_role PRIMARY KEY NOT NULL,
			role_name   VARCHAR(50)  CONSTRAINT NN_role_name   NOT NULL,
			description VARCHAR(200) CONSTRAINT NN_description NOT NULL,
			created_at  DATETIME DEFAULT (GETUTCDATE()),
			updated_at  DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table Role created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Role already exists into the database...';
	END
GO

/*************************************************************************
**  Table Name: [dbo].[Person_Role]	  									**
**																		**
**  Primary Key: -														**
**	Foreign Keys: person_id, role_id	  								**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 28/01/2019		Antonio Vargas			Version Initial				**
** 08/01/2019		Antonio Vargas			Add constraint primary key	**
**************************************************************************/
PRINT 'Creating the Person_Role table...';

IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Person_Role]')
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Person_Role] ( 
		    person_id  INT CONSTRAINT FK_person_role FOREIGN KEY REFERENCES [dbo].[Person](person_id) ON DELETE CASCADE,
		    role_id	   INT CONSTRAINT FK_role FOREIGN KEY REFERENCES [dbo].[Role](role_id) ON DELETE CASCADE, 
			created_at DATETIME DEFAULT (GETUTCDATE()),
			updated_at DATETIME DEFAULT (GETUTCDATE()),
		    CONSTRAINT PK_person_role PRIMARY KEY(
				person_id ASC,
				role_id   ASC
		    )
		);

		PRINT 'Table Person_Role created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Person_Role already exists into the database...';
	END
GO

/*************************************************************************
**  Table Name: [dbo].[Department]	  									**
**																		**
**  Primary Key: department_id											**
**	Foreign Keys: -						  								**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 26/01/2019		Elvis R. Ramirez		Version Initial				**
**************************************************************************/
PRINT 'Creating the Department table...';

IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Department]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Department](
			department_id INT IDENTITY CONSTRAINT PK_department PRIMARY KEY NOT NULL,
			name		  VARCHAR(255) CONSTRAINT NN_department_name NOT NULL,
			description	  VARCHAR(255)   CONSTRAINT NN_department_desc NOT NULL,
			created_at    DATETIME DEFAULT (GETUTCDATE()),
			updated_at    DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table Department created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Department already exists into the database...';
	END
GO

/*************************************************************************
**  Table Name: [dbo].[Area]		  									**
**																		**
**  Primary Key: area_id												**
**	Foreign Keys: department_id     	  								**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 26/01/2019		Elvis R. Ramirez			Version Initial			**
**************************************************************************/
PRINT 'Creating the Area table...';

IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Area]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Area] (
			area_id		  INT IDENTITY CONSTRAINT PK_area PRIMARY KEY NOT NULL,
			department_id INT CONSTRAINT FK_department FOREIGN KEY REFERENCES [dbo].[Department](department_id) ON DELETE CASCADE,
			name	      VARCHAR(255) CONSTRAINT NN_area_name NOT NULL,
			description	  VARCHAR(255) CONSTRAINT NN_area_desc NOT NULL,
			created_at    DATETIME DEFAULT (GETUTCDATE()),
			updated_at    DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table Area created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Area already exists into the database...';
	END
GO

/*************************************************************************
**  Table Name: [dbo].[Position]		  								**
**																		**
**  Primary Key: position_id											**
**	Foreign Keys: -						  								**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 26/01/2019		Elvis R. Ramirez 		Version Initial				**
**************************************************************************/
PRINT 'Creating the Position table...';

IF NOT EXISTS (	SELECT 1
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Position]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Position](
			position_id INT IDENTITY CONSTRAINT PK_position PRIMARY KEY NOT NULL,
			name		VARCHAR(255) CONSTRAINT NN_position_name NOT NULL,
			description VARCHAR(255) CONSTRAINT NN_position_desc NOT NULL,
			created_at  DATETIME DEFAULT (GETUTCDATE()),
			updated_at  DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table Position created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Position already exists into the database...';
	END
GO

/*************************************************************************
**  Table Name: [dbo].[Area_Position]		  							**
**																		**
**  Primary Key: area_position_id										**
**	Foreign Keys: area_id, position_id					  				**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 26/01/2019		Elvis R. Ramirez 		Version Initial				**
** 08/01/2019		Antonio Vargas			Add constraint primary key	**
** 09/01/2019		Antonio Vargas			Add PK area_position_id    	**
**************************************************************************/
PRINT 'Creating the Area_Position table...';

IF NOT EXISTS (	SELECT 1 
			FROM sys.objects 
			WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Area_Position]') 
					AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Area_Position](
			area_position_id INT IDENTITY CONSTRAINT PK_area_position PRIMARY KEY NOT NULL,
			area_id          INT CONSTRAINT	FK_area FOREIGN KEY REFERENCES [dbo].[Area](area_id) ON DELETE CASCADE,
			position_id      INT CONSTRAINT	FK_position FOREIGN KEY REFERENCES [dbo].[Position](position_id) ON DELETE CASCADE,
			created_at       DATETIME DEFAULT (GETUTCDATE()),
			updated_at       DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table Area_Position created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Area_Position already exists into the database...';
	END
GO

/*************************************************************************
**  Table Name: [dbo].[Employee]			  							**
**																		**
**  Primary Key: employee_id											**
**	Foreign Keys: person_id 							  				**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 25/01/2019		Elvis R. Ramirez		Version Initial				**
**************************************************************************/
PRINT 'Creating the Employee table...';

IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Employee]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Employee](
			employee_id  INT IDENTITY CONSTRAINT PK_employee PRIMARY KEY NOT NULL,
			person_id    INT CONSTRAINT FK_person_employee FOREIGN KEY REFERENCES [dbo].[Person](person_id) ON DELETE CASCADE,
			ci			 INT          CONSTRAINT NN_ci_person NOT NULL,
			address		 VARCHAR(255) CONSTRAINT NN_address_person NOT NULL,
			birth_date	 DATETIME     CONSTRAINT NN_birth_date NOT NULL,
			gender		 VARCHAR(8)   CONSTRAINT NN_gender NOT NULL,
			phone_number INT          CONSTRAINT NN_phone_number NOT NULL,
			picture		 VARBINARY(max) DEFAULT NULL,
			created_at   DATETIME DEFAULT (GETUTCDATE()),
			updated_at   DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table Employee created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Employee already exists into the database...';
	END
GO

/*************************************************************************
**  Table Name: [dbo].[Contract]			  							**
**																		**
**  Primary Key: contract_id											**
**	Foreign Keys: employee_id, area_position_id 						**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 26/01/2019		Elvis R. Ramirez		Version Initial				**
** 09/01/2019		Antonio Vargas			Add FK area_position_id    	**
**************************************************************************/
PRINT 'Creating the Contract table...';

IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Contract]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Contract](
			contract_id	     INT IDENTITY CONSTRAINT PK_contract PRIMARY KEY NOT NULL,
			employee_id	     INT CONSTRAINT FK_contract_employee FOREIGN KEY REFERENCES [dbo].[Employee](employee_id) ON DELETE CASCADE,
			area_position_id INT CONSTRAINT FK_contract_area_position FOREIGN KEY REFERENCES [dbo].[Area_Position](area_position_id) ON DELETE CASCADE,
			salary		     MONEY CONSTRAINT NN_salary NOT NULL,
			init_date	     DATETIME CONSTRAINT NN_init_date NOT NULL,
			end_date	     DATETIME DEFAULT NULL,
			employee_type    VARCHAR(8) CONSTRAINT NN_employee_type NOT NULL CHECK (employee_type IN('Parcial', 'Complete')),
			created_at       DATETIME DEFAULT (GETUTCDATE()),
			updated_at       DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table Contract created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Contract already exists into the database...';
	END
GO

/*************************************************************************
**  Table Name: [dbo].[Project]			  								**
**																		**
**  Primary Key: project_id												**
**	Foreign Keys: -														**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 26/01/2019		Elvis L. Arispe			Version Initial				**
**************************************************************************/
PRINT 'Creating the Project table...';

IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Project]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Project] (
			project_id			INT IDENTITY CONSTRAINT PK_project PRIMARY KEY NOT NULL,
			name_project		VARCHAR(255) CONSTRAINT NN_name_project NOT NULL,
			design_project		VARCHAR(255) DEFAULT NULL,
			location_project	VARCHAR(255) CONSTRAINT NN_location_project NOT NULL,
			budget_project		MONEY    CONSTRAINT NN_budget_project     NOT NULL,
			start_date_project	DATETIME CONSTRAINT NN_start_date_project NOT NULL,
			ending_date_project DATETIME DEFAULT NULL,
			created_at          DATETIME DEFAULT (GETUTCDATE()),
			updated_at          DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table Project created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Project already exists into the database';
	END
GO

/*************************************************************************
**  Table Name: Item_Equipment  	  									**
**																		**
**  Primary Key: item_equipment_id										**
**	Foreign Keys: -														**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 26/01/2019		 Pamela Cardozo			Version Initial				**
**************************************************************************/
PRINT 'Creating the Item_Equipment table...';

IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Item_Equipment]')
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE dbo.Item_Equipment(
			item_equipment_id INT IDENTITY CONSTRAINT PK_item_equipment PRIMARY KEY NOT NULL,
			name_equipment	  VARCHAR(100) CONSTRAINT NN_item_equipment_name NOT NULL,
			description		  VARCHAR(100) CONSTRAINT NN_item_equipment_desc NOT NULL,
			acquisition_date  DATETIME CONSTRAINT NN_acquisition_date NOT NULL,
			created_at        DATETIME DEFAULT (GETUTCDATE()),
			updated_at        DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table Item_Equipment created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Item_Equipment already exists into the database';
	END
GO

/*************************************************************************
**  Table Name: [dbo].[Employee_Project]			  					**
**																		**
**  Primary Key: emp_proj_id											**
**	Foreign Keys: employee_id, project_id								**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 26/01/2019		 Pamela Cardozo			Version Initial				**
**************************************************************************/
PRINT 'Creating the Employee_Project table...';

IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Employee_Project]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Employee_Project](
			emp_proj_id	INT IDENTITY CONSTRAINT PK_emp_proj PRIMARY KEY NOT NULL,
			employee_id	INT CONSTRAINT FK_employee_project_e FOREIGN KEY REFERENCES [dbo].[Employee](employee_id) ON DELETE CASCADE,
			project_id	INT CONSTRAINT FK_employee_project_p FOREIGN KEY REFERENCES [dbo].[Project](project_id) ON DELETE CASCADE,
			created_at  DATETIME DEFAULT (GETUTCDATE()),
			updated_at  DATETIME DEFAULT (GETUTCDATE()));
		
		PRINT 'Table Employee_Project created!';
	END 
ELSE 
	BEGIN
		PRINT 'Table Employee_Project already exists into the database';
	END
GO

/*************************************************************************
**  Table Name: [dbo].[Assignment_Item_Equipment]		  				**
**																		**
**  Primary Key: assignment_item_id										**
**	Foreign Keys: emp_proj_id, item_equipment_id						**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 26/01/2019		 Pamela Cardozo			Version Initial				**
**************************************************************************/
PRINT 'Creating the Assignment_Item_Equipment table...';

IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Assignment_Item_Equipment]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Assignment_Item_Equipment](
			assignment_item_id INT IDENTITY CONSTRAINT PK_assignment_item PRIMARY KEY NOT NULL,
			emp_proj_id		   INT CONSTRAINT FK_assign_emp_proj FOREIGN KEY REFERENCES [dbo].[Employee_Project](emp_proj_id) ON DELETE CASCADE,
			item_equipment_id  INT CONSTRAINT FK_assign_it_equipment FOREIGN KEY REFERENCES [dbo].[Item_Equipment](item_equipment_id) ON DELETE CASCADE,
			date_assignment	   DATETIME CONSTRAINT NN_date_assignment NOT NULL,
			created_at         DATETIME DEFAULT (GETUTCDATE()),
			updated_at         DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table Assignment_Item_Equipment created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Assignment_Item_Equipment already exists into the database';
	END
GO
/*************************************************************************
**  Table Name: [dbo].[Machinery]						  				**
**																		**
**  Primary Key: machinery_id											**
**	Foreign Keys: -														**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 26/01/2019		Elvis L. Arispe			Version Initial				**
**************************************************************************/
PRINT 'Creating the Machinery table...';

IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Machinery]') 
							AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Machinery] (
			machinery_id	INT IDENTITY CONSTRAINT PK_machinary PRIMARY KEY NOT NULL,
			name_machinery	VARCHAR (150) CONSTRAINT NN_machinery_name NOT NULL,
			brand_machinery	VARCHAR (50)  CONSTRAINT NN_machinery_brand NOT NULL,
			model_machinery	VARCHAR (50)  CONSTRAINT NN_machinery_model NOT NULL,
			state_machinery	VARCHAR (50)  DEFAULT NULL,
			created_at      DATETIME DEFAULT (GETUTCDATE()),
			updated_at      DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table Machinery created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Machinery already exists into the database';
	END
GO

/*************************************************************************
**  Table Name: [dbo].[Assignment_Machinery]						  	**
**																		**
**  Primary Key: assignment_machinery_id								**
**	Foreign Keys: emp_proj_id, machinery_id								**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 26/01/2019		Elvis L. Arispe			Version Initial				**
**************************************************************************/
PRINT 'Creating the Assignment_Machinery table...';

IF NOT EXISTS (	SELECT 1
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Assignment_Machinery]') 
							AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Assignment_Machinery] (
			assignment_machinery_id INT IDENTITY CONSTRAINT PK_assignment_machinery PRIMARY KEY NOT NULL,
			emp_proj_id			    INT CONSTRAINT FK_assign_mach_emp_proj FOREIGN KEY REFERENCES [dbo].[Employee_Project](emp_proj_id) ON DELETE CASCADE,
			machinery_id			INT CONSTRAINT FK_assing_mach_machinery FOREIGN KEY REFERENCES [dbo].[Machinery](machinery_id) ON DELETE CASCADE,
			start_date_assign		DATETIME CONSTRAINT NN_start_date_a NOT NULL,
			ending_date_asg_mac	    DATETIME DEFAULT NULL,
			created_at              DATETIME DEFAULT (GETUTCDATE()),
			updated_at              DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table Assignment_Machinery created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Assignment_Machinery already exists into the database';
	END
GO

/*************************************************************************
**  Table Name: [dbo].[Accident_Type] 								  	**
**																		**
**  Primary Key: accident_type_id										**
**	Foreign Keys: -														**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 26/01/2019		Tania Valero			Version Initial				**
**************************************************************************/
PRINT 'Creating the Accident_Type table...';

IF NOT EXISTS (	SELECT 1	
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Accident_Type]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Accident_Type] (
			accident_type_id INT IDENTITY CONSTRAINT PK_accident_type PRIMARY KEY NOT NULL,
			description VARCHAR(150) CONSTRAINT NN_accident_type_desc NOT NULL,
			created_at  DATETIME DEFAULT (GETUTCDATE()),
			updated_at  DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table Accident_Type created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Accident_Type already exists into the database';
	END
GO	

/*************************************************************************
**  Table Name: [dbo].[Accident]									  	**
**																		**
**  Primary Key: accident_id											**
**	Foreign Keys: accident_type_id, employee_id							**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 26/01/2019		Tania Valero			Version Initial				**
**************************************************************************/
PRINT 'Creating the Accident table...';

IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Accident]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Accident] (
			accident_id      INT IDENTITY CONSTRAINT PK_accident PRIMARY KEY NOT NULL,
			employee_id      INT CONSTRAINT FK_accident_employee FOREIGN KEY REFERENCES [dbo].[Employee](employee_id) ON DELETE CASCADE,
			accident_type_id INT CONSTRAINT FK_accident_type     FOREIGN KEY REFERENCES [dbo].[Accident_type](accident_type_id) ON DELETE CASCADE,
			cause            VARCHAR(255) CONSTRAINT NN_accident_cause NOT NULL,
			date_init        DATETIME CONSTRAINT NN_accident_date  NOT NULL,
			start_lost_time  DATETIME CONSTRAINT NN_accident_start_lost NOT NULL,
			end_lost_time    DATETIME CONSTRAINT NN_accident_end_lost NOT NULL,
			day_lost         INT CONSTRAINT NN_accident_day_lost NOT NULL,
			severity         VARCHAR(20) DEFAULT NULL,
			turn             VARCHAR(15) DEFAULT NULL,
			created_at       DATETIME DEFAULT (GETUTCDATE()),
			updated_at       DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table Accident created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Accident already exists into the database';
	END
GO	
	
/*************************************************************************
**  Table Name: [dbo].[Incident]									  	**
**																		**
**  Primary Key: incident_id											**
**	Foreign Keys: -														**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 26/01/2019		Tania Valero			Version Initial				**
**************************************************************************/
PRINT 'Creating the Incident table...';

IF NOT EXISTS ( SELECT 1 
                FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Incident]') 
				        AND type in (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Incident] (
			incident_id   INT IDENTITY CONSTRAINT PK_incident PRIMARY KEY NOT NULL,
			employee_id   INT CONSTRAINT FK_incident_employee FOREIGN KEY REFERENCES [dbo].[Employee](employee_id) ON DELETE CASCADE,
			cause         VARCHAR(255) CONSTRAINT NN_incident_cause NOT NULL,
			date_incident DATETIME     CONSTRAINT NN_incident_date NOT NULL,
			frecuency     VARCHAR(8)  DEFAULT NULL,
			kind          VARCHAR(15) DEFAULT NULL,
			created_at    DATETIME DEFAULT (GETUTCDATE()),
			updated_at    DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table Incident created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Incident already exists into the database';
	END
GO
