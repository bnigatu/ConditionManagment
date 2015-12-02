SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [RWT].[fn_DateDiff_No_Weekends_Implicit]
(
	@StartDate DATE,
	@EndDate DATE
)
RETURNS int
AS
BEGIN
	declare @return_var int

	set @return_var = 
	   (DATEDIFF(dd, @StartDate, @EndDate))
	  -(DATEDIFF(wk, @StartDate, @EndDate) * 2)
	  -(CASE WHEN DATENAME(dw, @StartDate) = 'Sunday' THEN 1 ELSE 0 END)
	  -(CASE WHEN DATENAME(dw, @EndDate) = 'Saturday' THEN 1 ELSE 0 END)

	return @return_var
END


GO
