SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[ACTIVITY_COMMENT_V]
 AS
	SELECT ACTIVITY_COMMENT_KEY
		  ,ACTIVITY_COMMENT_ID
		  ,IS_CURRENT
		  ,IS_DELETED
		  ,IS_CURRENT_DAY
		  ,VALID_FROM
		  ,VALID_TILL
		  ,LAST_MODIFIED_BY
		  ,LAST_MODIFIED_ON
		  ,BATCH_ID
		  ,ACTIVITY_ID
		  ,CONTACT_ID
		  ,CREATED_DATE
		  ,UPDATED_DATE
		  ,SELLER_VIEWABLE_FLAG
		  ,DUE_DILIGENCE_VIEWABLE_FLAG
		  ,INTERNAL_VIEWABLE_FLAG
		  ,COMMENT_TEXT
		  ,ACTIVITY_COMMENT_UUID
		  ,ACTIVITY_COMMENT_INDEX
		  ,ACTIVITY_KEY
		  ,CONTACT_KEY
		  ,[NAMESPACE]
	  FROM dbo.ACTIVITY_COMMENT
	      
	  WHERE IS_CURRENT = 'Y' AND IS_DELETED = 'N'

GO