
--Creation of trigger Assignment_Item_Equipment
/******************************************************************************
**  Name: TG_Assignment_Item_Equipment(Audit)_UpdateAdd
**  Desc: Audit History for Assignment_Item_Equipment table
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
CREATE TRIGGER [dbo].[TG_Assignment_Item_Equipment(Audit)_UpdateAdd]
ON [dbo].[Assignment_Item_Equipment]
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
  FROM [dbo].[Assignment_Item_Equipment] tabla 
  INNER JOIN inserted i ON (tabla.assignment_item_id = i.assignment_item_id)
 
END;
