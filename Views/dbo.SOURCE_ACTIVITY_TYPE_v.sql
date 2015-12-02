SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW [dbo].[SOURCE_ACTIVITY_TYPE_v]
 
 AS

SELECT SOURCE_ACTIVITY_TYPE_KEY
      ,SOURCE_ACTIVITY_TYPE_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,ACTIVITY_SOURCE_ID
      ,ACTIVITY_TYPE_ID
      ,[DESCRIPTION]
      ,CODE
      ,SOURCE_ACTIVITY_TYPE_UUID
      ,EXCLUDED_FLAG
      ,ACTIVITY_SOURCE_KEY
      ,ACTIVITY_TYPE_KEY
      ,[NAMESPACE]
  FROM [dbo].[SOURCE_ACTIVITY_TYPE] 
  WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
 


GO
