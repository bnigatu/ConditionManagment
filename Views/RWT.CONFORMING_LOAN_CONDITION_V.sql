SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE VIEW [RWT].[CONFORMING_LOAN_CONDITION_V] 
AS 

  SELECT l.loan_id, 
         l.loan_uuid, 
         ps.investor_loan_number                                AS rwt_loan_number 
            , 
         l.loan_number                                          AS seller_loan_number, 
         ddvd.vendor_loan_number                                AS dd_loan_number, 
         (SELECT user_name 
          FROM   loan_end_user leu1 
                 INNER JOIN end_user eu1 
                         ON leu1.end_user_contact_id = eu1.contact_id  and leu1.is_current = 'Y' and eu1.is_current = 'Y' and
						  leu1.[Namespace] = eu1.[Namespace]
                 INNER JOIN job_role jr1 
                         ON leu1.job_role_id = jr1.job_role_id and jr1.is_current = 'Y' and leu1.[Namespace] = jr1.[Namespace]
						 
          WHERE  leu1.loan_id = l.loan_id
                 AND jr1.NAME = 'ROLE_INV_COND_MGMT')           AS assigned_to_end_user, 
         (SELECT user_name 
          FROM   loan_end_user leu1 
                 INNER JOIN end_user eu1 
                         ON leu1.end_user_contact_id = eu1.contact_id  and
						   leu1.[Namespace] = eu1.[Namespace]
                 INNER JOIN job_role jr1 
                         ON leu1.job_role_id = jr1.job_role_id and jr1.is_current = 'Y' and 
						   leu1.[Namespace] = jr1.[Namespace]
          WHERE  leu1.loan_id = l.loan_id 
                 AND jr1.NAME = 'ROLE_INV_COND_MGMT_SECONDARY') AS secondary_assigned_to_end_user, 
         idds.inv_due_diligence_status_id                     AS rwt_dd_status_id, 
         idds.description                                       AS rwt_dd_status_description, 
         a.activity_key                                         AS condition_id, 
         a.activity_uuid                                        AS condition_uuid, 
         at.code                                                AS condition_type_code, 
         at.description                                         AS condition_type_description, 
         at.activity_category                                   AS condition_type_category, 
         sat.code                                               AS source_activity_code, 
         sat.description                                        AS source_activity_description, 
         a.description                                          AS rwt_condition_text, 
         a.source_description                                   AS dd_condition_text, 
         CASE a.source_acknowledged_flag 
           WHEN 'Y' THEN a.description 
           ELSE a.source_description 
         END                                                    AS display_condition_text, 
         a.seller_viewable_flag, 
         dd_comp.company_code                                   AS dd_company_code 
            , 
         dd_comp.company_name                                   AS dd_company_name, 
         dd_comp.company_id                                     AS dd_company_id 
         , 
         CASE ddvs.due_dilg_status_type_id 
           WHEN 1 THEN 'Reviewed With Conditions' 
           WHEN 2 THEN 'Review Complete' 
           ELSE NULL 
         END                                                    AS dd_loan_status_description, 
         ddvs.due_dilg_status_type_id                           AS dd_status_type_id, 
         ddvd.vendor_status_date                                AS dd_vendor_status_date, 
         ps.condition_notification_date, 
         ps.suspense_expiration_date, 
         --ics.investor_condition_status_id                      AS rwt_condition_status_id, 
         --ics.description                                        AS rwt_condition_status_description,          
         a.created_date                                         AS condition_created_date, 
         sas.source_activity_status_key                         AS dd_condition_status_id, 
         sas.code                                               AS dd_condition_status_code, 
         sas.description                                        AS dd_condition_status_description, 
         ddvd.created_date                                      AS loan_receipt_date, 
         ps.seller_review_date, 
         c.condition_timing_type_id, 
         CASE c.condition_timing_type_id 
           WHEN 1 THEN 'Pre-Purchase' 
           WHEN 2 THEN 'Post-Purchase' 
           ELSE NULL 
         END
		                                                    AS condition_timing_type_description,
		 l.[Namespace]
	     
  FROM   dbo.loan l with(nolock)
         INNER JOIN dbo.pricing_scenario ps with(nolock)
                 ON l.loan_id= ps.loan_id and l.is_current = 'Y' and ps.is_current = 'Y' and
				    l.[Namespace] = ps.[Namespace]
         LEFT OUTER JOIN dbo.due_dilg_vendor_data ddvd with(nolock)
                      ON ps.pricing_scenario_id = ddvd.pricing_scenario_id and ddvd.is_current = 'Y' and
					     ps.[Namespace] = ddvd.[Namespace] 
         INNER JOIN dbo.activity a with(nolock)
                 ON l.loan_id = a.loan_id and a.is_current = 'Y' and 
				  l.[Namespace] = a.[Namespace]
         INNER JOIN dbo.condition c with(nolock)
                 ON a.activity_id = c.activity_id and c.is_current = 'Y' and
				    a.[Namespace] = c.[Namespace]  
         LEFT OUTER JOIN dbo.activity_type at with(nolock)
                      ON a.activity_type_id = at.activity_type_id and at.is_current = 'Y' and 
					     a.[Namespace] = at.[Namespace]
         LEFT OUTER JOIN dbo.source_activity_type sat with(nolock)
                      ON a.source_activity_type_id = sat.source_activity_type_id and sat.is_current = 'Y' and
					     a.[Namespace] = sat.[Namespace]
         LEFT OUTER JOIN dbo.source_activity_status sas with(nolock)
                      ON a.source_activity_status_id =  sas.source_activity_status_id and sas.is_current = 'Y' and 
					     a.[Namespace] = sas.[Namespace] 
         LEFT OUTER JOIN dbo.company dd_comp with(nolock)
                      ON ddvd.company_id = dd_comp.company_id and dd_comp.is_current = 'Y' and 
					     ddvd.[Namespace] = dd_comp.[Namespace]
         LEFT OUTER JOIN dbo.due_dilg_vendor_status ddvs with(nolock)
                      ON ddvd.due_dilg_vendor_status_id =  ddvs.due_dilg_vendor_status_id and ddvs.is_current = 'Y' and
					     ddvd.[Namespace] = ddvs.[Namespace]
         LEFT OUTER JOIN dbo.inv_due_diligence_status idds with(nolock)
                      ON ps.inv_due_diligence_status_id = idds.inv_due_diligence_status_id and idds.is_current = 'Y' and 
					     ps.[Namespace] = idds.[Namespace]
         --LEFT OUTER JOIN dbo.investor_condition_status_v ics 
         --             ON c.investor_condition_status_key = 
         --                ics.investor_condition_status_key 
  WHERE  ps.current_pricing_flag = 'Y' 
         AND l.invalid_flag = 'N' 
         AND l.cmt_visible_flag = 'N' 
         AND a.excluded_flag = 'N' 
         AND NOT EXISTS (SELECT 'x' 
                         FROM   SOURCE_ACTIVITY_TYPE_v AS sat2 
                         WHERE  sat2.source_activity_type_id = 
                                a.source_activity_type_id
                                AND sat2.excluded_flag = 'Y') 



GO
