SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW [dbo].[INV_DUE_DILG_SAMPLE_TYPE_V]
 
 AS
	SELECT INV_DUE_DILG_SAMPLE_TYPE_KEY
		  ,INV_DUE_DILG_SAMPLE_TYPE_ID
		  ,IS_CURRENT
		  ,IS_DELETED
		  ,IS_CURRENT_DAY
		  ,VALID_FROM
		  ,VALID_TILL
		  ,LAST_MODIFIED_BY
		  ,LAST_MODIFIED_ON
		  ,BATCH_ID
		  ,[Action]
		  ,ModDate
		  ,ModBy
		  ,VERSION_NUMBER
		  ,COMPANY_ID
		  ,DUE_DILG_SAMPLE_TYPE_ID
		  ,INV_DUE_DILG_SAMPLE_TYPE_UUID
		  ,[DESCRIPTION]
		  ,SORT_ORDER
		  ,[NAMESPACE]
	  FROM dbo.INV_DUE_DILG_SAMPLE_TYPE
	  
	  WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
 
GO
