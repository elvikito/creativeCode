USE [SGSSO]
GO

/*************************************************************************
**  Activity Name: add rowversion 										**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
** 10/02/2019		Pamela Cardozo			Version Initial				**
**************************************************************************/

ALTER TABLE [dbo].[Accident] ADD [Rowversion] [timestamp] NOT NULL;
ALTER TABLE [dbo].[Accident_type] ADD [Rowversion] [timestamp] NOT NULL;
ALTER TABLE [dbo].[Account] ADD [Rowversion] [timestamp] NOT NULL;
ALTER TABLE [dbo].[Area] ADD [Rowversion] [timestamp] NOT NULL;
ALTER TABLE [dbo].[Area_Position] ADD [Rowversion] [timestamp] NOT NULL;
ALTER TABLE [dbo].[Assignment_Item_Equipment] ADD [Rowversion] [timestamp] NOT NULL;
ALTER TABLE [dbo].[Assignment_Machinery] ADD [Rowversion] [timestamp] NOT NULL;
ALTER TABLE [dbo].[Contract] ADD [Rowversion] [timestamp] NOT NULL;
ALTER TABLE [dbo].[Department] ADD [Rowversion] [timestamp] NOT NULL;
ALTER TABLE [dbo].[Employee] ADD [Rowversion] [timestamp] NOT NULL;
ALTER TABLE [dbo].[Employee_Project] ADD [Rowversion] [timestamp] NOT NULL;
ALTER TABLE [dbo].[Incident] ADD [Rowversion] [timestamp] NOT NULL;
ALTER TABLE [dbo].[Item_Equipment] ADD [Rowversion] [timestamp] NOT NULL;
ALTER TABLE [dbo].[Machinery] ADD [Rowversion] [timestamp] NOT NULL;
ALTER TABLE [dbo].[Person] ADD [Rowversion] [timestamp] NOT NULL;
ALTER TABLE [dbo].[Position] ADD [Rowversion] [timestamp] NOT NULL;
ALTER TABLE [dbo].[Person_Role] ADD [Rowversion] [timestamp] NOT NULL;
ALTER TABLE [dbo].[Role] ADD [Rowversion] [timestamp] NOT NULL;
ALTER TABLE [dbo].[Project] ADD [Rowversion] [timestamp] NOT NULL;
GO

/*************************************************************************
**  Schema Name: [ETL]													**
**																		**
**	Description: Schema creation										**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
** 10/02/2019		Pamela Cardozo			Version Initial				**
**************************************************************************/

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'ETL')
BEGIN
	PRINT 'Creating the SCHEMA ETL ...';
	EXEC('CREATE SCHEMA ETL')
END
ELSE
BEGIN
	PRINT ' SCHEMA ETL exist...';
END
GO

/*************************************************************************
**  Table Name: [ETL]													**
**																		**
**  Primary Key: [IDMigration]											**
**	Foreign Keys: -   													**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
** 10/02/2019		Pamela Cardozo			Version Initial				**
**************************************************************************/

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[ETL].[TableMigration]')
		       AND type in (N'U'))
BEGIN
	
	PRINT 'Creating the TableMigration table ...';

CREATE TABLE [ETL].[TableMigration](
	[IDMigration] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](50) NOT NULL,
	[LatestChange] [bigint] NOT NULL CONSTRAINT [DF_Migration]  DEFAULT ((0)),
	CONSTRAINT [PK_Migration] PRIMARY KEY CLUSTERED 
	(
		[IDMigration] ASC
	)WITH (	PAD_INDEX = OFF, 
			STATISTICS_NORECOMPUTE = OFF,
			IGNORE_DUP_KEY = OFF, 
			ALLOW_ROW_LOCKS = ON, 
			ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			) ON [PRIMARY]
END
 ELSE
	BEGIN
		PRINT 'Table Table Migration already exists in the Database.. ';
	END
GO

/*************************************************************************
**  Funtion Name: GetDatabaseRowVersion									**
**	Description: Used by DW ETL Process									**
**																		**
**	Called by: SQL Job													**
**	Author: Marcelo Claure												**
**	Reused: Elvis Leonel Arispe	Cabrera									**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
** 10/02/2019		Pamela Cardozo			Version Initial				**
**************************************************************************/

PRINT 'Creating Function called  -> [ETL].[GetDatabaseRowVersion]...';
IF OBJECT_ID (N'[ETL].[GetDatabaseRowVersion]') IS NOT NULL
BEGIN
    DROP FUNCTION [ETL].[GetDatabaseRowVersion];
