
USE SGSSODATA;
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Accident
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Accident]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Accident]
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[base_Accident]') 
		       AND type in (N'U'))
 BEGIN
        CREATE TABLE [dbo].[base_Accident] (
              [accident_id] [int] IDENTITY(1,1) NOT NULL,
              [employee_id] [int] NULL,
              [accident_type_id] [int] NULL,
              [cause] [varchar](255)  NOT NULL,
              [date_init] datetime NOT NULL,
              [start_lost_time] datetime NOT NULL,
              [end_lost_time] datetime NOT NULL,
              [day_lost] [int] NOT NULL,
              [severity] [varchar](20)  DEFAULT NULL,
              [turn] [varchar](15)  DEFAULT NULL,
              [created_at] datetime DEFAULT NULL,
              [updated_at] datetime DEFAULT NULL
        )

		PRINT 'Table Accident created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table Accident already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Accident_type
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Accident_type]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Accident_type]
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[base_Accident_type]') 
		       AND type in (N'U'))
 BEGIN
        CREATE TABLE [dbo].[base_Accident_type] (
					[accident_type_id] [int] IDENTITY(1,1) NOT NULL,
					[description] [varchar](150)  NOT NULL,
					[created_at] datetime DEFAULT NULL,
					[updated_at] datetime DEFAULT NULL
				)
		PRINT 'Table base_Accident_type created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table base_Accident_type already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Account
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Account]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Account]
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[base_Account]') 
		       AND type in (N'U'))
 BEGIN
        CREATE TABLE [dbo].[base_Account] (
					[account_id] [int] IDENTITY(1,1) NOT NULL,
					[person_id] [int] NULL,
					[password] [varchar](15)  NOT NULL,
					[created_at] datetime DEFAULT NULL,
					[updated_at] datetime DEFAULT NULL
				)
		PRINT 'Table base_Account created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table base_Account already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Area
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Area]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Area]
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[base_Area]') 
		       AND type in (N'U'))
 BEGIN
        CREATE TABLE [dbo].[base_Area] (
					[area_id] [int] IDENTITY(1,1) NOT NULL,
					[department_id] [int] NULL,
					[name] [varchar](255)  NOT NULL,
					[description] [varchar](255)  NOT NULL,
					[created_at] datetime DEFAULT NULL,
					[updated_at] datetime DEFAULT NULL
				)
		PRINT 'Table base_Area created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table base_Area already exists into the database';
	END
