/*******************************************************************************
** Name: Creación DWSGSSO Scchema                         
*******************************************************************************
**  Date:       Author:          Description:
**  --------    --------------   ---------------------------------------------------
** 10/02/2019   Pamela Cardozo   Initial Version
***************************************************************************** */
USE [DWSGSSO2];
GO

CREATE SCHEMA [ETL];
GO

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

CREATE TABLE [dbo].[DimItem](
    [item_id] [int] NOT NULL,
	[Itemname] [nvarchar](100) NOT NULL,
	[Itemdescription] [nvarchar](100) NOT NULL,
	
 CONSTRAINT [PK_DimItem] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*******************************************************************************
**   Name: ETL                         
*******************************************************************************
**  Date:       Author:          Description:
**  --------    --------------   ---------------------------------------------------
** 10/02/2019   Pamela Cardozo   Initial Version
***************************************************************************** */

CREATE TABLE [ETL].[Employee](
	[employee_id] [int] NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[ci] [int] NOT NULL,
	[gender] [nvarchar](50) NOT NULL,
	[phone_number] [int] NOT NULL,
	[address] [nvarchar](50) NOT NULL,
) ON [PRIMARY]
GO

CREATE TABLE [ETL].[Item](
	[item_id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](100) NOT NULL,
	
) ON [PRIMARY]
GO

/*******************************************************************************
**   Name:                         
*******************************************************************************
**  Date:       Author:          Description:
**  --------    --------------   ---------------------------------------------------
** 10/02/2019   Pamela Cardozo   Initial Version
***************************************************************************** */
IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_employee_id]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[FactAccidentes]'))
ALTER TABLE [dbo].[FactAccidentes]  WITH CHECK ADD  CONSTRAINT [FK_employee_id] FOREIGN KEY([employee_id])
REFERENCES [dbo].[DimEmployee] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FactAccidentes] CHECK CONSTRAINT [FK_employee_id]


IF NOT EXISTS (SELECT * FROM sys.foreign_keys
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_item_id]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[FactAccidentes]'))
ALTER TABLE [dbo].[FactAccidentes]  WITH CHECK ADD  CONSTRAINT [FK_item_id] FOREIGN KEY([item_id])
REFERENCES [dbo].[DimItem] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FactAccidentes] CHECK CONSTRAINT [FK_item_id]