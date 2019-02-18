
--Creation of trigger Incident
/******************************************************************************
**  Name: TG_Incident(Audit)_UpdateAdd
**  Desc: Audit History for Incident table
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
CREATE TRIGGER [dbo].[TG_Incident(Audit)_UpdateAdd]
ON [dbo].[Incident]
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
  FROM [dbo].[Incident] tabla 
  INNER JOIN inserted i ON (tabla.incident_id = i.incident_id)
 
END;
