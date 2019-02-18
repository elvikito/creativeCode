USE [DWSGSSO]
GO

CREATE SCHEMA [ETL];
GO


/*************************************************************************
**  Table Name: [dbo].[DimMachinary]									**
**																		**
**  Primary Key: [machinary_id]											**
**	Foreign Keys: -   													**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
**************************************************************************/
IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[DimMachinary]')
		       AND type in (N'U'))
BEGIN
	PRINT 'Creating the table DimMachinary ...';
	CREATE TABLE [dbo].[DimMachinary]
	(
	machinary_id	INT NOT NULL
	,name_mac		VARCHAR(150) NOT NULL
	,brand_mac		VARCHAR(50) NOT NULL
	,model_mac		VARCHAR(50) NOT NULL
	 CONSTRAINT PK_machinary_id PRIMARY KEY CLUSTERED 
	(
		machinary_id ASC
	)	WITH (	PAD_INDEX = OFF, 
				STATISTICS_NORECOMPUTE = OFF, 
				IGNORE_DUP_KEY = OFF,
				ALLOW_ROW_LOCKS = ON, 
				ALLOW_PAGE_LOCKS = ON
			  ) ON [PRIMARY]
	) ON [PRIMARY]
		PRINT 'DimMachinary Table Created!';
	END
 ELSE
	BEGIN
		PRINT 'DimMachinary table already exists in the Database: ';
	END
GO


/*************************************************************************
**  Table Name: [dbo].[DimProject]										**
**																		**
**  Primary Key: [project_id]											**
**	Foreign Keys: -   													**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
**************************************************************************/

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[DimProject]')
		       AND type in (N'U'))
BEGIN
	PRINT 'Creating the table DimProject ...';
	CREATE TABLE [dbo].[DimProject]
	(
	project_id		INT NOT NULL
	,name_pro		VARCHAR(255) NOT NULL
	,location_pro	VARCHAR(255) NOT NULL
	,budget_pro		MONEY NOT NULL
	 CONSTRAINT PK_project_id PRIMARY KEY CLUSTERED 
	(
		project_id ASC
	)	WITH (	PAD_INDEX = OFF, 
				STATISTICS_NORECOMPUTE = OFF, 
				IGNORE_DUP_KEY = OFF,
				ALLOW_ROW_LOCKS = ON, 
				ALLOW_PAGE_LOCKS = ON
			  ) ON [PRIMARY]
	) ON [PRIMARY]
		PRINT 'DimProject Table Created!';
	END
 ELSE
	BEGIN
		PRINT 'DimProject table already exists in the Database: ';
	END
GO

/*************************************************************************
**  Table Name: [dbo].[DimEmployee]										**
**																		**
**  Primary Key: [employee_id]											**
**	Foreign Keys: --													**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Pamela Cardozo			Version Initial				**
**************************************************************************/

CREATE TABLE [dbo].[DimEmployee](
	[employee_id] [int] NOT NULL,
	[Employeefirst_name] [nvarchar](50) NOT NULL,
	[Employeelast_name] [nvarchar](50) NOT NULL,
	[Employeeci] [int] NOT NULL,
	[Employeegender] [nvarchar](50) NOT NULL,
	[Employeephone_number] [int] NOT NULL,
	[Employeeaddress] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DimEmployee] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
	
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*************************************************************************
**  Table Name: [dbo].[DimItem]											**
**																		**
**  Primary Key: [item_equipment_id]									**
**	Foreign Keys: --													**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Pamela Cardozo			Version Initial				**
**************************************************************************/

