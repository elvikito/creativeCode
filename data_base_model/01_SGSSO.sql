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
			created_at DATETIME     DEFAULT NULL,
			updated_at DATETIME     DEFAULT NULL,
            Rowversion TIMESTAMP);

		PRINT '!Table Person created!';
	END
	ELSE
	BEGIN
		PRINT 'Table Person already exists into the database...';
	END;
/*************************************************************************
**  Table Name: [dbo].[Account]   												**
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
			person_id  INT          CONSTRAINT FK_acount_person FOREIGN KEY REFERENCES [dbo].[Person](person_id) ON DELETE CASCADE,
			password   VARBINARY(8000)  CONSTRAINT NN_password NOT NULL,
			created_at DATETIME     DEFAULT	NULL,
			updated_at DATETIME     DEFAULT NULL,
            Rowversion TIMESTAMP);

		PRINT '!Table Account created!';
	END
	ELSE 
	BEGIN
		PRINT 'Table Account already exists into the database';
	END;
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
			role_name   VARCHAR(50)  CONSTRAINT NN_role_name   DEFAULT NULL,
			description VARCHAR(200) CONSTRAINT NN_description DEFAULT NULL,
			created_at  DATETIME     DEFAULT NULL,
			updated_at  DATETIME     DEFAULT NULL,
            Rowversion TIMESTAMP);

		PRINT '!Table Role created!';
	END
	ELSE 
	BEGIN
		PRINT 'Table Role already exists into the database...';
	END;
/*************************************************************************
**  Table Name: [dbo].[Person_Role]	  									**
**																		**
**  Primary Key: -														**
**	Foreign Keys: person_id,role_id		  								**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 28/01/2019		Antonio Vargas			Version Initial				**
**************************************************************************/
	PRINT 'Creating the Person_Role table...';

	IF NOT EXISTS (	SELECT 1 
					FROM sys.objects 
					WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Person_Role]')
							AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Person_Role] ( 
		   person_id	INT CONSTRAINT	FK_person_role FOREIGN KEY REFERENCES [dbo].[Person](person_id) ON DELETE CASCADE,
		   role_id		INT CONSTRAINT FK_role FOREIGN KEY REFERENCES [dbo].[Role](role_id) ON DELETE CASCADE,
           Rowversion TIMESTAMP);

		PRINT '!Table Person_Role created!';
	END
	ELSE 
	BEGIN
		PRINT 'Table Person_Role already exists into the database...';
	END;
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
		  name			VARCHAR(255) NOT NULL,
		  description	VARCHAR(255) NOT NULL,
		  created_at	DATETIME DEFAULT NULL,
		  updated_at	DATETIME DEFAULT NULL,
          Rowversion    TIMESTAMP NOT NULL);

		PRINT '!Table Department created!';
	END
	ELSE 
	BEGIN
		PRINT 'Table Department already exists into the database...';
	END;
/*************************************************************************
**  Table Name: [dbo].[Area]		  									**
**																		**
**  Primary Key: area_id												**
**	Foreign Keys: person_id,role_id		  								**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 26/01/2019		Elvis R. Ramirez			Version Initial				**
**************************************************************************/
	PRINT 'Creating the Area table...';

	IF NOT EXISTS (	SELECT 1 
					FROM sys.objects 
					WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Area]') 
							AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Area] (
		  area_id		INT IDENTITY CONSTRAINT PK_area PRIMARY KEY NOT NULL,
		  name			VARCHAR(255) NOT NULL,
		  description	VARCHAR(255) NOT NULL,
		  department_id INT CONSTRAINT FK_department_id FOREIGN KEY REFERENCES [dbo].[Department](department_id) ON DELETE CASCADE,
		  created_at	DATETIME DEFAULT NULL,
		  updated_at	DATETIME DEFAULT NULL,
          Rowversion    TIMESTAMP NOT NULL);

		PRINT '!Table Area created!';
	END
	ELSE 
	BEGIN
		PRINT 'Table Area already exists into the database...';
	END;
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
			name		VARCHAR(255) DEFAULT NULL,
			description VARCHAR(255) DEFAULT NULL,
			created_at	DATETIME DEFAULT NULL,
			updated_at	DATETIME DEFAULT NULL,
            Rowversion  TIMESTAMP NOT NULL);

		PRINT '!Table Position created!';
	END
	ELSE 
	BEGIN
		PRINT 'Table Position already exists into the database...';
	END;
