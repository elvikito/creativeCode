USE [SGSSO];

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN TRANSACTION;
BEGIN TRY

-- Make sure IDENTITY_INSERT is set to OFF
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Position] OFF
SET IDENTITY_INSERT [dbo].[Area] OFF

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
** 03/02/2019		Elvis R. Ramirez	    Insert Data Inicial			**
**************************************************************************/


PRINT 'Insert data into the Department table...';

INSERT INTO [dbo].[Department] ([department_id], [name], [description], [created_at], [updated_at], [Rowversion]) VALUES (N'1', N'RRHH', N'Admin Recursos Humanos', N'2018-01-21 00:00:00.000', N'2018-01-30 00:00:00.000', 0x00000000000007D3)

INSERT INTO [dbo].[Department] ([department_id], [name], [description], [created_at], [updated_at], [Rowversion]) VALUES (N'2', N'Contabilidad', N'Manejo de Contabilidad', N'2018-01-21 00:00:00.000', N'2018-01-30 00:00:00.000', 0x00000000000007D6)
GO

INSERT INTO [dbo].[Department] ([department_id], [name], [description], [created_at], [updated_at], [Rowversion]) VALUES (N'3', N'Soporte', N'Centro de ayuda', N'2018-01-30 00:00:00.000', N'2018-02-23 00:00:00.000', 0x00000000000007D9)


/*************************************************************************
**  Table Name: [dbo].[Position]	  									**
**																		**
**  Primary Key: position_id											**
**	Foreign Keys: -						  								**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 03/02/2019		Elvis R. Ramirez	    Insert Data Inicial			**
**************************************************************************/

PRINT 'Insert data into the Position table...';

INSERT INTO [dbo].[Position] ([position_id], [name], [description], [created_at], [updated_at], [Rowversion]) VALUES (N'1', N'Gerente', N'Encargado de gerencia.', N'2018-01-30 00:00:00.000', N'2018-02-23 00:00:00.000', 0x00000000000007DD)


/*************************************************************************
**  Table Name: [dbo].[Area]	  									**
**																		**
**  Primary Key: area_id											**
**	Foreign Keys: -						  								**
**************************************************************************
**                            CHANGE HISTORY							**
**************************************************************************
** Date:			Author:					Description:				**
** -----------		----------------		----------------			**
** 03/02/2019		Elvis R. Ramirez	    Insert Data Inicial			**
**************************************************************************/

PRINT 'Insert data into the Area table...';


INSERT INTO [dbo].[Area] ([area_id], [name], [description], [department_id], [created_at], [updated_at], [Rowversion]) VALUES (N'1', N'Area_RRHH', N'Area de recursos humanos', N'1', N'2018-01-30 00:00:00.000', N'2018-02-02 00:00:00.000', 0x00000000000007DA)
