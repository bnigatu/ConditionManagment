SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW [dbo].[INV_CONDITION_STATUS_v]
 
 AS

SELECT INVESTOR_CONDITION_STATUS_KEY
      ,INVESTOR_CONDITION_STATUS_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,COMPANY_ID
      ,CONDITION_STATUS_ID
      ,[DESCRIPTION]
      ,INVESTOR_CONDITION_STATUS_UUID
      ,COMPANY_KEY
      ,CONDITION_STATUS_KEY
      ,[NAMESPACE]
  FROM [dbo].[INVESTOR_CONDITION_STATUS]

  
  WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
 


GO
