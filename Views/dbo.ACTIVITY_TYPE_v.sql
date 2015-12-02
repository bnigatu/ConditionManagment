SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
  
-------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW [dbo].[ACTIVITY_TYPE_v]
 AS
SELECT  ACTIVITY_TYPE_KEY
      ,ACTIVITY_TYPE_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,CODE
      ,[DESCRIPTION]
      ,ACTIVITY_CATEGORY
      ,ACTIVITY_TYPE_UUID
      ,[NAMESPACE]
  FROM [dbo].[ACTIVITY_TYPE]
  
  WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
 


GO
