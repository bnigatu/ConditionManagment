SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [RWT].[LOAN_HISTORY_EVENT_V]
AS 
  SELECT l.loan_id, 
         ps.investor_loan_number                      AS rwt_loan_number, 
         CONTACT_ID                                   AS changed_by_id, 
         (SELECT user_name 
          FROM   end_user 
          WHERE  end_user.contact_id = he.contact_id) AS changed_by_user_name, 
         CHANGE_DATE, 
         EVENT_NAME, 
         ID_BEFORE, 
         VALUE_BEFORE, 
         ID_AFTER, 
         VALUE_AFTER, 
         ADDITIONAL_INFORMATION,
		 l.[Namespace] 
  FROM   dbo.LOAN l with(nolock)
         INNER JOIN dbo.PRICING_SCENARIO ps with(nolock)
                 ON l.LOAN_id = ps.LOAN_id and
				    l.[Namespace] = ps.[Namespace] and
					l.is_current = 'Y' and ps.is_current = 'Y'
         INNER JOIN dbo.HISTORY_EVENT  he with(nolock)
                 ON l.LOAN_id = he.LOAN_id and
				    l.[Namespace] = he.[Namespace] and
					 he.is_current = 'Y'
  WHERE  ps.current_pricing_flag = 'Y' 
         AND l.invalid_flag = 'N' 
         AND l.cmt_visible_flag = 'Y' 
         AND ( ( he.verbose_history_flag = 'N' ) 
                OR ( he.verbose_history_flag IS NULL ) ) 


GO
