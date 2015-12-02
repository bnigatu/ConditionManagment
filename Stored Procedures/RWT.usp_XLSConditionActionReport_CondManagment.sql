SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [RWT].[usp_XLSConditionActionReport_CondManagment] 


    @condition_date datetime = null
    
AS

SET NOCOUNT ON;

If @condition_date is null
begin

SELECT   
  
new_condition_v.rwt_loan_number,
V_ODS.BORROWER_LAST AS Borrower, 
'Add' AS Action, 
r.LSSTIPCode AS ConditionCode, 
r.LSSTIPDescription AS ConditionDescription, 
new_condition_v.rwt_condition_text AS ConditionComments,
new_condition_v.condition_type_code, 
new_condition_v.condition_added_date

FROM      
   
[ConditionsManagment].[RWT].[NEW_CONDITION_V] AS new_condition_v  WITH(NOLOCK) 
LEFT OUTER JOIN rwtloanprod.loandata_reporting.reporting.ConditionActionReport_CMT_LS_ConditionMappings AS r  WITH(NOLOCK)  
	ON new_condition_v.condition_type_code = r.ConditionID 
LEFT OUTER JOIN [ConditionsManagment].RWT.V_ODS AS V_ODS 
	ON new_condition_v.rwt_loan_number = V_ODS.RWT_LOAN_NUM 


WHERE     

(new_condition_v.conforming_flag = 'N') AND
rwt_condition_text not like '%S=%' AND 
rwt_condition_text not like '%S =%'  


UNION

SELECT     

SATISFIED_CONDITION_V.rwt_loan_number, 
V_ODS.BORROWER_LAST AS Borrower, 
'Satisfy' AS Action, 
rpt.LSSTIPCode AS ConditionCode, 
rpt.LSSTIPDescription AS ConditionDescription, 
SATISFIED_CONDITION_V.rwt_condition_text AS ConditionComments,
SATISFIED_CONDITION_V.condition_type_code, 
SATISFIED_CONDITION_V.condition_satisfied_date

FROM
      
[ConditionsManagment].rwt.SATISFIED_CONDITION_V AS SATISFIED_CONDITION_V  WITH(NOLOCK) 
LEFT OUTER JOIN rwtloanprod.loandata_reporting.reporting.ConditionActionReport_CMT_LS_ConditionMappings AS rpt  WITH(NOLOCK)  
	ON SATISFIED_CONDITION_V.condition_type_code = rpt.ConditionID 
LEFT OUTER JOIN [ConditionsManagment].RWT.V_ODS AS V_ODS  WITH(NOLOCK) 
	ON SATISFIED_CONDITION_V.rwt_loan_number = V_ODS.RWT_LOAN_NUM 


WHERE     

(SATISFIED_CONDITION_V.conforming_flag = 'N')  
AND rwt_condition_text not like '%S=%'  
AND rwt_condition_text not like '%S =%'  
	
ORDER BY  rwt_loan_number

END
ELSE 
BEGIN

SELECT 
    
new_condition_v.rwt_loan_number, 
V_ODS.BORROWER_LAST AS Borrower, 
'Add' AS Action, 
rrpt.LSSTIPCode AS ConditionCode, 
rrpt.LSSTIPDescription AS ConditionDescription, 
new_condition_v.rwt_condition_text AS ConditionComments,
new_condition_v.condition_type_code, 
new_condition_v.condition_added_date

FROM

[ConditionsManagment].[RWT].[NEW_CONDITION_V] AS new_condition_v  WITH(NOLOCK)  
LEFT OUTER JOIN rwtloanprod.loandata_reporting.reporting.ConditionActionReport_CMT_LS_ConditionMappings AS rrpt  WITH(NOLOCK)  
	ON new_condition_v.condition_type_code = rrpt.ConditionID 
LEFT OUTER JOIN rwtspringmt_qa.[ConditionsManagment].RWT.V_ODS AS V_ODS  WITH(NOLOCK)  
	ON new_condition_v.rwt_loan_number = V_ODS.RWT_LOAN_NUM 


WHERE     

(new_condition_v.conforming_flag = 'N')  
AND condition_added_date >= DATEADD(day, DATEDIFF(day, 0, @condition_date ), 0)	  
AND condition_added_date < DATEADD(day, DATEDIFF(day, 0, @condition_date ), 1)  
AND rwt_condition_text not like '%S=%'  
AND rwt_condition_text not like '%S =%'  

 
UNION 

SELECT     

SATISFIED_CONDITION_V.rwt_loan_number, 
V_ODS.BORROWER_LAST AS Borrower, 
'Satisfy' AS Action, 
rptng.LSSTIPCode AS ConditionCode, 
rptng.LSSTIPDescription AS ConditionDescription, 
SATISFIED_CONDITION_V.rwt_condition_text AS ConditionComments,
SATISFIED_CONDITION_V.condition_type_code, 
SATISFIED_CONDITION_V.condition_satisfied_date

FROM         

[ConditionsManagment].[RWT].SATISFIED_CONDITION_V AS SATISFIED_CONDITION_V  WITH(NOLOCK) 
LEFT OUTER JOIN rwtloanprod.loandata_reporting.reporting.ConditionActionReport_CMT_LS_ConditionMappings AS rptng WITH(NOLOCK)  
	ON SATISFIED_CONDITION_V.condition_type_code = rptng.ConditionID 
LEFT OUTER JOIN rwtspringmt_qa.[ConditionsManagment].[RWT].V_ODS AS V_ODS  WITH(NOLOCK)  
	ON SATISFIED_CONDITION_V.rwt_loan_number = V_ODS.RWT_LOAN_NUM 


WHERE     

(SATISFIED_CONDITION_V.conforming_flag = 'N')  
AND condition_satisfied_date >= DATEADD(day, DATEDIFF(day, 0, @condition_date ), 0)	  
AND condition_satisfied_date < DATEADD(day, DATEDIFF(day, 0, @condition_date ), 1)	 
AND rwt_condition_text not like '%S=%'  
AND rwt_condition_text not like '%S =%'  
	
ORDER BY rwt_loan_number
END 





GO
