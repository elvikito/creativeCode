
--Creation of trigger Employee_Project
/******************************************************************************
**  Name: TG_Employee_Project(Audit)_UpdateAdd
**  Desc: Audit History for Employee_Project table
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
CREATE TRIGGER [dbo].[TG_Employee_Project(Audit)_UpdateAdd]
ON [dbo].[Employee_Project]
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
  FROM [dbo].[Employee_Project] tabla 
  INNER JOIN inserted i ON (tabla.emp_proj_id = i.emp_proj_id)
 
END;
