
/*******************************************************************************
** Name: Creación SGSSO Scchema                         
*******************************************************************************
**  Date:       Author:          Description:
**  --------    --------------   ---------------------------------------------------
** 10/02/2018   Pamela Cardozo   Initial Version
***************************************************************************** */
USE [SGSSO2];
GO

CREATE SCHEMA [ETL];
GO

CREATE TABLE [dbo].[Employee](
	[employee_id] [int] NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[ci] [int] NOT NULL,
	[gender] [nvarchar](50) NOT NULL,
	[phone_number] [int] NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[Rowversion] [timestamp] NOT NULL,
 CONSTRAINT [PK_SGSSO.Employee] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Item](
	[item_id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](100) NOT NULL,
	[Rowversion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
	
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
