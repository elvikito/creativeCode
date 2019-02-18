USE SGSSOCODE;
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Accident
-- ----------------------------
IF EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Accident')
	DROP SYNONYM [dbo].[Accident]
GO
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Accident')
	CREATE SYNONYM [dbo].[Accident] FOR [sgssodata].[dbo].[base_Accident];
PRINT 'Accident synonym done...';
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Accident_type
-- ----------------------------
IF EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Accident_type')
	DROP SYNONYM [dbo].[Accident_type]
	PRINT 'Drop synonym Accident_type done...';
GO
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Accident_type')
	CREATE SYNONYM [dbo].[Accident_type] FOR [sgssodata].[dbo].[base_Accident_Type];
PRINT 'Accident_type synonym done...';
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Account
-- ----------------------------
IF EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Account')
	DROP SYNONYM [dbo].[Account]
	PRINT 'Drop synonym Account done...';
GO
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Account')
	CREATE SYNONYM [dbo].[Account] FOR [sgssodata].[dbo].[base_Account];
PRINT 'Account synonym done...';

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Area
-- ----------------------------
IF EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Area')
	DROP SYNONYM [dbo].[Area]
	PRINT 'Drop synonym Account done...';
GO
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Area')
	CREATE SYNONYM [dbo].[Area] FOR [sgssodata].[dbo].[base_Area];
PRINT 'Area synonym done...';
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Area_Position
-- ----------------------------
IF EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Area_Position')
	DROP SYNONYM [dbo].[Area_Position]
	PRINT 'Drop synonym Area_Position done...';
GO
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Area_Position')
	CREATE SYNONYM [dbo].[Area_Position] FOR [sgssodata].[dbo].[base_Area_Position];
PRINT 'Area_Position synonym done...';
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Assignment_Item_Equipment
-- ----------------------------
IF EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Assignment_Item_Equipment')
	DROP SYNONYM [dbo].[Assignment_Item_Equipment]
	PRINT 'Drop synonym Assignment_Item_Equipment done...';
GO
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Assignment_Item_Equipment')
	CREATE SYNONYM [dbo].[Assignment_Item_Equipment] FOR [sgssodata].[dbo].[base_Assignment_Item_Equipment];
PRINT 'Assignment_Item_Equipment synonym done...';

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Assignment_Machinery
-- ----------------------------
IF EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Assignment_Machinery')
	DROP SYNONYM [dbo].[Assignment_Machinery]
	PRINT 'Drop synonym Assignment_Machinery done...';
GO
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Assignment_Machinery')
	CREATE SYNONYM [dbo].[Assignment_Machinery] FOR [sgssodata].[dbo].[base_Assignment_Machinery];
PRINT 'Assignment_Machinery synonym done...';

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for base_Contract
-- ----------------------------
IF EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Contract')
	DROP SYNONYM [dbo].[Contract]
	PRINT 'Drop synonym Contract done...';
GO
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Contract')
	CREATE SYNONYM [dbo].[Contract] FOR [sgssodata].[dbo].[base_Contract];
PRINT 'Contract synonym done...';

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for base_Department
-- ----------------------------
IF EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Department')
	DROP SYNONYM [dbo].[Department]
	PRINT 'Drop synonym Department done...';
GO
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Department')
	CREATE SYNONYM [dbo].[Department] FOR [sgssodata].[dbo].[base_Department];
PRINT 'Department synonym done...';

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for base_Employee
-- ----------------------------
IF EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Employee')
	DROP SYNONYM [dbo].[Employee]
	PRINT 'Drop synonym Employee done...';
GO
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Employee')
	CREATE SYNONYM [dbo].[Employee] FOR [sgssodata].[dbo].[base_Employee];
PRINT 'Employee synonym done...';

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for base_Employee_Project
-- ----------------------------
IF EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Employee_Project')
	DROP SYNONYM [dbo].[Employee_Project]
	PRINT 'Drop synonym Employee_Project done...';
GO
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Employee_Project')
	CREATE SYNONYM [dbo].[Employee_Project] FOR [sgssodata].[dbo].[base_Employee_Project];
PRINT 'Employee_Project synonym done...';

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Incident
-- ----------------------------
IF EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Incident')
	DROP SYNONYM [dbo].[Incident]
	PRINT 'Drop synonym Incident done...';
GO
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Incident')
	CREATE SYNONYM [dbo].[Incident] FOR [sgssodata].[dbo].[base_Incident];
PRINT 'Incident synonym done...';
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Item_Equipment
-- ----------------------------
IF EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Item_Equipment')
	DROP SYNONYM [dbo].[Item_Equipment]
	PRINT 'Drop synonym Item_Equipment done...';
GO
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Item_Equipment')
	CREATE SYNONYM [dbo].[Item_Equipment] FOR [sgssodata].[dbo].[base_Item_Equipment];
PRINT 'Item_Equipment synonym done...';

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Machinery
-- ----------------------------
IF EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Machinery')
	DROP SYNONYM [dbo].[Machinery]
	PRINT 'Drop synonym Machinery done...';
GO
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Machinery')
	CREATE SYNONYM [dbo].[Machinery] FOR [sgssodata].[dbo].[base_Machinery];
PRINT 'Machinery synonym done...';

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Person
-- ----------------------------
IF EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Person')
	DROP SYNONYM [dbo].[Person]
	PRINT 'Drop synonym Person done...';
GO
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Person')
	CREATE SYNONYM [dbo].[Person] FOR [sgssodata].[dbo].[base_Person];
PRINT 'Person synonym done...';

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Person_Role
-- ----------------------------
IF EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Person_Role')
	DROP SYNONYM [dbo].[Person_Role]
	PRINT 'Drop synonym Person_Role done...';
GO
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Person_Role')
	CREATE SYNONYM [dbo].[Person_Role] FOR [sgssodata].[dbo].[base_Person_Role];
PRINT 'Person_Role synonym done...';

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Position
-- ----------------------------
IF EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Position')
	DROP SYNONYM [dbo].[Position]
	PRINT 'Drop synonym Position done...';
GO
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Position')
	CREATE SYNONYM [dbo].[Position] FOR [sgssodata].[dbo].[base_Position];
PRINT 'Position synonym done...';
-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Project
-- ----------------------------
IF EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Project')
	DROP SYNONYM [dbo].[Project]
	PRINT 'Drop synonym Project done...';
GO
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Project')
	CREATE SYNONYM [dbo].[Project] FOR [sgssodata].[dbo].[base_Project];
PRINT 'Project synonym done...';

-- ----------------------------
-- Author: Elvis R. Ramirez Iriarte 
-- SYNONYM structure for Role
-- ----------------------------
IF EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Role')
	DROP SYNONYM [dbo].[Role]
	PRINT 'Drop synonym Role done...';
GO
IF NOT EXISTS ( SELECT 1 FROM sys.synonyms WHERE name = 'Role')
	CREATE SYNONYM [dbo].[Role] FOR [sgssodata].[dbo].[base_Role];
PRINT 'Role synonym done...';