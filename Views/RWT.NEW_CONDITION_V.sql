SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [RWT].[NEW_CONDITION_V]
AS 
  SELECT l.LOAN_ID, 
         l.LOAN_UUID, 
         ps.INVESTOR_LOAN_NUMBER                                    AS rwt_loan_number, 
         l.LOAN_NUMBER                                              AS seller_loan_number, 
         ddvd.VENDOR_LOAN_NUMBER                                    AS dd_loan_number, 
         (SELECT eu1.USER_NAME 
          FROM   dbo.LOAN_END_USER AS leu1 
                 INNER JOIN dbo.END_USER AS eu1 
                         ON leu1.END_USER_CONTACT_id = eu1.CONTACT_id AND
						 leu1.[NAMESPACE] = eu1.[NAMESPACE] AND
						 leu1.IS_CURRENT = 'Y' AND
						 eu1.IS_CURRENT = 'Y'
                 INNER JOIN dbo.JOB_ROLE AS jr1 
                         ON leu1.JOB_ROLE_id = jr1.JOB_ROLE_id AND
						 leu1.[NAMESPACE] = jr1.[NAMESPACE] AND
						 jr1.IS_CURRENT = 'Y'
          WHERE  ( leu1.LOAN_id = l.LOAN_id) 
                 AND ( jr1.NAME = 'ROLE_INV_COND_MGMT' ))           AS assigned_to_end_user_v,
         (SELECT eu1.USER_NAME 
          FROM   dbo.LOAN_END_USER AS leu1 
                 INNER JOIN dbo.END_USER AS eu1 
                         ON leu1.END_USER_CONTACT_id = eu1.CONTACT_id AND
						 leu1.[NAMESPACE] = eu1.[NAMESPACE] AND
						 leu1.IS_CURRENT = 'Y' AND						 
						 eu1.IS_CURRENT = 'Y'
                 INNER JOIN dbo.JOB_ROLE AS jr1 
                         ON leu1.JOB_ROLE_id = jr1.JOB_ROLE_id AND
						 leu1.[NAMESPACE] = jr1.[NAMESPACE] AND
						 jr1.IS_CURRENT = 'Y'
          WHERE  ( leu1.LOAN_ID = l.LOAN_ID ) 
                 AND ( jr1.NAME = 'ROLE_INV_COND_MGMT_SECONDARY' )) AS secondary_assigned_to_end_user,
         idds.INV_DUE_DILIGENCE_STATUS_ID                           AS rwt_dd_status_id, 
         idds.DESCRIPTION                                           AS rwt_dd_status_description,
         a.ACTIVITY_ID                                              AS condition_id, 
         a.ACTIVITY_UUID                                            AS condition_uuid, 
         at.CODE                                                    AS condition_type_code, 
         at.DESCRIPTION                                             AS condition_type_description,
         at.ACTIVITY_CATEGORY                                       AS condition_type_category,
         sat.CODE                                                   AS source_activity_code, 
         sat.DESCRIPTION                                            AS source_activity_description,
         a.DESCRIPTION                                              AS rwt_condition_text, 
         a.SOURCE_DESCRIPTION                                       AS dd_condition_text, 
         CASE a.source_acknowledged_flag 
           WHEN 'Y' THEN a.description 
           ELSE a.source_description 
         END                                                        AS display_condition_text,
         a.SELLER_VIEWABLE_FLAG, 
         dd_comp.COMPANY_CODE                                       AS dd_company_code, 
         dd_comp.COMPANY_NAME                                       AS dd_company_name, 
         dd_comp.COMPANY_ID                                         AS dd_company_id, 
         CASE ddvs.due_dilg_status_type_id 
           WHEN 1 THEN 'Reviewed With Conditions' 
           WHEN 2 THEN 'Review Complete' 
           ELSE NULL 
         END                                                        AS dd_loan_status_description,
         ddvs.DUE_DILG_STATUS_TYPE_ID                               AS dd_status_type_id, 
         ddvd.VENDOR_STATUS_DATE                                    AS dd_vendor_status_date,
         ps.CONDITION_NOTIFICATION_DATE, 
         ps.SUSPENSE_EXPIRATION_DATE, 
         --ics.INVESTOR_CONDITION_STATUS_ID                           AS rwt_condition_status_id,
         --ics.DESCRIPTION                                            AS rwt_condition_status_description,
         a.CREATED_DATE                                             AS condition_created_date,
         sas.SOURCE_ACTIVITY_STATUS_ID                              AS dd_condition_status_id,
         sas.CODE                                                   AS dd_condition_status_code,
         sas.DESCRIPTION                                            AS dd_condition_status_description,
         ddvd.CREATED_DATE                                          AS loan_receipt_date, 
         ps.SELLER_REVIEW_DATE, 
         c.CONDITION_TIMING_TYPE_ID, 
         CASE c.condition_timing_type_id 
           WHEN 1 THEN 'Pre-Purchase' 
           WHEN 2 THEN 'Post-Purchase' 
           ELSE NULL 
         END                                                        AS condition_timing_type_description,
         a.CREATED_DATE                                             AS condition_added_date, 
         l.CMT_VISIBLE_FLAG                                         AS conforming_flag, 
         a.ACTIVITY_CLOSED_DATE                                     AS condition_satisfied_date,
		 l.[Namespace]
  FROM   dbo.LOAN AS l WITH(nolock) 
         INNER JOIN dbo.PRICING_SCENARIO AS ps WITH(nolock) 
                 ON l.LOAN_ID = ps.LOAN_ID AND
					l.[NAMESPACE] = ps.[NAMESPACE] AND
				    l.IS_CURRENT = 'Y' AND
					ps.IS_CURRENT = 'Y'
         LEFT OUTER JOIN dbo.DUE_DILG_VENDOR_DATA AS ddvd WITH(nolock) 
                      ON ps.PRICING_SCENARIO_ID = ddvd.PRICING_SCENARIO_ID AND
					     ps.[NAMESPACE] = ddvd.[NAMESPACE] AND
					     ps.IS_CURRENT = 'Y'
         INNER JOIN dbo.ACTIVITY AS a WITH(nolock) 
                 ON l.LOAN_ID = a.LOAN_ID AND
				    l.[NAMESPACE] = a.[NAMESPACE] AND
				    a.IS_CURRENT = 'Y'
         INNER JOIN dbo.CONDITION AS c WITH(nolock) 
                 ON a.ACTIVITY_ID= c.ACTIVITY_ID AND
				    a.[NAMESPACE]= c.[NAMESPACE] AND
				    c.IS_CURRENT = 'Y'
         LEFT OUTER JOIN dbo.ACTIVITY_TYPE AS at WITH(nolock) 
                      ON a.ACTIVITY_TYPE_ID = at.ACTIVITY_TYPE_ID AND
					     a.[NAMESPACE] = at.[NAMESPACE] AND
					     at.IS_CURRENT = 'Y'
         LEFT OUTER JOIN dbo.SOURCE_ACTIVITY_TYPE AS sat WITH(nolock) 
                      ON a.SOURCE_ACTIVITY_TYPE_ID = sat.SOURCE_ACTIVITY_TYPE_ID AND
					     a.[NAMESPACE] = sat.[NAMESPACE] AND
					     sat.IS_CURRENT = 'Y'
         LEFT OUTER JOIN dbo.SOURCE_ACTIVITY_STATUS AS sas WITH(nolock) 
                      ON a.SOURCE_ACTIVITY_STATUS_ID = sas.SOURCE_ACTIVITY_STATUS_ID AND
					     a.[NAMESPACE] = sas.[NAMESPACE] AND
					     sas.IS_CURRENT = 'Y' 
         LEFT OUTER JOIN dbo.COMPANY AS dd_comp WITH(nolock) 
                      ON ddvd.COMPANY_ID = dd_comp.COMPANY_ID AND
					     ddvd.[NAMESPACE] = dd_comp.[NAMESPACE] AND
					     dd_comp.IS_CURRENT = 'Y'
         LEFT OUTER JOIN dbo.DUE_DILG_VENDOR_STATUS AS ddvs WITH(nolock) 
                      ON ddvd.DUE_DILG_VENDOR_STATUS_ID = ddvs.DUE_DILG_VENDOR_STATUS_ID AND
					     ddvd.[NAMESPACE] = ddvs.[NAMESPACE] AND
					     ddvs.IS_CURRENT = 'Y'
         LEFT OUTER JOIN dbo.INV_DUE_DILIGENCE_STATUS AS idds WITH(nolock) 
                      ON ps.INV_DUE_DILIGENCE_STATUS_ID = idds.INV_DUE_DILIGENCE_STATUS_ID  AND
					     ps.[NAMESPACE] = idds.[NAMESPACE]  AND
					     idds.IS_CURRENT = 'Y'
         --LEFT OUTER JOIN dbo.INVESTOR_CONDITION_STATUS_V AS ics WITH(nolock) 
         --             ON c.INVESTOR_CONDITION_STATUS_key = ics.INVESTOR_CONDITION_STATUS_key 
  WHERE  ( ps.CURRENT_PRICING_FLAG = 'Y' ) 
         AND ( l.INVALID_FLAG = 'N' ) 
         AND ( a.EXCLUDED_FLAG = 'N' ) 
         AND ( NOT EXISTS (SELECT 'x' AS Expr1 
                           FROM   dbo.SOURCE_ACTIVITY_TYPE_V AS sat2 
                           WHERE  ( SOURCE_ACTIVITY_TYPE_id = a.SOURCE_ACTIVITY_TYPE_id ) 
                                  AND ( EXCLUDED_FLAG = 'Y' )) ) 



GO