END
GO

CREATE FUNCTION [ETL].[GetDatabaseRowVersion] ()
RETURNS BIGINT
AS
BEGIN
  RETURN CONVERT(BIGINT, MIN_ACTIVE_ROWVERSION()) - 1;
END
GO

/*************************************************************************
**  Funtion Name: GetTableMigrationLatestRowVersion						**
**	Description: Gets Latest Rowversion used							**
**				 into the corresponding the table						**
**																		**
**	Called by: SQL Job													**
**	Author: Marcelo Claure												**
**	Reused: Elvis Leonel Arispe	Cabrera									**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
** 10/02/2019		Pamela Cardozo			Version Initial				**
**************************************************************************/

PRINT 'Creating Function called -> [ETL].[GetTableMigrationLatestRowVersion]...';
IF OBJECT_ID (N'[ETL].[GetTableMigrationLatestRowVersion]') IS NOT NULL  
    DROP FUNCTION [ETL].[GetTableMigrationLatestRowVersion];  
GO 

CREATE FUNCTION [ETL].[GetTableMigrationLatestRowVersion] 
(
	@table VARCHAR(50)
)
RETURNS BIGINT
AS
BEGIN
	DECLARE @last BIGINT;

	SELECT @last = LatestChange
	FROM [ETL].[TableMigration]
	WHERE TableName = @table;

  RETURN @last;
END
GO


/*************************************************************************
**  Procedure Name: UpdateTableMigration								**
**	Description: Updates Table Migration with latest Rowversion used	**
**																		**
**	Called by: SQL Job													**
**	Author: Marcelo Claure												**
**	Reused: Elvis Leonel Arispe	Cabrera									**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
** 10/02/2019		Pamela Cardozo			Version Initial				**
**************************************************************************/

PRINT 'Creating Procedure called -> [ETL].[UpdateTableMigration]...';
IF OBJECT_ID (N'[ETL].[UpdateTableMigration]') IS NOT NULL   
    DROP PROCEDURE [ETL].[UpdateTableMigration];  
GO 

