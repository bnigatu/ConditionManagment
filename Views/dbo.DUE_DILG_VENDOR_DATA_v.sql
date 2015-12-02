SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW [dbo].[DUE_DILG_VENDOR_DATA_v]
 AS

SELECT DUE_DILG_VENDOR_DATA_KEY
      ,DUE_DILG_VENDOR_DATA_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,PRICING_SCENARIO_ID
      ,DUE_DILG_VENDOR_STATUS_ID
      ,COMPANY_ID
      ,VENDOR_LOAN_NUMBER
      ,VENDOR_STATUS_DATE
      ,VENDOR_STATUS_DATE_AS_LONG
      ,DUE_DILG_VENDOR_DATA_UUID
      ,CREATED_DATE
      ,UPDATED_DATE
      ,PRICING_SCENARIO_KEY
      ,DUE_DILG_VENDOR_STATUS_KEY
      ,COMPANY_KEY
      ,[NAMESPACE]
  FROM [dbo].[DUE_DILG_VENDOR_DATA]
  
  WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
 

GO
