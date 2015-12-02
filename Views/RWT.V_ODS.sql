SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [RWT].[V_ODS] ( [SELLER], [BORROWER_LAST], [RWT_LOAN_NUM], 
						[SELLER_LOAN_NUM], [LOAN_STATUS], [RWT_LAST_STATUS_DATE], [LOCKED_DATE], 
						[LOCK_EXPIRATION_DATE], [COMMITMENT_ID], [PRODUCT_TYPE], [LOAN_PURPOSE], 
						[OCCUPANCY_TYPE], [PROPERTY_TYPE], [LOAN_AMOUNT], [DD_PROVIDER], [DD_SENT_DATE], 
						[MORTGAGE_TYPE]) 
AS 
  SELECT [SELLER] = Isnull(CONVERT(VARCHAR(40), [SELLER]), ''), 
         [BORROWER_LAST] = Isnull(CONVERT(VARCHAR(80), [BORROWER_LAST]), ''), 
         [RWT_LOAN_NUM] = CONVERT(VARCHAR(20), [RWT_LOAN_NUM]), 
         [SELLER_LOAN_NUM] = Isnull(CONVERT(VARCHAR(20), [SELLER_LOAN_NUM]), '') 
         , 
         [LOAN_STATUS] = Isnull(CONVERT(VARCHAR(40), [LOAN_STATUS]), 
                         ''), 
         [RWT_LAST_STATUS_DATE] = CASE 
                                    WHEN Isdate([RWT_LAST_STATUS_DATE]) = 1 THEN 
                                    CONVERT(VARCHAR(30), 
                                    CONVERT(DATETIME, [RWT_LAST_STATUS_DATE]), 
                                    101 
                                    ) 
                                    ELSE '' 
                                  END, 
         [LOCKED_DATE] = CASE 
                           WHEN Isdate([LOCKED_DATE]) = 1 THEN 
                           CONVERT(VARCHAR(30), 
                           CONVERT(DATETIME, [LOCKED_DATE]), 101) 
                           ELSE '' 
                         END, 
         [LOCK_EXPIRATION_DATE] = CASE 
                                    WHEN Isdate([LOCK_EXPIRATION_DATE]) = 1 THEN 
                                    CONVERT(VARCHAR(30), 
                                    CONVERT(DATETIME, [LOCK_EXPIRATION_DATE]), 
                                    101 
                                    ) 
                                    ELSE '' 
                                  END, 
         [COMMITMENT_ID] = Isnull(CONVERT(VARCHAR(20), [COMMITMENT_ID]), ''), 
         [PRODUCT_TYPE] = Isnull(CONVERT(VARCHAR(60), [PRODUCT_TYPE]), ''), 
         [LOAN_PURPOSE] = Isnull(CONVERT(VARCHAR(40), [LOAN_PURPOSE]), ''), 
         [OCCUPANCY_TYPE] = Isnull(CONVERT(VARCHAR(40), [OCCUPANCY_TYPE]), ''), 
         [PROPERTY_TYPE] = Isnull(CONVERT(VARCHAR(40), [PROPERTY_TYPE]), ''), 
         [LOAN_AMOUNT] = Isnull(CONVERT(VARCHAR(30), [LOAN_AMOUNT]), ''), 
         [DD_PROVIDER] = Isnull(CONVERT(VARCHAR(25), [DD_PROVIDER]), ''), 
         [DD_SENT_DATE] = CASE 
                            WHEN Isdate([DD_SENT_DATE]) = 1 THEN 
                            CONVERT(VARCHAR(30), 
                            CONVERT(DATETIME, [DD_SENT_DATE]), 101) 
                            ELSE '' 
                          END, 
         [MORTGAGE_TYPE] = Isnull(CONVERT(VARCHAR(15), [MORTGAGE_TYPE]), '') 
  FROM   RWTLOANPROD.[LOANDATA].[cache].[los_to_cmt] WITH(nolock) 

GO
GRANT SELECT ON  [RWT].[V_ODS] TO [report_user]
GO
GRANT INSERT ON  [RWT].[V_ODS] TO [report_user]
GO
GRANT UPDATE ON  [RWT].[V_ODS] TO [report_user]
GO
