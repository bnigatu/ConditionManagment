SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE  VIEW [RWT].[LOAN_V]
AS 
  SELECT l.loan_id, 
         ps.investor_loan_number        AS rwt_loan_number, 
         (SELECT TOP 1 comment_text 
          FROM   loan_comment uw_lc 
          WHERE  uw_lc.loan_id = l.loan_id  AND
		         uw_lc.[NAMESPACE] = l.[NAMESPACE] 				
                 AND loan_comment_class = 
                     'net.mortgageconnect.domain.diligence.UnderwriterComment') 
                                        underwriter_comment, 
         ps.inv_due_dilg_sample_type_id review_type_id, 
         iddst.description              review_type_description, 
         ps.COLLATERAL_REVIEW_CMPLT_DATE, 
         ps.CREDIT_REVIEW_COMPLETE_DATE, 
         ps.SUSPENSE_CLEARED_DATE, 
         l.CLEARED_BY_CSTD_FLAG, 
         ps.condition_notification_date, 
         ps.suspense_expiration_date, 
         ps.CALC_SUSPENSE_EXPIRATION_DATE, 
		 l.[Namespace]
  FROM   dbo.LOAN l with(nolock)
         INNER JOIN dbo.PRICING_SCENARIO ps with(nolock)                 
		  ON l.loan_id = ps.loan_id AND 
			 l.[NAMESPACE] = ps.[NAMESPACE] AND
			 l.IS_CURRENT='Y' AND ps.IS_CURRENT = 'Y'
         LEFT OUTER JOIN dbo.INV_DUE_DILG_SAMPLE_TYPE iddst with(nolock)
		  ON ps.INV_DUE_DILG_SAMPLE_TYPE_ID = iddst.INV_DUE_DILG_SAMPLE_TYPE_ID AND
		     ps.[NAMESPACE] = iddst.[NAMESPACE] 
					    AND iddst.IS_CURRENT='Y' 
                     
  WHERE  ps.current_pricing_flag = 'Y' 
         AND l.invalid_flag = 'N' 
         AND l.cmt_visible_flag = 'Y'; 






GO
