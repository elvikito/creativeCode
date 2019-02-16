
USE SGSSODATA;
GO
PRINT 'SGSSODATA database selected...';

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Person
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Person]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Person]
GO
PRINT 'Creating the base_Person table...';
IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[base_Person]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[base_Person](
			person_id  INT IDENTITY CONSTRAINT PK_person PRIMARY KEY NOT NULL,
			first_name VARCHAR(50)  CONSTRAINT NN_first_name NOT NULL,
			last_name  VARCHAR(50)  CONSTRAINT NN_last_name NOT NULL,
			email      VARCHAR(40)  CONSTRAINT NN_email NOT NULL,
			created_at DATETIME     DEFAULT (GETUTCDATE()),
			updated_at DATETIME     DEFAULT (GETUTCDATE()));
		PRINT 'Table base_Person created!';
	END
ELSE 
	BEGIN
		PRINT 'Table base_Person already exists into the database...';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Account
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Account]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Account]
GO
PRINT 'Creating the base_Account table...';
IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[base_Account]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[base_Account] (
			account_id INT IDENTITY CONSTRAINT PK_account  PRIMARY KEY NOT NULL,
			person_id  INT          CONSTRAINT FK_account_person FOREIGN KEY REFERENCES [dbo].[base_Person](person_id) ON DELETE CASCADE,
			password   VARCHAR(MAX) CONSTRAINT NN_password NOT NULL,
			created_at DATETIME     DEFAULT (GETUTCDATE()),
			updated_at DATETIME     DEFAULT (GETUTCDATE()));
		PRINT 'Table base_Account created!';
	END
ELSE 
	BEGIN
		PRINT 'Table base_Account already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Role]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Role]
GO
PRINT 'Creating the base_Role table...';
IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[base_Role]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[base_Role] (
			role_id     INT IDENTITY CONSTRAINT PK_role PRIMARY KEY NOT NULL,
			role_name   VARCHAR(50)  CONSTRAINT NN_role_name   NOT NULL,
			description VARCHAR(200) CONSTRAINT NN_description NOT NULL,
			created_at  DATETIME DEFAULT (GETUTCDATE()),
			updated_at  DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table base_Role created!';
	END
ELSE 
	BEGIN
		PRINT 'Table base_Role already exists into the database...';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Person_Role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Person_Role]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Person_Role]
GO
PRINT 'Creating the base_Person_Role table...';
IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[base_Person_Role]')
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[base_Person_Role] ( 
		    person_id  INT CONSTRAINT FK_person_role FOREIGN KEY REFERENCES [dbo].[base_Person](person_id) ON DELETE CASCADE,
		    role_id	   INT CONSTRAINT FK_role FOREIGN KEY REFERENCES [dbo].[base_Role](role_id) ON DELETE CASCADE, 
			created_at DATETIME DEFAULT (GETUTCDATE()),
			updated_at DATETIME DEFAULT (GETUTCDATE()),
		    CONSTRAINT PK_person_role PRIMARY KEY(
				person_id ASC,
				role_id   ASC
		    )
		);

		PRINT 'Table base_Person_Role created!';
	END
