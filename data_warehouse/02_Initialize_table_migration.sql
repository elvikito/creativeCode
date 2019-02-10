USE[SGSSO];

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN TRANSACTION;
PRINT 'Initialize Table Migration...';
/*************************************************************************
** Insert table Name: [ETL].[TableMigration]  							**
**																		**
** Description:	Initialization of integration table						**
**																		**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 10/02/2019		Elvis L. Arispe			Version Initial				**
**************************************************************************/

INSERT INTO [ETL].[TableMigration]
           ([TableName]
           ,[LatestChange])
     VALUES
           (<TableName, varchar(50),>
           ,<LatestChange, bigint,>)
GO

PRINT 'Table Migration initialization done...';
COMMIT TRANSACTION;

