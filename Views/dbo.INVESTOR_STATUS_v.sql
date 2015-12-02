SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW [dbo].[INVESTOR_STATUS_v]
 
 AS

SELECT INVESTOR_STATUS_KEY
      ,INVESTOR_STATUS_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,COMPANY_ID
      ,[DESCRIPTION]
      ,INVESTOR_STATUS_UUID
      ,FINAL_DISPOSITION_FLAG
      ,COMPANY_KEY
      ,[NAMESPACE]
  FROM [dbo].[INVESTOR_STATUS]

  
  WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
 


GO
