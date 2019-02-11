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

--Creation of trigger Person
/******************************************************************************
**  Name: TG_Person(Audit)_InsertUpdate
**  Desc: Audit History for Person table
** 
**  Called by: Portal
**
**  Author: Tania Valero
**
**  Date: 10/02/2019
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:          Author:                        Description:
** --------        --------        --------------------------------------------
** 02/10/2019    Tania Valero                     Initial version
*******************************************************************************/
CREATE TRIGGER [dbo].[TG_Person(Audit)_InsertUpdate]
ON [dbo].[Person]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(first_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue) 
    SELECT TableName    = 'Person', 
           ColumnName   = 'first_name',
           ID           = i.person_id, 
           Date         = @CurrDate, 
           OldValue     = d.[first_name], 
           NewValue     = i.[first_name]         
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.person_id = i.person_id)
    WHERE ISNULL(d.first_name, '') != ISNULL(i.first_name, '');
  END

  IF UPDATE(last_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue) 
    SELECT TableName    = 'Person', 
           ColumnName   = 'last_name',
           ID           = i.person_id, 
           Date         = @CurrDate, 
           OldValue     = d.[last_name], 
           NewValue     = i.[last_name]         
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.person_id = i.person_id)
    WHERE ISNULL(d.last_name, '') != ISNULL(i.last_name, '');
  END
  
  IF UPDATE(email)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue) 
    SELECT TableName    = 'Person', 
           ColumnName   = 'email',
           ID           = i.person_id, 
           Date         = @CurrDate, 
           OldValue     = d.[email], 
           NewValue     = i.[email]         
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.person_id = i.person_id)
    WHERE ISNULL(d.email, '') != ISNULL(i.email, '');
  END
END;

--Creation of trigger Employee
/******************************************************************************
**  Name: TG_Employee(Audit)_InsertUpdate
**  Desc: Audit History for Employee table
** 
**  Called by: Portal
**
**  Author: Tania Valero
**
**  Date: 10/02/2019
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:          Author:                        Description:
** --------        --------        --------------------------------------------
** 02/10/2019    Tania Valero                     Initial version
*******************************************************************************/
CREATE TRIGGER [dbo].[TG_Employee(Audit)_InsertUpdate]
ON [dbo].[Employee]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(ci)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Employee', 
           ColumnName   = 'ci',
           ID           = i.employee_id, 
           Date         = @CurrDate, 
           OldValue     = d.[ci], 
           NewValue     = i.[ci],
           ModifiedBy   = i.ModifiedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.employee_id = i.employee_id)
    WHERE ISNULL(d.ci, '') != ISNULL(i.ci, '');
  END
  
  IF UPDATE(address)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Employee', 
           ColumnName   = 'address',
           ID           = i.employee_id, 
           Date         = @CurrDate, 
           OldValue     = d.[address], 
           NewValue     = i.[address],
           ModifiedBy   = i.ModifiedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.employee_id = i.employee_id)
    WHERE ISNULL(d.address, '') != ISNULL(i.address, '');
  END
END;

--Creation of trigger Contract
/******************************************************************************
**  Name: TG_Contract(Audit)_InsertUpdate
**  Desc: Audit History for Contract table
** 
**  Called by: Portal
**
**  Author: Tania Valero
**
**  Date: 10/02/2019
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:          Author:                        Description:
** --------        --------        --------------------------------------------
** 02/10/2019    Tania Valero                     Initial version
*******************************************************************************/
CREATE TRIGGER [dbo].[TG_Contract(Audit)_InsertUpdate]
ON [dbo].[Contract]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
 
  IF UPDATE(area_position_id)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Contract', 
           ColumnName   = 'area_position_id',
           ID           = i.contract_id, 
           Date         = @CurrDate, 
           OldValue     = d.[area_position_id], 
           NewValue     = i.[area_position_id],
           ModifiedBy   = i.ModifiedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.area_position_id, '') != ISNULL(i.area_position_id, '');
  END
  
  IF UPDATE(salary)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Contract', 
           ColumnName   = 'salary',
           ID           = i.contract_id, 
           Date         = @CurrDate, 
           OldValue     = d.[salary], 
           NewValue     = i.[salary],
           ModifiedBy   = i.ModifiedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.salary, '') != ISNULL(i.salary, '');
  END
  
  IF UPDATE(init_date)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Contract', 
           ColumnName   = 'init_date',
           ID           = i.contract_id, 
           Date         = @CurrDate, 
           OldValue     = d.[init_date], 
           NewValue     = i.[init_date],
           ModifiedBy   = i.ModifiedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.init_date, '') != ISNULL(i.init_date, '');
  END
END;
