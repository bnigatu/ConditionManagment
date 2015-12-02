SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE VIEW [dbo].[SOURCE_ACTIVITY_STATUS_v]
 
 AS

SELECT SOURCE_ACTIVITY_STATUS_KEY
      ,SOURCE_ACTIVITY_STATUS_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,ACTIVITY_SOURCE_ID
      ,ACTIVITY_STATUS_ID
      ,[DESCRIPTION]
      ,CODE
      ,SOURCE_ACTIVITY_STATUS_UUID
      ,ACTIVITY_SOURCE_KEY
      ,ACTIVITY_STATUS_KEY
      ,[NAMESPACE]
  FROM [dbo].[SOURCE_ACTIVITY_STATUS]
  WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
 


GO