/*************************************************************************
**  Table Name: [dbo].[Area_Position]		  							**
**																		**
**  Primary Key: -														**
**	Foreign Keys: area_id,position_id					  				**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 26/01/2019		Elvis R. Ramirez 		Version Initial				**
**************************************************************************/
	PRINT 'Creating the Area_Position table...';

	IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Area_Position]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Area_Position]( 
			area_id     INT CONSTRAINT	FK_area_id FOREIGN KEY REFERENCES [dbo].[Area](area_id) ON DELETE CASCADE,
			position_id INT CONSTRAINT	FK_position_id FOREIGN KEY REFERENCES [dbo].[Position](position_id) ON DELETE CASCADE,
            Rowversion  TIMESTAMP NOT NULL);

		PRINT '!Table Area_Position created!';
	END
	ELSE 
	BEGIN
		PRINT 'Table Area_Position already exists into the database...';
	END;
/*************************************************************************
**  Table Name: [dbo].[Employee]			  							**
**																		**
**  Primary Key: employee_id											**
**	Foreign Keys: -										  				**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 25/01/2019		Team "Creative"			Version Initial				**
**************************************************************************/
	PRINT 'Creating the Employee table...';

	IF NOT EXISTS (	SELECT 1 
					FROM sys.objects 
					WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Employee]') 
							AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Employee](
			employee_id  INT IDENTITY CONSTRAINT PK_cliente PRIMARY KEY NOT NULL,
			first_name	 VARCHAR(255) NOT NULL,
			last_name	 VARCHAR(255) NOT NULL,
			email		 VARCHAR(255) DEFAULT NULL,
			ci			 INT NOT NULL,
			address		 VARCHAR(255) DEFAULT NULL,
			birth_date	 DATETIME NOT NULL,
			gender		 VARCHAR(8) DEFAULT NULL,
			picture		 VARBINARY(max),
			phone_number INT DEFAULT NULL,
			created_at	 DATETIME DEFAULT NULL,
			updated_at	 DATETIME DEFAULT NULL,
			person_id    INT CONSTRAINT FK_person_id FOREIGN KEY REFERENCES [dbo].[Person](person_id),
            Rowversion   TIMESTAMP NOT NULL);

		PRINT '!Table Employee created!';
	END
	ELSE 
	BEGIN
		PRINT 'Table Employee already exists into the database...';
	END;
/*************************************************************************
**  Table Name: [dbo].[Employee]			  							**
**																		**
**  Primary Key: contract_id											**
**	Foreign Keys: employee_id,position_id								**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 26/01/2019		Elvis R. Ramirez		Version Initial				**
**************************************************************************/
	PRINT 'Creating the Contract table...';

	IF NOT EXISTS (	SELECT 1 
				FROM sys.objects 
				WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Contract]') 
						AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Contract](
			contract_id		INT IDENTITY CONSTRAINT PK_contract PRIMARY KEY NOT NULL,
			employee_id		INT CONSTRAINT FK_contract_employee FOREIGN KEY REFERENCES [dbo].[Employee](employee_id) ON DELETE CASCADE,
			position_id		INT CONSTRAINT FK_contract_position FOREIGN KEY REFERENCES [dbo].[Position](position_id) ON DELETE CASCADE,
			salary			DECIMAL DEFAULT NULL,
			init_date		DATETIME NOT NULL,
			end_date		DATETIME DEFAULT NULL,
			employee_type	VARCHAR(15) DEFAULT NULL,
			created_at		DATETIME DEFAULT NULL,
			updated_at		DATETIME DEFAULT NULL,
            Rowversion      TIMESTAMP NOT NULL);

		PRINT '!Table Contract created!';
	END
	ELSE 
	BEGIN
		PRINT 'Table Contract already exists into the database...';
	END;
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
			project_id				INT CONSTRAINT PK_project_id PRIMARY KEY NOT NULL,
			name_project			VARCHAR (255) NOT NULL,
			design_proyect			VARCHAR (255) DEFAULT NULL,
			location_proyect		VARCHAR (255)	NOT NULL,
			budget_proyect			MONEY  NOT NULL,
			start_date_project		DATETIME  NOT NULL,
			ending_date_project 	DATETIME DEFAULT NULL,
			created_at				DATETIME DEFAULT NULL,
			updated_at				DATETIME DEFAULT NULL,
            Rowversion              TIMESTAMP NOT NULL);

		PRINT '!Table Project created!';
	END
	ELSE 
	BEGIN
		PRINT 'Table Project already exists into the database';
	END;
