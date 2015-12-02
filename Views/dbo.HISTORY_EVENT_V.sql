SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW [dbo].[HISTORY_EVENT_V]
 
 AS

SELECT HISTORY_EVENT_KEY
      ,HISTORY_EVENT_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,LOAN_ID
      ,CONTACT_ID
      ,CHANGE_DATE
      ,EVENT_NAME
      ,ID_BEFORE
      ,VALUE_BEFORE
      ,ID_AFTER
      ,VALUE_AFTER
      ,ADDITIONAL_INFORMATION
      ,CHANGE_BY_DETAIL
      ,VERBOSE_HISTORY_FLAG
      ,LOAN_KEY
      ,CONTACT_KEY
      ,[NAMESPACE]
  FROM [dbo].[HISTORY_EVENT]
  
  WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
 



GO
