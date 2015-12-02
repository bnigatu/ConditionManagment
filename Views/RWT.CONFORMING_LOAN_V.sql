SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [RWT].[CONFORMING_LOAN_V] 
AS 
  SELECT l.loan_id, 
         ps.investor_loan_number        AS rwt_loan_number, 
         (SELECT TOP 1 comment_text 
          FROM   loan_comment uw_lc 
          WHERE  uw_lc.loan_id = l.loan_id and 
		       uw_lc.[Namespace] = l.[namespace] 
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
		     ON l.loan_id = ps.loan_id and
		      l.[Namespace] = ps.[Namespace] and 
		      l.is_current = 'Y' and ps.is_current = 'Y'
         LEFT OUTER JOIN dbo.inv_due_dilg_sample_type iddst with(nolock)
                 ON ps.INV_DUE_DILG_SAMPLE_TYPE_id = iddst.INV_DUE_DILG_SAMPLE_TYPE_id and
				    iddst.is_current = 'Y' and ps.[Namespace] = iddst.[Namespace]
  WHERE  ps.current_pricing_flag = 'Y' 
         AND l.invalid_flag = 'N' 
         AND l.cmt_visible_flag = 'N' 




GO
