SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [RWT].[fn_time_interval]
(
	@timePeriod varchar(10),
	@Change_Date datetime
)
RETURNS int
AS
BEGIN
	declare @return_var int
  set @return_var =
		  case @timePeriod
			when 'daily' then cast(datepart(year,@Change_Date) as varchar(4))
							 + cast(datepart(dayofyear,@Change_Date) as varchar(3))
			when 'weekly' then cast(datepart(year,@Change_Date) as varchar(4))
							 + cast(datepart(week,dateadd(d,-1,@Change_Date)) as varchar(2))
			when 'monthly' then  cast(datepart(year,@Change_Date) as varchar(4))
							 + cast(datepart(month,@Change_Date) as varchar(2))
			end

	return @return_var
END





GO
