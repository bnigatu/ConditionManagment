SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW [dbo].[DUE_DILG_VENDOR_STATUS_v]
 
 AS

SELECT DUE_DILG_VENDOR_STATUS_KEY
      ,DUE_DILG_VENDOR_STATUS_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,COMPANY_ID
      ,DUE_DILG_STATUS_TYPE_ID
      ,CODE
      ,[DESCRIPTION]
      ,DUE_DILG_VENDOR_STATUS_UUID
      ,COMPANY_KEY
      ,DUE_DILG_STATUS_TYPE_KEY
      ,[NAMESPACE]
  FROM [dbo].[DUE_DILG_VENDOR_STATUS]
  
  WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
 

GO
