SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [RWT].[usp_23_Create_tmp_table_used_by_chart]
(
	 @typeBucket varchar(5)
	,@cutoff date
	,@timePeriod varchar(10)
	,@change_date_max datetime
)
as
-- ONLY applies to 23-Due Diligence Processing Times SubChart & 23a-Due Diligence Processing Times Detail
-- MUST be called from 23-Due Diligence Processing Times SubChart.rdl or 23a-Due Diligence Processing Times Detail.rdl
-- Create and populate the #tmp table per parameter input. This table is displayed by the chart, or for internal use
-- This SP exists bacause #tmp tables cannot persist bt reports, nor is there table parameters in SSRS.
-- The first DOW = Monday (as opposed to traditional Sunday)
-- 04/11/2013 - Richard Louie
BEGIN
	SET NOCOUNT ON;

 -- Table variable used because CTE does not allow If statement
 declare @daily_dates table(date1 date, DayOfWeek varchar(10))
 -- Loan table entries built using recursive CTE. Increase the Maxrecursion option up to 32k if needed.
 ;with daily_dates AS
 (
	select cast(@cutoff as date) as date1, datename(dw, @cutoff) as DayOfWeek
	union ALL
	select dateadd(d,1,date1), datename(dw, dateadd(d,1,date1)) as DayOfWeek
	 from    daily_dates  
	 where  dateadd(d,1,date1) < = @change_date_max
 )
 insert @daily_dates
  select date1, DayOfWeek from daily_dates option (Maxrecursion 10000) 
 
--select * from @daily_dates
-- select * from #tmp0

-- This handles all timePeriods
 insert #tmp
  select [DATE_BEG] = case @timePeriod
			when 'daily' then date1
			when 'weekly' then convert(date, dateadd(dy, case datepart(dw, date1)
					when 2 then 0 when 3 then -1 when 4 then -2 when 5 then -3 when 6 then -4 when 7 then -5 else -6 end,date1))
			when 'monthly' then convert(date, convert(varchar(6), date1, 112) + '01')
		  end
		,[DATE_END] = case @timePeriod
			when 'daily' then date1
			when 'weekly' then convert(date, dateadd(dy, case datepart(dw, date1)
					when 2 then 6 when 3 then 5 when 4 then 4 when 5 then 3 when 6 then 2 when 7 then 1 else 0 end, date1))
			when 'monthly' then convert(date, dateadd(dy, -1, dateadd(m, 1, convert(varchar(6), date1, 112) + '01')))
		  end
		,time_interval = null,null,null,null,null,null,null
  from @daily_dates
  where DayOfWeek not in ('Saturday','Sunday') -- exclude weekends
  group by	(case @timePeriod
			when 'daily' then date1
			when 'weekly' then convert(date, dateadd(dy, case datepart(dw, date1)
					when 2 then 0 when 3 then -1 when 4 then -2 when 5 then -3 when 6 then -4 when 7 then -5 else -6 end,date1))
			when 'monthly' then convert(date, convert(varchar(6), date1, 112) + '01')
		 end
		 )
		,(case @timePeriod
			when 'daily' then date1
			when 'weekly' then convert(date, dateadd(dy, case datepart(dw, date1)
					when 2 then 6 when 3 then 5 when 4 then 4 when 5 then 3 when 6 then 2 when 7 then 1 else 0 end, date1))
					when 'monthly' then convert(date, dateadd(dy, -1, dateadd(m, 1, convert(varchar(6), date1, 112) + '01')))
		  end
		 )

-- Update the time_interval using the date_end
 update #tmp
  set time_interval =
		  case @timePeriod
			when 'daily' then [RWT].[fn_time_interval] ('daily',date_end)
			when 'weekly' then [RWT].[fn_time_interval] ('weekly',date_end)
			when 'monthly' then [RWT].[fn_time_interval] ('monthly',date_end)
		   end
		 -- case @timePeriod
			--when 'daily' then cast(datepart(year,date_end) as varchar(4)) + cast(datepart(dayofyear,date_end) as varchar(3))
			----datepart(dayofyear,date_end)
			--when 'weekly' then cast(datepart(year,date_end) as varchar(4)) + cast(datepart(week,date_end) as varchar(2))
			---- datepart(week,date_end)
			--when 'monthly' then  cast(datepart(year,date_end) as varchar(4)) + cast(datepart(month,date_end) as varchar(2))
			--end
  from #tmp

-- Update the records in #tmp to the typeBucket
 update #tmp set typeBucket = @typeBucket
 
 END
  

GO
GRANT EXECUTE ON  [RWT].[usp_23_Create_tmp_table_used_by_chart] TO [report_user]
GO