CREATE TABLE [dbo].[DimItem](
    [item_equipment_id] [int] NOT NULL,
	[Itemname_equipment] [nvarchar](100) NOT NULL,
	[Itemdescription] [nvarchar](100) NOT NULL,
	
 CONSTRAINT [PK_DimItem] PRIMARY KEY CLUSTERED 
(
	[item_equipment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/*************************************************************************
**  Table Name: [dbo].[FactAccident]									**
**																		**
**  Primary Key: [project_id]											**
**	Foreign Keys: employee_id,project_id,machinery_id,item_equipment_id **
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
**************************************************************************/

IF NOT EXISTS (SELECT 1 FROM sys.objects
		       WHERE object_id = OBJECT_ID(N'[dbo].[FactAccident]')
		       AND type in (N'U'))
BEGIN
	PRINT 'Creating the table FactAccident ...';
	CREATE TABLE [dbo].[FactAccident]
	(
	employee_id			INT NOT NULL
	,project_id			INT	NOT NULL
	,machinary_id		INT NOT NULL
	,item_equipment_id	INT NOT NULL
	,accident_id		INT NOT NULL
	,cause				VARCHAR(255) NOT NULL
	,severity			VARCHAR(20) NOT NULL
	,turn				VARCHAR(15) NOT NULL
	,day_lost			INT NOT NULL
	 CONSTRAINT PK_FactAccident PRIMARY KEY CLUSTERED 
	(
		employee_id			ASC
		,project_id			ASC
		,machinary_id		ASC
		,item_equipment_id	ASC
		,accident_id ASC
	)	WITH (	PAD_INDEX = OFF, 
				STATISTICS_NORECOMPUTE = OFF, 
				IGNORE_DUP_KEY = OFF,
				ALLOW_ROW_LOCKS = ON, 
				ALLOW_PAGE_LOCKS = ON
			  ) ON [PRIMARY]
	) ON [PRIMARY]
		PRINT 'FactAccident Table Created!';
	END
ELSE
	BEGIN
		PRINT 'FactAccident table already exists in the Database: ';
	END
GO

/*************************************************************************
**  Table Name: [ETL].[Machinary]										**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
**************************************************************************/

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[ETL].[Machinary]') 
		      AND type in (N'U'))
BEGIN
	PRINT 'Creating the table [ETL].[Machinary] table....';
	CREATE TABLE [ETL].[Machinary]
	(
		machinary_id	INT NOT NULL
		,name_mac		VARCHAR(150) NOT NULL
		,brand_mac		VARCHAR(50) NOT NULL
		,model_mac		VARCHAR(50) NOT NULL
	) ON [PRIMARY]

		PRINT '[ETL].[Machinary] Table Created!';
	END
ELSE
	BEGIN
		PRINT '[ETL].[Machinary] table already exists in the Database: ';
	END
GO

/*************************************************************************
**  Table Name: [ETL].[Project]											**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
**************************************************************************/

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[ETL].[Project]') 
		      AND type in (N'U'))
BEGIN
	PRINT 'Creating the table [ETL].[Project] table....';
	CREATE TABLE [ETL].[Project]
	(
		project_id		INT NOT NULL
		,name_pro		VARCHAR(255) NOT NULL
		,location_pro	VARCHAR(255) NOT NULL
		,budget_pro		MONEY NOT NULL
	) ON [PRIMARY]

		PRINT '[ETL].[Project] Table Created!';
	END
ELSE
	BEGIN
		PRINT '[ETL].[Project] table already exists in the Database: ';
	END
GO

/*************************************************************************
**  Table Name: [ETL].[Employee]										**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Pamela Cardozo			Version Initial				**
**************************************************************************/

CREATE TABLE [ETL].[Employee](
	[employee_id] [int] NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[ci] [int] NOT NULL,
	[gender] [nvarchar](50) NOT NULL,
	[phone_number] [int] NOT NULL,
	[address] [varchar](255) NOT NULL
) ON [PRIMARY]
GO

/*************************************************************************
**  Table Name: [ETL].[Item]											**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Pamela Cardozo			Version Initial				**
**************************************************************************/

CREATE TABLE [ETL].[Item](
	[item_equipment_id] [int] NOT NULL,
	[name_equipment] [nvarchar](100) NOT NULL,
	[description] [nvarchar](100) NOT NULL,
	
) ON [PRIMARY]
GO

/*************************************************************************
**  Table Name: [ETL].[Accident]										**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
**************************************************************************/

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[ETL].[Accident]') 
		      AND type in (N'U'))
