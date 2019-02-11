-- =============================================  
-- Author: Elvis R. Ramirez Iriarte
-- Description: Creación de Login(Service, Reporting.)
-- =============================================  

USE [master];
GO

DECLARE @passwd VARCHAR(256)
SET @passwd = 'CreativeCode_1'

IF NOT EXISTS ( SELECT * FROM sys.server_principals WHERE name = 'Service' )
  CREATE LOGIN [Service] WITH PASSWORD = '$(passwd)', CHECK_POLICY = OFF;

IF NOT EXISTS ( SELECT * FROM sys.server_principals WHERE name = 'Reporting' )
  CREATE LOGIN [Reporting] WITH PASSWORD = '$(passwd)', CHECK_POLICY = OFF;


-- =============================================  
-- Author: Elvis R. Ramirez Iriarte
-- Description: Creacion de base de datos (SGSSODATA)
-- =============================================  

USE Master;
IF NOT EXISTS(SELECT 1 FROM sys.databases WHERE name='SGSSODATA')
BEGIN
	CREATE DATABASE SGSSODATA;
END
ELSE
BEGIN
	ALTER DATABASE SGSSODATA SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE SGSSODATA;
	CREATE DATABASE SGSSODATA;
END
GO
-- =============================================  
-- Author: Elvis R. Ramirez Iriarte
-- Description: Creación de User (Service, Reporting.)
-- =============================================

USE SGSSODATA;
GO

PRINT 'Creating Users....';

IF NOT EXISTS ( SELECT 1 FROM sys.database_principals WHERE name = 'Service')
	CREATE USER [Service] FOR LOGIN [Service] WITH DEFAULT_SCHEMA = [dbo];

IF NOT EXISTS ( SELECT 1 FROM sys.database_principals WHERE name = 'Reporting')
	CREATE USER [Reporting] FOR LOGIN [Reporting] WITH DEFAULT_SCHEMA = [dbo];


-- =============================================  
-- Author: Elvis R. Ramirez Iriarte
-- Description: Creacion de Roles(RoleService, RoleReporting)
-- =============================================

PRINT 'Creating Roles.......';

IF NOT EXISTS ( SELECT 1 FROM sys.database_principals WHERE name = 'RoleService' and Type = 'R')
	CREATE ROLE RoleService AUTHORIZATION [dbo];

IF NOT EXISTS ( SELECT 1 FROM sys.database_principals WHERE name = 'RoleReporting' and Type = 'R')
	CREATE ROLE RoleReporting AUTHORIZATION [dbo];

-- =============================================  
-- Author: Elvis R. Ramirez Iriarte
-- Description: Asignacion de permisos             
-- =============================================

PRINT 'Adding Permissions to Roles.......';
GRANT SELECT ON SCHEMA::[dbo] TO [RoleService];
GRANT INSERT ON SCHEMA::[dbo] TO [RoleService];
GRANT UPDATE ON SCHEMA::[dbo] TO [RoleService];
GRANT DELETE ON SCHEMA::[dbo] TO [RoleService];
GO
GRANT SELECT ON SCHEMA::[dbo] TO [RoleReporting];
GO

PRINT 'Adding Users to Roles.......';
ALTER ROLE RoleService ADD MEMBER [Service];
ALTER ROLE RoleReporting ADD MEMBER [Reporting];
GO


USE [master];
GO


-- =============================================  
-- Author: Elvis R. Ramirez Iriarte
-- Description: Creacion de base de datos (SGSSOCODE)
-- =============================================  

USE Master;
IF NOT EXISTS(SELECT 1 FROM sys.databases WHERE name='SGSSOCODE')
BEGIN
	CREATE DATABASE SGSSOCODE;
END
ELSE
BEGIN
	ALTER DATABASE SGSSOCODE SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE SGSSOCODE;
	CREATE DATABASE SGSSOCODE;
END
GO

USE SGSSOCODE;

PRINT 'Creating Users....';

IF NOT EXISTS ( SELECT 1 FROM sys.database_principals WHERE name = 'Service')
	CREATE USER [Service] FOR LOGIN [Service] WITH DEFAULT_SCHEMA = [dbo];

IF NOT EXISTS ( SELECT 1 FROM sys.database_principals WHERE name = 'Reporting')
	CREATE USER [Reporting] FOR LOGIN [Reporting] WITH DEFAULT_SCHEMA = [dbo];

PRINT 'Creating Roles.......';

IF NOT EXISTS ( SELECT 1 FROM sys.database_principals WHERE name = 'RoleService' and Type = 'R')
	CREATE ROLE RoleService AUTHORIZATION [dbo];

IF NOT EXISTS ( SELECT 1 FROM sys.database_principals WHERE name = 'RoleReporting' and Type = 'R')
	CREATE ROLE RoleReporting AUTHORIZATION [dbo];

PRINT 'Adding Users to Roles.......';
ALTER ROLE RoleService ADD MEMBER [Service];
ALTER ROLE RoleReporting ADD MEMBER [Reporting];

PRINT 'Creating Synonyms....';
