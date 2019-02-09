
USE SGSSOCODE;


-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Accident
-- ----------------------------
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Accident')
	CREATE SYNONYM [dbo].[Accident] FOR [sgssodata].[dbo].[base_Accident];

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Accident_type
-- ----------------------------
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Accident_type')
	CREATE SYNONYM [dbo].[Accident_type] FOR [sgssodata].[dbo].[base_Accident_type];

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Account
-- ----------------------------
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Account')
	CREATE SYNONYM [dbo].[Account] FOR [sgssodata].[dbo].[base_Account];


-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Area
-- ----------------------------
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Area')
	CREATE SYNONYM [dbo].[Area] FOR [sgssodata].[dbo].[base_Area];

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Area_Position
-- ----------------------------
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Area_Position')
	CREATE SYNONYM [dbo].[Area_Position] FOR [sgssodata].[dbo].[base_Area_Position];

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Assignment_Item_Equipment
-- ----------------------------
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Assignment_Item_Equipment')
	CREATE SYNONYM [dbo].[Assignment_Item_Equipment] FOR [sgssodata].[dbo].[base_Assignment_Item_Equipment];

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Assignment_Machinery
-- ----------------------------
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Assignment_Machinery')
	CREATE SYNONYM [dbo].[Assignment_Machinery] FOR [sgssodata].[dbo].[base_Assignment_Machinery];

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for base_Contract
-- ----------------------------
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Contract')
	CREATE SYNONYM [dbo].[contract] FOR [sgssodata].[dbo].[base_Contract];

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for base_Department
-- ----------------------------
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Department')
	CREATE SYNONYM [dbo].[Department] FOR [sgssodata].[dbo].[base_Department];

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for base_Employee
-- ----------------------------
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Employee')
	CREATE SYNONYM [dbo].[Employee] FOR [sgssodata].[dbo].[base_Employee];

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for base_Employee_Project
-- ----------------------------
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Employee_Project')
	CREATE SYNONYM [dbo].[Employee_Project] FOR [sgssodata].[dbo].[base_Employee_Project];

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Incident
-- ----------------------------

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Incident')
	CREATE SYNONYM [dbo].[Incident] FOR [sgssodata].[dbo].[base_Incident];

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Item_Equipment
-- ----------------------------

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Item_Equipment')
	CREATE SYNONYM [dbo].[Item_Equipment] FOR [sgssodata].[dbo].[base_Item_Equipment];

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Machinery
-- ----------------------------

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Machinery')
	CREATE SYNONYM [dbo].[Machinery] FOR [sgssodata].[dbo].[base_Machinery];

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Person
-- ----------------------------

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Person')
	CREATE SYNONYM [dbo].[Person] FOR [sgssodata].[dbo].[base_Person];

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Person_Role
-- ----------------------------

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Person_Role')
	CREATE SYNONYM [dbo].[Person_Role] FOR [sgssodata].[dbo].[base_Person_Role];


-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Position
-- ----------------------------

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Position')
	CREATE SYNONYM [dbo].[Position] FOR [sgssodata].[dbo].[base_Position];

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Project
-- ----------------------------

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Project')
	CREATE SYNONYM [dbo].[Project] FOR [sgssodata].[dbo].[base_Project];

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Role
-- ----------------------------

IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Role')
	CREATE SYNONYM [dbo].[Role] FOR [sgssodata].[dbo].[base_Role];



