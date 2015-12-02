SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW [dbo].[ACTIVITY_STATUS_V]
 AS
	SELECT ACTIVITY_STATUS_KEY
		  ,ACTIVITY_STATUS_ID
		  ,IS_CURRENT
		  ,IS_DELETED
		  ,IS_CURRENT_DAY
		  ,VALID_FROM
		  ,VALID_TILL
		  ,LAST_MODIFIED_BY
		  ,LAST_MODIFIED_ON
		  ,BATCH_ID
		  ,[Action]
		  ,ModDate
		  ,ModBy
		  ,[DESCRIPTION]
		  ,OPEN_STATUS_FLAG
		  ,ACTIVITY_STATUS_UUID
		  ,[NAMESPACE]
	  FROM dbo.ACTIVITY_STATUS
	  
	  WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'
GO
