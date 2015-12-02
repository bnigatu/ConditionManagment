SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [RWT].[LOAN_COMMENT_V]
AS 
  SELECT l.loan_id, 
         ps.investor_loan_number   AS rwt_loan_number, 
         lc.loan_comment_index, 
         lc.created_date, 
         lc.updated_date, 
         lc.comment_text, 
         lc.loan_comment_class, 
         lc.SELLER_VIEWABLE_FLAG, 
         lc.DUE_DILIGENCE_VIEWABLE_FLAG, 
         lc.INTERNAL_VIEWABLE_FLAG AS internal_flag, 
         lc.source_identifier,
		 l.[Namespace]
  FROM   dbo.LOAN l with(Nolock)
         INNER JOIN dbo.PRICING_SCENARIO ps with(Nolock)
                 ON l.loan_id = ps.loan_id  and l.is_current = 'Y' and ps.is_current = 'Y' and l.[Namespace] = ps.[namespace]
         INNER JOIN dbo.LOAN_COMMENT lc with(Nolock)
                 ON l.loan_id = lc.loan_id and lc.is_current = 'Y' and l.[Namespace] = lc.[Namespace]
  WHERE  ps.current_pricing_flag = 'Y' 
         AND l.invalid_flag = 'N' 
         AND l.cmt_visible_flag = 'Y' 


GO
