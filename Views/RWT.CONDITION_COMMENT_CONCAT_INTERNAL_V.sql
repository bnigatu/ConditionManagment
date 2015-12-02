SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [RWT].[CONDITION_COMMENT_CONCAT_INTERNAL_V] 
AS 



WITH cond AS(SELECT cond.Condition_id,cond.[Namespace], COMMENT_TEXT AS CondList 
							--comment_text + Char(10) AS [text()] 
                      FROM   (SELECT condition_id,
					                 [Namespace], 
                                     Upper(Substring(USER_NAME, 12, Len( 
                                     USER_NAME) 
                                     )) 
                                     + ' - ' 
                                     + CONVERT(VARCHAR(30), comment_created_date 
                                     , 
                                     101) 
                                     + '  ' 
                                     + REPLACE(REPLACE(RIGHT('0'+LTRIM(RIGHT( 
                                     CONVERT( VARCHAR, comment_created_date, 100), 7)), 7), 'AM', ' AM'), 'PM', ' PM') 
                                     + Char(10) + Comment_Text AS 'COMMENT_TEXT', 
									 SELLER_VIEWABLE_FLAG, 
									 comment_created_date 
                              FROM   RWT.condition_comment_v
                              --WHERE seller_viewable_flag = 'Y' 
                     ) cond
) 
,com as(
	SELECT cond.Condition_id,cond.[Namespace], 
		REPLACE(REPLACE(REPLACE(
			(SELECT  CondList + Char(10)  --as COMMENT_TEXT
			 FROM cond result
			 WHERE (cond.Condition_id = result.condition_id and 
					cond.[Namespace] = result.[Namespace]) 
			 FOR xml path(''))
			 , '</A><A>', ', ')
            ,'<A>','')
        ,'</A>','')  AS COMMENT_TEXT 							
	FROM   cond 
	GROUP BY cond.Condition_id,cond.[Namespace]
					--cond.Condition_id = cm.condition_id 
					--and    cond.[Namespace] = cm.[Namespace] --AND
						  --cond.seller_viewable_flag = 'Y'
					--ORDER  BY cond.comment_created_date DESC 
					--FOR xml path('')
) 
  SELECT cm.loan_id
      ,loan_uuid
      ,rwt_loan_number
      ,seller_loan_number
      ,dd_loan_number
      ,assigned_to_end_user
      ,secondary_assigned_to_end_user
      ,rwt_dd_status_id
      ,rwt_dd_status_description
      ,cm.condition_id
      ,condition_key
      ,condition_uuid
      ,condition_type_code
      ,condition_type_description
      ,condition_type_category
      ,source_activity_code
      ,source_activity_description
      ,rwt_condition_text
      ,dd_condition_text
      ,display_condition_text
      ,seller_viewable_flag
      ,dd_company_code
      ,dd_company_name
      ,dd_company_id
      ,dd_loan_status_description
      ,dd_status_type_id
      ,dd_vendor_status_date
      ,condition_notification_date
      ,suspense_expiration_date
      ,condition_created_date
      ,dd_condition_status_id
      ,dd_condition_status_code
      ,dd_condition_status_description
      ,loan_receipt_date
      ,seller_review_date
      ,condition_timing_type_id
      ,condition_timing_type_description
      ,cm.[Namespace], 
      com.COMMENT_TEXT
--		 FROM            rwt.loan_condition_v cm CROSS APPLY
--                             (SELECT        COMMENT_TEXT + CHAR(10) AS [text()]
--                               FROM           (Select condition_id,
-- UPPER(SUBSTRING(USER_NAME,12,LEN(USER_NAME)))+ ' - '+
-- convert(varchar(30),comment_created_date,101) 
-- + '  '+ 
-- REPLACE(REPLACE(RIGHT('0'+LTRIM(RIGHT(CONVERT(varchar,comment_created_date,100),7)),7),'AM',' AM'),'PM',' PM')
-- + CHAR(10)+Comment_Text as 'COMMENT_TEXT',
-- SELLER_VIEWABLE_FLAG,
-- comment_created_date
-- from rwt.condition_comment_v) cond
--                               WHERE        cond.Condition_id = cm.condition_id 
							   


--ORDER BY cond.comment_created_date DESC
--FOR XML PATH('')) cond(CondList)


 
  FROM   RWT.loan_condition_V cm 
   left join com on com.Condition_id = cm.condition_id 
					and com.[Namespace] = cm.[Namespace]
         --CROSS apply (SELECT COMMENT_TEXT + Char(10) AS [text()] 
         --             FROM   (SELECT condition_id, 
					    --             [Namespace],
         --                            Upper(Substring(USER_NAME, 12, Len( 
         --                            USER_NAME) 
         --                            )) 
         --                            + ' - ' 
         --                            + CONVERT(VARCHAR(30), comment_created_date 
         --                            , 
         --                            101) 
         --                            + '  ' 
         --                            + Replace(Replace(RIGHT('0'+Ltrim(RIGHT( 
         --                            CONVERT( 
         --                            VARCHAR, 
         --                                    comment_created_date, 
         --                            100), 7)), 7), 'AM', ' AM'), 'PM', ' PM') 
         --                            + Char(10) + Comment_Text AS 'COMMENT_TEXT' 
         --                            , 
         --            SELLER_VIEWABLE_FLAG, 
         --            comment_created_date 
         --                     FROM   RWT.condition_comment_V) cond 
         --             WHERE  cond.Condition_id = cm.condition_id and
					    --     cond.[Namespace] = cm.[Namespace]
         --             ORDER  BY cond.comment_created_date DESC 
         --             FOR xml path('')) cond(condlist) 







GO
