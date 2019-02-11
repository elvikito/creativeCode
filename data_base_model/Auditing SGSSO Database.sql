
--Table of Audit
CREATE TABLE [dbo].[AuditHistory]
(
	[AuditHistoryId] INT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_AuditHistory] PRIMARY KEY,
	[TableName]		 VARCHAR(50) NULL,
	[ColumnName]	 VARCHAR(50) NULL,
	[ID]             INT NULL,
	[Date]           DATETIME NULL,
	[Oldvalue]       VARCHAR(MAX) NULL,
	[NewValue]       VARCHAR(MAX) NULL,
	[ModifiedBy]     INT
);
GO
