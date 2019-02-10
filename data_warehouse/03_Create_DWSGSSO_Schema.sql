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
GO

/*************************************************************************
**  Table Name: [dbo].[DimProject]										**
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

CREATE TABLE [dbo].[FactAccident]
(
	employee_id			INT NOT NULL
	,project_id			INT	NOT NULL
	,machinary_id		INT NOT NULL
	,item_equipment_id	INT NOT NULL
	,cause				VARCHAR(255) NOT NULL
	,severity			VARCHAR(20) NOT NULL
	,turn				VARCHAR(15) NOT NULL
	 CONSTRAINT PK_FactAccident PRIMARY KEY CLUSTERED 
	(
		employee_id			ASC
		,project_id			ASC
		,machinary_id		ASC
		,item_equipment_id	ASC
	)	WITH (	PAD_INDEX = OFF, 
				STATISTICS_NORECOMPUTE = OFF, 
				IGNORE_DUP_KEY = OFF,
				ALLOW_ROW_LOCKS = ON, 
				ALLOW_PAGE_LOCKS = ON
			  ) ON [PRIMARY]
) ON [PRIMARY]
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
CREATE TABLE [ETL].[Machinary]
(
	machinary_id	INT NOT NULL
	,name_mac		VARCHAR(150) NOT NULL
	,brand_mac		VARCHAR(50) NOT NULL
	,model_mac		VARCHAR(50) NOT NULL
) ON [PRIMARY]
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

CREATE TABLE [ETL].[Project]
(
	project_id		INT NOT NULL
	,name_pro		VARCHAR(255) NOT NULL
	,location_pro	VARCHAR(255) NOT NULL
	,budget_pro		MONEY NOT NULL
) ON [PRIMARY]
GO

/*************************************************************************
**  Table Name: [dbo].[DimProject]										**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
**************************************************************************/

CREATE TABLE [ETL].[Accident]
(
	employee_id			INT NOT NULL
	,project_id			INT	NOT NULL
	,machinary_id		INT NOT NULL
	,item_equipment_id	INT NOT NULL
	,cause				VARCHAR(255) NOT NULL
	,severity			VARCHAR(20) NOT NULL
	,turn				VARCHAR(15) NOT NULL
) ON [PRIMARY]
GO


/*************************************************************************
**  Activity Name: Add Foreign Key´s									**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
**************************************************************************/
ALTER TABLE [dbo].[FactAccident]  WITH CHECK ADD  CONSTRAINT [FK_DimMachinary] FOREIGN KEY(machinary_id)
REFERENCES [dbo].[DimMachinary] (machinary_id)
GO
ALTER TABLE [dbo].[FactAccident] CHECK CONSTRAINT [FK_DimMachinary]
GO
ALTER TABLE [dbo].[FactAccident]  WITH CHECK ADD  CONSTRAINT [FK_DimProject] FOREIGN KEY(project_id)
REFERENCES [dbo].[DimProject] (project_id)
GO
ALTER TABLE [dbo].[FactAccident] CHECK CONSTRAINT [FK_DimProject]
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
** Procedure Name: [ETL].[DW_MergeAccident]								**
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
		,[cause]
		,[severity]
		,[turn]
	  )
	  VALUES
	  (
		[employee_id]
		,source.[project_id]
		,source.[machinary_id]
		,source.[item_equipment_id]
		,source.[cause]
		,source.[severity]
		,source.[turn]
	  );
END
GO