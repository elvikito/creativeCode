
--Creation of trigger Accident
/******************************************************************************
**  Name: TG_Accident(Audit)_UpdateAdd
**  Desc: Audit History for Accident table
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
CREATE TRIGGER [dbo].[TG_Accident(Audit)_UpdateAdd]
ON [dbo].[Accident]
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
  FROM [dbo].[Accident] tabla 
  INNER JOIN inserted i ON (tabla.accident_id = i.accident_id)
 
END;