ELSE 
	BEGIN
		PRINT 'Table base_Person_Role already exists into the database...';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Department
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Department]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Department]
GO
PRINT 'Creating the base_Department table...';
IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[base_Department]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[base_Department](
			department_id INT IDENTITY CONSTRAINT PK_department PRIMARY KEY NOT NULL,
			name		  VARCHAR(255) CONSTRAINT NN_department_name NOT NULL,
			description	  VARCHAR(255)   CONSTRAINT NN_department_desc NOT NULL,
			created_at    DATETIME DEFAULT (GETUTCDATE()),
			updated_at    DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table base_Department created!';
	END
ELSE 
	BEGIN
		PRINT 'Table base_Department already exists into the database...';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Area
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Area]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Area]
GO
PRINT 'Creating the base_Area table...';
IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[base_Area]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[base_Area] (
			area_id		  INT IDENTITY CONSTRAINT PK_area PRIMARY KEY NOT NULL,
			department_id INT CONSTRAINT FK_department FOREIGN KEY REFERENCES [dbo].[base_Department](department_id) ON DELETE CASCADE,
			name	      VARCHAR(255) CONSTRAINT NN_area_name NOT NULL,
			description	  VARCHAR(255) CONSTRAINT NN_area_desc NOT NULL,
			created_at    DATETIME DEFAULT (GETUTCDATE()),
			updated_at    DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table base_Area created!';
	END
ELSE 
	BEGIN
		PRINT 'Table base_Area already exists into the database...';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Position
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Position]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Position]
GO
PRINT 'Creating the base_Position table...';
IF NOT EXISTS (	SELECT 1
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[base_Position]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[base_Position](
			position_id INT IDENTITY CONSTRAINT PK_position PRIMARY KEY NOT NULL,
			name		VARCHAR(255) CONSTRAINT NN_position_name NOT NULL,
			description VARCHAR(255) CONSTRAINT NN_position_desc NOT NULL,
			created_at  DATETIME DEFAULT (GETUTCDATE()),
			updated_at  DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table base_Position created!';
	END
ELSE 
	BEGIN
		PRINT 'Table base_Position already exists into the database...';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Area_Position
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Area_Position]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Area_Position]
GO
PRINT 'Creating the base_Area_Position table...';
IF NOT EXISTS (	SELECT 1 
			FROM sys.objects 
			WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[base_Area_Position]') 
					AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[base_Area_Position](
			area_position_id INT IDENTITY CONSTRAINT PK_area_position PRIMARY KEY NOT NULL,
			area_id          INT CONSTRAINT	FK_area FOREIGN KEY REFERENCES [dbo].[base_Area](area_id) ON DELETE CASCADE,
			position_id      INT CONSTRAINT	FK_position FOREIGN KEY REFERENCES [dbo].[base_Position](position_id) ON DELETE CASCADE,
			created_at       DATETIME DEFAULT (GETUTCDATE()),
			updated_at       DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table base_Area_Position created!';
	END
ELSE 
	BEGIN
		PRINT 'Table base_Area_Position already exists into the database...';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Employee
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Employee]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Employee]
GO
PRINT 'Creating the base_Employee table...';
IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[base_Employee]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[base_Employee](
			employee_id  INT IDENTITY CONSTRAINT PK_employee PRIMARY KEY NOT NULL,
			person_id    INT CONSTRAINT FK_person_employee FOREIGN KEY REFERENCES [dbo].[base_Person](person_id) ON DELETE CASCADE,
			ci			 INT          CONSTRAINT NN_ci_person NOT NULL,
			address		 VARCHAR(255) CONSTRAINT NN_address_person NOT NULL,
			birth_date	 DATETIME     CONSTRAINT NN_birth_date NOT NULL,
			gender		 VARCHAR(8)   CONSTRAINT NN_gender NOT NULL,
			phone_number INT          CONSTRAINT NN_phone_number NOT NULL,
			picture		 VARBINARY(max) DEFAULT NULL,
			created_at   DATETIME DEFAULT (GETUTCDATE()),
			updated_at   DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table base_Employee created!';
	END
ELSE 
	BEGIN
		PRINT 'Table base_Employee already exists into the database...';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Contract
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Contract]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Contract]
GO
PRINT 'Creating the base_Contract table...';
IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[base_Contract]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[base_Contract](
			contract_id	     INT IDENTITY CONSTRAINT PK_contract PRIMARY KEY NOT NULL,
			employee_id	     INT CONSTRAINT FK_contract_employee FOREIGN KEY REFERENCES [dbo].[base_Employee](employee_id) ON DELETE CASCADE,
			area_position_id INT CONSTRAINT FK_contract_area_position FOREIGN KEY REFERENCES [dbo].[base_Area_Position](area_position_id) ON DELETE CASCADE,
			salary		     MONEY CONSTRAINT NN_salary NOT NULL,
			init_date	     DATETIME CONSTRAINT NN_init_date NOT NULL,
			end_date	     DATETIME DEFAULT NULL,
			employee_type    VARCHAR(8) CONSTRAINT NN_employee_type NOT NULL CHECK (employee_type IN('Parcial', 'Complete')),
			created_at       DATETIME DEFAULT (GETUTCDATE()),
			updated_at       DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table base_Contract created!';
	END
ELSE 
	BEGIN
		PRINT 'Table base_Contract already exists into the database...';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Project
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Project]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Project]
GO
PRINT 'Creating the base_Project table...';
IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[base_Project]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[base_Project] (
			project_id			INT IDENTITY CONSTRAINT PK_project PRIMARY KEY NOT NULL,
			name_project		VARCHAR(255) CONSTRAINT NN_name_project NOT NULL,
			design_project		VARCHAR(255) DEFAULT NULL,
			location_project	VARCHAR(255) CONSTRAINT NN_location_project NOT NULL,
			budget_project		MONEY    CONSTRAINT NN_budget_project     NOT NULL,
			start_date_project	DATETIME CONSTRAINT NN_start_date_project NOT NULL,
			ending_date_project DATETIME DEFAULT NULL,
			created_at          DATETIME DEFAULT (GETUTCDATE()),
			updated_at          DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table base_Project created!';
	END
ELSE 
	BEGIN
		PRINT 'Table base_Project already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Item_Equipment
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Item_Equipment]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Item_Equipment]
GO
PRINT 'Creating the base_Item_Equipment table...';
IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[base_Item_Equipment]')
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE dbo.base_Item_Equipment(
			item_equipment_id INT IDENTITY CONSTRAINT PK_item_equipment PRIMARY KEY NOT NULL,
			name_equipment	  VARCHAR(100) CONSTRAINT NN_item_equipment_name NOT NULL,
			description		  VARCHAR(100) CONSTRAINT NN_item_equipment_desc NOT NULL,
			acquisition_date  DATETIME CONSTRAINT NN_acquisition_date NOT NULL,
			created_at        DATETIME DEFAULT (GETUTCDATE()),
			updated_at        DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table base_Item_Equipment created!';
	END
ELSE 
	BEGIN
		PRINT 'Table base_Item_Equipment already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Employee_Project
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Employee_Project]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Employee_Project]
GO
PRINT 'Creating the base_Employee_Project table...';
IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[base_Employee_Project]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[base_Employee_Project](
			emp_proj_id	INT IDENTITY CONSTRAINT PK_emp_proj PRIMARY KEY NOT NULL,
			employee_id	INT CONSTRAINT FK_employee_project_e FOREIGN KEY REFERENCES [dbo].[base_Employee](employee_id) ON DELETE CASCADE,
			project_id	INT CONSTRAINT FK_employee_project_p FOREIGN KEY REFERENCES [dbo].[base_Project](project_id) ON DELETE CASCADE,
			created_at  DATETIME DEFAULT (GETUTCDATE()),
			updated_at  DATETIME DEFAULT (GETUTCDATE()));
		
		PRINT 'Table base_Employee_Project created!';
	END 
