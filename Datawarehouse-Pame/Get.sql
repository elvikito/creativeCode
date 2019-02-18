/******************************************************************************
**  Name: GetEmployeeChangesByRowVersion
**  Desc: Pulls Changes and Inserts from the dbo.Employee table 
**  Called By ETL SQL Job.

*******************************************************************************
**  Date:       Author:             Description:
**  --------    --------           --------------------------------------------------
**  10/02/2019  Pamela Cardozo       Initial Version
******************************************************************************/
PRINT 'Creando Stored Procedure llamado  -> [ETL].[GetEmployeeChangesByRowVersion]...';
IF OBJECT_ID ( '[ETL].[GetEmployeeChangesByRowVersion]', 'P' ) IS NOT NULL   
    DROP PROCEDURE [ETL].[GetEmployeeChangesByRowVersion];  
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ETL].[GetEmployeeChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT [employee_id]
		  ,[first_name]
		  ,[last_name]
		  ,[ci]
		  ,[gender]
		  ,[phone_number]
		  ,[address]
	FROM [dbo].[Employee] 
	WHERE [Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND [Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
	
GO
/******************************************************************************
**  Name: GetItemChangesByRowVersion
**  Desc: Pulls Changes and Inserts from the dbo.Item table 
**  Called By ETL SQL Job.

*******************************************************************************
**  Date:       Author:             Description:
**  --------    --------           --------------------------------------------------
**  10/02/2019  Pamela Cardozo       Initial Version
******************************************************************************/
PRINT 'Creando Stored Procedure  llamado  -> [ETL].[GetItemChangesByRowVersion]...';
IF OBJECT_ID ( '[ETL].[GetItemChangesByRowVersion]', 'P' ) IS NOT NULL   
    DROP PROCEDURE [ETL].[GetItemChangesByRowVersion];  
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ETL].[GetItemChangesByRowVersion]
(
  @LastRowVersionID BIGINT,
  @CurrentDBTS      BIGINT
)
AS
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	SELECT [item_id]
		  ,[name] 
		  ,[description]
		  
	FROM [dbo].[Item] 
	WHERE [Rowversion] > CONVERT(ROWVERSION, @LastRowVersionID)
	AND [Rowversion] <= CONVERT(ROWVERSION, @CurrentDBTS)
	
GO