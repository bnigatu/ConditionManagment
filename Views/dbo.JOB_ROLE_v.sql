SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE VIEW [dbo].[JOB_ROLE_v]
 
 AS

SELECT JOB_ROLE_KEY
      ,JOB_ROLE_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,NAME
      ,[DESCRIPTION]
      ,JOB_ROLE_UUID
      ,[NAMESPACE]
  FROM [dbo].[JOB_ROLE]

  
  WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
 


GO