/*************************************************************************
**  Table Name: Equipment			  									**
**																		**
**  Primary Key: equipment_id											**
**	Foreign Keys: -														**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 26/01/2019		 Pamela Cardozo			Version Initial				**
**************************************************************************/
	PRINT 'Creating the Equipment table...';

	IF NOT EXISTS (	SELECT 1 
					FROM sys.objects 
					WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Equipment]')
							AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE dbo.Equipment(
			equipment_id		INT CONSTRAINT PK_equipment PRIMARY KEY NOT NULL,
			name_equipment		VARCHAR(100) CONSTRAINT NN_name_equipment NOT NULL,
			description		VARCHAR(100) CONSTRAINT NN_description NOT NULL,
			acquisition_date	DATETIME CONSTRAINT NN_acquisition_date NOT NULL,
			created_at			DATETIME DEFAULT NULL,
			updated_at			DATETIME DEFAULT NULL,
            Rowversion TIMESTAMP);

		PRINT '!Table Equipment created!';
	END
	ELSE 
	BEGIN
		PRINT 'Table Equipment already exists into the database';
	END;
/*************************************************************************
**  Table Name: [dbo].[Employee_Project]			  					**
**																		**
**  Primary Key: equipment_id											**
**	Foreign Keys: employee_id,project_id								**
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
			 emp_proj_id	INT CONSTRAINT PK_assig_equipid PRIMARY KEY NOT NULL,
			 employee_id	INT CONSTRAINT FK_employee_project_eid FOREIGN KEY REFERENCES [dbo].[Employee](employee_id),
			 project_id		INT CONSTRAINT FK_employee_project_pid FOREIGN KEY REFERENCES [dbo].[Project](project_id),
             Rowversion TIMESTAMP);
		PRINT '!Table Employee_Project created!';
	END 
ELSE 
	BEGIN
		PRINT 'Table Employee_Project already exists into the database';
	END;
/*************************************************************************
**  Table Name: [dbo].[Assignment_Equipment]			  				**
**																		**
**  Primary Key: assig_equip_id											**
**	Foreign Keys: emp_proj_id,equipment_id								**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 26/01/2019		 Pamela Cardozo			Version Initial				**
**************************************************************************/
	PRINT 'Creating the Assignment_Equipment table...';

	IF NOT EXISTS (	SELECT 1 
					FROM sys.objects 
					WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Assignment_Equipment]') 
							AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Assignment_Equipment](
			 assig_equip_id		INT CONSTRAINT PK_assig_equip_id PRIMARY KEY NOT NULL,
			 emp_proj_id		INT CONSTRAINT FK_assing_emppro_id FOREIGN KEY REFERENCES [dbo].[Employee_Project](emp_proj_id),
			 equipment_id		INT CONSTRAINT FK_equipment FOREIGN KEY REFERENCES [dbo].[Equipment](equipment_id),
			 date_assignment	DATETIME CONSTRAINT NN_date_assignment NOT NULL,
             Rowversion         TIMESTAMP);

		PRINT '!Table Assignment_Equipment created!';
	END
	ELSE 
	BEGIN
		PRINT 'Table Assignment_Equipment already exists into the database';
	END;
