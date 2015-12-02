SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [RWT].[usp_XLSConditionActionReport_DataExceptions_CondManagment] 

AS

SET NOCOUNT ON;
 
SELECT
new_condition_v.rwt_loan_number,
V_ODS.BORROWER_LAST AS Borrower,
new_condition_v.condition_added_date AS ExceptionDate,
r.LSSTIPCode AS ConditionCode,
r.LSSTIPDescription AS ConditionDescription,
new_condition_v.rwt_condition_text AS ConditionComments,
new_condition_v.condition_type_code, new_condition_v.condition_added_date

FROM

[ConditionsManagment].[RWT].[NEW_CONDITION_V]   AS new_condition_v WITH(NOLOCK)
LEFT OUTER JOIN [ConditionsManagment].[RWT].satisfied_condition_v   AS satisfied_condition_v_1  WITH(NOLOCK)
	ON new_condition_v.condition_id = satisfied_condition_v_1.condition_id AND
	new_condition_v.[NAMESPACE] = satisfied_condition_v_1.[NAMESPACE]
LEFT OUTER JOIN rwtloanprod.loandata_reporting.reporting.ConditionActionReport_CMT_LS_ConditionMappings AS r WITH(NOLOCK)
	ON new_condition_v.condition_type_code = r.ConditionID
LEFT OUTER JOIN [ConditionsManagment].[RWT].V_ODS AS V_ODS  WITH(NOLOCK)
	ON new_condition_v.rwt_loan_number = V_ODS.RWT_LOAN_NUM 

WHERE

(new_condition_v.conforming_flag = 'N')
AND (new_condition_v.rwt_condition_text LIKE '%S=%')
AND (new_condition_v.condition_type_code <> '99999')
AND (satisfied_condition_v_1.condition_id IS NULL)
OR (new_condition_v.conforming_flag = 'N')
AND (new_condition_v.rwt_condition_text LIKE '%S =%')
AND (new_condition_v.condition_type_code <> '99999')
AND (satisfied_condition_v_1.condition_id IS NULL)

ORDER BY

new_condition_v.rwt_loan_number



GO