BEGIN
	PRINT 'Creating the table [ETL].[Accident] table....';
	CREATE TABLE [ETL].[Accident]
	(
		employee_id			INT NOT NULL
		,project_id			INT	NOT NULL
		,machinary_id		INT NOT NULL
		,item_equipment_id	INT NOT NULL
		,accident_id		INT NOT NULL
		,cause				VARCHAR(255) NOT NULL
		,severity			VARCHAR(20) NOT NULL
		,turn				VARCHAR(15) NOT NULL
		,day_lost			INT NOT NULL
	) ON [PRIMARY]

		PRINT '[ETL].[Accident] Table Created!';
	END
ELSE
	BEGIN
		PRINT '[ETL].[Accident] table already exists in the Database: ';
	END
GO

/*************************************************************************
**  Activity Name: Add Foreign Key愀									**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
** 10/02/2019		Pamela Cardozo			Version Initial				**
**************************************************************************/
ALTER TABLE [dbo].[FactAccident]  WITH CHECK ADD  CONSTRAINT [FK_DimMachinary] FOREIGN KEY(machinary_id)
REFERENCES  [dbo].[DimMachinary] (machinary_id)
GO
ALTER TABLE [dbo].[FactAccident] CHECK CONSTRAINT [FK_DimMachinary]
GO
ALTER TABLE [dbo].[FactAccident]  WITH CHECK ADD  CONSTRAINT [FK_DimProject] FOREIGN KEY(project_id)
REFERENCES  [dbo].[DimProject] (project_id)
GO
ALTER TABLE [dbo].[FactAccident] CHECK CONSTRAINT [FK_DimProject]
GO
ALTER TABLE [dbo].[FactAccident]  WITH CHECK ADD  CONSTRAINT [FK_DimEmployee] FOREIGN KEY([employee_id])
REFERENCES  [dbo].[DimEmployee] ([employee_id])
GO
ALTER TABLE [dbo].[FactAccident] CHECK CONSTRAINT [FK_DimEmployee]
GO
ALTER TABLE [dbo].[FactAccident]  WITH CHECK ADD  CONSTRAINT [FK_DimItem] FOREIGN KEY([item_equipment_id])
REFERENCES  [dbo].[DimItem] ([item_equipment_id])
GO
ALTER TABLE [dbo].[FactAccident] CHECK CONSTRAINT [FK_DimItem]
GO

/*************************************************************************
** Procedure Name: [ETL].[DW_MergeMachinary]							**
** Description: Merges Source ETL.Machinary changes into				**
**				Destination dbo.DimMachinary table.						**
** Called By SQL Job ETL												**
**																		**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
**************************************************************************/

PRINT 'Creando PROCEDURE llamado  -> [ETL].[DW_MergeMachinary]...';
IF OBJECT_ID (N'[ETL].[DW_MergeMachinary]') IS NOT NULL
BEGIN
    DROP PROCEDURE [ETL].[DW_MergeMachinary];
END
GO

CREATE PROCEDURE [ETL].[DW_MergeMachinary]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[DimMachinary] AS target
	USING [ETL].[Machinary] AS source
	ON
	(
	  target.[machinary_id] = source.[machinary_id]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [name_mac]		= source.[name_mac]
			,[brand_mac]	= source.[brand_mac]
			,[model_mac]    = source.[model_mac]
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 [machinary_id]
		,[name_mac]
		,[brand_mac]
		,[model_mac]
	  )
	  VALUES
	  (
		source.[machinary_id]
		,source.[name_mac]
		,source.[brand_mac]
		,source.[model_mac]
	  );
END
GO

/*************************************************************************
** Procedure Name: [ETL].[DW_MergeProject]								**
** Description: Merges Source ETL.Machinary changes into				**
**				Destination dbo.DimMachinary table.						**
** Called By SQL Job ETL												**
**																		**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
**************************************************************************/

PRINT 'Creando PROCEDURE llamado  -> [ETL].[DW_MergeProject]...';
IF OBJECT_ID (N'[ETL].[DW_MergeProject]') IS NOT NULL
BEGIN
    DROP PROCEDURE [ETL].[DW_MergeProject];
END
GO

