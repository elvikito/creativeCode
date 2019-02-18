
--Creation of trigger Machinery
/******************************************************************************
**  Name: TG_Machinery(Audit)_UpdateAdd
**  Desc: Audit History for Machinery table
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
CREATE TRIGGER [dbo].[TG_Machinery(Audit)_UpdateAdd]
ON [dbo].[Machinery]
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
  FROM [dbo].[Machinery] tabla 
  INNER JOIN inserted i ON (tabla.machinery_id = i.machinery_id)
 
END;
