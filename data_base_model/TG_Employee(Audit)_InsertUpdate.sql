
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
                                 NewValue) 
    SELECT TableName    = 'Employee', 
           ColumnName   = 'ci',
           ID           = i.employee_id, 
           Date         = @CurrDate, 
           OldValue     = d.[ci], 
           NewValue     = i.[ci]         
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
                                 NewValue) 
    SELECT TableName    = 'Employee', 
           ColumnName   = 'address',
           ID           = i.employee_id, 
           Date         = @CurrDate, 
           OldValue     = d.[address], 
           NewValue     = i.[address]          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.employee_id = i.employee_id)
    WHERE ISNULL(d.address, '') != ISNULL(i.address, '');
  END
END;