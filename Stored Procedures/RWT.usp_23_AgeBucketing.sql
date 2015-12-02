SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- drop procedure usp_23_AgeBucketing
CREATE procedure [RWT].[usp_23_AgeBucketing]
(
	@typeBucket varchar(5)
)
as
-- ONLY applies to 23-Due Diligence Processing Times SubChart.
-- MUST be called from 23-Due Diligence Processing Times SubChart.rdl
-- Calculates the aging of the loans and the averages
-- 04/10/2013 - Richard Louie
-- 04/23/2013 - Added PR typeBucket code
-- 11/05/2015 - Added Proc to RWTSPRINGMT_QA and changed source to ConditionsManagement
set nocount on;

if @typeBucket = 'PR'
 begin
-- Special case for AgeBucketing End of Period - DD Firm without DD Results
  declare @tmp5 table (
					--date_end datetime
					lh1_timePeriod_interval int
					--,rwt_loan_number varchar(32)
					--,change_date datetime
					,day_diff int
					,ageBucket_1_count int
					,ageBucket_2_count int
					,ageBucket_3_count int
					,ageBucket_4_count int
					);
  declare @tmp6 table (
					lh1_timePeriod_interval int
					,ageBucket_1_count int
					,ageBucket_2_count int
					,ageBucket_3_count int
					,ageBucket_4_count int
					,time_interval_avg float
					);

--  Insert #tmp3 loans with aging bucket calculation into #tmp5
  ;with LastTmpTable
   (date_end
    ,lh1_timePeriod_interval
    ,rwt_loan_number
    ,change_date
    ,day_diff
    ,ageBucket_1_count
    ,ageBucket_2_count
    ,ageBucket_3_count
    ,ageBucket_4_count) as
   (
    select a.date_end, a.lh1_timePeriod_interval, a.rwt_loan_number, a.change_date, a.day_diff
		,(select count(rwt_loan_number) from #tmp3
		    where day_diff between (select ageBucket_1_min from #ageBucketRange where typeBucket = @typeBucket)
									and (select ageBucket_1_max from #ageBucketRange where typeBucket = @typeBucket)
			 and a.lh1_timePeriod_interval = lh1_timePeriod_interval
			 ) as ageBucket_1_count
		,(select count(rwt_loan_number) from #tmp3
		    where day_diff between (select ageBucket_2_min from #ageBucketRange where typeBucket = @typeBucket)
									and (select ageBucket_2_max from #ageBucketRange where typeBucket = @typeBucket)
			 and a.lh1_timePeriod_interval = lh1_timePeriod_interval
			 ) as ageBucket_2_count
		,(select count(rwt_loan_number) from #tmp3
		    where day_diff between (select ageBucket_3_min from #ageBucketRange where typeBucket = @typeBucket)
									and (select ageBucket_3_max from #ageBucketRange where typeBucket = @typeBucket)
			 and a.lh1_timePeriod_interval = lh1_timePeriod_interval
			 ) as ageBucket_3_count
		,(select count(rwt_loan_number) from #tmp3
		    where day_diff between (select ageBucket_4_min from #ageBucketRange where typeBucket = @typeBucket)
									and (select ageBucket_4_max from #ageBucketRange where typeBucket = @typeBucket)
			 and a.lh1_timePeriod_interval = lh1_timePeriod_interval
			 ) as ageBucket_4_count
     from #tmp3 a
     group by a.date_end, a.lh1_timePeriod_interval, a.rwt_loan_number, a.change_date, a.day_diff
   )
   insert @tmp5
    select	lh1_timePeriod_interval
			,day_diff
			,ageBucket_1_count
			,ageBucket_2_count
			,ageBucket_3_count
			,ageBucket_4_count
	 from LastTmpTable
--  Group the records and update the avg field in #tmp6
   insert @tmp6
    select	a.lh1_timePeriod_interval
			,a.ageBucket_1_count
			,a.ageBucket_2_count
			,a.ageBucket_3_count
			,a.ageBucket_4_count
			,time_interval_avg = (select cast(sum(day_diff) as float) / count(*) from @tmp5
									where lh1_timePeriod_interval = a.lh1_timePeriod_interval)
	 from @tmp5 a
	 group by a.lh1_timePeriod_interval
			,a.ageBucket_1_count
			,a.ageBucket_2_count
			,a.ageBucket_3_count
			,a.ageBucket_4_count
--	Copy records to #tmp2. Then the rest of the work for PR is the same as the other typeBuckets
   insert #tmp2
    select	lh1_timePeriod_interval
			,ageBucket_1_count
			,ageBucket_2_count
			,ageBucket_3_count
			,ageBucket_4_count
			,time_interval_avg
	 from @tmp6
 end
else
 begin
  insert #tmp2
   select a.lh1_timePeriod_interval
		,(select count(day_diff) from #tmp1
		    where day_diff between (select ageBucket_1_min from #ageBucketRange where typeBucket = @typeBucket)
									and (select ageBucket_1_max from #ageBucketRange where typeBucket = @typeBucket)
			 and a.lh1_timePeriod_interval = lh1_timePeriod_interval)
		,(select count(day_diff) from #tmp1
		    where day_diff between (select ageBucket_2_min from #ageBucketRange where typeBucket = @typeBucket)
									and (select ageBucket_2_max from #ageBucketRange where typeBucket = @typeBucket)
			 and a.lh1_timePeriod_interval = lh1_timePeriod_interval)
		,(select count(day_diff) from #tmp1
		    where day_diff between (select ageBucket_3_min from #ageBucketRange where typeBucket = @typeBucket)
									and (select ageBucket_3_max from #ageBucketRange where typeBucket = @typeBucket)
			 and a.lh1_timePeriod_interval = lh1_timePeriod_interval)
		,(select count(day_diff) from #tmp1
		    where day_diff between (select ageBucket_4_min from #ageBucketRange where typeBucket = @typeBucket)
									and (select ageBucket_4_max from #ageBucketRange where typeBucket = @typeBucket)
			 and a.lh1_timePeriod_interval = lh1_timePeriod_interval)
 		,avg(cast(day_diff as float))
   from #tmp1 a
    group by a.lh1_timePeriod_interval
 end



GO