ELSE 
	BEGIN
		PRINT 'Table base_Employee_Project already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Assignment_Item_Equipment
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Assignment_Item_Equipment]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Assignment_Item_Equipment]
GO
PRINT 'Creating the base_Assignment_Item_Equipment table...';
IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[base_Assignment_Item_Equipment]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[base_Assignment_Item_Equipment](
			assignment_item_id INT IDENTITY CONSTRAINT PK_assignment_item PRIMARY KEY NOT NULL,
			emp_proj_id		   INT CONSTRAINT FK_assign_emp_proj FOREIGN KEY REFERENCES [dbo].[base_Employee_Project](emp_proj_id) ON DELETE CASCADE,
			item_equipment_id  INT CONSTRAINT FK_assign_it_equipment FOREIGN KEY REFERENCES [dbo].[base_Item_Equipment](item_equipment_id) ON DELETE CASCADE,
			date_assignment	   DATETIME CONSTRAINT NN_date_assignment NOT NULL,
			created_at         DATETIME DEFAULT (GETUTCDATE()),
			updated_at         DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table base_Assignment_Item_Equipment created!';
	END
ELSE 
	BEGIN
		PRINT 'Table base_Assignment_Item_Equipment already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Machinery
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Machinery]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Machinery]
GO
PRINT 'Creating the base_Machinery table...';
IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[base_Machinery]') 
							AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[base_Machinery] (
			machinery_id	INT IDENTITY CONSTRAINT PK_machinary PRIMARY KEY NOT NULL,
			name_machinery	VARCHAR (150) CONSTRAINT NN_machinery_name NOT NULL,
			brand_machinery	VARCHAR (50)  CONSTRAINT NN_machinery_brand NOT NULL,
			model_machinery	VARCHAR (50)  CONSTRAINT NN_machinery_model NOT NULL,
			state_machinery	VARCHAR (50)  DEFAULT NULL,
			created_at      DATETIME DEFAULT (GETUTCDATE()),
			updated_at      DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table base_Machinery created!';
	END
ELSE 
	BEGIN
		PRINT 'Table base_Machinery already exists into the database';
	END
GO
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Assignment_Machinery
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Assignment_Machinery]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Assignment_Machinery]
GO
PRINT 'Creating the base_Assignment_Machinery table...';
IF NOT EXISTS (	SELECT 1
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[base_Assignment_Machinery]') 
							AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[base_Assignment_Machinery] (
			assignment_machinery_id INT IDENTITY CONSTRAINT PK_assignment_machinery PRIMARY KEY NOT NULL,
			emp_proj_id			    INT CONSTRAINT FK_assign_mach_emp_proj FOREIGN KEY REFERENCES [dbo].[base_Employee_Project](emp_proj_id) ON DELETE CASCADE,
			machinery_id			INT CONSTRAINT FK_assing_mach_machinery FOREIGN KEY REFERENCES [dbo].[base_Machinery](machinery_id) ON DELETE CASCADE,
			start_date_assign		DATETIME CONSTRAINT NN_start_date_a NOT NULL,
			ending_date_asg_mac	    DATETIME DEFAULT NULL,
			created_at              DATETIME DEFAULT (GETUTCDATE()),
			updated_at              DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table base_Assignment_Machinery created!';
	END
ELSE 
	BEGIN
		PRINT 'Table base_Assignment_Machinery already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Accident_Type
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Accident_Type]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Accident_Type]
GO
PRINT 'Creating the base_Accident_Type table...';
IF NOT EXISTS (	SELECT 1	
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[base_Accident_Type]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[base_Accident_Type] (
			accident_type_id INT IDENTITY CONSTRAINT PK_accident_type PRIMARY KEY NOT NULL,
			description VARCHAR(150) CONSTRAINT NN_accident_type_desc NOT NULL,
			created_at  DATETIME DEFAULT (GETUTCDATE()),
			updated_at  DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table base_Accident_Type created!';
	END
ELSE 
	BEGIN
		PRINT 'Table base_Accident_Type already exists into the database';
	END
GO	

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Accident
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Accident]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Accident]
GO
PRINT 'Creating the base_Accident table...';
IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[base_Accident]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[base_Accident] (
			accident_id      INT IDENTITY CONSTRAINT PK_accident PRIMARY KEY NOT NULL,
			employee_id      INT CONSTRAINT FK_accident_employee FOREIGN KEY REFERENCES [dbo].[base_Employee](employee_id) ON DELETE CASCADE,
			accident_type_id INT CONSTRAINT FK_accident_type     FOREIGN KEY REFERENCES [dbo].[base_Accident_Type](accident_type_id) ON DELETE CASCADE,
			cause            VARCHAR(255) CONSTRAINT NN_accident_cause NOT NULL,
			date_init        DATETIME CONSTRAINT NN_accident_date  NOT NULL,
			start_lost_time  DATETIME CONSTRAINT NN_accident_start_lost NOT NULL,
			end_lost_time    DATETIME CONSTRAINT NN_accident_end_lost NOT NULL,
			day_lost         INT CONSTRAINT NN_accident_day_lost NOT NULL,
			severity         VARCHAR(20) DEFAULT NULL,
			turn             VARCHAR(15) DEFAULT NULL,
			created_at       DATETIME DEFAULT (GETUTCDATE()),
			updated_at       DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table base_Accident created!';
	END
ELSE 
	BEGIN
		PRINT 'Table base_Accident already exists into the database';
	END
GO	
	
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Incident
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Incident]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Incident]
GO
PRINT 'Creating the base_Incident table...';
IF NOT EXISTS ( SELECT 1 
                FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[base_Incident]') 
				        AND type in (N'U'))
	BEGIN
		CREATE TABLE [dbo].[base_Incident] (
			incident_id   INT IDENTITY CONSTRAINT PK_incident PRIMARY KEY NOT NULL,
			employee_id   INT CONSTRAINT FK_incident_employee FOREIGN KEY REFERENCES [dbo].[base_Employee](employee_id) ON DELETE CASCADE,
			cause         VARCHAR(255) CONSTRAINT NN_incident_cause NOT NULL,
			date_incident DATETIME     CONSTRAINT NN_incident_date NOT NULL,
			frecuency     VARCHAR(8)  DEFAULT NULL,
			kind          VARCHAR(15) DEFAULT NULL,
			created_at    DATETIME DEFAULT (GETUTCDATE()),
			updated_at    DATETIME DEFAULT (GETUTCDATE()));

		PRINT 'Table base_Incident created!';
	END
ELSE 
	BEGIN
		PRINT 'Table base_Incident already exists into the database';
	END
GO