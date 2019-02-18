
--Creation of trigger Assignment_Machinery
/******************************************************************************
**  Name: TG_Assignment_Machinery(Audit)_UpdateAdd
**  Desc: Audit History for Assignment_Machinery table
** 
**  Called by: Portal
**
**  Author: Tania Valero
**
**  Date: 16/02/2019
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:          Author:                        Description:
** --------        --------        --------------------------------------------
** 02/16/2019    Tania Valero                     Initial version
*******************************************************************************/
CREATE TRIGGER [dbo].[TG_Assignment_Machinery(Audit)_UpdateAdd]
ON [dbo].[Assignment_Machinery]
AFTER INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
  
  UPDATE tabla
  SET updated_at = @CurrDate
  FROM [dbo].[Assignment_Machinery] tabla 
  INNER JOIN inserted i ON (tabla.assignment_machinery_id = i.assignment_machinery_id)
 
END;
