
--Creation of trigger Area_Position
/******************************************************************************
**  Name: TG_Area_Position(Audit)_UpdateAdd
**  Desc: Audit History for Area_Position table
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
CREATE TRIGGER [dbo].[TG_Area_Position(Audit)_UpdateAdd]
ON [dbo].[Area_Position]
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
  FROM [dbo].[Area_Position] tabla 
  INNER JOIN inserted i ON (tabla.area_position_id = i.area_position_id)
 
END;
