SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




CREATE VIEW [dbo].[INV_DUE_DILIGENCE_STATUS_v]
 
 AS

SELECT INV_DUE_DILIGENCE_STATUS_KEY
      ,INV_DUE_DILIGENCE_STATUS_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,VERSION_NUMBER
      ,COMPANY_ID
      ,INV_DUE_DILG_STATUS_TYPE_ID
      ,INV_DUE_DILG_STATUS_UUID
      ,[DESCRIPTION]
      ,SORT_ORDER
      ,COMPANY_KEY
      ,INV_DUE_DILG_STATUS_TYPE_KEY
      ,[NAMESPACE]
  FROM [dbo].[INV_DUE_DILIGENCE_STATUS]

  
  WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
 


GO
