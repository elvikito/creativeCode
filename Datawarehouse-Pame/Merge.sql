/*******************************************************************************
** Name: ETL.DW_MergeEmployee                          
*******************************************************************************
**  Date:       Author:          Description:
**  --------    --------------   ---------------------------------------------------
** 10/02/2018   Pamela Cardozo   Initial Version
***************************************************************************** */
CREATE PROCEDURE [ETL].[DW_MergeEmployee]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[DimEmployee] AS target
	USING [ETL].[Employee] AS source
	ON
	(
	  target.[employee_id] = source.[employee_id]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [Employeefirst_name]   = source.[first_name]
			,[Employeelast_name]    = source.[last_name]
			,[Employeeci]           = source.[ci]
			,[Employeegender]       = source.[gender]
			,[Employeephone_number] = source.[phone_number]
			,[Employeeaddress]      = source.[address]
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		 [employee_id]
		,[Employeefirst_name]
		,[Employeelast_name]
		,[Employeeci]
		,[Employeegender]
		,[Employeephone_number]
		,[Employeeaddress]
	  )
	  VALUES
	  (
		source.[employee_id]
		,source.[first_name]
		,source.[last_name]
		,source.[ci]
		,source.[gender]
		,source.[phone_number]
		,source.[address]
	  );
END



/******************************************************************************
**  Name: ETL.DW_Item
**  Desc: Merges Source ETL.Item changes into Destination dbo.DimItem table. 
**  Called By SQL Job ETL
** **
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:          Description:
**  --------    --------------   ---------------------------------------------------
** 10/02/2018   Pamela Cardozo   Initial Version
******************************************************************************/
CREATE PROCEDURE [ETL].[DW_Item]
AS
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
	MERGE [dbo].[DimItem] AS target
	USING [ETL].[Item] AS source
	ON
	(
	  target.[item_id] = source.[item_id]
	)
	WHEN MATCHED
	THEN UPDATE 
		 SET [Itemname] = source.[name]
			,[Itemdescription]         = source.[description]
	WHEN NOT MATCHED
	THEN 
	  INSERT
	  (
		[item_id] 
		,[Itemname]
		,[Itemdescription] 
	  )
	  VALUES
	  (
		source.[item_id]
		,source.[Itemname]
		,source.[Itemdescription]
	  );
END