CREATE PROCEDURE [ETL].[DW_MergeProject]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[DimProject] AS target
	USING [ETL].[Project] AS source
	ON
	(
	  target.[project_id] = source.[project_id]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [name_pro]		= source.[name_pro]
			,[location_pro]	= source.[location_pro]
			,[budget_pro]    = source.[budget_pro]
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 [project_id]
		 ,[name_pro]
		 ,[location_pro]
		 ,[budget_pro]
	  )
	  VALUES
	  (
		source.[project_id]
		,source.[name_pro]
		,source.[location_pro]
		,source.[budget_pro]
	  );
END
GO

/*************************************************************************
** Procedure Name: [ETL].[DW_MergeEmployee]								**
** Called By SQL Job ETL												**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Pamela Cardozo			Version Initial				**
**************************************************************************/

CREATE PROCEDURE [ETL].[DW_MergeEmployee]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[DimEmployee] AS target
	USING [ETL].[Employee] AS source
	ON
	(
	  target.[employee_id] = source.[employee_id]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [Employeefirst_name]   = source.[first_name]
			,[Employeelast_name] = source.[last_name]
			,[Employeeci] = source.[ci]
			,[Employeegender] = source.[gender]
			,[Employeephone_number] = source.[phone_number]
			,[Employeeaddress] = source.[address]
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 [employee_id]
		,[Employeefirst_name]
		,[Employeelast_name]
		,[Employeeci]
		,[Employeegender]
		,[Employeephone_number]
		,[Employeeaddress]
	  )
	  VALUES
	  (
		source.[employee_id]
		,source.[first_name]
		,source.[last_name]
		,source.[ci]
		,source.[gender]
		,source.[phone_number]
		,source.[address]
	  );
END
GO


/******************************************************************************
**  Name: [ETL].[DW_MergeItem]
**  Desc: Merges Source ETL.Item changes into Destination dbo.DimItem table. 
**  Called By SQL Job ETL
** **
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:          Description:
**  --------    --------------   ---------------------------------------------------
** 10/02/2018   Pamela Cardozo   Initial Version
******************************************************************************/
CREATE PROCEDURE [ETL].[DW_MergeItem]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[DimItem] AS target
	USING [ETL].[Item] AS source
	ON
	(
	  target.[item_equipment_id] = source.[item_equipment_id]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [Itemname_equipment] = source.[name_equipment]
			,[Itemdescription]     = source.[description]
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		[item_equipment_id] 
		,[Itemname_equipment]
		,[Itemdescription] 
	  )
	  VALUES
	  (
		source.[item_equipment_id]
		,source.[name_equipment]
		,source.[description]
	  );
END
GO

/*************************************************************************
** Procedure Name: [ETL].[DW_MergeAccident]								**
** Called By SQL Job ETL												**
**																		**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
**************************************************************************/

PRINT 'Creando PROCEDURE llamado  -> [ETL].[DW_MergeAccident]...';
IF OBJECT_ID (N'[ETL].[DW_MergeAccident]') IS NOT NULL
BEGIN
    DROP PROCEDURE [ETL].[DW_MergeAccident];
END
GO
CREATE PROCEDURE [ETL].[DW_MergeAccident]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[FactAccident] AS target
	USING [ETL].[Accident] AS source
	ON
	(
		
		 target.[employee_id]			= source.[employee_id]
		AND target.[project_id]			= source.[project_id]	
		AND target.[machinary_id]		= source.[machinary_id]	
		AND target.[item_equipment_id]	= source.[item_equipment_id]
		AND target.[accident_id]		= source.[accident_id]
	)
	WHEN MATCHED
	THEN UPDATE 
			SET	[cause]		= source.[cause]
				,[severity] = source.[severity]
				,[turn]		= source.[turn]
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		[employee_id]
		,[project_id]
		,[machinary_id]
		,[item_equipment_id]
		,[accident_id]
		,[cause]
		,[severity]
		,[turn]
		,[day_lost]
	  )
	  VALUES
	  (
		source.[employee_id]
		,source.[project_id]
		,source.[machinary_id]
		,source.[item_equipment_id]
		,source.[accident_id]
		,source.[cause]
		,source.[severity]
		,source.[turn]
		,source.[day_lost]
	  );
END
GO