GO
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Area_Position
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Area_Position]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Area_Position]
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[base_Area_Position]') 
		       AND type in (N'U'))
 BEGIN
			CREATE TABLE [dbo].[base_Area_Position] (
				[area_id] [int] NOT NULL,
				[position_id] [int] NOT NULL,
				[created_at] [varchar](1)  DEFAULT NULL,
				[updated_at] [varchar](1)  DEFAULT NULL
			)
		PRINT 'Table base_Area_Position created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table base_Area_Position already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Assignment_Item_Equipment
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Assignment_Item_Equipment]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Assignment_Item_Equipment]
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[base_Assignment_Item_Equipment]') 
		       AND type in (N'U'))
 BEGIN
			CREATE TABLE [dbo].[base_Assignment_Item_Equipment] (
				[assignment_item_id] [int] NOT NULL,
				[emp_proj_id] [int] NULL,
				[item_equipment_id] [int] NULL,
				[date_assignment] datetime NOT NULL,
				[created_at] datetime DEFAULT NULL,
				[updated_at] datetime DEFAULT NULL
			)		
		PRINT 'Table base_Area_Position created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table base_Area_Position already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Assignment_Machinery
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Assignment_Machinery]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Assignment_Machinery]
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[base_Assignment_Machinery]') 
		       AND type in (N'U'))
 BEGIN
        CREATE TABLE [dbo].[base_Assignment_Machinery] (
					[assignment_machinery_id] [int] NOT NULL,
					[emp_proj_id] [int] NULL,
					[machinery_id] [int] NULL,
					[start_date_assign] datetime NOT NULL,
					[ending_date_asg_mac] datetime DEFAULT NULL,
					[created_at] datetime DEFAULT NULL,
					[updated_at] datetime DEFAULT NULL
				)
		PRINT 'Table base_Assignment_Machinery created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table base_Assignment_Machinery already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Contract
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Contract]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Contract]
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[base_Contract]') 
		       AND type in (N'U'))
 BEGIN
        CREATE TABLE [dbo].[base_Contract] (
					[contract_id] [int] IDENTITY(1,1) NOT NULL,
					[employee_id] [int] NULL,
					[position_id] [int] NULL,
					[salary] money NOT NULL,
					[init_date] datetime NOT NULL,
					[end_date] datetime DEFAULT NULL,
					[employee_type] [varchar](8)  NOT NULL,
					[created_at] datetime DEFAULT NULL,
					[updated_at] datetime DEFAULT NULL
				)
		PRINT 'Table base_Contract created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table base_Contract already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Department
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Department]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Department]
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[base_Department]') 
		       AND type in (N'U'))
 BEGIN
        CREATE TABLE [dbo].[base_Department] (
					[department_id] [int] IDENTITY(1,1) NOT NULL,
					[name] [varchar](255)  NOT NULL,
					[description] [varchar](255)  NOT NULL,
					[created_at] datetime DEFAULT NULL,
					[updated_at] datetime DEFAULT NULL
				)
		PRINT 'Table base_Department created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table base_Department already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Employee
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Employee]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Employee]
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[base_Employee]') 
		       AND type in (N'U'))
 BEGIN
        CREATE TABLE [dbo].[base_Employee] (
					[employee_id] [int] IDENTITY(1,1) NOT NULL,
					[person_id] [int] NULL,
					[ci] [int] NOT NULL,
					[address] [varchar](255)  NOT NULL,
					[birth_date] datetime NOT NULL,
					[gender] [varchar](8)  NOT NULL,
					[phone_number] [int] NOT NULL,
					[picture] varbinary(max) DEFAULT NULL,
					[created_at] datetime DEFAULT NULL,
					[updated_at] datetime DEFAULT NULL
				)
		PRINT 'Table base_Employee created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table base_Employee already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Employee_Project
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Employee_Project]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Employee_Project]
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[base_Employee_Project]') 
		       AND type in (N'U'))
 BEGIN
        CREATE TABLE [dbo].[base_Employee_Project] (
					[emp_proj_id] [int] NOT NULL,
					[employee_id] [int] NULL,
					[project_id] [int] NULL,
					[created_at] datetime DEFAULT NULL,
					[updated_at] datetime DEFAULT NULL
				)
		PRINT 'Table base_Employee_Project created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table base_Employee_Project already exists into the database';
	END
GO


