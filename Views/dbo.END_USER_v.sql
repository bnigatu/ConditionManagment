SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW [dbo].[END_USER_v]
 
 AS

SELECT CONTACT_KEY
      ,CONTACT_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,COMPANY_ID
      ,[USER_NAME]
      ,ACCOUNT_APPROVED_FLAG
      ,ACCOUNT_ACTIVATED_FLAG
      ,COMPANY_KEY
      ,[NAMESPACE]
  FROM [dbo].[END_USER]

  
  WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
 


GO
