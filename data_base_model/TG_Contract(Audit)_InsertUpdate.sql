
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
                                 NewValue) 
    SELECT TableName    = 'Contract', 
           ColumnName   = 'area_position_id',
           ID           = i.contract_id, 
           Date         = @CurrDate, 
           OldValue     = d.[area_position_id], 
           NewValue     = i.[area_position_id]         
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
                                 NewValue) 
    SELECT TableName    = 'Contract', 
           ColumnName   = 'salary',
           ID           = i.contract_id, 
           Date         = @CurrDate, 
           OldValue     = d.[salary], 
           NewValue     = i.[salary]      
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
                                 NewValue) 
    SELECT TableName    = 'Contract', 
           ColumnName   = 'init_date',
           ID           = i.contract_id, 
           Date         = @CurrDate, 
           OldValue     = d.[init_date], 
           NewValue     = i.[init_date]          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.init_date, '') != ISNULL(i.init_date, '');
  END
END;
