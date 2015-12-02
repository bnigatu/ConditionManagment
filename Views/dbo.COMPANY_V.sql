SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW [dbo].[COMPANY_V]
 AS

SELECT  COMPANY_KEY
      ,COMPANY_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,VERSION_NUMBER
      ,OWNING_COMPANY_ID
      ,COMPANY_NAME
      ,COMPANY_CODE
      ,ADMIN_EMAIL_TO_ADDRESS
      ,OWNING_COMPANY_KEY
      ,BUSINESS_DAY_CALENDAR_KEY
      ,[NAMESPACE]
  FROM [dbo].[COMPANY]
  
  WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
 


GO
