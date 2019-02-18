
--Creation of trigger Accident_Type
/******************************************************************************
**  Name: TG_Accident_Type(Audit)_UpdateAdd
**  Desc: Audit History for Accident_Type table
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
CREATE TRIGGER [dbo].[TG_Accident_Type(Audit)_UpdateAdd]
ON [dbo].[Accident_Type]
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
  FROM [dbo].[Accident_Type] tabla 
  INNER JOIN inserted i ON (tabla.accident_type_id = i.accident_type_id)
 
END;