/*************************************************************************
**  Table Name: [dbo].[Machinery]						  				**
**																		**
**  Primary Key: machinary_id											**
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
			machinary_id		INT CONSTRAINT PK_machinary_id PRIMARY KEY NOT NULL,
			name_machinary		VARCHAR (100) NOT NULL,
			brand_machinary	VARCHAR (100) NOT NULL,
			model_machinary	VARCHAR (100) NOT NULL,
			state_machinary	VARCHAR (100) DEFAULT NULL,
			created_at			DATETIME DEFAULT NULL,
			updated_at			DATETIME DEFAULT NULL,
            Rowversion TIMESTAMP);

		PRINT '!Table Machinery created!';
	END
	ELSE 
	BEGIN
		PRINT 'Table Machinery already exists into the database';
	END;
/*************************************************************************
**  Table Name: [dbo].[Assignment_Machinery]						  	**
**																		**
**  Primary Key: machinary_id											**
**	Foreign Keys: -														**
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
			asg_mac_id				INT CONSTRAINT PK_asg_mac_id PRIMARY KEY NOT NULL,
			emp_proy_id			  INT CONSTRAINT FK_assing_emp_proy
											  FOREIGN KEY REFERENCES [dbo].[Employee_Project](emp_proj_id),
			machinary_id			INT CONSTRAINT FK_assing_machinary
											  FOREIGN KEY REFERENCES [dbo].[Machinery](machinary_id),
			start_date_asg_mac	DATETIME  NOT NULL,
			ending_date_asg_mac	DATETIME DEFAULT NULL,
			created_at				  DATETIME DEFAULT NULL,
			updated_at				  DATETIME DEFAULT NULL,
            Rowversion TIMESTAMP);


		PRINT '!Table Assignment_Machinery created!';
	END
	ELSE 
	BEGIN
		PRINT 'Table Assignment_Machinery already exists into the database';
	END;
/*************************************************************************
**  Table Name: [dbo].[Accident_type] 								  	**
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
	PRINT 'Creating the Accident_type table...';

	IF NOT EXISTS (	SELECT 1	
					FROM sys.objects 
					WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Accident_type]') 
							AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Accident_type] (
		  accident_type_id INT IDENTITY CONSTRAINT PK_accident_id_type PRIMARY KEY,
		  description VARCHAR(150) DEFAULT NULL,
		  created_at DATETIME DEFAULT NULL,
		  updated_at DATETIME DEFAULT NULL,
          Rowversion TIMESTAMP);

		PRINT '!Table Accident_type created!';
	END
	ELSE 
	BEGIN
		PRINT 'Table Accident_type already exists into the database';
	END;
/*************************************************************************
**  Table Name: [dbo].[Accident]									  	**
**																		**
**  Primary Key: accident_id											**
**	Foreign Keys: accident_type_id,employee_id							**
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
			accident_id INT IDENTITY CONSTRAINT PK_accident_id PRIMARY KEY NOT NULL,
			employee_id INT CONSTRAINT FK_accident_employee_id FOREIGN KEY REFERENCES [dbo].[Employee](employee_id) ON DELETE CASCADE,
			accident_type_id INT CONSTRAINT FK_accident_type_id FOREIGN KEY REFERENCES [dbo].[Accident_type](accident_type_id) ON DELETE CASCADE,
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
			updated_at DATETIME DEFAULT NULL,
            Rowversion TIMESTAMP);

		PRINT '!Table Accident created!';
	END
	ELSE 
	BEGIN
		PRINT 'Table Accident already exists into the database';
	END;
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

	IF NOT EXISTS (
	SELECT 1 FROM sys.objects 
	WHERE object_id = OBJECT_ID(N'[dbo].[Incident]') AND type in (N'U'))
	BEGIN
		CREATE TABLE [dbo].[Incident] (
			incident_id INT IDENTITY CONSTRAINT PK_incident_id PRIMARY KEY NOT NULL,
			cause VARCHAR(255) NOT NULL,
			date_init DATETIME NOT NULL,
			factor VARCHAR(15) DEFAULT NULL,
			frecuency VARCHAR(8) DEFAULT NULL,
			kind VARCHAR(15) DEFAULT NULL,
			severity VARCHAR(15) DEFAULT NULL,
			created_at DATETIME DEFAULT NULL,
			updated_at DATETIME DEFAULT NULL,
            Rowversion TIMESTAMP);

		PRINT 'Table Incident created!';
	END
	ELSE 
	BEGIN
		PRINT 'Table Incident already exists into the database';
	END;

