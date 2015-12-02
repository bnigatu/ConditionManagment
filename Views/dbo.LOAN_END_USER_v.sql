SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



CREATE VIEW [dbo].[LOAN_END_USER_v]
 
 AS
 
SELECT LOAN_END_USER_KEY
      ,LOAN_END_USER_ID
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
      ,END_USER_CONTACT_ID
      ,JOB_ROLE_ID
      ,LOAN_END_USER_UUID
      ,LOAN_KEY
      ,CONTACT_KEY
      ,END_USER_CONTACT_KEY
      ,JOB_ROLE_KEY
      ,[NAMESPACE]
  FROM [dbo].[LOAN_END_USER]

  
  WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
 


GO