CREATE PROCEDURE [ETL].[UpdateTableMigration]
(
  @tableName VARCHAR(50),
  @current     BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	UPDATE [ETL].[TableMigration]
	SET LatestChange = @current
	WHERE TableName = @tableName;
GO

/*************************************************************************
**  Procedure Name:	[ETL].[PullDataToDatawarehouse]						**
**	Description: Pulls Changes and Inserts								**
**				 from the SGSSO to DWSchool Database					**
**																		**
**	Called by: SQL Job													**
**	Author: Marcelo Claure												**
**	Reused: Elvis Leonel Arispe	Cabrera									**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
** 10/02/2019		Pamela Cardozo			Version Initial				**
**************************************************************************/

PRINT 'Creating Procedure called -> [ETL].[PullDataToDatawarehouse]...';
IF OBJECT_ID (N'[ETL].[PullDataToDatawarehouse]') IS NOT NULL  
    DROP PROCEDURE [ETL].[PullDataToDatawarehouse];  
GO 

CREATE PROCEDURE [ETL].[PullDataToDatawarehouse]
(
  @table VARCHAR(50)
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
BEGIN
	DECLARE @SQLString      NVARCHAR(MAX);  
	DECLARE @ParmDefinition NVARCHAR(MAX); 
	DECLARE @currentDBTS    BIGINT = [ETL].[GetDatabaseRowVersion]();
	DECLARE @lastDBTS       BIGINT = [ETL].[GetTableMigrationLatestRowVersion](@table); 

	SET @ParmDefinition = N'@last BIGINT, @current BIGINT'; 
	SET @SQLString = N'INSERT INTO [DWSGSSO].[ETL].[' + @table + ']
					   EXECUTE [ETL].[Get' + @table + 'ChangesByRowVersion] @LastRowVersionID = @last
																		   ,@CurrentDBTS      = @current;';  
	EXECUTE SP_EXECUTESQL @SQLString
						 ,@ParmDefinition
						 ,@last    = @lastDBTS
						 ,@current = @currentDBTS;  

	EXECUTE [ETL].[UpdateTableMigration] @tableName = @table
										,@current   = @currentDBTS;
END
GO

/*************************************************************************
**  Procedure Name:	[ETL].[GetMachineryChangesByRowVersion]				**
**																		**
**	Called by: SQL Job													**
**	Author: Elvis Leonel Arispe	Cabrera									**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
**************************************************************************/

PRINT 'Creating Procedure called -> [ETL].[GetMachineryChangesByRowVersion]...';
IF OBJECT_ID (N'[ETL].[GetMachineryChangesByRowVersion]') IS NOT NULL  
    DROP PROCEDURE [ETL].[GetMachineryChangesByRowVersion];  
GO 

CREATE PROCEDURE [ETL].[GetMachineryChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT	 mc.machinery_id
			,mc.name_machinery
			,mc.brand_machinery
			,mc.model_machinery
	FROM [dbo].[Machinery] mc
	WHERE [Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND [Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS);
GO

/*************************************************************************
**  Procedure Name:	[ETL].[GetProjectChangesByRowVersion]				**
**																		**
**	Called by: SQL Job													**
**	Author: Elvis Leonel Arispe	Cabrera									**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
**************************************************************************/

PRINT 'Creating Procedure called -> [ETL].[GetProjectChangesByRowVersion]...';
IF OBJECT_ID (N'[ETL].[GetProjectChangesByRowVersion]') IS NOT NULL  
    DROP PROCEDURE [ETL].[GetProjectChangesByRowVersion];  
GO 

CREATE PROCEDURE [ETL].[GetProjectChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT	project_id
			,name_project
			,location_project
			,budget_project
	FROM [dbo].[Project]
	WHERE [Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND [Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS);
GO


/*************************************************************************
**  Procedure Name:	[ETL].[GetEmployeeChangesByRowVersion]				**
**																		**
**	Called by: SQL Job													**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Pamela Cardozo			Version Initial				**
**************************************************************************/

CREATE PROCEDURE [ETL].[GetEmployeeChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT emp.[employee_id]
		  ,per.[first_name]
		  ,per.[last_name]
		  ,emp.[ci]
		  ,emp.[gender]
		  ,emp.[phone_number]
		  ,emp.[address]
	FROM [dbo].[Employee] emp
	INNER JOIN [dbo].[Person] per
	ON (emp.person_id = per.person_id)
	WHERE emp.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND emp.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
GO

/*************************************************************************
**  Procedure Name:	[ETL].[GetEmployeeChangesByRowVersion]				**
**																		**
**	Called by: SQL Job													**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Pamela Cardozo			Version Initial				**
**************************************************************************/

CREATE PROCEDURE [ETL].[GetItemChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT [item_equipment_id]
		  ,[name_equipment]
		  ,[description] 
	FROM [dbo].[Item_Equipment]
	WHERE [Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND [Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
GO

/*************************************************************************
**  Procedure Name:	[ETL].[GetAccidentChangesByRowVersion]				**
**																		**
**	Called by: SQL Job													**
**	Author: Elvis Leonel Arispe	Cabrera									**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
**************************************************************************/

PRINT 'Creating Procedure called -> [ETL].[GetAccidentChangesByRowVersion]...';
IF OBJECT_ID (N'[ETL].[GetAccidentChangesByRowVersion]') IS NOT NULL  
    DROP PROCEDURE [ETL].[GetAccidentChangesByRowVersion];  
GO 

CREATE PROCEDURE [ETL].[GetAccidentChangesByRowVersion]	
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT	emp.employee_id				-- id Empleado
			,emp_proj.project_id		-- id Proyecto
			,ass_mac.machinery_id		-- id Maquinaria
			,ass_item.item_equipment_id	-- id Item
			,acc.accident_id			-- id Accident
			,acc.cause
			,acc.severity
			,acc.turn
			,acc.day_lost
	FROM [dbo].[Accident] acc
	INNER JOIN [dbo].[Accident_type] ty
	ON (ty.accident_type_id=acc.accident_type_id)
	INNER JOIN [dbo].[Employee] emp
	ON (emp.employee_id = acc.employee_id)
	INNER JOIN [dbo].[Employee_Project] emp_proj
	ON (emp_proj.employee_id = emp.employee_id)
	INNER JOIN [dbo].[Assignment_Machinery] ass_mac
	ON (ass_mac.emp_proj_id = emp_proj.emp_proj_id)
	INNER JOIN [dbo].[Assignment_Item_Equipment] ass_item
	ON (ass_item.emp_proj_id = emp_proj.emp_proj_id)
	WHERE acc.[Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND acc.[Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS);	
GO
