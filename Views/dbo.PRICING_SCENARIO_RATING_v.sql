SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW [dbo].[PRICING_SCENARIO_RATING_v]
 
 AS

SELECT PRICING_SCENARIO_RATING_KEY
      ,PRICING_SCENARIO_RATING_ID
      ,IS_CURRENT
      ,IS_DELETED
      ,IS_CURRENT_DAY
      ,VALID_FROM
      ,VALID_TILL
      ,LAST_MODIFIED_BY
      ,LAST_MODIFIED_ON
      ,BATCH_ID
      ,PRICING_SCENARIO_ID
      ,RATING_AGENCY_ID
      ,OVERALL_GRADE
      ,CREDIT_GRADE
      ,COMPLIANCE_GRADE
      ,PROPERTY_GRADE
      ,PRICING_SCENARIO_KEY
      ,RATING_AGENCY_KEY
      ,[NAMESPACE]
  FROM [dbo].[PRICING_SCENARIO_RATING]
  
  WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
 


GO
