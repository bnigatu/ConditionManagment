SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [RWT].[CONDITION_COMMENT_V]
AS 
  SELECT a.ACTIVITY_ID                AS condition_id, 
         a.ACTIVITY_UUID              AS condition_uuid, 
         ac.ACTIVITY_COMMENT_ID       AS condition_comment_id, 
         ac.ACTIVITY_COMMENT_UUID     AS condition_comment_uuid, 
         ac.ACTIVITY_COMMENT_INDEX    AS condition_comment_index, 
         eu.USER_NAME, 
         ac.COMMENT_TEXT, 
         ac.SELLER_VIEWABLE_FLAG, 
         ac.DUE_DILIGENCE_VIEWABLE_FLAG, 
         ac.INTERNAL_VIEWABLE_FLAG AS internal_flag, 
         ac.CREATED_DATE           AS comment_created_date,
		 l.[NAMESPACE]
  
   FROM dbo.ACTIVITY AS a
                                 INNER JOIN dbo.CONDITION AS c with(nolock)
                 ON a.ACTIVITY_id = c.ACTIVITY_id and  
				 a.is_current = 'Y' and 
				 c.is_current = 'Y' and
				 a.[Namespace] = c.[Namespace]
         INNER JOIN dbo.ACTIVITY_COMMENT AS ac with(nolock)
                 ON a.ACTIVITY_id = ac.ACTIVITY_id and
				  ac.is_current = 'Y' and 
				  a.[Namespace] = ac.[Namespace]
         INNER JOIN dbo.END_USER AS eu with(nolock)
                 ON ac.CONTACT_id = eu.CONTACT_id and 
				 eu.is_current = 'Y' and 
				 ac.[Namespace] = eu.[Namespace]
         INNER JOIN dbo.LOAN AS l with(nolock)
                 ON a.loan_id = l.loan_id and l.is_current = 'Y' and
				 a.[Namespace] = l.[Namespace] 
                    WHERE l.invalid_flag = 'N'
                      AND l.cmt_visible_flag = 'Y'
                      AND a.EXCLUDED_FLAG = 'N'
                      AND NOT EXISTS (SELECT 'x'
                                        FROM SOURCE_ACTIVITY_TYPE as sat2
                                        WHERE sat2.source_activity_type_id = a.source_activity_type_id
                                          AND sat2.excluded_flag = 'Y')
  --FROM   dbo.ACTIVITY AS a with(nolock) 
  --       INNER JOIN dbo.CONDITION AS c with(nolock)
  --               ON a.ACTIVITY_id = c.ACTIVITY_id and  
		--		 a.is_current = 'Y' and 
		--		 c.is_current = 'Y' and
		--		 a.[Namespace] = c.[Namespace]
  --       INNER JOIN dbo.ACTIVITY_COMMENT AS ac with(nolock)
  --               ON a.ACTIVITY_id = ac.ACTIVITY_id and
		--		  ac.is_current = 'Y' and 
		--		  a.[Namespace] = ac.[Namespace]
  --       INNER JOIN dbo.END_USER AS eu with(nolock)
  --               ON ac.CONTACT_id = eu.CONTACT_id and 
		--		 eu.is_current = 'Y' and 
		--		 ac.[Namespace] = eu.[Namespace]
  --       INNER JOIN dbo.LOAN AS l with(nolock)
  --               ON a.loan_id = l.loan_id and l.is_current = 'Y' and
		--		 a.[Namespace] = l.[Namespace] 
 
  --WHERE  l.invalid_flag = 'N'; 





GO
