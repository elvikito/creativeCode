
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