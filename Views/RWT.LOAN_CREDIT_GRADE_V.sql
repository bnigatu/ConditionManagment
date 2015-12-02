SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [RWT].[LOAN_CREDIT_GRADE_V]
AS 
  SELECT l.loan_id, 
         ps.investor_loan_number AS rwt_loan_number, 
         psr.RATING_AGENCY_ID, 
         CASE psr.rating_agency_id 
           WHEN 1 THEN 'S & P' 
           WHEN 2 THEN 'Moodys' 
           WHEN 3 THEN 'DBRS' 
           WHEN 4 THEN 'Fitch' 
           ELSE 'Other' 
         END                     AS rating_agency_name, 
         psr.OVERALL_GRADE, 
         psr.CREDIT_GRADE, 
         psr.COMPLIANCE_GRADE, 
         psr.PROPERTY_GRADE,
		 l.[Namespace]
  FROM   dbo.LOAN l with(nolock) 
         INNER JOIN dbo.PRICING_SCENARIO ps with(nolock) 
                 ON l.loan_id= ps.loan_id and
				    l.[Namespace] = ps.[Namespace] and
					l.is_current = 'Y' and ps.is_current = 'Y'
         INNER JOIN dbo.PRICING_SCENARIO_RATING psr with(nolock)
                 ON ps.pricing_scenario_id = psr.pricing_scenario_id and
				    ps.[Namespace] = psr.[Namespace] and
					psr.is_current = 'Y'
  WHERE  ps.current_pricing_flag = 'Y' 
         AND l.invalid_flag = 'N' 
         AND l.cmt_visible_flag = 'Y' 


GO