-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Incident
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Incident]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Incident]
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[base_Incident]') 
		       AND type in (N'U'))
 BEGIN
        CREATE TABLE [dbo].[base_Incident] (
					[incident_id] [int] IDENTITY(1,1) NOT NULL,
					[employee_id] [int] NULL,
					[cause] [varchar](255)  NOT NULL,
					[date_incident] datetime NOT NULL,
					[frecuency] [varchar](8)  DEFAULT NULL,
					[kind] [varchar](15)  DEFAULT NULL,
					[created_at] datetime DEFAULT NULL,
					[updated_at] datetime DEFAULT NULL
				)
		PRINT 'Table base_Incident created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table base_Incident already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Item_Equipment
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Item_Equipment]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Item_Equipment]
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[base_Item_Equipment]') 
		       AND type in (N'U'))
 BEGIN
        CREATE TABLE [dbo].[base_Item_Equipment] (
					[item_equipment_id] [int] NOT NULL,
					[name_equipment] [varchar](100)  NOT NULL,
					[description] [varchar](100)  NOT NULL,
					[acquisition_date] datetime NOT NULL,
					[created_at] datetime DEFAULT NULL,
					[updated_at] datetime DEFAULT NULL
				)
		PRINT 'Table base_Item_Equipment created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table base_Item_Equipment already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Machinery
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Machinery]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Machinery]
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[base_Machinery]') 
		       AND type in (N'U'))
 BEGIN
        CREATE TABLE [dbo].[base_Machinery] (
					[machinery_id] [int] NOT NULL,
					[name_machinery] [varchar](150)  NOT NULL,
					[brand_machinery] [varchar](50)  NOT NULL,
					[model_machinery] [varchar](50)  NOT NULL,
					[state_machinery] [varchar](50)  DEFAULT NULL,
					[created_at] datetime DEFAULT NULL,
					[updated_at] datetime DEFAULT NULL
				)
		PRINT 'Table base_Machinery created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table base_Machinery already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Person
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Person]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Person]
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[base_Person]') 
		       AND type in (N'U'))
 BEGIN
        CREATE TABLE [dbo].[base_Person] (
					[person_id] [int] IDENTITY(1,1) NOT NULL,
					[first_name] [varchar](50)  NOT NULL,
					[last_name] [varchar](50)  NOT NULL,
					[email] [varchar](40)  NOT NULL,
					[created_at] datetime DEFAULT NULL,
					[updated_at] datetime DEFAULT NULL
				)
		PRINT 'Table base_Person created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table base_Person already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Person_Role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Person_Role]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Person_Role]
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[base_Person_Role]') 
		       AND type in (N'U'))
 BEGIN
        CREATE TABLE [dbo].[base_Person_Role] (
					[person_id] [int] NOT NULL,
					[role_id] [int] NOT NULL,
					[created_at] [varchar](1)  DEFAULT NULL,
					[updated_at] [varchar](1)  DEFAULT NULL
				)
		PRINT 'Table base_Person_Role created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table base_Person_Role already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Position
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Position]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Position]
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[base_Position]') 
		       AND type in (N'U'))
 BEGIN
        CREATE TABLE [dbo].[base_Position] (
					[position_id] [int] IDENTITY(1,1) NOT NULL,
					[name] [varchar](255)  NOT NULL,
					[description] [varchar](255)  NOT NULL,
					[created_at] [varchar](1)  DEFAULT NULL,
					[updated_at] [varchar](1)  DEFAULT NULL
				)
		PRINT 'Table base_Position created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table base_Position already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Project
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Project]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Project]
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[base_Project]') 
		       AND type in (N'U'))
 BEGIN
        CREATE TABLE [dbo].[base_Project] (
					[project_id] [int] NOT NULL,
					[name_project] [varchar](255)  NOT NULL,
					[design_project] [varchar](255)  DEFAULT NULL,
					[location_project] [varchar](255)  NOT NULL,
					[budget_project] money NOT NULL,
					[start_date_project] datetime NOT NULL,
					[ending_date_project] datetime DEFAULT NULL,
					[created_at] datetime DEFAULT NULL,
					[updated_at] datetime DEFAULT NULL
				)
		PRINT 'Table base_Project created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table base_Project already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Table structure for base_Role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[base_Role]') AND type IN ('U'))
	DROP TABLE [dbo].[base_Role]
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[base_Role]') 
		       AND type in (N'U'))
 BEGIN
        CREATE TABLE [dbo].[base_Role] (
					[role_id] [int] IDENTITY(1,1) NOT NULL,
					[role_name] [varchar](50)  NOT NULL,
					[description] [varchar](200)  NOT NULL,
					[created_at] datetime DEFAULT NULL,
					[updated_at] datetime DEFAULT NULL
				)
		PRINT 'Table base_Role created!';
	END
 ELSE 
	BEGIN
		PRINT 'Table base_Role already exists into the database';
	END
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Primary Key structure for table base_Accident
-- ----------------------------
ALTER TABLE [dbo].[base_Accident] ADD CONSTRAINT [PK_accident] PRIMARY KEY CLUSTERED ([accident_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Primary Key structure for table base_Accident_type
-- ----------------------------
ALTER TABLE [dbo].[base_Accident_type] ADD CONSTRAINT [PK_accident_type] PRIMARY KEY CLUSTERED ([accident_type_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Primary Key structure for table base_Account
-- ----------------------------
ALTER TABLE [dbo].[base_Account] ADD CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED ([account_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Primary Key structure for table base_Area
-- ----------------------------
ALTER TABLE [dbo].[base_Area] ADD CONSTRAINT [PK_area] PRIMARY KEY CLUSTERED ([area_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Primary Key structure for table base_Area_Position
-- ----------------------------
ALTER TABLE [dbo].[base_Area_Position] ADD CONSTRAINT [PK_area_position] PRIMARY KEY CLUSTERED ([area_id], [position_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Primary Key structure for table base_Assignment_Item_Equipment
-- ----------------------------
ALTER TABLE [dbo].[base_Assignment_Item_Equipment] ADD CONSTRAINT [PK_assignment_item] PRIMARY KEY CLUSTERED ([assignment_item_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Primary Key structure for table base_Assignment_Machinery
-- ----------------------------
ALTER TABLE [dbo].[base_Assignment_Machinery] ADD CONSTRAINT [PK_assignment_machinery] PRIMARY KEY CLUSTERED ([assignment_machinery_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Checks structure for table base_Contract
-- ----------------------------
ALTER TABLE [dbo].[base_Contract] ADD CONSTRAINT [CK__Contract__employ__6383C8BA] CHECK ([employee_type]='Complete' OR [employee_type]='Parcial')
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Primary Key structure for table base_Contract
-- ----------------------------
ALTER TABLE [dbo].[base_Contract] ADD CONSTRAINT [PK_contract] PRIMARY KEY CLUSTERED ([contract_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Primary Key structure for table base_Department
-- ----------------------------
ALTER TABLE [dbo].[base_Department] ADD CONSTRAINT [PK_department] PRIMARY KEY CLUSTERED ([department_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Primary Key structure for table base_Employee
-- ----------------------------
ALTER TABLE [dbo].[base_Employee] ADD CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED ([employee_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Primary Key structure for table base_Employee_Project
-- ----------------------------
ALTER TABLE [dbo].[base_Employee_Project] ADD CONSTRAINT [PK_emp_proj] PRIMARY KEY CLUSTERED ([emp_proj_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Primary Key structure for table base_Incident
-- ----------------------------
ALTER TABLE [dbo].[base_Incident] ADD CONSTRAINT [PK_incident] PRIMARY KEY CLUSTERED ([incident_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Primary Key structure for table base_Item_Equipment
-- ----------------------------
ALTER TABLE [dbo].[base_Item_Equipment] ADD CONSTRAINT [PK_item_equipment] PRIMARY KEY CLUSTERED ([item_equipment_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Primary Key structure for table base_Machinery
-- ----------------------------
ALTER TABLE [dbo].[base_Machinery] ADD CONSTRAINT [PK_machinary] PRIMARY KEY CLUSTERED ([machinery_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Primary Key structure for table base_Person
-- ----------------------------
ALTER TABLE [dbo].[base_Person] ADD CONSTRAINT [PK_person] PRIMARY KEY CLUSTERED ([person_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Primary Key structure for table base_Person_Role
-- ----------------------------
ALTER TABLE [dbo].[base_Person_Role] ADD CONSTRAINT [PK_person_role] PRIMARY KEY CLUSTERED ([person_id], [role_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

-- ----------------------------
-- Primary Key structure for table base_Position
-- ----------------------------
ALTER TABLE [dbo].[base_Position] ADD CONSTRAINT [PK_position] PRIMARY KEY CLUSTERED ([position_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Primary Key structure for table base_Project
-- ----------------------------
ALTER TABLE [dbo].[base_Project] ADD CONSTRAINT [PK_project] PRIMARY KEY CLUSTERED ([project_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Primary Key structure for table base_Role
-- ----------------------------
ALTER TABLE [dbo].[base_Role] ADD CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED ([role_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Foreign Keys structure for table base_Accident
-- ----------------------------
ALTER TABLE [dbo].[base_Accident] ADD CONSTRAINT [FK_accident_employee] FOREIGN KEY ([employee_id]) REFERENCES [base_Employee] ([employee_id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[base_Accident] ADD CONSTRAINT [FK_accident_type] FOREIGN KEY ([accident_type_id]) REFERENCES [base_Accident_type] ([accident_type_id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Foreign Keys structure for table base_Account
-- ----------------------------
ALTER TABLE [dbo].[base_Account] ADD CONSTRAINT [FK_account_person] FOREIGN KEY ([person_id]) REFERENCES [base_Person] ([person_id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Foreign Keys structure for table base_Area
-- ----------------------------
ALTER TABLE [dbo].[base_Area] ADD CONSTRAINT [FK_department] FOREIGN KEY ([department_id]) REFERENCES [base_Department] ([department_id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Foreign Keys structure for table base_Area_Position
-- ----------------------------
ALTER TABLE [dbo].[base_Area_Position] ADD CONSTRAINT [FK_area] FOREIGN KEY ([area_id]) REFERENCES [base_Area] ([area_id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[base_Area_Position] ADD CONSTRAINT [FK_position] FOREIGN KEY ([position_id]) REFERENCES [base_Position] ([position_id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Foreign Keys structure for table base_Assignment_Item_Equipment
-- ----------------------------
ALTER TABLE [dbo].[base_Assignment_Item_Equipment] ADD CONSTRAINT [FK_assign_emp_proj] FOREIGN KEY ([emp_proj_id]) REFERENCES [base_Employee_Project] ([emp_proj_id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[base_Assignment_Item_Equipment] ADD CONSTRAINT [FK_assign_it_equipment] FOREIGN KEY ([item_equipment_id]) REFERENCES [base_Item_Equipment] ([item_equipment_id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Foreign Keys structure for table base_Assignment_Machinery
-- ----------------------------
ALTER TABLE [dbo].[base_Assignment_Machinery] ADD CONSTRAINT [FK_assign_mach_emp_proj] FOREIGN KEY ([emp_proj_id]) REFERENCES [base_Employee_Project] ([emp_proj_id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[base_Assignment_Machinery] ADD CONSTRAINT [FK_assing_mach_machinery] FOREIGN KEY ([machinery_id]) REFERENCES [base_Machinery] ([machinery_id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Foreign Keys structure for table base_Contract
-- ----------------------------
ALTER TABLE [dbo].[base_Contract] ADD CONSTRAINT [FK_contract_employee] FOREIGN KEY ([employee_id]) REFERENCES [base_Employee] ([employee_id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[base_Contract] ADD CONSTRAINT [FK_contract_position] FOREIGN KEY ([position_id]) REFERENCES [base_Position] ([position_id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Foreign Keys structure for table base_Employee
-- ----------------------------
ALTER TABLE [dbo].[base_Employee] ADD CONSTRAINT [FK_person_employee] FOREIGN KEY ([person_id]) REFERENCES [base_Person] ([person_id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Foreign Keys structure for table base_Employee_Project
-- ----------------------------
ALTER TABLE [dbo].[base_Employee_Project] ADD CONSTRAINT [FK_employee_project_e] FOREIGN KEY ([employee_id]) REFERENCES [base_Employee] ([employee_id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[base_Employee_Project] ADD CONSTRAINT [FK_employee_project_p] FOREIGN KEY ([project_id]) REFERENCES [base_Project] ([project_id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Foreign Keys structure for table base_Incident
-- ----------------------------
ALTER TABLE [dbo].[base_Incident] ADD CONSTRAINT [FK_incident_employee] FOREIGN KEY ([employee_id]) REFERENCES [base_Employee] ([employee_id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- Foreign Keys structure for table base_Person_Role
-- ----------------------------
ALTER TABLE [dbo].[base_Person_Role] ADD CONSTRAINT [FK_person_role] FOREIGN KEY ([person_id]) REFERENCES [base_Person] ([person_id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[base_Person_Role] ADD CONSTRAINT [FK_role] FOREIGN KEY ([role_id]) REFERENCES [base_Role] ([role_id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


