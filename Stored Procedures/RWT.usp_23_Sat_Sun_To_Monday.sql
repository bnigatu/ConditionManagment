SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE procedure [RWT].[usp_23_Sat_Sun_To_Monday]
(
	@timePeriod varchar(10),
	@typeBucket varchar(5)
)
as
-- ONLY applies to 23-Due Diligence Processing Times SubChart.
-- MUST be called from 23-Due Diligence Processing Times SubChart.rdl
-- Include any Sat,Sun counts to the following Monday for the timeBucket = 'daily'
--  Find all Fridays in #tmp except if max date in range (datefirst = 7 Sun, set in main report code module)
--  The next two days will be sat, sun. Populate @tmp_daily
--  The third day will be the monday. Update @tmp_daily time_interval_mon --, unless it is > #tmp max date
--  Combine the @tmp_daily time_interval_mon with ageBucket totals, then update #tmp2
-- 04/10/2013 - Richard Louie
-- 04/24/2013 - Added year_* fields & related code
-- 11/05/2015 - Created Procedure in RWTSPRINGMT_QA
set nocount on;

  if @timePeriod = 'daily'
	begin
		--declare @time_interval_min int = (select Min(time_interval)from #tmp)
		--declare @time_interval_max int = (select Max(time_interval)from #tmp)
		--declare @time_interval_min_date date
		--select @time_interval_min_date = Min(date_end) from #tmp
		declare @tmp_daily table(date_end date, time_interval int, time_interval_Mon int
				,year_time_interval int, year_time_interval_Mon int)
		;with Fridays(date_end, time_interval) as
		  (
		  select date_end, time_interval from #tmp where datepart(dw,date_end) = 6
		  )
		insert @tmp_daily
		 select  dateadd(d, 1, date_end) -- add the Saturdays
				,datepart(dayofyear,dateadd(d, 1, date_end))
				,datepart(dayofyear,dateadd(d, 3, date_end))
				,cast(datepart(year,dateadd(d, 1, date_end)) as varchar(4))
				  + cast(datepart(dayofyear,dateadd(d, 1, date_end)) as varchar(3))
				,cast(datepart(year,dateadd(d, 3, date_end)) as varchar(4))
				  + cast(datepart(dayofyear,dateadd(d, 3, date_end)) as varchar(3))
		  from Fridays
		insert @tmp_daily
		 select  dateadd(d, 1, date_end) -- add the Sundays
				,datepart(dayofyear,dateadd(d, 1, date_end))
				,datepart(dayofyear,dateadd(d, 2, date_end))
				,cast(datepart(year,dateadd(d, 1, date_end)) as varchar(4))
				  + cast(datepart(dayofyear,dateadd(d, 1, date_end)) as varchar(3))
				,cast(datepart(year,dateadd(d, 2, date_end)) as varchar(4))
				  + cast(datepart(dayofyear,dateadd(d, 2, date_end)) as varchar(3))
		  from @tmp_daily
	  -- update weekend values in #tmp2 to the following Monday interval value
	  ;with Combined_tmp_daily (time_interval_mon, ab1, ab2, ab3, ab4) as
	    (
	     select b.year_time_interval_Mon
				,sum(a.ageBucket_1_count)
				,sum(a.ageBucket_2_count)
				,sum(a.ageBucket_3_count)
				,sum(a.ageBucket_4_count)
				from #tmp2 a 
				 join @tmp_daily b on b.year_time_interval = a.lh1_timePeriod_interval
				 group by b.year_time_interval_Mon
		)
	  update a
	  set	 a.ageBucket_1_count = a.ageBucket_1_count + b.ab1
			,a.ageBucket_2_count = a.ageBucket_2_count + b.ab2
			,a.ageBucket_3_count = a.ageBucket_3_count + b.ab3
			,a.ageBucket_4_count = a.ageBucket_4_count + b.ab4
			  from #tmp2 a
			   join Combined_tmp_daily b
				on a.lh1_timePeriod_interval = b.time_interval_Mon
	;with tmp2Grouped(lh1_timePeriod_interval, ab1cs, ab2cs, ab3cs, ab4cs, tiaa) as (
		select	lh1_timePeriod_interval
				,sum(ageBucket_1_count)
				,sum(ageBucket_2_count)
				,sum(ageBucket_3_count)
				,sum(ageBucket_4_count)
				,avg(time_interval_avg)
		 from #tmp2
		 group by lh1_timePeriod_interval)
	  update a
	  set	a.ageBucket_1_count = ab1cs
			,a.ageBucket_2_count = ab2cs
			,a.ageBucket_3_count = ab3cs
			,a.ageBucket_4_count = ab4cs
			,a.time_interval_avg = tiaa
			  from #tmp a
			   join tmp2Grouped b
				on a.time_interval = b.lh1_timePeriod_interval
	end
 else
  begin
   update a
   set	 a.ageBucket_1_count = b.ageBucket_1_count
		,a.ageBucket_2_count = b.ageBucket_2_count
		,a.ageBucket_3_count = b.ageBucket_3_count
		,a.ageBucket_4_count = b.ageBucket_4_count
		,a.time_interval_avg = b.time_interval_avg
		  from #tmp a
		   join #tmp2 b
		    on a.time_interval = b.lh1_timePeriod_interval
			where a.typeBucket = @typeBucket
  end


GO
