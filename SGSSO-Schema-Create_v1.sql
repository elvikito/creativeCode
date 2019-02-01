USE [creativecode]
GO

/*=============================================================================*/
/* SCHEMA AUTHENTICATION                                                       */
/*=============================================================================*/

/*******************************************************************************/
/*  Table Name: Person                                                         */
/*                                                                             */
/*  Primary Key: person_id                                                     */
/*  Foreign Keys: -                                                            */
/*******************************************************************************/
/*                              Change History                                 */
/*******************************************************************************/
/* Date:        Author:           Description:                                 */
/* ----------   ---------------   ---------------------------------------------*/
/* 28/01/2019   Antonio Vargas    Initial version                              */
/*******************************************************************************/

PRINT 'Creating the Person table...';

IF NOT EXISTS (
	SELECT 1 FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[Person]') AND type in (N'U'))
	BEGIN
		CREATE TABLE dbo.Person (
			person_id  INT IDENTITY CONSTRAINT PK_person     PRIMARY KEY,
			first_name VARCHAR(50)  CONSTRAINT NN_first_name NOT NULL,
			last_name  VARCHAR(50)  CONSTRAINT NN_last_name  NOT NULL,
			email      VARCHAR(40)  CONSTRAINT NN_email      NOT NULL,
			created_at DATETIME     DEFAULT NULL,
			updated_at DATETIME     DEFAULT NULL
		);

		PRINT 'Table Person created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Person already exists into the database';
	END
GO


/*******************************************************************************/
/*  Table Name: Account                                                        */
/*                                                                             */
/*  Primary Key: account_id                                                    */
/*  Foreign Keys: -                                                            */
/*******************************************************************************/
/*                              Change History                                 */
/*******************************************************************************/
/* Date:        Author:           Description:                                 */
/* ----------   ---------------   ---------------------------------------------*/
/* 28/01/2019   Antonio Vargas    Initial version                              */
/*******************************************************************************/

PRINT 'Creating the Account table...';

IF NOT EXISTS (
	SELECT 1 FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[Account]') AND type in (N'U'))
	BEGIN
		CREATE TABLE dbo.Account (
			account_id INT IDENTITY CONSTRAINT PK_account  PRIMARY KEY,
			person_id  INT          CONSTRAINT FK_acount_person   REFERENCES Person(person_id),
			password   VARCHAR(15)  CONSTRAINT NN_password NOT NULL,
			created_at DATETIME     DEFAULT NULL,
			updated_at DATETIME     DEFAULT NULL
		);

		PRINT 'Table Account created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Account already exists into the database';
	END
GO


/*******************************************************************************/
/*  Table Name: Role                                                           */
/*                                                                             */
/*  Primary Key: role_id                                                       */
/*  Foreign Keys: -                                                            */
/*******************************************************************************/
/*                              Change History                                 */
/*******************************************************************************/
/* Date:        Author:           Description:                                 */
/* ----------   ---------------   ---------------------------------------------*/
/* 28/01/2019   Antonio Vargas    Initial version                              */
/*******************************************************************************/

PRINT 'Creating the Role table...';

IF NOT EXISTS (
	SELECT 1 FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND type in (N'U'))
	BEGIN
		CREATE TABLE Role (
			role_id     INT IDENTITY CONSTRAINT PK_role        PRIMARY KEY,
			role_name   VARCHAR(50)  CONSTRAINT NN_role_name   DEFAULT NULL,
			description VARCHAR(200) CONSTRAINT NN_description DEFAULT NULL,
			created_at  DATETIME     DEFAULT NULL,
			updated_at  DATETIME     DEFAULT NULL
		);

		PRINT 'Table Role created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Role already exists into the database';
	END
GO


/*******************************************************************************/
/*  Table Name: Person_Role                                                    */
/*                                                                             */
/*  Primary Key: -                                                             */
/*  Foreign Keys: person_id, role_id                                           */
/*******************************************************************************/
/*                              Change History                                 */
/*******************************************************************************/
/* Date:        Author:           Description:                                 */
/* ----------   ---------------   ---------------------------------------------*/
/* 28/01/2019   Antonio Vargas    Initial version                              */
/*******************************************************************************/

PRINT 'Creating the Person_Role table...';

IF NOT EXISTS (
	SELECT 1 FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[Person_Role]') AND type in (N'U'))
	BEGIN
		CREATE TABLE Person_Role ( 
		   person_id INT CONSTRAINT FK_person_role REFERENCES Person(person_id),
		   role_id   INT CONSTRAINT FK_role   REFERENCES Role(role_id) 
		);

		PRINT 'Table Person_Role created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Person_Role already exists into the database';
	END
GO


/*=============================================================================*/
/* SCHEMA ORGANIZATIONAL                                                       */
/*=============================================================================*/

/*******************************************************************************/
/*  Table Name: Department                                                     */
/*                                                                             */
/*  Primary Key: department_id                                                 */
/*  Foreign Keys: -                                                            */
/*******************************************************************************/
/*                              Change History                                 */
/*******************************************************************************/
/* Date:        Author:           Description:                                 */
/* ----------   ---------------   ---------------------------------------------*/
/* --/01/2019   Elvis R. Ramirez Iriarte 		Initial version                */
/*******************************************************************************/

PRINT 'Creating the Department table...';

IF NOT EXISTS (
	SELECT 1 FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND type in (N'U'))
	BEGIN
		CREATE TABLE dbo.Department (
		  department_id int IDENTITY CONSTRAINT PK_department PRIMARY KEY,
		  name varchar(255) NOT NULL,
		  description varchar(255) NOT NULL,
		  created_at datetime DEFAULT NULL,
		  updated_at datetime DEFAULT NULL,
		);

		PRINT 'Table Department created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Department already exists into the database';
	END
GO


/*******************************************************************************/
/*  Table Name: Area                                                           */
/*                                                                             */
/*  Primary Key: area_id                                                       */
/*  Foreign Keys: -                                                            */
/*******************************************************************************/
/*                              Change History                                 */
/*******************************************************************************/
/* Date:        Author:           Description:                                 */
/* ----------   ---------------   ---------------------------------------------*/
/* --/01/2019                     Initial version                              */
/*******************************************************************************/

PRINT 'Creating the Area table...';

IF NOT EXISTS (
	SELECT 1 FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[Area]') AND type in (N'U'))
	BEGIN
		CREATE TABLE dbo.Area (
		  area_id int IDENTITY CONSTRAINT PK_area PRIMARY KEY,
		  name varchar(255) NOT NULL,
		  description varchar(255) NOT NULL,
		  created_at datetime DEFAULT NULL,
		  updated_at datetime DEFAULT NULL
		);

		PRINT 'Table Area created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Area already exists into the database';
	END
GO

/*******************************************************************************/
/*  Table Name: Position                                                       */
/*                                                                             */
/*  Primary Key: position_id                                                   */
/*  Foreign Keys: -                                                            */
/*******************************************************************************/
/*                              Change History                                 */
/*******************************************************************************/
/* Date:        Author:           Description:                                 */
/* ----------   ---------------   ---------------------------------------------*/
/* --/01/2019   Elvis R. Ramirez Iriarte 		Initial version                */
/*******************************************************************************/

PRINT 'Creating the Position table...';

IF NOT EXISTS (
	SELECT 1 FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[Position]') AND type in (N'U'))
	BEGIN
		CREATE TABLE Position (
			position_id INT IDENTITY CONSTRAINT PK_position PRIMARY KEY,
			name varchar(255) DEFAULT NULL,
			description varchar(255) DEFAULT NULL,
			created_at datetime DEFAULT NULL,
			updated_at datetime DEFAULT NULL
		);

		PRINT 'Table Position created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Position already exists into the database';
	END
GO

/*******************************************************************************/
/*  Table Name: Area_Position                                                  */
/*                                                                             */
/*  Primary Key: -                                                             */
/*  Foreign Keys: area_id, position_id                                         */
/*******************************************************************************/
/*                              Change History                                 */
/*******************************************************************************/
/* Date:        Author:           Description:                                 */
/* ----------   ---------------   ---------------------------------------------*/
/* --/01/2019   Elvis R. Ramirez Iriarte 		Initial version                */
/*******************************************************************************/

PRINT 'Creating the Area_Position table...';

IF NOT EXISTS (
	SELECT 1 FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[Area_Position]') AND type in (N'U'))
	BEGIN
		CREATE TABLE Area_Position ( 
			area_id     INT REFERENCES [dbo].[Area](area_id),
			position_id INT REFERENCES [dbo].[Position](position_id)
		);

		PRINT 'Table Area_Position created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Area_Position already exists into the database';
	END
GO


/*******************************************************************************/
/*  Table Name: Employee                                                       */
/*                                                                             */
/*  Primary Key: employee_id                                                   */
/*  Foreign Keys: -                                                            */
/*******************************************************************************/
/*                              Change History                                 */
/*******************************************************************************/
/* Date:        Author:           Description:                                 */
/* ----------   ---------------   ---------------------------------------------*/
/* --/01/2019   Elvis R. Ramirez Iriarte 		Initial version                */
/*******************************************************************************/

PRINT 'Creating the Employee table...';

IF NOT EXISTS (
	SELECT 1 FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
	BEGIN
		CREATE TABLE Employee (
			employee_id INT IDENTITY CONSTRAINT PK_cliente PRIMARY KEY,
			first_name varchar(255) NOT NULL,
			last_name varchar(255) NOT NULL,
			email varchar(255) DEFAULT NULL,
			ci int NOT NULL,
			address varchar(255) DEFAULT NULL,
			birth_date datetime NOT NULL,
			gender varchar(8) DEFAULT NULL,
			picture varbinary(max),
			phone_number int DEFAULT NULL,
			created_at datetime DEFAULT NULL,
			updated_at datetime DEFAULT NULL  
		);

		PRINT 'Table Employee created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Employee already exists into the database';
	END
GO


/*******************************************************************************/
/*  Table Name: Contract                                                       */
/*                                                                             */
/*  Primary Key: contract_id                                                   */
/*  Foreign Keys: employee_id, postition_id                                    */
/*******************************************************************************/
/*                              Change History                                 */
/*******************************************************************************/
/* Date:        Author:           Description:                                 */
/* ----------   ---------------   ---------------------------------------------*/
/* --/01/2019   Elvis R. Ramirez Iriarte 		Initial version                */
/*******************************************************************************/

PRINT 'Creating the Contract table...';

IF NOT EXISTS (
	SELECT 1 FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[Contract]') AND type in (N'U'))
	BEGIN
		CREATE TABLE dbo.Contract(
			contract_id INT IDENTITY CONSTRAINT PK_contract PRIMARY KEY,
			employee_id INT CONSTRAINT FK_contract_employee REFERENCES [dbo].[Employee](employee_id) ON DELETE CASCADE,
			position_id INT CONSTRAINT FK_contract_position REFERENCES [dbo].[Position](position_id) ON DELETE CASCADE,
			salary decimal DEFAULT NULL,
			init_date datetime NOT NULL,
			end_date datetime DEFAULT NULL,
			employee_type varchar(15) DEFAULT NULL,
			created_at datetime DEFAULT NULL,
			updated_at datetime DEFAULT NULL
		);

		PRINT 'Table Contract created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Contract already exists into the database';
	END
GO
 
/*=============================================================================*/
/* SCHEMA ORGANIZATIONAL                                                       */
/*=============================================================================*/
 
/*******************************************************************************/
/*  Table Name: Equipment                                                      */
/*                                                                             */
/*  Primary Key: equipment_id                                                  */
/*  Foreign Keys: -                                                            */
/*******************************************************************************/
/*                              Change History                                 */
/*******************************************************************************/
/* Date:        Author:           Description:                                 */
/* ----------   ---------------   ---------------------------------------------*/
/* 26/01/2019   Pamela Cardozo    Initial version                              */
/*******************************************************************************/

PRINT 'Creating the Equipment table...';

IF NOT EXISTS (
	SELECT 1 FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[Equipment]') AND type in (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Equipment](
			equipment_id INT CONSTRAINT PK_equipment PRIMARY KEY NOT NULL
			,name_equipment VARCHAR(100) CONSTRAINT NN_name_equipment NOT NULL
			,description VARCHAR(100) CONSTRAINT NN_description NOT NULL
			,acquisition_date DATETIME CONSTRAINT NN_acquisition_date NOT NULL
			,created_at DATETIME DEFAULT NULL
			,updated_at DATETIME DEFAULT NULL
		);

		PRINT 'Table Equipment created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Equipment already exists into the database';
	END
GO


/*******************************************************************************/
/*  Table Name: Assignment_Equipment                                           */
/*                                                                             */
/*  Primary Key: assig_equip_id                                                */
/*  Foreign Keys: emp_proj_id, equipment_id                                    */
/*******************************************************************************/
/*                              Change History                                 */
/*******************************************************************************/
/* Date:        Author:           Description:                                 */
/* ----------   ---------------   ---------------------------------------------*/
/* 26/01/2019   Pamela Cardozo    Initial version                              */
/*******************************************************************************/

PRINT 'Creating the Assignment_Equipment table...';

IF NOT EXISTS (
	SELECT 1 FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[Assignment_Equipment]') AND type in (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Assignment_Equipment](
			 assig_equip_id INT CONSTRAINT PK_assig_equip_id PRIMARY KEY NOT NULL
			,emp_proj_id INT CONSTRAINT FK_assing_emppro_id FOREIGN KEY REFERENCES [dbo].[Employee_Project](emp_proj_id)
			,equipment_id INT CONSTRAINT FK_equipment FOREIGN KEY REFERENCES [dbo].[Equipment](equipment_id)
			,date_assignment DATETIME CONSTRAINT NN_date_assignment NOT NULL
		);

		PRINT 'Table Assignment_Equipment created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Assignment_Equipment already exists into the database';
	END
GO


/*******************************************************************************/
/*  Table Name: Employee_Project                                               */
/*                                                                             */
/*  Primary Key: emp_proj_id                                                   */
/*  Foreign Keys: employee_id, project_id                                      */
/*******************************************************************************/
/*                              Change History                                 */
/*******************************************************************************/
/* Date:        Author:           Description:                                 */
/* ----------   ---------------   ---------------------------------------------*/
/* 26/01/2019   Pamela Cardozo    Initial version                              */
/*******************************************************************************/

PRINT 'Creating the Employee_Project table...';

IF NOT EXISTS (
	SELECT 1 FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[Employee_Project]') AND type in (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Employee_Project](
			 emp_proj_id INT CONSTRAINT PK_assig_equipid PRIMARY KEY NOT NULL
			,employee_id INT CONSTRAINT FK_employee_project_eid FOREIGN KEY REFERENCES [dbo].[Employee](employee_id)
			,project_id INT CONSTRAINT FK_employee_project_pid FOREIGN KEY REFERENCES [dbo].[Project](project_id)
		);


		PRINT 'Table Employee_Project created!';
	END 
ELSE 
	BEGIN
		PRINT 'Table Employee_Project already exists into the database';
	END
GO


/*******************************************************************************/
/*  Table Name: Machinery                                                      */
/*                                                                             */
/*  Primary Key: machinary_id                                                  */
/*  Foreign Keys: -                                                            */
/*******************************************************************************/
/*                              Change History                                 */
/*******************************************************************************/
/* Date:        Author:           Description:                                 */
/* ----------   ---------------   ---------------------------------------------*/
/* 26/01/2019   Elvis L. Arispe   Initial version                              */
/*******************************************************************************/

PRINT 'Creating the Machinery table...';

IF NOT EXISTS (
	SELECT 1 FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[Machinery]') AND type in (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Machinery] (
			machinary_id INT CONSTRAINT PK_machinary_id PRIMARY KEY NOT NULL
			,name_machinary VARCHAR (100) CONSTRAINT NN_name_machinary NOT NULL
			,brand_machinary VARCHAR (100) CONSTRAINT NN_brand_machinary NOT NULL
			,model_machinary VARCHAR (100) CONSTRAINT NN_model_machinary NOT NULL
			,state_machinary VARCHAR (100) 
		)

		PRINT 'Table Machinery created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Machinery already exists into the database';
	END
GO


/*******************************************************************************/
/*  Table Name: Assignment_Machinery                                           */
/*                                                                             */
/*  Primary Key: asg_mac_id                                                    */
/*  Foreign Keys: emp_proy_id, machinary_id                                    */
/*******************************************************************************/
/*                              Change History                                 */
/*******************************************************************************/
/* Date:        Author:           Description:                                 */
/* ----------   ---------------   ---------------------------------------------*/
/* 26/01/2019   Elvis L. Arispe   Initial version                              */
/*******************************************************************************/

PRINT 'Creating the Assignment_Machinery table...';

IF NOT EXISTS (
	SELECT 1 FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[Assignment_Machinery]') AND type in (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Assignment_Machinery] (
			 asg_mac_id INT CONSTRAINT PK_asg_mac_id PRIMARY KEY NOT NULL
			,emp_proy_id INT CONSTRAINT FK_assing_emp_proy FOREIGN KEY REFERENCES [dbo].[Employee_Project](emp_proj_id)
			,machinary_id INT CONSTRAINT FK_assing_machinary FOREIGN KEY REFERENCES [dbo].[Machinery](machinary_id)
			,start_date_asg_mac DATETIME CONSTRAINT NN_start_date_asg_mac NOT NULL
			,ending_date_asg_mac DATETIME
		);

		PRINT 'Table Assignment_Machinery created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Assignment_Machinery already exists into the database';
	END
GO


/*******************************************************************************/
/*  Table Name: Project                                                        */
/*                                                                             */
/*  Primary Key: project_id                                                    */
/*  Foreign Keys: -                                                            */
/*******************************************************************************/
/*                              Change History                                 */
/*******************************************************************************/
/* Date:        Author:           Description:                                 */
/* ----------   ---------------   ---------------------------------------------*/
/* 26/01/2019   Elvis L. Arispe   Initial version                              */
/*******************************************************************************/

PRINT 'Creating the Project table...';

IF NOT EXISTS (
	SELECT 1 FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[Project]') AND type in (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Project] (
			project_id INT CONSTRAINT PK_project_id PRIMARY KEY NOT NULL
			,name_project VARCHAR (255) CONSTRAINT NN_name_project NOT NULL
			,design_proyect VARCHAR (255)
			,location_proyect VARCHAR (255) CONSTRAINT NN_location_proyect NOT NULL
			,budget_proyect MONEY CONSTRAINT NN_budget_proyect NOT NULL
			,start_date_project DATETIME CONSTRAINT NN_start_date_project NOT NULL
			,ending_date_project DATETIME
		);

		PRINT 'Table Project created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Project already exists into the database';
	END
GO 


/*=============================================================================*/
/* SCHEMA ACCIDENT                                                             */
/*=============================================================================*/

/*******************************************************************************/
/*  Table Name: Accident                                                       */
/*                                                                             */
/*  Primary Key: accident_id                                                   */
/*  Foreign Keys: accidente_type_id, employee_id                               */
/*******************************************************************************/
/*                              Change History                                 */
/*******************************************************************************/
/* Date:        Author:           Description:                                 */
/* ----------   ---------------   ---------------------------------------------*/
/* 26/01/2019   Tania Valero      Initial version                              */
/*******************************************************************************/

PRINT 'Creating the Accident table...';

IF NOT EXISTS (
	SELECT 1 FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[Accident]') AND type in (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Accident] (
			accident_id INT IDENTITY CONSTRAINT PK_accident_id PRIMARY KEY,
			employee_id INT CONSTRAINT FK_accident_employee_id FOREIGN KEY REFERENCES [dbo].[Employee](employee_id) ON DELETE CASCADE,
			accident_type_id INT CONSTRAINT FK_accident_type_id FOREIGN KEY
			REFERENCES [dbo].[accident_type](accident_type_id) ON DELETE CASCADE,
			cause VARCHAR(255) NOT NULL,
			date_init DATETIME NOT NULL,
			factor VARCHAR(15) DEFAULT NULL,
			medication VARCHAR(8) DEFAULT NULL,
			receive VARCHAR(15) DEFAULT NULL,
			severity VARCHAR(15) DEFAULT NULL,
			start_lost_time DATETIME NOT NULL,
			day_lost VARCHAR(255) NOT NULL,
			end_lost_time DATETIME NOT NULL,
			turn VARCHAR(15) DEFAULT NULL,
			created_at DATETIME DEFAULT NULL,
			updated_at DATETIME DEFAULT NULL
		);

		PRINT 'Table Accident created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Accident already exists into the database';
	END
GO 


/*******************************************************************************/
/*  Table Name: Accident_type                                                 */
/*                                                                             */
/*  Primary Key: accident_type_id                                              */
/*  Foreign Keys: -                                                            */
/*******************************************************************************/
/*                              Change History                                 */
/*******************************************************************************/
/* Date:        Author:           Description:                                 */
/* ----------   ---------------   ---------------------------------------------*/
/* 26/01/2019   Tania Valero      Initial version                              */
/*******************************************************************************/

PRINT 'Creating the Accident_type table...';

IF NOT EXISTS (
	SELECT 1 FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[Accident_type]') AND type in (N'U'))
	BEGIN
		CREATE TABLE dbo.accident_type (
		  accident_type_id INT IDENTITY CONSTRAINT PK_accident_id_type PRIMARY KEY,
		  description VARCHAR(150) DEFAULT NULL,
		  created_at DATETIME DEFAULT NULL,
		  updated_at DATETIME DEFAULT NULL
		);

		PRINT 'Table Accident_type created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Accident_type already exists into the database';
	END
GO


/*******************************************************************************/
/*  Table Name: Incident                                                       */
/*                                                                             */
/*  Primary Key: incident_id                                                   */
/*  Foreign Keys: -                                                            */
/*******************************************************************************/
/*                              Change History                                 */
/*******************************************************************************/
/* Date:        Author:           Description:                                 */
/* ----------   ---------------   ---------------------------------------------*/
/* 26/01/2019   Tania Valero      Initial version                              */
/*******************************************************************************/

PRINT 'Creating the Incident table...';

IF NOT EXISTS (
	SELECT 1 FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[Incident]') AND type in (N'U'))
	BEGIN
		CREATE TABLE dbo.Incident (
			incident_id INT IDENTITY CONSTRAINT PK_incident_id PRIMARY KEY,
			cause VARCHAR(255) NOT NULL,
			date_init DATETIME NOT NULL,
			factor VARCHAR(15) DEFAULT NULL,
			frecuency VARCHAR(8) DEFAULT NULL,
			kind VARCHAR(15) DEFAULT NULL,
			severity VARCHAR(15) DEFAULT NULL,
			created_at DATETIME DEFAULT NULL,
			updated_at DATETIME DEFAULT NULL,
		);

		PRINT 'Table Incident created!';
	END
ELSE 
	BEGIN
		PRINT 'Table Incident already exists into the database';
	END
GO